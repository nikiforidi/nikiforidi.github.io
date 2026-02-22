---
layout: page
title: "VPN Tunneling Architecture"
permalink: /deep-dives/vpn-tunneling-architecture/
---

## Overview

A Linux VPN client architecture developed during the VPN Manager tenure (2020-2021). This project established the foundational networking logic later refined in the Go-based ForestVPN CLI. It utilized a split-privilege model with a user-space CLI and a root daemon communicating via IPC.

**Project Metrics**

- **Period:** 2020 — 2021
- **Role:** Python Developer & Network Engineer
- **Primary Language:** Python
- **Key Frameworks:** Click, Anyd, Requests

[vpnm CLI](https://github.com/nikiforidi/vpnm) | [vpnmd Daemon](https://github.com/nikiforidi/vpnmd) | [anyd Framework](https://pypi.org/project/anyd/)

## Architecture Diagram

The system employed a client-daemon model. The `vpnm` CLI ran as a standard user, while `vpnmd` ran as root to handle privileged network operations. Traffic was routed through a TUN device managed by `tun2socks`, encrypted by `v2ray-core`, and resolved via `cloudflared` (DoH).

```text
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│   vpnm CLI    │────▶│   vpnmd       │────▶│  anyd IPC     │
│   (User)      │     │   (Root)      │     │  (Sockets)    │
│   Click       │     │   Anyd        │     │  localhost:   │
│               │     │               │     │  6554         │
└───────┬───────┘     └───────┬───────┘     └───────┬───────┘
        │                     │                     │
        │                     ▼                     ▼
        │            ┌─────────────────────────────────────┐
        │            │        Privileged Operations        │
        │            │  • iptables (DNS Redirect)          │
        │            │  • ip tuntap (Interface Mgmt)       │
        │            │  • ip route (Routing Table)         │
        │            └─────────────────────────────────────┘
        │
        ▼
┌───────────────────────────────────────────────────────────┐
│                    Tunneling Stack                        │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │  cloudflared │  │  tun2socks   │  │  v2ray-core  │     │
│  │    (DoH)     │  │   (TUN)      │  │   (Proxy)    │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
└───────────────────────────────────────────────────────────┘
```

## Component Details

### CLI Interface (`app.py`)

Built with the `click` framework, the CLI handled user interaction, authentication, and high-level commands. It communicated with the daemon via `vpnmd_api`.

**Available Commands**

| Command      | Description                             | Key Options             |
| :----------- | :-------------------------------------- | :---------------------- |
| `login`      | Authenticate with VPN Manager API       | `--email`, `--password` |
| `status`     | Check active connection status          | None                    |
| `account`    | Display account info (balance, traffic) | None                    |
| `connect`    | Establish VPN tunnel                    | `--best`, `--random`    |
| `disconnect` | Terminate VPN tunnel                    | `--force`               |
| `logout`     | Clear local authentication secret       | None                    |

**Authentication Flow**

1.  User credentials validated against `VPNM_API_URL`.
2.  JWT/Token stored in local `SECRET` file (JSON).
3.  Subsequent commands read token for API authentication.

### Daemon IPC Interface (`appd.py`)

The `vpnmd` daemon exposed privileged network functions via the `anyd` framework over localhost sockets. This prevented the need for `sudo` on every CLI command.

**Exposed IPC Methods**

```python
┌─────────────────────────────────────────────────────────────────┐
│                      vpnmd API Methods                          │
├─────────────────────────────────────────────────────────────────┤
│  Network Interfaces                                             │
│  • add_iface(ifindex, ifaddr)   → ip tuntap add / ip addr add   │
│  • delete_iface(ifindex)        → ip tuntap del                 │
│  • set_iface_up(ifindex)        → ip link set dev tunX up       │
├─────────────────────────────────────────────────────────────────┤
│  Routing                                                        │
│  • add_default_route(metric, ifindex) → ip route add default    │
│  • add_node_route(node, gateway, metric) → ip route add         │
│  • delete_node_route(node, gateway) → ip route delete           │
├─────────────────────────────────────────────────────────────────┤
│  Firewall & DNS                                                 │
│  • add_dns_rule(port)           → iptables -t nat -A REDIRECT   │
│  • delete_dns_rule(port)        → iptables -t nat -D REDIRECT   │
│  • iptables_rule_exists(port)   → iptables -t nat -C CHECK      │
└─────────────────────────────────────────────────────────────────┘
```

**Key Implementation Details**

- **DNS Redirection**: Used `iptables` NAT rules to redirect UDP port 53 traffic to a local port handled by `cloudflared`.
- **Interface Management**: Dynamically created TUN devices (`tun{ifindex}`) based on connection requests.
- **Safety Checks**: `iptables_rule_exists` prevented duplicate rule insertion during reconnection attempts.

## Tunneling Stack

| Component       | Role               | Configuration                                                             |
| :-------------- | :----------------- | :------------------------------------------------------------------------ |
| **v2ray-core**  | Encryption & Proxy | Handles VMess/VLESS protocols, encrypts traffic to remote node.           |
| **tun2socks**   | Traffic Forwarding | Captures system traffic from TUN device and forwards to v2ray socks port. |
| **cloudflared** | DNS over HTTPS     | Resolves DNS queries securely, preventing ISP DNS leakage.                |

## Design Decisions & Trade-offs

| Decision            | Alternative          | Rationale                                                                      |
| :------------------ | :------------------- | :----------------------------------------------------------------------------- |
| **Split Privilege** | Single Binary (sudo) | Reduced attack surface; CLI runs as user, only daemon needs root.              |
| **IPC via anyd**    | Direct Syscalls      | Clean API boundary, automatic serialization, easier testing.                   |
| **TUN/TAP**         | Proxy per-app        | System-wide tunneling ensures all traffic is protected without per-app config. |
| **Python**          | Go/C++               | Faster development cycle, rich ecosystem for API/CLI tooling.                  |

---

## Key Technical Solutions

- **Split-Privilege Architecture:** Isolated privileged network operations (root) from user interaction (user-space) via `anyd` IPC sockets, minimizing the attack surface.
- **Enforced DNS Encryption:** Redirected all UDP port 53 traffic via `iptables` NAT rules to a local `cloudflared` instance, preventing ISP DNS leakage.
- **TUN-Based Forwarding:** Captured system-wide traffic using a virtual TUN interface and `tun2socks`, routing it through `v2ray-core` for encryption without per-app configuration.
- **Idempotent Network Rules:** Implemented safety checks (e.g., `iptables_rule_exists`) to prevent duplicate rule insertion during reconnection attempts.

[vpnm source code](https://github.com/nikiforidi/vpnm) | [vpnmd source code](https://github.com/nikiforidi/vpnmd) | [anyd PyPI page](https://pypi.org/project/anyd/)  
[← Back to Deep Dives](/deep-dives/)
