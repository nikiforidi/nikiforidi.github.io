---
layout: page
title: "anyd Daemon Framework"
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

## Context

Developed during **VPN Manager** tenure (2020-2021) as part of the Linux VPN client architecture.

**Purpose:** Enable secure IPC communication between:
- `vpnm` CLI (user-space, no privileges)
- `vpnmd` daemon (root privileges for network operations)

---

## Architecture

### Component Model

```
┌─────────────────────────────────────────────────────────┐
│                    anyd Framework                        │
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
│  (vpnm CLI) │                          │ (vpnmd Daemon)│
└──────┬──────┘                          └──────┬──────┘
       │                                        │
       │  1. Connect (socket)                   │
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

## Core Components

### Appd (Server)

| Feature | Description |
|---------|-------------|
| **Inheritance** | `multiprocessing.connection.Listener` |
| **API Registry** | `_api` dictionary stores decorated methods |
| **Request Format** | `(endpoint, args, kwargs)` tuple |
| **Response** | Any Python object or Exception |
| **Session Close** | `SIGENDS` byte signal |
| **Logging** | Connection, request, response events |

### Client (via ClientSession)

| Feature | Description |
|---------|-------------|
| **Wrapper** | `multiprocessing.connection.Client` |
| **Method** | `commit(endpoint, *args, **kwargs)` |
| **Exception Handling** | Re-raises server exceptions locally |
| **Session Management** | Context manager (`with` statement) |
| **Cleanup** | Automatic `end_session()` on exit |

---

## Usage Pattern

### Server Side (Daemon)

```python
from anyd import Appd

class Vpnmd(Appd):
    @Appd.api
    def connect(self, config_path):
        # Privileged network operation
        return {"status": "connected"}
    
    @Appd.api
    def disconnect(self):
        # Privileged network operation
        return {"status": "disconnected"}

if __name__ == "__main__":
    server = Vpnmd(address=("localhost", 3000), authkey=b"secret")
    server.start()
```

### Client Side (CLI)

```python
from anyd import ClientSession

with ClientSession(address=("localhost", 3000), authkey=b"secret") as client:
    result = client.commit("connect", "/etc/vpn/config.json")
    print(result)  # {"status": "connected"}
# Session automatically closed
```

---

## Security Model

| Layer | Mechanism | Purpose |
|-------|-----------|---------|
| **Authentication** | `authkey` (bytes) | Prevent unauthorized connections |
| **Transport** | TCP/Unix sockets | Local IPC only (localhost) |
| **Serialization** | Pickle | Python-native, but trusted environment only |
| **Session** | SIGENDS signal | Clean connection termination |

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

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| Pickle serialization | Fast, but security risk if exposed to untrusted clients |
| multiprocessing.connection | Simple, but limited to local IPC |
| Exception propagation | Debugging friendly, but leaks implementation details |
| Single-threaded server | Simple, but blocks on long-running operations |

---

## Use Cases

### VPN Manager (vpnmd)

**Context:** vpnmd daemon needs to perform privileged network operations (TUN/TAP, Netfilter, routing).

**Benefit:** vpnm CLI communicates with root daemon securely without direct privilege escalation.

**Implementation:**
- `vpnmd` runs as root (systemd service)
- `vpnm` runs as user (CLI)
- anyd handles IPC with authentication

---

## See Also

- [Full source code](https://github.com/anatolio-deb/anyd)
- [PyPI page](https://pypi.org/project/anyd/)
- [VPN Tunneling Architecture](/deep-dives/vpn-tunneling-architecture/)

---

[← Back to Deep Dives](/deep-dives/)
```

---

## 📝 Key Updates Based on `core.py`

| Aspect | Before | After |
|--------|--------|-------|
| **Server Class** | Generic description | `Appd` inherits `multiprocessing.connection.Listener` |
| **Client Class** | Generic description | `_Client` + `ClientSession` context manager |
| **API Registration** | Not specified | `@api` decorator with `_api` dictionary |
| **Request Format** | Not specified | `(endpoint, args, kwargs)` tuple |
| **Session Close** | Not specified | `SIGENDS` byte signal |
| **Exception Handling** | Not specified | Server exceptions propagated to client |
| **Security** | Auth key mentioned | `authkey` (bytes) for connection authentication |
| **Usage Example** | Generic | Actual code pattern from `core.py` |
| **Trade-offs** | Generic | Specific to `multiprocessing.connection` + Pickle |
