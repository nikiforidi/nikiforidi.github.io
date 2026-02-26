title: Portfolio Context Export
generated: 2026-02-26 07:41:07
format: Markdown
scope: .md files only
Portfolio Context Export
Complete markdown export for audit and review.

File: `about/communities.md`
---
layout: page
title: Professional Communities
permalink: /about/communities/
---

## PyPI

| Field | Value |
|-------|-------|
| **Profile** | [pypi.org/user/anatolio/](https://pypi.org/user/anatolio/) |
| **Published Package** | [anyd 0.4.1](https://pypi.org/project/anyd/) |
| **Release Date** | August 20, 2021 |
| **Description** | A small framework for building and using custom Unix daemons |
| **Functionality** | Build custom Unix daemon processes as servers, API accessible over sockets (IPC), client library included, supports authentication & validation |
| **Tech** | Python >=3.8, POSIX sockets, IPC |
| **License** | MIT License + BSD |
| **GitHub** | [github.com/anatolio-deb/anyd](https://github.com/anatolio-deb/anyd) |
| **Context** | Developed during VPN Manager tenure (2020-2021) |

---

## GitHub

| Field | Value |
|-------|-------|
| **Profile** | [github.com/nikiforidi](https://github.com/nikiforidi) |
| **Contributions** | 1,756+ in 26 repositories |
| **Languages** | Python, Go, Vue, Shell, TypeScript |
| **Notable Projects** | [vpnm](https://github.com/nikiforidi/vpnm) (154 commits), [vpnmd](https://github.com/nikiforidi/vpnmd) (62 commits), [anyd](https://github.com/anatolio-deb/anyd) |

---

## Habr

| Field | Value |
|-------|-------|
| **Profile** | [habr.com/users/cybran24/](https://habr.com/users/cybran24/) |
| **Publications** | 9 articles, 48 comments |
| **Karma** | 13,000+ |
| **Views** | 237,000+ |
| **Topics** | Python, OOP, Server Administration, Linux, Information Security |
| **Period** | December 2017 — Present (8+ years) |

---

## Related Pages

- [Engineering Philosophy](philosophy.md) — Why I share knowledge
- [Career Timeline](timeline.md) — When I published work
- [Deep Dives](/deep-dives/) — Technical content examples

---

[← Back to About](/about/)
File: `about/contact.md`
---
layout: page
title: Contact
permalink: /about/contact/
---

## Get In Touch

| Channel | Link |
|---------|------|
| **Telegram** | [@nikiforidi](https://telegram.me/nikiforidi) |
| **GitHub** | [github.com/nikiforidi](https://github.com/nikiforidi) |
| **Habr Career** | [career.habr.com/nikiforidi](https://career.habr.com/nikiforidi) |
| **PyPI** | [pypi.org/user/anatolio/](https://pypi.org/user/anatolio/) |
| **Location** | Moscow, Russia |
| **Availability** | Open to remote work |

---

## Preferred Contact Method

**Telegram** is the fastest way to reach me for:
- Job opportunities
- Technical discussions
- Collaboration proposals

---

## Related Pages

- [Professional Communities](communities.md) — Where I'm active
- [Career Timeline](timeline.md) — My work history
- [Deep Dives](/deep-dives/) — Technical project details

---

[← Back to About](/about/)
File: `about/index.md`
---
layout: page
title: About
permalink: /about/
---

## Anatoly Nikiforov

**Staff Software Engineer / Software Architect**

o Moscow, Russia • ✈ Open to Remote Work

---

## Overview

Staff Software Engineer / Software Architect with **5+ years** of professional experience spanning the full technology stack:

| Layer | Technologies |
|-------|-------------|
| **Low-level** | Linux kernel modules, Netfilter hooks, TUN/TAP interfaces, POSIX sockets |
| **System-level** | Daemons, IPC mechanisms, network tunneling, VPN protocols |
| **Application-level** | Go, Python, TypeScript, Vue.js, REST/SOAP APIs |
| **Architecture-level** | Distributed systems, event-driven orchestration, validation patterns |

---

## Quick Navigation

| Page | Description |
|------|-------------|
| [Engineering Philosophy](philosophy.md) | Core principles and beliefs |
| [Career Timeline](timeline.md) | Detailed chronology with milestones |
| [Professional Communities](communities.md) | PyPI, GitHub, Habr profiles |
| [Contact](contact.md) | Get in touch |

---

## Core Beliefs

| Belief | Evidence |
|--------|----------|
| **Depth over breadth** | 9 years focused on systems, networking, distributed systems |
| **Documentation matters** | 5 architectural specifications documented (MHA, JEMP, SSA, Validation Stack, Transactional Models) |
| **Share knowledge** | 9 Habr articles (237K views), 11 university lectures |
| **Measure everything** | Benchmarks, metrics, and impact tracked for all major projects |
| **Open source by default** | 6 public repositories, 1,756 GitHub contributions |

---

## At a Glance

| Metric | Value |
|--------|-------|
| **Professional Experience** | 5+ years (2019–2026) |
| **Community Activity** | 9 years (Habr since 2017) |
| **Companies** | 7 (1C, MIND, MIPT, ForestVPN, Carrierproxy, VPN Manager, JetBrains) |
| **Publications** | 9 Habr articles (237K+ views, 13K+ karma) |
| **GitHub** | 1,756 contributions, 26 repositories |
| **PyPI Packages** | 1 published ([anyd 0.4.1](https://pypi.org/project/anyd/)) |
| **Architecture Specs** | 5 documented specifications |
| **Lectures** | 11 (MIPT Go Course) |

---

**Last Updated:** February 2026
File: `about/philosophy.md`
---
layout: page
title: Engineering Philosophy
permalink: /about/philosophy/
---

## Core Principles

### 1. Systems Thinking

I work comfortably across all layers of the stack:

```text
┌───────────────────────────────────────────┐
│  Application (Go, Python, Vue.js)         │
│  - REST APIs, CLI clients, Web UI         │
├───────────────────────────────────────────┤
│  System (Linux, Docker, systemd)          │
│  - Daemons, IPC, network tunneling        │
├───────────────────────────────────────────┤
│  Kernel (Netfilter, TUN/TAP, POSIX)       │
│  - Kernel modules, sockets, syscalls      │
└───────────────────────────────────────────┘
```

**Example:** VPN Manager project required all three layers:

- **Kernel:** TUN/TAP interface, Netfilter hooks
- **System:** vpnmd daemon (root privileges), systemd service
- **Application:** vpnm CLI (Python), anyd IPC framework

---

### 2. Architecture First, Code Second

Before writing code, I define:

| Question            | Example (MHA)                                  |
| ------------------- | ---------------------------------------------- |
| **Problem**         | Detect CIR changes across cloud providers      |
| **Constraints**     | Different APIs, vendor-specific fields         |
| **Trade-offs**      | Hash collisions vs. comparison speed           |
| **Success Metrics** | 100% change detection, <100ms hash calculation |

**Result:** 5 documented specifications before implementation.

---

### 3. Verification Over Assumption

| Layer        | Tool                        | Purpose                 |
| ------------ | --------------------------- | ----------------------- |
| **Input**    | Universe Validation Stack   | Validate Unified Models |
| **Output**   | Prometheus, Grafana         | Monitor system behavior |
| **Behavior** | Notion specs, Habr articles | Document decisions      |

---

### 4. Teach to Learn

I solidify understanding by teaching:

| Platform              | Output                                        | Impact                                    |
| --------------------- | --------------------------------------------- | ----------------------------------------- |
| **MIPT**              | 11 Go lectures                                | 100+ students                             |
| **JetBrains Academy** | Python Core project (Multilingual Translator) | Educational resource for Hyperskill track |
| **Habr**              | 9 articles                                    | 237K views, 13K karma                     |
| **Open Source**       | 6 projects                                    | 1,756 GitHub contributions                |

---

### 5. Iterate Publicly

```text
Share Early → Accept Feedback → Improve → Repeat
↓              ↓              ↓
GitHub        Issues, PRs    Real-world usage
Habr          Comments       237K views
PyPI          Downloads      anyd 0.4.1
```

---

## Related Pages

- [Career Timeline](timeline.md) — See how these principles evolved
- [Professional Communities](communities.md) — Where I share knowledge
- [Specifications](/specs/) — Architecture documentation examples

---

[← Back to About](/about/)

File: `about/timeline.md`
---
layout: page
title: Career Timeline
permalink: /about/timeline/
---

## Visual Timeline

```text
2017 ──── 2018 ──── 2019 ──── 2020 ──── 2021 ──── 2022 ──── 2023 ──── 2024 ──── 2025 ──── 2026
│         │         │         │         │         │         │         │         │         │
▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼
Habr      DNSCrypt  JetBrains  VPN      Carrier   Forest    MIPT      MIND      MIND      1C
Articles  (58K)     Academy   Manager   proxy     VPN       Course    Software  Software  Cloud
                                                            │         │
                                                            ▼         ▼
                                                            Start       MHA, JEMP, SSA
                                                            Course      Validation Stack
```

---

## Detailed Chronology

| Period    | Company       | Role             | Key Achievements                            |
| --------- | ------------- | ---------------- | ------------------------------------------- |
| 2017-2018 | Habr          | Author           | 3 articles (121K views)                     |
| 2019-2020 | JetBrains     | Python Engineer  | Python Core course, Multilingual Translator |
| 2020-2021 | VPN Manager   | Python Tech Lead | anyd, vpnm, vpnmd                           |
| 2021      | Carrierproxy  | Full-Stack       | Django + Vue.js                             |
| 2022      | ForestVPN     | Go Tech Lead     | CLI, Homebrew, 116 releases                 |
| 2022-2023 | MIPT          | Instructor       | Go course (11 lectures)                     |
| 2023-2025 | MIND Software | Chief Developer  | MHA, JEMP, SSA                              |
| 2025-2026 | 1C            | Service Engineer | Crash dump service                          |

---

## Career Progression

| Level      | Period       | Focus                             |
| ---------- | ------------ | --------------------------------- |
| **Junior** | 2019-2020    | Python development, learning      |
| **Middle** | 2020-2022    | System programming, leadership    |
| **Senior** | 2022-2025    | Architecture, distributed systems |
| **Staff**  | 2025-present | Service reliability, monitoring   |

---

## Related Pages

- [Engineering Philosophy](philosophy.md) — Principles that guided this journey
- [Professional Communities](communities.md) — Where I published work
- [Deep Dives](/deep-dives/) — Technical details of key projects

---

[← Back to About](/about/)

File: `deep-dives/anyd-daemon-framework.md`
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
- [✓] VPN tunneling (network privileges)
- [✓] Secrets management (memory protection)
- [✓] Hardware control (GPIO/USB access)
- [✓] System administration (service restarts)
- [✓] Database operations (credential isolation)

---

## Architecture

### Component Model

The Appd class inherits from multiprocessing.connection.Listener and runs the server loop. API methods are registered via the @api decorator and stored in the _api dictionary. The server accepts client connections and processes requests in a request/response loop. Sessions terminate cleanly via the SIGENDS byte signal protocol.

```text
┌───────────────────────────────────────────────────────────────┐
│                       anyd Framework                          │
├───────────────────────────────┬───────────────────────────────┤
│      Server (Appd)            │       Client (Session)        │
├───────────────────────────────┼───────────────────────────────┤
│ • multiprocessing.Listener    │ • multiprocessing.Client      │
│ • @api decorator registry     │ • commit(endpoint, *args)     │
│ • Request/response loop       │ • Exception propagation       │
│ • SIGENDS session close       │ • Context manager support     │
└───────────────────────────────┴───────────────────────────────┘
```

### Communication Flow

The Client wraps multiprocessing.connection.Client and forms requests as tuples. The commit() method sends the request and receives the response from the server. Server exceptions propagate to the client without crashing the daemon. The ClientSession context manager ensures automatic cleanup via end_session() on exit.

```text
┌───────────────┐                         ┌───────────────┐
│    Client     │                         │    Server     │
│   (Unpriv.)   │                         │  (Privileged) │
└───────┬───────┘                         └───────┬───────┘
        │                                         │
        │  1. Connect (socket + authkey)          │
        │────────────────────────────────────────▶│
        │                                         │
        │  2. Register API methods (@api)         │
        │                                         │◀──┐
        │  3. commit("method", *args, **kwargs)   │   │
        │────────────────────────────────────────▶│   │ Process
        │                                         │───┘
        │  4. Response or Exception               │
        │◀────────────────────────────────────────│
        │                                         │
        │  5. end_session() (SIGENDS)             │
        │────────────────────────────────────────▶│
        │                                         │
        │  6. Close connection                    │
        │────────────────────────────────────────▶│
        │                                         │
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
| **Inheritance** | multiprocessing.connection.Listener |
| **API Registry** | _api dictionary stores decorated methods |
| **Request Format** | (endpoint, args, kwargs) tuple |
| **Response** | Any Python object or Exception |
| **Session Close** | SIGENDS byte signal |
| **Logging** | Connection, request, response events |

### Client (via ClientSession)

| Feature | Description |
|---------|-------------|
| **Wrapper** | multiprocessing.connection.Client |
| **Method** | commit(endpoint, *args, **kwargs) |
| **Exception Handling** | Re-raises server exceptions locally |
| **Session Management** | Context manager (with statement) |
| **Cleanup** | Automatic end_session() on exit |

---

## Security Model

| Layer | Mechanism | Purpose |
|-------|-----------|---------|
| **Authentication** | authkey (bytes) | Prevent unauthorized connections |
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
| **Pickle serialization** | Fast, but security risk if exposed to untrusted clients |
| **multiprocessing.connection** | Simple, but limited to local IPC |
| **Exception propagation** | Debugging friendly, but leaks implementation details |
| **Single-threaded server** | Simple, but blocks on long-running operations |

---

## Why anyd? Universal Possibilities

The beauty of anyd lies in its agnosticism:

- **Logic-Agnostic:** The framework doesn't care what your daemon does. VPN, secrets, hardware, databases — any privileged operation works.
- **Security-First:** Built-in authentication (`authkey`) and process isolation ensure clients can't escalate privileges beyond the API surface.
- **Developer-Friendly:** Pythonic decorators (`@api`), context managers (`with ClientSession`), and exception propagation make it intuitive.
- **Zero Dependencies:** Uses Python stdlib only (`multiprocessing.connection`), making it portable and easy to audit.
- **Extensible:** Add logging, monitoring, rate-limiting — the framework doesn't constrain your architecture.

anyd proves that privilege separation doesn't have to be complex. With ~200 lines of code, you can build secure, isolated daemons for unlimited use cases.

---

## See Also

- [Full source code](https://github.com/anatolio-deb/anyd)
- [PyPI page](https://pypi.org/project/anyd/)
- [VPN Tunneling Architecture](/deep-dives/vpn-tunneling-architecture/)

---

[← Back to Deep Dives](/deep-dives/)
File: `deep-dives/forestvpn-cli.md`
---
layout: page
title: "ForestVPN CLI"
permalink: /deep-dives/forestvpn-cli/
---

## Overview

A cross-platform VPN CLI client engineered for Linux, OpenWRT, macOS, and Windows. As the Go Technical Lead, I drove the architecture and release cycle from May 2022 to April 2023.

**Project Metrics**

- **Commits:** 792
- **Releases:** 116 (Latest: v0.3.5)
- **Contributors:** 5
- **Primary Language:** Go (82.8%)
- **License:** MIT

[Repository](https://github.com/forestvpn/cli) | [Homebrew Stable](https://github.com/forestvpn/homebrew-stable) | [Chocolatey](https://community.chocolatey.org/packages/fvpn)

## Architecture & Design

The CLI is structured around a modular package design that separates high-level actions from low-level system interactions.

### Package Structure

```text
┌────────────────────────────────────────────────────────────┐
│                         cmd (Entry Point)                  │
│                         main.go                            │
└─────────────────────────┬──────────────────────────────────┘
                          │
                          ▼
┌────────────────────────────────────────────────────────────┐
│                      actions (Core Logic)                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │   State      │  │   Connect    │  │  Disconnect  │      │
│  │  Structure   │  │   Command    │  │   Command    │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────┬────────────────────┬────────────────┬────────────┘
          │                    │                │
          ▼                    ▼                ▼
┌─────────────┐      ┌─────────────┐  ┌─────────────────────┐
│    auth     │      │     api     │  │       utils         │
│  (Firebase) │      │   (wgrest)  │  │  (OS Detection)     │
└─────────────┘      └─────────────┘  └─────────────────────┘
```

### State Management Logic (`state.go`)

The `State` struct abstracts WireGuard interface management. It employs runtime OS detection to branch logic into three distinct execution paths.

**Struct Definition**

```text
┌─────────────────────────────────────────────────────────────────┐
│                      actions.State                              │
├─────────────────────────────────────────────────────────────────┤
│  Fields:                                                        │
│  • status              (bool)                                   │
│  • WireGuardInterface  (string)                                 │
├─────────────────────────────────────────────────────────────────┤
│  Methods:                                                       │
│  • GetStatus()         → Checks wg show / uci show              │
│  • SetUp()             → Establishes connection (See Flow)      │
│  • SetDown()           → Terminates connection                  │
└─────────────────────────────────────────────────────────────────┘
```

**Connection Flow (SetUp Method)**

```text
      ┌──────────────┐
      │  User Input  │ (Profile ID, Persist Flag)
      └──────┬───────┘
             ▼
      ┌──────────────┐
      │ Load Profile │ (auth.LoadDevice)
      └──────┬───────┘
             ▼
      ┌───────────────┐
      │ OS Detection  │ (utils.Os / IsOpenWRT)
      └───────┬───────┘
              │
     ┌────────┼───────┬────────────────────────┐
     ▼        │       ▼                        ▼
┌──────────┐  │  ┌────────────────┐      ┌──────────────┐
│ Windows  │  │  │   OpenWRT      │      │ Linux/macOS  │
│          │  │  │                │      │              │
│ wireguard│  │  │ persist?       │      │ wg-quick     │
│ .exe     │  │  │                │      │ up           │
│ install  │  │  │ Yes → uci      │      │              │
│ service  │  │  │       utils    │      └──────────────┘
└──────────┘  │  │       .Network │
              │  │                │
              │  │ No  → ip link. │
              │  │       wg set   │
              │  │       conf     │
              │  └────────────────┘
              │
      ┌───────┴───────┬────────────────────────┐
      ▼               ▼                        ▼
┌──────────┐  ┌──────────────┐      ┌──────────────┐
│ Windows  │  │   OpenWRT    │      │ Linux/macOS  │
│          │  │              │      │              │
│ wireguard│  │ uci delete   │      │ wg-quick     │
│ .exe     │  │ network.wg   │      │ down         │
│ uninstall│  │ commit       │      │              │
│ service  │  │              │      │              │
└──────────┘  └──────────────┘      └──────────────┘
```

**Key Implementation Details**

- **Status Polling**: `GetStatus` originally parsed shell output (`wg show`), deprecated in favor of API-driven checks.
- **OpenWRT Persistence**: The `persist` flag determines whether to use UCI for permanent configuration (including firewall rules) or transient `ip` commands.
- **SSH Safety**: On OpenWRT, active SSH client IPs are excluded from the VPN tunnel to prevent lockouts.

## Distribution Strategy

- **macOS**: Homebrew (stable and beta taps).
- **Windows**: Chocolatey community repositories.
- **Linux**: `.deb` (Debian/Ubuntu), `.rpm` (Fedora), `.apk` (Alpine).
- **Embedded**: OpenWRT `.ipk` packages.

## CI/CD Pipeline

- **Build Automation**: Drone CI (multi-architecture).
- **Release Management**: GoReleaser (versioning, changelogs, artifacts).
- **Observability**: Sentry (error tracking).
- **Delivery**: GitHub Releases & Package Repositories.

---

[Full source code](https://github.com/forestvpn/cli)  
[← Back to Deep Dives](/deep-dives/)

File: `deep-dives/index.md`
---
layout: page
title: Deep Dives
permalink: /deep-dives/
---

## Technical Deep Dives

Detailed architectural breakdowns of key projects with links to source code and external resources.

---

## Available Deep Dives

| Project                                                   | Description                               | Links                                                                                    |
| --------------------------------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------- |
| [anyd Daemon Framework](anyd-daemon-framework/)           | Unix daemon IPC framework                 | [PyPI](https://pypi.org/project/anyd/), [GitHub](https://github.com/anatolio-deb/anyd)   |
| [VPN Tunneling Architecture](vpn-tunneling-architecture/) | Linux VPN client with TUN/TAP             | [vpnm](https://github.com/nikiforidi/vpnm), [vpnmd](https://github.com/nikiforidi/vpnmd) |
| [v2sub systemd Integration](v2sub-systemd-integration/)   | Rootless v2ray manager with systemd & TUI | [GitHub](https://github.com/nikiforidi/v2sub)                                            |
| [ForestVPN CLI](forestvpn-cli/)                           | Cross-platform VPN client                 | [GitHub](https://github.com/forestvpn/cli)                                               |
| [JetBrains Academy](jetbrains-academy/)                   | Python educational project                | [Hyperskill](https://hyperskill.org/projects/99)                                         |
| [MIND Universe](mind-universe/)                           | Cloud infrastructure management           | [Specs](/specs/)                                                                         |

---

[← Back to Home](/)

File: `deep-dives/jetbrains-academy.md`
---
layout: page
title: "JetBrains Academy: Multilingual Translator"
permalink: /deep-dives/jetbrains-academy/
---

## Overview

Educational Python project developed for JetBrains Academy Hyperskill track.

- **Period:** October 2019 — March 2020
- **Role:** Python Software Engineer
- **Project:** [Multilingual Online Translator](https://github.com/anatolio-deb/Multilingual-online-translator)
- **Platform:** [Hyperskill Project #99](https://hyperskill.org/projects/99)
- **Track:** Python Core

---

## Architecture

The translate_word() function handles both interactive mode and command-line arguments. The Reverso Context API is queried via requests.get() with custom User-Agent headers. BeautifulSoup parses the HTML response to extract translations and examples. Results are saved to file ({word}-translation.txt) and printed to console.

```text
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│   User CLI    │────▶│  Translator   │────▶│   Reverso     │
│   Input       │     │   Logic       │     │   Context     │
└───────────────┘     └───────┬───────┘     └───────────────┘
                              │
                              ▼
                      ┌───────────────┐
                      │    hs-test    │
                      │  (Testing)    │
                      └───────────────┘
```

### Input Modes

| Mode | Trigger | Behavior |
|------|---------|----------|
| **Interactive** | No arguments | Prompts for source language, target language, word |
| **CLI** | 3 arguments | Direct translation: `python translator.py english french word` |
| **All Languages** | `all` as target | Translates to all 12 supported languages |

### Supported Languages

Arabic, German, English, Spanish, French, Hebrew, Japanese, Dutch, Polish, Portuguese, Romanian, Russian, Turkish (13 total).

---

## Key Features

- Translate text between multiple languages
- Built on Reverso Context API
- Covered with `hs-test` framework tests
- English documentation included

---

## Teaching Impact

| Metric | Value |
|--------|-------|
| **Project Page** | [hyperskill.org/projects/99](https://hyperskill.org/projects/99) |
| **GitHub** | [github.com/anatolio-deb/Multilingual-online-translator](https://github.com/anatolio-deb/Multilingual-online-translator) |
| **Purpose** | Educational resource for Python learners |
| **Track** | Python Core |

---

## Skills Applied

- Python
- Git
- Software Testing (hs-test framework)
- API Integration (Reverso Context)
- Technical Documentation (English)

---

[← Back to Deep Dives](/deep-dives/)
File: `deep-dives/mind-universe.md`
---
layout: page
title: "MIND Universe"
permalink: /deep-dives/mind-universe/
---

## Overview

Cloud infrastructure management platform developed at MIND Software (2023-2025).

**Period:** February 2023 — February 2025

**Role:** Lead Backend Developer / Chief Developer

---

## DRUID API

CRUD-like operations for cloud infrastructure resources (CIR):

| Acronym | Action | Description |
|---------|--------|-------------|
| **D** | Deploy | Create new CIR |
| **R** | Refresh | Sync CIR state from provider |
| **U** | Update | Modify CIR configuration |
| **I** | Import | Import existing CIR into Universe |
| **D** | Destroy | Delete CIR |

---

## Architecture Specifications

| Specification | Purpose | Link |
|--------------|---------|------|
| [MHA](/specs/mha/) | Model Hashing Algorithm — CIR change detection | Nested hashing, bidirectional comparison |
| [SSA](/specs/ssa/) | Sequence Sorting Algorithm — Go map ordering | Zero-last semantics, 116ms benchmark |
| [JEMP](/specs/jemp/) | Job Event Messaging Protocol — Concurrency model | Heartbeat events, Job Collector |
| [Validation Stack](/specs/validation-stack/) | Unified Model validation layer | FILO execution, strict/tolerant modes |
| [Transactional Models](/specs/transactional-models/) | VM deployment transaction process | Prototype → Base → Complete states |

---

## Supported Providers

| Provider | Status |
|----------|--------|
| VMware | [✓] Implemented |
| OpenStack | [✓] Implemented |
| oVirt | [✓] Implemented |
| SpaceVM | [✓] Implemented |

---

## Technologies

- **Languages:** Go
- **Message Queue:** RabbitMQ
- **Database:** PostgreSQL
- **APIs:** REST, SOAP
- **OS:** Linux

---

## See Also

- [Full Specifications](/specs/)

---

[← Back to Deep Dives](/deep-dives/)
File: `deep-dives/v2sub-systemd-integration.md`
---
layout: page
title: "v2sub: systemd-run Integration & Interactive Menu"
permalink: /deep-dives/v2sub-systemd-integration/
---

## Overview

**Project:** [v2sub](https://github.com/nikiforidi/v2sub) — A v2ray subscription manager written in Python

**Commit:** `feat: systemd-run and interactive menu` · [0899bf5](https://github.com/nikiforidi/v2sub/commit/0899bf5)

**Period:** 2020-2021

**Role:** Python Developer & System Engineer

---

## Problem Statement

### Original Architecture Issues

The v2sub project had several critical limitations that prevented widespread adoption:

| Problem                       | Impact                                                    | Root Cause                                      |
| ----------------------------- | --------------------------------------------------------- | ----------------------------------------------- |
| **Root privileges required**  | Users hesitant to run unknown scripts as root             | `systemctl restart v2ray.service` requires sudo |
| **Config in `/etc/v2ray/`**   | File operations need elevated permissions                 | Traditional system-wide config location         |
| **No node selection UI**      | Users must manually edit config or remember index numbers | CLI-only with `--index` argument                |
| **No clean shutdown**         | Orphaned v2ray processes after script exit                | No process tracking or lifecycle management     |
| **Unreliable user detection** | `SUDO_USER` fallback breaks in some environments          | Inconsistent environment variable availability  |

### User Experience Pain Points

```bash
# Before: Clunky workflow requiring root
$ sudo python3 v2sub.py run --index 5
Password: [sudo password required]
[!] Security concern: Why does a VPN client need root?

# Before: No way to see available nodes
$ python3 v2sub.py list
# Raw JSON output, no formatting

# Before: No clean shutdown
$ Ctrl+C
# v2ray process keeps running in background
```

---

## Motivation

### Why This Refactor Was Necessary

1. **Security First** — Running third-party scripts as root is a security anti-pattern. Users should never need to trust a script with full system access for VPN functionality.

2. **User Experience** — Interactive selection is more intuitive than remembering index numbers. Think `htop` vs `ps aux | grep`.

3. **Proper Lifecycle Management** — Services should start cleanly and stop cleanly. No orphaned processes.

4. **Portability** — User-level systemd units work across different Linux distributions without requiring system-wide configuration.

5. **Maintainability** — Separating systemd logic into its own module makes the codebase easier to test and extend.

---

## Technical Solutions

### 1. User-Level systemd Units (No Root Required)

**Before:**

```python
# utils.py - Required root
def restart_server():
    click.echo("Going to restart v2ray service...")
    result = call("systemctl restart v2ray.service", shell=True)
    # [-] Requires: sudo python3 v2sub.py
```

**After:**

```python
# systemd.py - User-level service management
SYSTEMD_RUN_CMD = [
    "systemd-run",
    "--user",           # [+] No root needed
    "--collect",        # [+] Auto-cleanup when done
    "-p", "Restart=on-failure",
]

def start(cmd: Iterable) -> dict:
    SYSTEMD_RUN_CMD.extend(cmd)
    proc = run(SYSTEMD_RUN_CMD, check=True, capture_output=True)
    # Extract unit name from stderr: "Running as unit: user@12345.service"
    return {"unit": proc.stderr.decode().split(":")[1].strip()}
```

**Why `systemd-run --user`?**

- Creates transient service units (no permanent config files)
- Runs in user session (no root required)
- `--collect` flag ensures automatic cleanup after service stops
- Output includes unit name for later management (stop/restart)

### 2. Interactive Terminal Menu

**Before:**

```bash
$ python3 v2sub.py run --index 5
# User must remember: "Which index was the US server?"
```

**After:**

```python
# command.py - Interactive node selection
from simple_term_menu import TerminalMenu

def run(name, port):
    servers = subscribe.get_servers(name)
    menu = TerminalMenu(servers, title=name)
    index = menu.show()  # [+] Interactive selection
    node = subscribe.get_node(index, name)
    # ... start connection
```

**Why `simple_term_menu`?**

- Pure Python (no external dependencies beyond pip)
- Keyboard navigation (arrow keys, Enter)
- Works in any terminal (no GUI required)
- Minimal code footprint (~20 lines)

### 3. State Tracking for Clean Shutdown

**Problem:** How do we stop a v2ray instance we started earlier?

**Solution:** Persist the systemd unit name to JSON state file.

```python
# subscribe.py - Initialize state file
def init():
    # ... existing init code ...
    if not os.path.exists(SYSTEMD_UNIT):
        os.mknod(SYSTEMD_UNIT)  # Create state file

# command.py - Track unit name
def run(name, port):
    existing_unit = utils.read_from_json(systemd.SYSTEMD_UNIT).get("unit", "")
    existing_config = utils.read_from_json(config.V2RAY_CONFIG_FILE)

    if existing_config != node:
        systemd.stop(existing_unit)  # [+] Stop old instance first
        config.update_config(node, port)

    if not systemd.is_active(existing_unit):
        unit = systemd.start(["v2ray", "-config", config.V2RAY_CONFIG_FILE])
        utils.write_to_json(unit, systemd.SYSTEMD_UNIT)  # [+] Save for later

# command.py - Clean shutdown
def stop():
    unit = utils.read_from_json(systemd.SYSTEMD_UNIT).get("unit", "")
    if systemd.is_active(unit):
        systemd.stop(unit)
        click.echo("Stopped")
```

**State File Structure:**

```json
// ~/.v2sub/unit.json
{
  "unit": "user@12345.service"
}
```

### 4. Simplified User Detection

**Before:**

```python
# Unreliable in some environments
user = os.getenv("SUDO_USER") or os.getenv("USER")
```

**After:**

```python
# Reliable: USER is always set in login shells
user = os.getenv("USER")
```

**Why the change?**

- `SUDO_USER` only set when script is run with `sudo`
- Since we no longer require sudo, `USER` is sufficient
- Simpler code = fewer edge cases

### 5. Config File Location Change

**Before:**

```python
V2RAY_CONFIG_FILE = "/etc/v2ray/config.json"  # [-] Requires root
```

**After:**

```python
V2RAY_CONFIG_FILE = "/tmp/config.json"  # [+] User-writable
```

**Trade-offs:**

| Aspect          | `/etc/v2ray/`     | `/tmp/`                                    |
| --------------- | ----------------- | ------------------------------------------ |
| **Permissions** | Root required     | User-writable                              |
| **Persistence** | Survives reboot   | Cleared on reboot                          |
| **Security**    | Protected by root | World-readable (but config has no secrets) |
| **Use Case**    | System service    | User session                               |

**Decision:** For user-level VPN client, `/tmp/` is acceptable because:

- Config is regenerated on each connection
- No sensitive data in config (auth is in subscription URL)
- Reboot clears stale configs (actually a feature)

---

## Architecture Changes

### Module Structure

```
v2sub/
├── __init__.py          # Version, global variables
├── command.py           # CLI commands (run, stop, ping)
├── config.py            # V2Ray config generation
├── subscribe.py         # Subscription management
├── systemd.py           # [+] NEW: systemd-run integration
└── utils.py             # Helper functions (ping, JSON I/O)
```

### Service Lifecycle Flow

```
┌──────────────┐
│  User Input  │ (Select node from menu)
└──────┬───────┘
       ▼
┌──────────────┐
│ Check State  │ (Read unit.json)
└──────┬───────┘
       ▼
┌──────────────┐
│ Config Diff? │ (Compare with existing)
└──────┬───────┘
       │
       ├── Yes ──▶ systemd.stop(existing_unit)
       │           config.update_config(node)
       │           systemd.start(new_unit)
       │           utils.write_to_json(unit)
       │
       └── No ───▶ systemd.is_active(unit)?
                   ├── Yes ──▶ Already running
                   └── No ───▶ systemd.start(unit)
```

### Command Comparison

| Command  | Before                                | After                                 |
| -------- | ------------------------------------- | ------------------------------------- |
| **Run**  | `sudo python3 v2sub.py run --index 5` | `python3 v2sub.py run` (interactive)  |
| **Stop** | [-] Not available                     | `python3 v2sub.py stop`               |
| **Ping** | `python3 v2sub.py ping --index 5`     | `python3 v2sub.py ping` (interactive) |
| **Root** | [+] Required                          | [-] Not required                      |

---

## Key Design Decisions

### 1. Why `systemd-run` Instead of `systemctl`?

| Aspect           | `systemctl`                           | `systemd-run`           |
| ---------------- | ------------------------------------- | ----------------------- |
| **Unit Type**    | Permanent (`.service` file)           | Transient (in-memory)   |
| **Config Files** | Creates files in `/etc/systemd/user/` | No files created        |
| **Cleanup**      | Manual (`systemctl disable`)          | Automatic (`--collect`) |
| **Use Case**     | Long-running services                 | One-off sessions        |

**Decision:** `systemd-run --user --collect` is perfect for VPN sessions because:

- No permanent configuration clutter
- Automatic cleanup when session ends
- User-level (no root)
- Unit name returned for management

### 2. Why JSON for State Tracking?

**Alternatives Considered:**

- **PID file** — Only tracks process ID, not systemd unit
- **Environment variable** — Lost when shell closes
- **Database** — Overkill for single value
- **JSON file** — [+] Simple, human-readable, easy to parse

**Decision:** JSON strikes the right balance between simplicity and functionality.

### 3. Why Interactive Menu Instead of Fuzzy Search?

**Alternatives Considered:**

- **Fuzzy search** (like `fzf`) — Requires external dependency
- **Numbered list** — What we had before (poor UX)
- **Interactive menu** — [+] Built-in to `simple_term_menu`

**Decision:** Interactive menu provides:

- Visual feedback (highlighted selection)
- Keyboard navigation
- No external dependencies beyond pip
- Works in any terminal

---

## Metrics & Impact

### Code Changes

| Metric            | Value            |
| ----------------- | ---------------- |
| **Files Changed** | 7                |
| **Lines Added**   | +96              |
| **Lines Removed** | -37              |
| **Net Change**    | +59 lines        |
| **New Modules**   | 1 (`systemd.py`) |
| **New Commands**  | 1 (`stop`)       |

### User Experience Improvements

| Metric              | Before                | After            |
| ------------------- | --------------------- | ---------------- |
| **Root Required**   | [+] Yes               | [-] No           |
| **Node Selection**  | Manual index          | Interactive menu |
| **Clean Shutdown**  | [-] No                | [+] Yes          |
| **Config Location** | `/etc/v2ray/`         | `/tmp/`          |
| **User Detection**  | `SUDO_USER` or `USER` | `USER` only      |

### Security Improvements

| Risk                        | Before                      | After             |
| --------------------------- | --------------------------- | ----------------- |
| **Root Privileges**         | Required for all operations | Not required      |
| **Config File Permissions** | 644 (root-owned)            | 644 (user-owned)  |
| **Process Isolation**       | System-wide service         | User session      |
| **Attack Surface**          | Full system access          | User session only |

---

## Trade-offs

### 1. `/tmp/` vs `/etc/v2ray/`

| Trade-off                 | Impact                                  |
| ------------------------- | --------------------------------------- |
| **Config lost on reboot** | [+] Acceptable (regenerated on connect) |
| **World-readable config** | [+] Acceptable (no secrets in config)   |
| **No system-wide config** | [+] Intentional (user-level tool)       |

### 2. `systemd-run` vs Direct Process

| Trade-off                 | Impact                                           |
| ------------------------- | ------------------------------------------------ |
| **Systemd dependency**    | [+] Acceptable (most Linux distros have systemd) |
| **Slightly more complex** | [+] Worth it for lifecycle management            |
| **User session required** | [+] Intentional (no root)                        |

### 3. Interactive Menu vs CLI Arguments

| Trade-off            | Impact                                          |
| -------------------- | ----------------------------------------------- |
| **Not scriptable**   | [!] Minor (can add `--index` flag if needed)    |
| **Extra dependency** | [+] Minimal (`simple_term_menu` is pure Python) |
| **Better UX**        | [+] Significant improvement                     |

---

## Lessons Learned

### 1. Don't Require Root Unless Absolutely Necessary

**Lesson:** Users are (rightfully) suspicious of scripts that require root. Always ask: "Can this work without elevated privileges?"

**Application:** Use `systemd-run --user` instead of `systemctl` for user sessions.

### 2. State Management is Critical for Service Lifecycle

**Lesson:** If you start a service, you need a way to stop it later. Persist state somewhere durable.

**Application:** JSON state file for tracking systemd unit names.

### 3. Interactive UX > CLI Arguments for Human Users

**Lesson:** Remembering index numbers is cognitively demanding. Visual selection is intuitive.

**Application:** `simple_term_menu` for node selection.

### 4. Separate Concerns into Modules

**Lesson:** systemd logic doesn't belong in `utils.py`. Give it its own module.

**Application:** New `systemd.py` module with clear responsibilities.

---

## Future Improvements

### 1. Add `--index` Flag for Scripting

```python
@cli.command()
@click.option("--index", type=click.INT, default=None)
def run(name, port, index):
    if index is not None:
        # Scripting mode
        node = subscribe.get_node(index, name)
    else:
        # Interactive mode
        servers = subscribe.get_servers(name)
        menu = TerminalMenu(servers, title=name)
        index = menu.show()
        node = subscribe.get_node(index, name)
```

### 2. Add `status` Command

```python
@cli.command()
def status():
    unit = utils.read_from_json(systemd.SYSTEMD_UNIT).get("unit", "")
    if systemd.is_active(unit):
        click.echo(f"[+] Active: {unit}")
    else:
        click.echo("[-] Inactive")
```

### 3. Add Connection History

```python
# Track last 10 connections
history = utils.read_from_json(HISTORY_FILE)
history.append({"node": node, "timestamp": datetime.now()})
history = history[-10:]  # Keep last 10
utils.write_to_json(history, HISTORY_FILE)
```

### 4. Add Auto-Reconnect on Network Change

```python
# Watch for NetworkManager events
# Reconnect if connection drops
```

---

## See Also

- [v2sub Repository](https://github.com/nikiforidi/v2sub)
- [Commit 0899bf5](https://github.com/nikiforidi/v2sub/commit/0899bf5)
- [systemd-run Documentation](https://www.freedesktop.org/software/systemd/man/systemd-run.html)
- [simple_term_menu](https://pypi.org/project/simple-term-menu/)

---

[← Back to Deep Dives](/deep-dives/)

File: `deep-dives/vpn-tunneling-architecture.md`
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

File: `index.md`
---
layout: home
title: Technical Portfolio
tagline: Architecture, Algorithms, System Design
permalink: /
---

## Welcome, Traveler ☕

<div class="terminal-container" 
     data-terminal="$ whoami\n> Anatoly Nikiforov\n$ status\n> Ready for remote work\n$ location\n> Moscow, Russia">
</div>

Pull up a chair. This portfolio is designed for cozy reading about engineering craft—the kind of late-night coding sessions where the only company is your terminal, a warm cup of coffee, and the satisfaction of solving hard problems.

Whether you're here to review architecture, reminisce about the old days, or just enjoy well-documented systems, make yourself at home.

---

## System Modules

| Module                          | Content                                 | Access                                    |
| ------------------------------- | --------------------------------------- | ----------------------------------------- |
| [`[specs/]`](/specs/)           | 5 architectural specs (MHA, SSA, JEMP)  | [`[ENTER]`](/specs/){: .theme-enter}      |
| [`[deep-dives/]`](/deep-dives/) | Technical breakdowns of key projects    | [`[ENTER]`](/deep-dives/){: .theme-enter} |
| [`[about/]`](/about/)           | Engineering philosophy, career timeline | [`[ENTER]`](/about/){: .theme-enter}      |

---

## Featured Processes

### ▶ Model Hashing Algorithm (MHA)

Bidirectional hashing for cloud infrastructure resource comparison.

- **Problem:** Detect CIR changes across different cloud providers
- **Solution:** Nested hashing with unified model abstraction
- **Metrics:** <100ms hash calculation, 100% change detection
- **Execute:** [`/specs/mha/`](/specs/mha/)

### ▶ Sequence Sorting Algorithm (SSA)

Custom Go algorithm for ordered map iteration with zero-last semantics.

- **Problem:** Go maps are unordered, but we need `[1, 2, 4, 7, 0]`
- **Solution:** O(n\*2) lookup with mismatch counter
- **Benchmark:** 1,000,000 keys in 116.9 ms
- **Execute:** [`/specs/ssa/`](/specs/ssa/)

### ▶ Job Event Messaging Protocol (JEMP)

Event-driven concurrency model for distributed job execution.

- **Problem:** Track concurrent jobs without MQ overhead
- **Solution:** Heartbeat events + Job Collector + Checkpointer
- **Execute:** [`/specs/jemp/`](/specs/jemp/)

> "What I cannot create, I do not understand."
> — Richard Feynman

---

## Featured Deep Dives

### ▶ anyd Daemon Framework

Unix daemon IPC framework published on PyPI.

- **PyPI:** [`anyd 0.4.1`](https://pypi.org/project/anyd/)
- **GitHub:** [`anatolio-deb/anyd`](https://github.com/anatolio-deb/anyd)
- **Tech:** POSIX sockets, IPC, authentication, validation
- **Execute:** [`/deep-dives/anyd-daemon-framework/`](/deep-dives/anyd-daemon-framework/)

### ▶ VPN Tunneling Architecture

Linux VPN client with TUN/TAP, Netfilter, and DNS redirection.

- **Repositories:** [`vpnm`](https://github.com/nikiforidi/vpnm) (154 commits), [`vpnmd`](https://github.com/nikiforidi/vpnmd) (62 commits)
- **Tech:** TUN/TAP, Netfilter, cloudflared DoH, tun2socks
- **Execute:** [`/deep-dives/vpn-tunneling-architecture/`](/deep-dives/vpn-tunneling-architecture/)

### ▶ ForestVPN CLI

Cross-platform VPN client (Linux, macOS, Windows, OpenWRT).

- **Repository:** [`forestvpn/cli`](https://github.com/forestvpn/cli)
- **Stats:** 792 commits, 116 releases, 8 stars
- **Tech:** Go 82.8%, Shell 17.2%, Homebrew, Chocolatey
- **Execute:** [`/deep-dives/forestvpn-cli/`](/deep-dives/forestvpn-cli/)

---

## System Status

| Metric          | Value                          |
| --------------- | ------------------------------ |
| Uptime          | 5+ years (2019–2026)           |
| Commits         | 1,756+ contributions           |
| Packages        | 1 published (anyd 0.4.1)       |
| Docs            | 5 architectural specifications |
| Last Build      | February 2026                  |
| Coffee Consumed | ∞ cups                         |

> **Note:** All links are verified. All claims are backed by public evidence.

The terminal is warm, the coffee is fresh, and the code is documented.

Stay a while.

File: `portfolio_assets.md`
title: Portfolio Assets Export
generated: 2026-02-21 04:38:54
format: Markdown
scope: Config, CSS, Layouts, Scripts
Portfolio Assets Export
Complete export of Jekyll configuration and theme assets.

File: `.github/workflows/deploy.yml`
```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v4
      - uses: actions/jekyll-build-pages@v1
        with:
          source: ./
          destination: ./_site
      - uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - uses: actions/deploy-pages@v4

```

File: `.gitignore`
```gitignore
_site/
.sass-cache/
.jekyll-cache/
*~
.DS_Store
.idea/
.vscode/
.devcontainer/
```

File: `.jekyll-cache/.gitignore`
```gitignore
# ignore everything in this directory
*
```

File: `Gemfile`
```ruby
source "https://rubygems.org"

gem "jekyll", "~> 4.3"
gem "jekyll-feed", "~> 0.15"
gem "webrick", "~> 1.8"
gem "minima", "~> 2.5"

```

File: `Gemfile.lock`
```text
GEM
  remote: https://rubygems.org/
  specs:
    addressable (2.8.8)
      public_suffix (>= 2.0.2, < 8.0)
    base64 (0.2.0)
    colorator (1.1.0)
    concurrent-ruby (1.3.6)
    csv (3.2.8)
    em-websocket (0.5.3)
      eventmachine (>= 0.12.9)
      http_parser.rb (~> 0)
    eventmachine (1.2.7)
    ffi (1.17.3-aarch64-linux-gnu)
    forwardable-extended (2.6.0)
    google-protobuf (3.25.8-aarch64-linux)
    http_parser.rb (0.8.1)
    i18n (1.14.8)
      concurrent-ruby (~> 1.0)
    jekyll (4.4.1)
      addressable (~> 2.4)
      base64 (~> 0.2)
      colorator (~> 1.0)
      csv (~> 3.0)
      em-websocket (~> 0.5)
      i18n (~> 1.0)
      jekyll-sass-converter (>= 2.0, < 4.0)
      jekyll-watch (~> 2.0)
      json (~> 2.6)
      kramdown (~> 2.3, >= 2.3.1)
      kramdown-parser-gfm (~> 1.0)
      liquid (~> 4.0)
      mercenary (~> 0.3, >= 0.3.6)
      pathutil (~> 0.9)
      rouge (>= 3.0, < 5.0)
      safe_yaml (~> 1.0)
      terminal-table (>= 1.8, < 4.0)
      webrick (~> 1.7)
    jekyll-feed (0.17.0)
      jekyll (>= 3.7, < 5.0)
    jekyll-sass-converter (3.0.0)
      sass-embedded (~> 1.54)
    jekyll-seo-tag (2.8.0)
      jekyll (>= 3.8, < 5.0)
    jekyll-watch (2.2.1)
      listen (~> 3.0)
    json (2.7.2)
    kramdown (2.5.2)
      rexml (>= 3.4.4)
    kramdown-parser-gfm (1.1.0)
      kramdown (~> 2.0)
    liquid (4.0.4)
    listen (3.10.0)
      logger
      rb-fsevent (~> 0.10, >= 0.10.3)
      rb-inotify (~> 0.9, >= 0.9.10)
    logger (1.6.0)
    mercenary (0.4.0)
    minima (2.5.2)
      jekyll (>= 3.5, < 5.0)
      jekyll-feed (~> 0.9)
      jekyll-seo-tag (~> 2.1)
    pathutil (0.16.2)
      forwardable-extended (~> 2.6)
    public_suffix (7.0.2)
    rb-fsevent (0.11.2)
    rb-inotify (0.11.1)
      ffi (~> 1.0)
    rexml (3.4.4)
    rouge (4.7.0)
    safe_yaml (1.0.5)
    sass-embedded (1.62.1-aarch64-linux-gnu)
      google-protobuf (~> 3.21)
    terminal-table (3.0.2)
      unicode-display_width (>= 1.1.1, < 3)
    unicode-display_width (2.6.0)
    webrick (1.9.2)

PLATFORMS
  aarch64-linux

DEPENDENCIES
  jekyll (~> 4.3)
  jekyll-feed (~> 0.15)
  minima (~> 2.5)
  webrick (~> 1.8)

CHECKSUMS
  addressable (2.8.8) sha256=7c13b8f9536cf6364c03b9d417c19986019e28f7c00ac8132da4eb0fe393b057
  base64 (0.2.0) sha256=0f25e9b21a02a0cc0cea8ef92b2041035d39350946e8789c562b2d1a3da01507
  colorator (1.1.0) sha256=e2f85daf57af47d740db2a32191d1bdfb0f6503a0dfbc8327d0c9154d5ddfc38
  concurrent-ruby (1.3.6) sha256=6b56837e1e7e5292f9864f34b69c5a2cbc75c0cf5338f1ce9903d10fa762d5ab
  csv (3.2.8) sha256=2f5e11e8897040b97baf2abfe8fa265b314efeb8a9b7f756db9ebcf79e7db9fe
  em-websocket (0.5.3) sha256=f56a92bde4e6cb879256d58ee31f124181f68f8887bd14d53d5d9a292758c6a8
  eventmachine (1.2.7) sha256=994016e42aa041477ba9cff45cbe50de2047f25dd418eba003e84f0d16560972
  ffi (1.17.3-aarch64-linux-gnu) sha256=28ad573df26560f0aedd8a90c3371279a0b2bd0b4e834b16a2baa10bd7a97068
  forwardable-extended (2.6.0) sha256=1bec948c469bbddfadeb3bd90eb8c85f6e627a412a3e852acfd7eaedbac3ec97
  google-protobuf (3.25.8-aarch64-linux) sha256=5869d1a31f39ee3361e85f3ef3db0512c19f0e0c75cd69d7303c177e17590044
  http_parser.rb (0.8.1) sha256=9ae8df145b39aa5398b2f90090d651c67bd8e2ebfe4507c966579f641e11097a
  i18n (1.14.8) sha256=285778639134865c5e0f6269e0b818256017e8cde89993fdfcbfb64d088824a5
  jekyll (4.4.1) sha256=4c1144d857a5b2b80d45b8cf5138289579a9f8136aadfa6dd684b31fe2bc18c1
  jekyll-feed (0.17.0) sha256=689aab16c877949bb9e7a5c436de6278318a51ecb974792232fd94d8b3acfcc3
  jekyll-sass-converter (3.0.0) sha256=e2e7674f186e906b9d99b8066e13f9b4d5cb9f806d36f7bc8cf2610053d8c902
  jekyll-seo-tag (2.8.0) sha256=3f2ed1916d56f14ebfa38e24acde9b7c946df70cb183af2cb5f0598f21ae6818
  jekyll-watch (2.2.1) sha256=bc44ed43f5e0a552836245a54dbff3ea7421ecc2856707e8a1ee203a8387a7e1
  json (2.7.2) sha256=1898b5cbc81cd36c0fd4d0b7ad2682c39fb07c5ff682fc6265f678f550d4982c
  kramdown (2.5.2) sha256=1ba542204c66b6f9111ff00dcc26075b95b220b07f2905d8261740c82f7f02fa
  kramdown-parser-gfm (1.1.0) sha256=fb39745516427d2988543bf01fc4cf0ab1149476382393e0e9c48592f6581729
  liquid (4.0.4) sha256=4fcfebb1a045e47918388dbb7a0925e7c3893e58d2bd6c3b3c73ec17a2d8fdb3
  listen (3.10.0) sha256=c6e182db62143aeccc2e1960033bebe7445309c7272061979bb098d03760c9d2
  logger (1.6.0) sha256=0ab7c120262dd8de2a18cb8d377f1f318cbe98535160a508af9e7710ff43ef3e
  mercenary (0.4.0) sha256=b25a1e4a59adca88665e08e24acf0af30da5b5d859f7d8f38fba52c28f405138
  minima (2.5.2) sha256=9c434e3b7bc4a0f0ab488910438ed3757a0502ff1060d172f361907fc38aa45a
  pathutil (0.16.2) sha256=e43b74365631cab4f6d5e4228f812927efc9cb2c71e62976edcb252ee948d589
  public_suffix (7.0.2) sha256=9114090c8e4e7135c1fd0e7acfea33afaab38101884320c65aaa0ffb8e26a857
  rb-fsevent (0.11.2) sha256=43900b972e7301d6570f64b850a5aa67833ee7d87b458ee92805d56b7318aefe
  rb-inotify (0.11.1) sha256=a0a700441239b0ff18eb65e3866236cd78613d6b9f78fea1f9ac47a85e47be6e
  rexml (3.4.4) sha256=19e0a2c3425dfbf2d4fc1189747bdb2f849b6c5e74180401b15734bc97b5d142
  rouge (4.7.0) sha256=dba5896715c0325c362e895460a6d350803dbf6427454f49a47500f3193ea739
  safe_yaml (1.0.5) sha256=a6ac2d64b7eb027bdeeca1851fe7e7af0d668e133e8a88066a0c6f7087d9f848
  sass-embedded (1.62.1-aarch64-linux-gnu) sha256=e9c591197aafab1badc6664b73ef05d051319d52e5e326c5b05f8d8bcafefccb
  terminal-table (3.0.2) sha256=f951b6af5f3e00203fb290a669e0a85c5dd5b051b3b023392ccfd67ba5abae91
  unicode-display_width (2.6.0) sha256=12279874bba6d5e4d2728cef814b19197dbb10d7a7837a869bab65da943b7f5a
  webrick (1.9.2) sha256=beb4a15fc474defed24a3bda4ffd88a490d517c9e4e6118c3edce59e45864131

BUNDLED WITH
  4.0.5

```

File: `_config.yml`
```yaml
title: Anatoly Nikiforov
description: Architecture, Algorithms, System Design
theme: minima
plugins:
  - jekyll-feed
header_pages:
  - index.md
  - about/
  - specs/
  - deep-dives/
highlighter: rouge
markdown: kramdown
kramdown:
  syntax_highlighter: rouge
  syntax_highlighter_opts:
    block:
      line_numbers: false
    span:
      line_numbers: false
```

File: `_layouts/default.html`
```html
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{% if page.title %}{{ page.title }} | {{ site.title }}{% else %}{{ site.title }}{% endif %}</title>
  <link rel="stylesheet" href="{{ '/assets/css/style.css' | relative_url }}">
</head>
<body>
  <header class="site-header">
    <div class="wrapper">
      <a class="site-title" href="{{ '/' | relative_url }}">{{ site.title }}</a>
      <nav class="site-nav">
        {% for path in site.header_pages %}
          {% assign page = site.pages | where: "path", path | first %}
          {% if page.title %}
            <a class="nav-link" href="{{ page.url | relative_url }}">{{ page.title }}</a>
          {% endif %}
        {% endfor %}
      </nav>
    </div>
  </header>

  <main class="page-content" aria-label="Content">
    <div class="wrapper">
      {{ content }}
    </div>
  </main>

  <footer class="site-footer">
    <div class="wrapper">
      <p>&copy; {{ site.time | date: '%Y' }} {{ site.title }}</p>
    </div>
  </footer>

  <!-- CRT Effect JS (deferred, non-blocking) -->
  <script src="{{ '/assets/js/crt-effect.js' | relative_url }}" defer></script>
</body>
</html>
```
```

File: `_layouts/home.html`
```html
---
layout: default
---
<div class="home">
  {{ content }}
</div>
```

File: `_layouts/page.html`
```html
---
layout: default
---
<article class="post">
  <header class="post-header">
    <h1 class="post-title">{{ page.title }}</h1>
  </header>
  <div class="post-content">
    {{ content }}
  </div>
</article>
```

File: `_sass/_hacker.scss`
```scss
/**
Warm Nostalgia Theme - For veteran computer scientists
Inspired by: Vintage terminals, amber monitors, coffee shops, late-night coding
*/
@mixin theme() {
  :root {
    /* Warm amber/sepia palette (like old monitors + coffee) */
    --base-color: #ffb000;           /* Amber glow */
    --base-color-dim: #cc8c00;       /* Dimmed amber */
    --background-color: #1a1510;     /* Warm dark brown (not pure black) */
    --background-alt: #251e17;       /* Slightly lighter brown */
    --text-color: #ffcc80;           /* Warm light orange */
    --text-muted: #997755;           /* Muted brown-orange */
    
    /* Borders & Dividers */
    --border: solid 1px rgba(255, 176, 0, 0.3);
    --border-dashed: dashed 1px rgba(255, 176, 0, 0.2);
    
    /* Selection */
    --selection-background: rgba(255, 176, 0, 0.4);
    --selection-text: #1a1510;
    
    /* Links */
    --link-color: #ffb000;
    --link-hover: #ffcc80;
    
    /* Code Colors (warm palette) */
    --code-comment: #887766;
    --code-string: #ffcc80;
    --code-keyword: #ffb000;
    --code-function: #ffaa66;
    --code-number: #ff9966;
    --code-type: #ffcc99;
    
    /* Accents */
    --accent-warm: #ff9966;          /* Warm orange */
    --accent-coffee: #8b6f47;        /* Coffee brown */
    --accent-cream: #fff8e7;         /* Cream (for highlights) */
  }
}
```

File: `assets/css/style.scss`
```scss
```scss
---
---

/* =============================================================================
   WARM & COZY NOSTALGIA THEME + CRT TV EFFECT
   For veteran computer scientists
   ============================================================================= */

/* --- Warm Color Palette --- */
:root {
  --base-color: #ffb000;
  --base-color-dim: #cc8c00;
  --background-color: #1a1510;
  --background-alt: #251e17;
  --text-color: #ffcc80;
  --text-muted: #997755;
  --border: solid 1px rgba(255, 176, 0, 0.3);
  --border-dashed: dashed 1px rgba(255, 176, 0, 0.2);
  --selection-background: rgba(255, 176, 0, 0.4);
  --selection-text: #1a1510;
  --link-color: #ffb000;
  --link-hover: #ffcc80;
  
  /* Code Colors (warm palette) */
  --code-comment: #887766;
  --code-string: #ffcc80;
  --code-keyword: #ffb000;
  --code-function: #ffaa66;
  --code-number: #ff9966;
  --code-type: #ffcc99;
  
  /* CRT Effect Variables */
  --crt-noise-opacity: 0.12;
  --crt-scanline-opacity: 0.25;
  --crt-rgb-intensity: 0.03;
  --crt-power-duration: 400ms;
}

/* --- Global Base --- */
html, body {
  background-color: var(--background-color);
  color: var(--text-color);
  font-family: 'Courier New', 'Monaco', 'Consolas', monospace;
  font-size: 17px;
  line-height: 1.7;
  margin: 0;
  padding: 0;
}

/* --- Warm Background Gradient --- */
body {
  background: linear-gradient(180deg, var(--background-color) 0%, var(--background-alt) 100%);
  min-height: 100vh;
}

/* --- Selection --- */
::selection {
  background: var(--selection-background);
  color: var(--selection-text);
}

/* --- Links --- */
a {
  color: var(--link-color);
  text-decoration: none;
  border-bottom: var(--border-dashed);
  transition: all 0.3s ease;
}

a:hover {
  color: var(--link-hover);
  text-shadow: 0 0 8px rgba(255, 176, 0, 0.5);
  border-bottom-color: var(--link-hover);
}

/* --- Headers --- */
h1, h2, h3, h4, h5, h6 {
  color: var(--base-color);
  font-weight: bold;
  margin-top: 2.5em;
  margin-bottom: 1em;
  letter-spacing: 1px;
  text-shadow: 0 0 15px rgba(255, 176, 0, 0.3);
}

h1 {
  font-size: 2.2em;
  border-bottom: var(--border);
  padding-bottom: 0.5em;
}

h2 {
  font-size: 1.6em;
  border-left: 4px solid var(--base-color);
  padding-left: 1em;
}

h3 {
  font-size: 1.3em;
  color: #ff9966;
}

/* --- Site Header --- */
.site-header {
  background: var(--background-alt);
  border-bottom: var(--border);
  padding: 1.5em 0;
  box-shadow: 0 2px 20px rgba(255, 176, 0, 0.1);
}

.site-header .site-title {
  font-size: 1.8em;
  color: var(--base-color);
  letter-spacing: 2px;
}

.site-header .site-title:hover {
  text-shadow: 0 0 20px var(--base-color);
}

.site-header .site-nav {
  margin-top: 1em;
}

.site-header .nav-link {
  color: var(--text-color);
  margin-right: 1.5em;
  border: var(--border);
  padding: 0.4em 1em;
  border-radius: 3px;
}

.site-header .nav-link:hover {
  background: var(--base-color);
  color: var(--background-color);
  box-shadow: 0 0 15px rgba(255, 176, 0, 0.5);
}

/* --- Main Content --- */
.page-content {
  max-width: 850px;
  margin: 0 auto;
  padding: 3em 1.5em;
  background: rgba(255, 248, 231, 0.02);
  border-radius: 8px;
}

/* =============================================================================
   SYNTAX HIGHLIGHTING (Rouge-compatible)
   Warm Nostalgia Theme
   ============================================================================= */

/* --- Code Block Base --- */
pre, code {
  background: var(--background-alt);
  border: var(--border);
  font-family: 'Courier New', 'Monaco', 'Consolas', monospace;
  border-radius: 4px;
}

pre {
  padding: 1.5em;
  overflow-x: auto;
  margin: 2em 0;
  box-shadow: inset 0 0 30px rgba(0, 0, 0, 0.3);
  position: relative;
}

.highlight {
  background: var(--background-alt);
  border-radius: 4px;
  margin: 1.5em 0;
  
  pre {
    margin: 0;
    padding: 1.5em;
    background: transparent;
    border: none;
    box-shadow: none;
  }
  
  code {
    background: transparent;
    padding: 0;
    font-size: 0.9em;
    line-height: 1.6;
  }
}

/* Rouge token classes */
.highlight {
  .c   { color: var(--code-comment); font-style: italic; }
  .cm  { color: var(--code-comment); font-style: italic; }
  .cp  { color: var(--code-keyword); font-weight: bold; }
  .c1  { color: var(--code-comment); font-style: italic; }
  .cs  { color: var(--code-comment); font-style: italic; }
  
  .k   { color: var(--code-keyword); font-weight: bold; }
  .kc  { color: var(--code-keyword); font-weight: bold; }
  .kd  { color: var(--code-keyword); font-weight: bold; }
  .kn  { color: var(--code-keyword); font-weight: bold; }
  .kp  { color: var(--code-keyword); font-weight: bold; }
  .kr  { color: var(--code-keyword); font-weight: bold; }
  .kt  { color: var(--code-type); }
  
  .n   { color: var(--text-color); }
  .na  { color: var(--code-function); }
  .nb  { color: var(--code-function); }
  .bp  { color: var(--code-function); }
  .nc  { color: var(--code-type); font-weight: bold; }
  .no  { color: var(--accent-warm); }
  .nd  { color: var(--code-function); }
  .ni  { color: var(--text-color); }
  .ne  { color: var(--code-keyword); font-weight: bold; }
  .nf  { color: var(--code-function); font-weight: bold; }
  .nl  { color: var(--code-function); }
  .nn  { color: var(--code-type); font-weight: bold; }
  .nx  { color: var(--text-color); }
  .py  { color: var(--text-color); }
  .nt  { color: var(--code-keyword); font-weight: bold; }
  .nv  { color: var(--text-color); }
  
  .l   { color: var(--code-number); }
  .ld  { color: var(--code-string); }
  .s   { color: var(--code-string); }
  .sa  { color: var(--code-string); }
  .sb  { color: var(--code-string); }
  .sc  { color: var(--code-string); }
  .dl  { color: var(--code-string); }
  .sd  { color: var(--code-comment); font-style: italic; }
  .s2  { color: var(--code-string); }
  .se  { color: var(--accent-warm); font-weight: bold; }
  .sh  { color: var(--code-string); }
  .si  { color: var(--code-string); }
  .sx  { color: var(--code-string); }
  .sr  { color: var(--code-string); }
  .s1  { color: var(--code-string); }
  .ss  { color: var(--code-string); }
  
  .m   { color: var(--code-number); }
  .mb  { color: var(--code-number); }
  .mf  { color: var(--code-number); }
  .mh  { color: var(--code-number); }
  .mi  { color: var(--code-number); }
  .mo  { color: var(--code-number); }
  
  .o   { color: var(--code-keyword); font-weight: bold; }
  .ow  { color: var(--code-keyword); font-weight: bold; }
  
  .p   { color: var(--text-muted); }
  .pi  { color: var(--code-keyword); }
  
  .ge  { font-style: italic; }
  .gr  { color: var(--red); }
  .gh  { color: var(--base-color); font-weight: bold; }
  .gi  { color: var(--green); }
  .go  { color: var(--text-muted); }
  .gp  { color: var(--text-muted); }
  .gs  { font-weight: bold; }
  .gu  { color: var(--base-color); font-weight: bold; }
  .gt  { color: var(--red); }
  
  .w   { color: var(--text-muted); }
}

/* --- Inline Code --- */
:not(pre) > code {
  background: var(--background-alt);
  color: var(--code-string);
  padding: 0.2em 0.4em;
  border-radius: 3px;
  font-size: 0.9em;
}

/* --- Language Labels --- */
.highlight::before {
  content: attr(data-lang);
  position: absolute;
  top: 0.5em;
  right: 1em;
  font-size: 0.75em;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 1px;
  opacity: 0.7;
}

/* --- ASCII Art / Diagrams - No Highlighting --- */
pre.language-ascii,
pre.language-text,
pre.language-plaintext {
  .highlight {
    code {
      color: var(--base-color) !important;
      .c, .cm, .c1, .cs { color: var(--text-muted) !important; }
    }
  }
}

/* =============================================================================
   CRT TV EFFECT FOR CODE BLOCKS & ASCII ART
   Adapted from: https://codepen.io/Mobius1/pen/zZpoXj
   ============================================================================= */

/* --- CRT Container for code/ascii blocks --- */
.crt-block {
  position: relative;
  border-radius: 4px;
  overflow: hidden;
  background: var(--background-alt, #251e17);
  border: var(--border, solid 1px rgba(255, 176, 0, 0.3));
  margin: 2em 0;
}

/* --- CRT Canvas (Noise) --- */
.crt-canvas {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  opacity: var(--crt-noise-opacity);
  mix-blend-mode: overlay;
  z-index: 1;
}

/* --- Scanlines Overlay --- */
.crt-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 2;
  background: linear-gradient(
    transparent 50%,
    rgba(0, 0, 0, var(--crt-scanline-opacity)) 50%
  );
  background-size: 100% 3px;
  animation: scanline-scroll 8s linear infinite;
}

@keyframes scanline-scroll {
  0% { background-position: 0 0; }
  100% { background-position: 0 100%; }
}

/* --- RGB Shift / Chromatic Aberration --- */
.crt-rgb {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 3;
  background: linear-gradient(
    90deg,
    rgba(255, 0, 0, var(--crt-rgb-intensity)),
    rgba(0, 255, 0, calc(var(--crt-rgb-intensity) * 0.33)),
    rgba(0, 0, 255, var(--crt-rgb-intensity))
  );
  background-size: 4px 100%;
  animation: crt-shift 0.08s infinite steps(1);
  opacity: 0.7;
}

@keyframes crt-shift {
  0%, 100% { transform: translateX(0); }
  25% { transform: translateX(1px); }
  50% { transform: translateX(-1px); }
  75% { transform: translateX(0); }
}

/* --- Content Layer (above effects) --- */
.crt-block pre,
.crt-block code,
.crt-block .ascii-art {
  position: relative;
  z-index: 4;
  background: transparent !important;
  border: none !important;
  color: var(--text-color);
}

/* --- ASCII Art Specific Styling --- */
.ascii-art {
  font-family: 'Courier New', monospace;
  font-size: 14px;
  line-height: 1.4;
  white-space: pre;
  color: var(--base-color);
  text-shadow: 0 0 5px rgba(255, 176, 0, 0.3);
}

/* --- Optional: Glitch on Hover --- */
.crt-block:hover .crt-rgb {
  animation-duration: 0.04s;
  opacity: 1;
}

/* --- Power-On Animation --- */
.crt-power-on {
  animation: crt-power var(--crt-power-duration) ease-out forwards;
}

@keyframes crt-power {
  0% {
    opacity: 0;
    filter: brightness(0) contrast(0) saturate(0);
  }
  30% {
    opacity: 1;
    filter: brightness(3) contrast(2) saturate(1.5);
  }
  60% {
    filter: brightness(1.5) contrast(1.2) saturate(1.1);
  }
  100% {
    opacity: 1;
    filter: brightness(1.1) contrast(1) saturate(1);
  }
}

/* --- Disable on Mobile (performance) --- */
@media (max-width: 768px), (prefers-reduced-motion: reduce) {
  .crt-canvas,
  .crt-rgb {
    display: none;
  }
  .crt-overlay {
    opacity: 0.4;
    animation: none;
  }
}

/* --- Tables --- */
table {
  width: 100%;
  border-collapse: collapse;
  margin: 2em 0;
  border: var(--border);
  border-radius: 4px;
  overflow: hidden;
}

table th, table td {
  border: var(--border);
  padding: 1em;
  text-align: left;
}

table th {
  background: var(--background-alt);
  color: var(--base-color);
  letter-spacing: 1px;
}

table tr:hover {
  background: rgba(255, 176, 0, 0.05);
}

/* --- Blockquotes --- */
blockquote {
  border-left: 4px solid var(--base-color);
  margin: 2em 0;
  padding: 1.5em 2em;
  background: var(--background-alt);
  color: var(--text-muted);
  font-style: italic;
  border-radius: 0 4px 4px 0;
}

blockquote p {
  margin: 0;
}

/* --- Horizontal Rule --- */
hr {
  border: none;
  border-top: var(--border-dashed);
  margin: 3em 0;
  opacity: 0.5;
}

/* --- Site Footer --- */
.site-footer {
  border-top: var(--border);
  padding: 3em 0;
  margin-top: 4em;
  text-align: center;
  color: var(--text-muted);
  font-size: 0.9em;
  background: var(--background-alt);
}

.site-footer a {
  color: var(--base-color);
}

/* --- Hide Duplicate Footer Elements --- */
.site-footer .site-title,
.site-footer h2,
.site-footer .author {
  display: none;
}

/* --- Custom Classes --- */
.coffee-break {
  text-align: center;
  margin: 3em 0;
  padding: 2em;
  background: var(--background-alt);
  border: var(--border);
  border-radius: 8px;
}

.coffee-break::before {
  content: "☕ ";
  font-size: 2em;
  display: block;
  margin-bottom: 0.5em;
}

.nostalgia-note {
  background: rgba(255, 176, 0, 0.05);
  border: var(--border-dashed);
  padding: 1.5em;
  border-radius: 4px;
  margin: 2em 0;
  font-size: 0.95em;
}

.nostalgia-note::before {
  content: "📼  ";
}

.terminal-prompt::before {
  content: "$  ";
  color: var(--base-color);
  font-weight: bold;
}

.welcome-box {
  background: var(--background-alt);
  border: var(--border);
  padding: 2em;
  border-radius: 8px;
  margin: 2em 0;
  text-align: center;
}

.welcome-box h2 {
  border: none;
  padding: 0;
  margin-top: 0;
}

.theme-enter {
  display: inline-block;
  border: var(--border);
  padding: 0.5em 1em;
  margin: 0.5em 0;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 0.9em;
}

.theme-enter:hover {
  background: var(--base-color);
  color: var(--background-color);
  box-shadow: 0 0 15px rgba(255, 176, 0, 0.5);
}

/* --- Scrollbar --- */
::-webkit-scrollbar {
  width: 12px;
  height: 12px;
}

::-webkit-scrollbar-track {
  background: var(--background-color);
}

::-webkit-scrollbar-thumb {
  background: var(--base-color-dim);
  border: 2px solid var(--background-color);
  border-radius: 6px;
}

::-webkit-scrollbar-thumb:hover {
  background: var(--base-color);
}

/* --- Responsive --- */
@media (max-width: 600px) {
  html, body {
    font-size: 15px;
  }
  
  .page-content {
    padding: 1.5em 1em;
  }
  
  .site-header .site-nav .nav-link {
    display: block;
    margin: 0.5em 0;
  }
}

/* Terminal Animation Styles */
.terminal-container {
  background: var(--background-alt, #251e17);
  border: var(--border, solid 1px rgba(255, 176, 0, 0.3));
  border-radius: 4px;
  padding: 1.5em;
  font-family: 'Courier New', monospace;
  font-size: 0.95em;
  margin: 2em 0;
  min-height: 150px;
}

.terminal-line {
  display: block;
  margin: 0.5em 0;
  line-height: 1.5;
  color: var(--text-color, #ffcc80);
}

.terminal-prompt {
  color: var(--base-color, #ffb000);
  font-weight: bold;
}

.terminal-output {
  color: var(--text-color, #ffcc80);
}

.terminal-cursor {
  display: inline-block;
  width: 10px;
  height: 1.2em;
  background-color: var(--base-color, #ffb000);
  animation: blink 1s step-end infinite;
}

@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}
```
```

Export Summary
| Metric | Value |
|--------|-------|
| Total Files | 11 |
| Generated | 2026-02-21 04:38:54 |
| Format | Markdown (.md) |
| Scope | Config, CSS, Layouts, Scripts |
| Total Size | 23KB |

Auto-generated by generate_assets.py

File: `specs/index.md`
---
layout: page
title: Specifications
permalink: /specs/
---

## MIND Universe Specifications

Technical specifications developed during tenure at MIND Software (2023-2025). Each spec includes architecture sketches, benchmarks, and metrics with links to full Notion documentation.

---

## Available Specifications

| Specification | Purpose | Status |
|--------------|---------|--------|
| [MHA](mha/) | Model Hashing Algorithm — CIR change detection | [✓] Documented |
| [SSA](ssa/) | Sequence Sorting Algorithm — Go map ordering | [✓] Documented |
| [JEMP](jemp/) | Job Event Messaging Protocol — Concurrency model | [✓] Documented |
| [Validation Stack](validation-stack/) | Unified Model validation layer | [✓] Documented |
| [Transactional Models](transactional-models/) | VM deployment transaction process | [✓] Documented |

---

## Related Concepts

- [DRUID API](/deep-dives/mind-universe/) — Deploy, Refresh, Update, Import, Destroy (see MIND Universe)

---

[← Back to Home](/)
File: `specs/jemp.md`
---
layout: page
title: Job Event Messaging Protocol (JEMP)
permalink: /specs/jemp/
---

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Universe-concurrency-model-4ea53fe313bb47eeaf8711db26828c39)

---

## Overview

**Purpose:** Track concurrent job execution state without MQ overhead.

**Context:** MIND Universe Job Pool concurrency model.

**Problem:** Need to track job state (running, lost, finished) without constant MQ polling.

---

## Architecture

### Event-Driven Model

The Job Pool maintains all active jobs and communicates with them through the Event Bus. Three event types flow from jobs back to the pool: Heartbeat indicates the job is alive, Finished signals successful completion, and Internal is reserved for system services like the Job Collector. This event-driven approach eliminates the need for constant polling while maintaining full visibility into job state.

```text
┌─────────────────┐         ┌─────────────────┐
│    Job Pool     │◀───────▶│    Event Bus    │
└────────┬────────┘         └─────────────────┘
         │
         ├───────────────────┼───────────────────┐
         ▼                   ▼                   ▼
┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
│   Heartbeat     │ │   Finished      │ │   Internal      │
│   Event         │ │   Event         │ │   Event         │
└─────────────────┘ └─────────────────┘ └─────────────────┘
```

### Job Lifecycle

Jobs transition through four states from Queued to Running to Finished. The Lost state is reached when no Heartbeat is received within the configurable timeout threshold. This lifecycle allows the Job Collector to identify and unregister stalled jobs without blocking the execution of healthy ones.

```text
┌───────────┐     ┌───────────┐     ┌───────────┐     ┌───────────┐
│  Queued   │────▶│  Running  │────▶│  Finished │     │   Lost    │
└───────────┘     └─────┬─────┘     └───────────┘     └─────▲─────┘
                        │                                   │
                        └───────── Heartbeat ───────────────┘
                          (Timeout → Lost)
```

---

## Event Types

| Event Type | Description | Frequency |
|------------|-------------|-----------|
| **Heartbeat** | Job alive indicator | Every N seconds |
| **Finished** | Job completed successfully | Once per job |
| **Internal** | System events (JC, Checkpointer) | As needed |

---

## Components

### Job Collector (JC)

| Metric | Value |
|--------|-------|
| **Timeout Threshold** | Configurable (default: 5 min) |
| **Check Interval** | Every 30 seconds |
| **Action** | Unregister lost jobs from pool |

### Checkpointer

| Metric | Value |
|--------|-------|
| **Checkpoint Interval** | Configurable (default: 1 min) |
| **Persistence** | Local disk snapshot |
| **Recovery** | Restore queued jobs after restart |

---

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| Event bus overhead | Minimal (in-process) |
| Heartbeat frequency | Network traffic vs. detection speed |
| Checkpoint frequency | Disk I/O vs. recovery point |

---

## Related Specifications

- [MHA](/specs/mha/) — Model hashing
- [SSA](/specs/ssa/) — Sequence ordering
- [Validation Stack](/specs/validation-stack/) — Model validation
- [Transactional Models](/specs/transactional-models/) — Deployment states

---

[← Back to Specifications](/specs/)
File: `specs/mha.md`
---
layout: page
title: Model Hashing Algorithm (MHA)
permalink: /specs/mha/
---

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Model-Hashing-Algorithm-MHA-e725fd99f9d74481965cb542c1727d0e)

---

## Overview

**Purpose:** Detect changes between cloud infrastructure resource (CIR) database records and actual state on cloud provider sites.

**Context:** MIND Universe DRUID action stack (Refresh, Update actions).

---

## Architecture

### Nested Hashing Model

Each VM component (CPU, RAM, Disks, OS/ID) is hashed independently using only vendor-agnostic fields. Component hashes are then combined into a single VM hash for efficient comparison. This nested approach enables granular change detection at the component level rather than treating the VM as a monolithic blob.

```text
┌───────────────────────────────────────────────────────────────┐
│                      Virtual Machine                          │
├───────────────┬───────────────┬───────────────┬───────────────┤
│     CPU       │     RAM       │    Disks      │   OS / ID     │
│    (hash)     │    (hash)     │    (hash)     │    (hash)     │
└───────────────┴───────────────┴───────────────┴───────────────┘
                                │
                                ▼
                     ┌───────────────────────┐
                     │   Combined VM Hash    │
                     └───────────────────────┘
```

### Bidirectional Comparison

The Unified Model (database record) and Facts (cloud API response) are processed through identical MHA Hash Calc pipelines. Both directions produce comparable hashes because only common components are used. The Hash Compare step detects any divergence between stored state and actual infrastructure state.

```text
┌──────────────────┐              ┌──────────────────┐
│  Unified Model   │              │      Facts       │
│   (DB Record)    │              │  (Cloud API)     │
├──────────────────┤              ├──────────────────┤
│  MHA Hash Calc   │              │  MHA Hash Calc   │
└────────┬─────────┘              └────────┬─────────┘
         │                                 │
         └───────────────┬─────────────────┘
                         ▼
                 ┌─────────────────┐
                 │   Hash Compare  │
                 │  (Change Detect)│
                 └─────────────────┘
```

---

## Key Design Decisions

| Decision                   | Alternative        | Rationale                        |
| -------------------------- | ------------------ | -------------------------------- |
| **Nested Hashing**         | Flat hash          | Component-level change detection |
| **Bidirectional**          | One-way comparison | Same algorithm for DB + API      |
| **Common Components Only** | All fields         | Cross-cloud compatibility        |

---

## Metrics

| Metric                        | Value                             |
| ----------------------------- | --------------------------------- |
| **Hash Calculation Time**     | <100ms per CIR                    |
| **Change Detection Accuracy** | 100%                              |
| **Supported CIR Types**       | VM, Network, Storage              |
| **Cloud Providers**           | VMware, OpenStack, oVirt, SpaceVM |

---

## Trade-offs

| Trade-off                       | Impact                        |
| ------------------------------- | ----------------------------- |
| Vendor-specific fields excluded | Some details not tracked      |
| Hash collisions possible        | Mitigated by nested structure |
| Additional computation overhead | Acceptable for accuracy gain  |

---

## Related Specifications

- [SSA](/specs/ssa/) — Sequence ordering for model processing
- [JEMP](/specs/jemp/) — Job concurrency model
- [Validation Stack](/specs/validation-stack/) — Input validation
- [Transactional Models](/specs/transactional-models/) — VM deployment states

---

[← Back to Specifications](/specs/)

File: `specs/ssa.md`
---
layout: page
title: Sequence Sorting Algorithm (SSA)
permalink: /specs/ssa/
---

## Full Specification

📎 [**View on Notion →**](https://www.notion.so/Sequence-Sorting-Algorithm-SSA-44f828765101456d9ed1a3b6898088a1)

---

## Overview

**Purpose:** Sort Go map integer keys in ascending order with zero key last: `[1, 2, 4, 7, 0]`

**Context:** Sequential Model Processing (SMP) in MIND Universe DRUID API.

**Problem:** Go maps are unordered; we need deterministic iteration with zero-last semantics.

---

## Architecture

### Algorithm Flow

The Input Map contains integer keys that need sorting with zero positioned last. The Extract Keys step pulls all keys into a slice for processing. The Sort + Zero Logic sorts keys in ascending order then moves zero to the end. The Output Slice contains the final ordered sequence ready for model iteration.

```text
┌───────────────────┐
│   Input Map       │
│ {0:1, 2:3, 4:5}   │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│  Extract Keys     │
│   [0, 2, 4]       │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│  Sort + Zero      │
│   Last Logic      │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│  Output Slice     │
│   [2, 4, 0]       │
└───────────────────┘
```

---

## Implementation

```go
func SequenceSorting(m map[int]int) (order []int) {
    mlen := len(m)
    keys := make([]int, mlen)
    var mismatchCounter int
    for i := 0; i < mlen*2; i++ {
        _, ok := m[i]
        if ok {
            keys[i-mismatchCounter] = i
        } else {
            mismatchCounter++
        }
    }
    sort.Ints(keys)
    order = make([]int, mlen)
    for i := 1; i < mlen; i++ {
        order[i-1] = keys[i]
    }
    return
}
```

---

## Benchmarks

| Metric             | Value                            |
| ------------------ | -------------------------------- |
| **Input Size**     | 1,000,000 keys                   |
| **Execution Time** | 116.9 ms                         |
| **Complexity**     | O(n\*2) lookup + O(n log n) sort |
| **Memory**         | 2x key slice allocation          |

### Benchmark Results

```
Keys processed: 1000000
2023/05/26 15:17:32 Sort took 116.915073ms
```

### Mutations

```
Input:  {0: 1, 2: 3, 4: 5, 6: 7, 8: 9}
Keys:   [0, 2, 4, 6, 8]
Output: [2, 4, 6, 8, 0]
```

---

## Trade-offs

| Trade-off              | Impact                    |
| ---------------------- | ------------------------- |
| O(n\*2) iterations     | Acceptable for n <1M      |
| Extra slice allocation | Memory overhead ~2x       |
| Zero-last semantics    | Required for SMP ordering |

---

## Proof of Concept

🔗 [Go Playground: SSA PoC →](https://go.dev/play/p/gXdgi47OGDO)

---

## Related Specifications

- [MHA](/specs/mha/) — Model hashing
- [JEMP](/specs/jemp/) — Job messaging
- [Validation Stack](/specs/validation-stack/) — Model validation
- [Transactional Models](/specs/transactional-models/) — Deployment states

---

[← Back to Specifications](/specs/)

File: `specs/transactional-models.md`
---
layout: page
title: Transactional Models
permalink: /specs/transactional-models/
---

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Unified-model-transactions-in-the-Universe-Deploy-1561ff431c37452bb1e2645b27586b75)

---

## Overview

**Purpose:** Describe the multi-stage process of building Unified Models for VM deployment.

**Context:** MIND Universe VM deployment backend.

**Problem:** VM deployment requires multi-source, multi-stage model construction.

---

## Architecture

### Model States

The Prototype state is built from Source Unit and Placement data sources, tightly coupling the model to infrastructure specifics. User customization transforms the prototype into the Base state, allowing overrides of default values. The Complete state is reached after Universe validation and enrichment with platform-specific default arguments, making the model ready for deployment.

```text
┌───────────────┐      ┌───────────────┐      ┌───────────────┐
│   Prototype   │─────▶│     Base      │─────▶│   Complete    │
│    Model      │      │    Model      │      │    Model      │
└───────┬───────┘      └───────┬───────┘      └───────┬───────┘
        │                      │                      │
        ▼                      ▼                      ▼
┌───────────────┐      ┌───────────────┐      ┌───────────────┐
│ Source Unit + │      │  User Input   │      │  Validation + │
│  Placement    │      │ Customization │      │ Default Values│
└───────────────┘      └───────────────┘      └───────────────┘
```

---

## Model States

| State         | Source                         | Purpose                            |
| ------------- | ------------------------------ | ---------------------------------- |
| **Prototype** | Source Unit + Placement        | Initial model tied to data sources |
| **Base**      | User customization             | User overrides prototype values    |
| **Complete**  | Universe validation + defaults | Ready for deployment               |

---

## Key Design Decisions

| Decision                     | Alternative        | Rationale                      |
| ---------------------------- | ------------------ | ------------------------------ |
| **Three-state model**        | Single-state       | Clear separation of concerns   |
| **User customization step**  | Direct deploy      | User control over final config |
| **Validation before deploy** | Validate on target | Catch errors early             |

---

## Rollback Mechanism [!]

> **Note:** A rollback mechanism was implemented through DRUID API calls to remove redundant CIRs during deployment. This feature exists in the codebase but cannot be publicly documented due to NDA restrictions.

---

## Trade-offs

| Trade-off           | Impact                            |
| ------------------- | --------------------------------- |
| Multi-stage process | Increased complexity              |
| User customization  | More flexibility, more validation |
| Default values      | Consistency across platforms      |

---

## Related Specifications

- [MHA](/specs/mha/) — Model hashing
- [SSA](/specs/ssa/) — Sequence ordering
- [JEMP](/specs/jemp/) — Job messaging
- [Validation Stack](/specs/validation-stack/) — Model validation

---

[← Back to Specifications](/specs/)

File: `specs/validation-stack.md`
---
layout: page
title: Universe Validation Stack
permalink: /specs/validation-stack/
---

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Universe-Models-Validation-479bb17669ea446d8ea67e74f3be475f)

---

## Overview

**Purpose:** Centralized validation layer for Unified Models before infrastructure interaction.

**Context:** MIND Universe Job execution pipeline.

**Problem:** Handle user input errors locally before sending requests to cloud infrastructure.

---

## Architecture

### Stack Structure

Validators are pushed onto the stack as pluggable entities, each validating a single field or implementing complex logic. The stack executes validators in FILO (First-In-Last-Out) order and collects results for analysis. After execution completes, the stack empties unless validators are marked as reusable for future validation chains.

```text
┌───────────────────────────────────────────┐
│           Validation Stack                │
├───────────────────────────────────────────┤
│  Validator N (Top)                        │
│  Validator N-1                            │
│  ...                                      │
│  Validator 1 (Bottom)                     │
└───────────────────────────────────────────┘
                    │
                    ▼
              FILO Execution
```

### Execution Flow

```
Push Validators → Run Chain (FILO) → Collect Results → Empty Stack
```

---

## Scopes of Usage

| Scope | Name | Purpose |
|-------|------|---------|
| **Global** | Site Worker | Validate across the Job (e.g., look for duplicates) |
| **Models** | Site Driver | Check specific fields of Unified Models |

---

## Modes

### Strict Mode

Validation stops immediately after the first negative result, preventing further processing of invalid models. This mode is suitable when any validation failure should block deployment entirely.

```
Validator 1 [✓] → Validator 2 [✗] → STOP
```

### Fault-Tolerant Mode

All validators run to completion regardless of intermediate failures, collecting both positive and negative results. This mode enables comprehensive error reporting before blocking deployment.

```
Validator 1 [✓] → Validator 2 [✗] → Validator 3 [✓] → Collect All
```

---

## Reusable Validators

| Type | Behavior |
|------|----------|
| **Reusable** | Kept after chain execution |
| **Non-Reusable** | Removed after chain execution |

---

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| Additional validation layer | Slight latency increase |
| Local error handling | Reduced infrastructure errors |
| Pluggable validators | Flexible validation logic |

---

## Related Specifications

- [MHA](/specs/mha/) — Model hashing
- [SSA](/specs/ssa/) — Sequence ordering
- [JEMP](/specs/jemp/) — Job messaging
- [Transactional Models](/specs/transactional-models/) — Deployment states

---

[← Back to Specifications](/specs/)
Export Summary
| Metric | Value |
|--------|-------|
| Total Files | 20 |
| Generated | 2026-02-26 07:41:07 |
| Format | Markdown (.md) |
| Scope | .md files only |
| Total Size | 110KB |

Auto-generated by generate_context.py
