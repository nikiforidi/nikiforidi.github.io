---
layout: page
title: "anyd: Unix Daemon IPC Framework"
permalink: /deep-dives/anyd-daemon-framework/
---

## Overview

**anyd** is a Python framework for building custom Unix daemons with socket-based IPC APIs.

- **PyPI:** [anyd 0.4.1](https://pypi.org/project/anyd/)
- **GitHub:** [anatolio-deb/anyd](https://github.com/anatolio-deb/anyd)
- **Released:** August 20, 2021
- **License:** MIT + BSD
- **Python:** >=3.8, <4.0

---

## Architecture

### Component Diagram

```
┌─────────────────┐         ┌─────────────────┐
│   Daemon App    │         │   Client App    │
│   (anyd.Appd)   │         │ (anyd.Client)   │
├─────────────────┤         ├─────────────────┤
│ @appd.api       │◄───────►│ client.commit() │
│   - echo()      │  IPC    │   - commit()    │
│   - validate()  │ Sockets │   - validate()  │
├─────────────────┤         ├─────────────────┤
│ Socket Server   │         │ Socket Client   │
│ (localhost:3000)│         │ (localhost:3000)│
└─────────────────┘         └─────────────────┘
```

---

## Key Design Decisions

| Decision | Alternative | Rationale |
|----------|-------------|-----------|
| **TCP Sockets** | Unix Domain Sockets | Cross-platform (Linux, macOS, Windows) |
| **Pickle Serialization** | JSON, Protocol Buffers | Python-native, supports exceptions |
| **Auth Key** | JWT, OAuth | Simple IPC authentication (trusted environment) |
| **Exception Propagation** | Error codes | Client sees actual exceptions, daemon stays up |

---

## Metrics

| Metric | Value |
|--------|-------|
| **Version** | 0.4.1 (latest) |
| **Release Date** | Aug 20, 2021 |
| **Package Size** | 4.5 kB (source), 4.3 kB (wheel) |
| **Upload Tool** | poetry/1.1.8 |
| **Dependencies** | Python stdlib only |

---

## Use Cases

### VPN Manager (vpnmd)

**Context:** vpnmd daemon needs to perform privileged network operations.

**Benefit:** CLI communicates with root daemon securely without direct privilege escalation.

---

## See Also

- [Full source code](https://github.com/anatolio-deb/anyd)
- [PyPI page](https://pypi.org/project/anyd/)
- [VPN Tunneling Architecture](/deep-dives/vpn-tunneling-architecture.md)

---

[← Back to Deep Dives](/deep-dives/)
