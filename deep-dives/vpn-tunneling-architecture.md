---
layout: page
title: "VPN Tunneling Architecture"
permalink: /deep-dives/vpn-tunneling-architecture/
---

## Overview

Linux VPN client architecture developed during VPN Manager tenure (2020-2021).

**External Resources:**
- [vpnm CLI](https://github.com/nikiforidi/vpnm) — 154 commits, 12 releases
- [vpnmd Daemon](https://github.com/nikiforidi/vpnmd) — 62 commits, 3 releases
- [anyd Framework](https://pypi.org/project/anyd/) — PyPI published

---

## Architecture Diagram

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   vpnm CLI  │────▶│   vpnmd     │────▶│  anyd IPC   │
│   (User)    │     │   (Root)    │     │  (Sockets)  │
└─────────────┘     └─────────────┘     └─────────────┘
│                   │                   │
▼                   ▼                   ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  cloudflared│     │  tun2socks  │     │  v2ray-core │
│    (DoH)    │     │   (TUN)     │     │   (Proxy)   │
└─────────────┘     └─────────────┘     └─────────────┘
```

---

## Key Design Decisions

| Decision | Alternative | Rationale |
|----------|-------------|-----------|
| **TUN/TAP** | Proxy per-app | System-wide tunneling, no per-app config |
| **DoH via v2ray** | Direct DNS | DNS queries also encrypted through tunnel |
| **Root daemon (vpnmd)** | sudo per-call | Single privilege escalation point |
| **IPC via anyd** | Direct syscalls | Clean API, authentication, validation |

---

## Repository Statistics

| Repository | Commits | Releases | Stars | Status |
|------------|---------|----------|-------|--------|
| [vpnm](https://github.com/nikiforidi/vpnm) | 154 | 12 | 1 | ✅ Stable Reference |
| [vpnmd](https://github.com/nikiforidi/vpnmd) | 62 | 3 | 0 | ✅ Stable Reference |

---

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| Python vs Go | Faster development, slower execution |
| Single binary (pyinstaller) | Easy distribution, larger size |
| Project Status | Stable reference implementation |

---

## See Also

- [vpnm source code](https://github.com/nikiforidi/vpnm)
- [vpnmd source code](https://github.com/nikiforidi/vpnmd)
- [anyd PyPI page](https://pypi.org/project/anyd/)
- [anyd Deep Dive](/deep-dives/anyd-daemon-framework/)

---

[← Back to Deep Dives](/deep-dives/)
