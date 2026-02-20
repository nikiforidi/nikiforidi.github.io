---
layout: page
title: "anyd Daemon Framework"
permalink: /deep-dives/anyd-daemon-framework/
---

## Overview

**anyd** is a Python framework for building custom Unix daemons with socket-based IPC APIs.

The name **anyd** stands for "**any daemon**" — reflecting its universal purpose: enabling secure, isolated, privileged code execution for any use case requiring privilege separation.

- **PyPI:** [anyd 0.4.1](https://pypi.org/project/anyd/)
- **GitHub:** [anatolio-deb/anyd](https://github.com/anatolio-deb/anyd)
- **Released:** August 20, 2021
- **License:** MIT + BSD
- **Python:** >=3.8, <4.0

---

## Core Philosophy: Universal Privilege Separation

**anyd** is not limited to VPN-specific logic. It solves a fundamental architectural problem:

> **How do you allow an unprivileged user-space client to safely execute privileged operations without exposing the entire system?**

### The anyd Solution

| Component | Responsibility | Privilege Level |
|-----------|---------------|-----------------|
| **Server (Appd)** | Executes sensitive operations | Root / Privileged |
| **Client (Session)** | Requests operations | User / Unprivileged |
| **IPC Channel** | Secure communication | Authenticated (authkey) |
| **Boundary** | Security isolation | Process separation |

This pattern applies to **unlimited possibilities**:
- ✅ VPN tunneling (network privileges)
- ✅ Secrets management (memory protection)
- ✅ Hardware control (GPIO/USB access)
- ✅ System administration (service restarts)
- ✅ Database operations (credential isolation)

---

## Architecture

### Component Model

```
┌─────────────────────────────────────────────────────────┐
│                    anyd Framework                       │
├───────────────────────────┬─────────────────────────────┤
│      Server (Appd)        │       Client (Session)      │
├───────────────────────────┼─────────────────────────────┤
│ • multiprocessing.Listener│ • multiprocessing.Client    │
│ • @api decorator registry │ • commit(endpoint, *args)   │
│ • Request/response loop   │ • Exception propagation     │
│ • SIGENDS session close   │ • Context manager support   │
└───────────────────────────┴─────────────────────────────┘
```

### Communication Flow

```
┌─────────────┐                          ┌─────────────┐
│   Client    │                          │   Server    │
│  (Unpriv.)  │                          │ (Privileged)│
└──────┬──────┘                          └──────┬──────┘
│                                        │
│  1. Connect (socket + authkey)         │
│───────────────────────────────────────▶│
│                                        │
│  2. Register API methods (@api)        │
│                                        │◀──┐
│  3. commit("method", *args, **kwargs)  │   │
│───────────────────────────────────────▶│   │
│                                        │   │ Process
│                                        │───┘
│  4. Response or Exception              │
│◀───────────────────────────────────────│
│                                        │
│  5. end_session() (SIGENDS)            │
│───────────────────────────────────────▶│
│                                        │
│  6. Close connection                   │
│───────────────────────────────────────▶│
│                                        │
```

---

## Usage Examples

### Example 1: VPN Manager (Real-World Implementation)

**Context:** `vpnmd` daemon needs to perform privileged network operations (TUN/TAP, Netfilter, routing).

**Benefit:** `vpnm` CLI communicates with root daemon securely without direct privilege escalation.

```python
# Server: vpnmd (Root privileges)
class Vpnmd(Appd):
    @Appd.api
    def connect(self, config_path: str) -> dict:
        # Privileged: Modify routing tables, create TUN device
        return {"status": "connected"}

# Client: vpnm (User privileges)
with ClientSession(address=("localhost", 3000), authkey=b"secret") as client:
    client.commit("connect", "/etc/vpn/config.json")
```

[See full implementation](/deep-dives/vpn-tunneling-architecture/)

---

## Key Design Decisions

| Decision | Alternative | Rationale |
|----------|-------------|-----------|
| **multiprocessing.connection** | ZeroMQ, gRPC | Python stdlib, no external dependencies |
| **Pickle serialization** | JSON, Protocol Buffers | Native Python, supports exception objects |
| **@api decorator** | Manual registry dict | Clean, Pythonic method registration |
| **Exception propagation** | Error codes | Client sees actual exceptions, daemon stays up |
| **Context manager** | Manual connect/close | Automatic cleanup, prevents resource leaks |
| **SIGENDS protocol** | TCP FIN | Explicit session termination signal |

---

## Metrics

| Metric | Value |
|--------|-------|
| **Version** | 0.4.1 (latest) |
| **Release Date** | Aug 20, 2021 |
| **Package Size** | 4.5 kB (source), 4.3 kB (wheel) |
| **Upload Tool** | poetry/1.1.8 |
| **Dependencies** | Python stdlib only |
| **Lines of Code** | ~200 (core.py) |

---

## See Also

- [Full source code](https://github.com/anatolio-deb/anyd)
- [PyPI page](https://pypi.org/project/anyd/)
- [VPN Tunneling Architecture](/deep-dives/vpn-tunneling-architecture/)

---

[← Back to Deep Dives](/deep-dives/)
