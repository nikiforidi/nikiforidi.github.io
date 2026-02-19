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

### Example 2: Secure Secrets Vault (Conceptual)

**Context:** Store encryption keys in memory (root-protected), allow CLI to request decryption without exposing keys.

**Benefit:** Keys never leave the daemon process. Client only sees decrypted data.

```python
# Server: VaultD (Root privileges, holds secrets in memory)
class VaultD(Appd):
    _secrets = {"api_key": "super_secret_123"}
    
    @Appd.api
    def decrypt(self, resource: str) -> str:
        # Privileged: Access protected memory
        if resource not in self._secrets:
            raise ValueError("Resource not found")
        return self._secrets[resource]
    
    @Appd.api
    def rotate(self, resource: str, new_value: str) -> dict:
        # Privileged: Update secrets securely
        self._secrets[resource] = new_value
        return {"status": "rotated"}

# Client: CLI (User privileges, never sees raw keys)
with ClientSession(address=("localhost", 3000), authkey=b"vault_key") as client:
    # Request decryption without accessing key directly
    api_key = client.commit("decrypt", "api_key")
    print(f"Using key: {api_key[:4]}...")  # Only use, don't store
    
    # Request rotation
    client.commit("rotate", "api_key", "new_secret_456")
```

**Security Model:**
- Keys stored only in daemon memory (not on disk)
- Client authenticates via `authkey`
- Client cannot dump daemon memory (process isolation)
- All operations logged by daemon

---

### Example 3: System Administration Toolkit (Conceptual)

**Context:** Allow developers to restart services without giving them full `sudo` access.

**Benefit:** Granular control over privileged operations.

```python
# Server: SysAdminD (Root privileges)
class SysAdminD(Appd):
    @Appd.api
    def restart_service(self, service_name: str) -> dict:
        # Privileged: systemctl restart
        allowed = ["nginx", "postgresql", "redis"]
        if service_name not in allowed:
            raise PermissionError(f"{service_name} not allowed")
        # subprocess.run(["systemctl", "restart", service_name])
        return {"status": "restarted"}

# Client: Dev CLI (User privileges)
with ClientSession(address=("localhost", 3000), authkey=b"admin_key") as client:
    # Safe: Only allowed services can be restarted
    client.commit("restart_service", "nginx")
    
    # Blocked: Raises PermissionError from server
    client.commit("restart_service", "ssh")
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

## Security Model

| Layer | Mechanism | Purpose |
|-------|-----------|---------|
| **Authentication** | `authkey` (bytes) | Prevent unauthorized connections |
| **Transport** | TCP/Unix sockets | Local IPC only (localhost) |
| **Serialization** | Pickle | Python-native, but trusted environment only |
| **Session** | SIGENDS signal | Clean connection termination |
| **Isolation** | Process boundary | Memory separation between client/server |

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

## Why anyd? Universal Possibilities

The beauty of **anyd** lies in its **agnosticism**:

1.  **Logic-Agnostic:** The framework doesn't care *what* your daemon does. VPN, secrets, hardware, databases — any privileged operation works.
2.  **Security-First:** Built-in authentication (`authkey`) and process isolation ensure clients can't escalate privileges beyond the API surface.
3.  **Developer-Friendly:** Pythonic decorators (`@api`), context managers (`with ClientSession`), and exception propagation make it intuitive.
4.  **Zero Dependencies:** Uses Python stdlib only (`multiprocessing.connection`), making it portable and easy to audit.
5.  **Extensible:** Add logging, monitoring, rate-limiting — the framework doesn't constrain your architecture.

**anyd** proves that **privilege separation doesn't have to be complex**. With ~200 lines of code, you can build secure, isolated daemons for **unlimited use cases**.

---

## See Also

- [Full source code](https://github.com/anatolio-deb/anyd)
- [PyPI page](https://pypi.org/project/anyd/)
- [VPN Tunneling Architecture](/deep-dives/vpn-tunneling-architecture/)

---

[← Back to Deep Dives](/deep-dives/)