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

📍 Moscow, Russia • ✈️ Open to Remote Work

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

| Question | Example (MHA) |
|----------|---------------|
| **Problem** | Detect CIR changes across cloud providers |
| **Constraints** | Different APIs, vendor-specific fields |
| **Trade-offs** | Hash collisions vs. comparison speed |
| **Success Metrics** | 100% change detection, <100ms hash calculation |

**Result:** 5 documented specifications before implementation.

---

### 3. Verification Over Assumption

| Layer | Tool | Purpose |
|-------|------|---------|
| **Input** | Universe Validation Stack | Validate Unified Models |
| **Output** | Prometheus, Grafana | Monitor system behavior |
| **Behavior** | Notion specs, Habr articles | Document decisions |

---

### 4. Teach to Learn

I solidify understanding by teaching:

| Platform | Output | Impact |
|----------|--------|--------|
| **MIPT** | 11 Go lectures | 100+ students |
| **JetBrains Academy** | Python Core project (Multilingual Translator) | Educational resource for Hyperskill track |
| **Habr** | 9 articles | 237K views, 13K karma |
| **Open Source** | 6 projects | 1,756 GitHub contributions |

---

### 5. Iterate Publicly
Share Early → Accept Feedback → Improve → Repeat
↓              ↓              ↓
GitHub        Issues, PRs    Real-world usage
Habr          Comments       237K views
PyPI          Downloads      anyd 0.4.1
---

## A Letter to Veteran Engineers

If you're reading this and you remember:

- ⌨️ Editing code in `vi` without syntax highlighting
- 💾 Compiling code overnight and hoping it worked
- 📠 Debugging via print statements and log files
- 🌐 Deploying via FTP and holding your breath
- 📚 Reading physical man pages because Stack Overflow didn't exist

...then you understand why **documentation matters**.

This portfolio is my small contribution to keeping that spirit alive—the belief that **engineering is a craft**, not just a job. That systems should be **understandable**, not just functional. That we should **leave things better than we found them**.

Welcome to my corner of the internet. The terminal is always warm, and there's always coffee. ☕

— Anatoly

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
2017 ──── 2018 ──── 2019 ──── 2020 ──── 2021 ──── 2022 ──── 2023 ──── 2024 ──── 2025 ──── 2026
│         │         │         │         │         │         │         │         │         │
▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼
Habr      DNSCrypt  JetBrains VPN       Carrier   Forest    MIPT      MIND      MIND      1C
Articles  (58K)     Academy   Manager   proxy     VPN       Course    Software  Software  Cloud
│         │
▼         ▼
Start       MHA, JEMP, SSA
Course      Validation Stack
---

## Detailed Chronology

| Period | Company | Role | Key Achievements |
|--------|---------|------|------------------|
| 2017-2018 | Habr | Author | 3 articles (121K views) |
| 2019-2020 | JetBrains | Python Engineer | Python Core course, Multilingual Translator |
| 2020-2021 | VPN Manager | Python Tech Lead | anyd, vpnm, vpnmd |
| 2021 | Carrierproxy | Full-Stack | Django + Vue.js |
| 2022 | ForestVPN | Go Tech Lead | CLI, Homebrew, 116 releases |
| 2022-2023 | MIPT | Instructor | Go course (11 lectures) |
| 2023-2025 | MIND Software | Chief Developer | MHA, JEMP, SSA |
| 2025-2026 | 1C | Service Engineer | Crash dump service |

---

## Career Progression

| Level | Period | Focus |
|-------|--------|-------|
| **Junior** | 2019-2020 | Python development, learning |
| **Middle** | 2020-2022 | System programming, leadership |
| **Senior** | 2022-2025 | Architecture, distributed systems |
| **Staff** | 2025-present | Service reliability, monitoring |

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
- ✅ VPN tunneling (network privileges)
- ✅ Secrets management (memory protection)
- ✅ Hardware control (GPIO/USB access)
- ✅ System administration (service restarts)
- ✅ Database operations (credential isolation)

---

## Architecture

### Component Model

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
        return { "status": "connected" }

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
    _secrets = { "api_key": "super_secret_123" }
    
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
        return { "status": "rotated" }

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
        return { "status": "restarted" }

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
| multiprocessing.connection | ZeroMQ, gRPC | Python stdlib, no external dependencies |
| Pickle serialization | JSON, Protocol Buffers | Native Python, supports exception objects |
| @api decorator | Manual registry dict | Clean, Pythonic method registration |
| Exception propagation | Error codes | Client sees actual exceptions, daemon stays up |
| Context manager | Manual connect/close | Automatic cleanup, prevents resource leaks |
| SIGENDS protocol | TCP FIN | Explicit session termination signal |

---

## Core Components

### Appd (Server)

| Feature | Description |
|---------|-------------|
| Inheritance | multiprocessing.connection.Listener |
| API Registry | _api dictionary stores decorated methods |
| Request Format | (endpoint, args, kwargs) tuple |
| Response | Any Python object or Exception |
| Session Close | SIGENDS byte signal |
| Logging | Connection, request, response events |

### Client (via ClientSession)

| Feature | Description |
|---------|-------------|
| Wrapper | multiprocessing.connection.Client |
| Method | commit(endpoint, *args, **kwargs) |
| Exception Handling | Re-raises server exceptions locally |
| Session Management | Context manager (with statement) |
| Cleanup | Automatic end_session() on exit |

---

## Security Model

| Layer | Mechanism | Purpose |
|-------|-----------|---------|
| Authentication | authkey (bytes) | Prevent unauthorized connections |
| Transport | TCP/Unix sockets | Local IPC only (localhost) |
| Serialization | Pickle | Python-native, but trusted environment only |
| Session | SIGENDS signal | Clean connection termination |
| Isolation | Process boundary | Memory separation between client/server |

---

## Metrics

| Metric | Value |
|--------|-------|
| Version | 0.4.1 (latest) |
| Release Date | Aug 20, 2021 |
| Package Size | 4.5 kB (source), 4.3 kB (wheel) |
| Upload Tool | poetry/1.1.8 |
| Dependencies | Python stdlib only |
| Lines of Code | ~200 (core.py) |

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

Cross-platform VPN CLI client for Linux, OpenWRT, macOS, and Windows.

**External Resources:**
- [Repository](https://github.com/forestvpn/cli) — 792 commits, 116 releases
- **Period:** May 2022 — April 2023
- **Role:** Go Technical Lead

---

## Repository Statistics

| Metric | Value |
|--------|-------|
| **Commits** | 792 |
| **Releases** | 116 (Latest: v0.3.5, Jun 27, 2023) |
| **Stars** | 8 |
| **Forks** | 1 |
| **Contributors** | 5 |
| **Languages** | Go 82.8%, Shell 17.2% |
| **License** | MIT |

---

## Architecture

### Package Structure

| Package | Purpose |
|---------|---------|
| [actions](https://github.com/forestvpn/cli/tree/main/src/actions) | High-level Actions (urfave/cli v2) |
| [api](https://github.com/forestvpn/cli/tree/main/src/api) | API client (wgrest) |
| [auth](https://github.com/forestvpn/cli/tree/main/src/auth) | Authentication (Firebase REST API) |
| [cmd](https://github.com/forestvpn/cli/tree/main/src/cmd) | Entry point |
| [utils](https://github.com/forestvpn/cli/tree/main/src/utils) | Helper functions |

---

## Distribution Channels

| Platform | Package Type | Delivery |
|----------|--------------|----------|
| **macOS** | Homebrew | [stable](https://github.com/forestvpn/homebrew-stable), [beta](https://github.com/forestvpn/homebrew-beta) |
| **Debian/Ubuntu** | .deb | GitHub Releases |
| **Fedora** | .rpm | GitHub Releases |
| **Alpine** | .apk | GitHub Releases |
| **Windows** | Chocolatey | [community.chocolatey.org/packages/fvpn](https://community.chocolatey.org/packages/fvpn) |
| **OpenWRT** | .ipk | GitHub Releases |

---

## CI/CD Pipeline

| Tool | Purpose |
|------|---------|
| [Drone CI](https://www.drone.io/) | Automated builds |
| [GoReleaser](https://goreleaser.com/) | Stable & beta releases |
| [Sentry](https://sentry.io/welcome/) | Error tracking |
| GitHub Releases | Continuous delivery |

---

## See Also

- [Full source code](https://github.com/forestvpn/cli)

---

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

| Project | Description | Links |
|---------|-------------|-------|
| [anyd Daemon Framework](anyd-daemon-framework/) | Unix daemon IPC framework | [PyPI](https://pypi.org/project/anyd/), [GitHub](https://github.com/anatolio-deb/anyd) |
| [VPN Tunneling Architecture](vpn-tunneling-architecture/) | Linux VPN client with TUN/TAP | [vpnm](https://github.com/nikiforidi/vpnm), [vpnmd](https://github.com/nikiforidi/vpnmd) |
| [ForestVPN CLI](forestvpn-cli/) | Cross-platform VPN client | [GitHub](https://github.com/forestvpn/cli) |
| [JetBrains Academy](jetbrains-academy/) | Python educational project | [Hyperskill](https://hyperskill.org/projects/99) |
| [MIND Universe](mind-universe/) | Cloud infrastructure management | [Specs](/specs/) |

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
File: `deep-dives/vpn-tunneling-architecture.md`
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

```text
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│   vpnm CLI    │────▶│   vpnmd       │────▶│  anyd IPC     │
│   (User)      │     │   (Root)      │     │  (Sockets)    │
└───────┬───────┘     └───────┬───────┘     └───────┬───────┘
        │                     │                     │
        ▼                     ▼                     ▼
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│  cloudflared  │     │  tun2socks    │     │  v2ray-core   │
│    (DoH)      │     │   (TUN)       │     │   (Proxy)     │
└───────────────┘     └───────────────┘     └───────────────┘
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
| [vpnm](https://github.com/nikiforidi/vpnm) | 154 | 12 | 1 | [✓] Stable Reference |
| [vpnmd](https://github.com/nikiforidi/vpnmd) | 62 | 3 | 0 | [✓] Stable Reference |

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
File: `index.md`
---
layout: home
title: Technical Portfolio
tagline: Architecture, Algorithms, System Design
permalink: /
---

## Welcome, Traveler ☕

```bash
$ whoami
> Anatoly Nikiforov
$ status
> Ready for remote work
$ location
> Moscow, Russia
$ echo "Grab a coffee, make yourself comfortable"
```

Pull up a chair. This portfolio is designed for cozy reading about engineering craft—the kind of late-night coding sessions where the only company is your terminal, a warm cup of coffee, and the satisfaction of solving hard problems.

Whether you're here to review architecture, reminisce about the old days, or just enjoy well-documented systems, make yourself at home.

---

## System Modules

| Module | Content | Access |
|--------|---------|--------|
| [[specs/](/specs/)](/specs/) | 5 architectural specs (MHA, SSA, JEMP) | [[ENTER](/specs/)](/specs/) {: .theme-enter} |
| [[deep-dives/](/deep-dives/)](/deep-dives/) | Technical breakdowns of key projects | [[ENTER](/deep-dives/)](/deep-dives/) {: .theme-enter} |
| [[about/](/about/)](/about/) | Engineering philosophy, career timeline | [[ENTER](/about/)](/about/) {: .theme-enter} |

---

## Featured Processes

### ▶ Model Hashing Algorithm (MHA)

Bidirectional hashing for cloud infrastructure resource comparison.

- **Problem:** Detect CIR changes across different cloud providers
- **Solution:** Nested hashing with unified model abstraction
- **Metrics:** <100ms hash calculation, 100% change detection
- **Execute:** `[/specs/mha/](/specs/mha/)`

### ▶ Sequence Sorting Algorithm (SSA)

Custom Go algorithm for ordered map iteration with zero-last semantics.

- **Problem:** Go maps are unordered, but we need `[1, 2, 4, 7, 0]`
- **Solution:** O(n*2) lookup with mismatch counter
- **Benchmark:** 1,000,000 keys in 116.9 ms
- **Execute:** `[/specs/ssa/](/specs/ssa/)`

### ▶ Job Event Messaging Protocol (JEMP)

Event-driven concurrency model for distributed job execution.

- **Problem:** Track concurrent jobs without MQ overhead
- **Solution:** Heartbeat events + Job Collector + Checkpointer
- **Execute:** `[/specs/jemp/](/specs/jemp/)`

> "What I cannot create, I do not understand."
> — Richard Feynman

---

## Featured Deep Dives

### ▶ anyd Daemon Framework

Unix daemon IPC framework published on PyPI.

- **PyPI:** `[anyd 0.4.1](https://pypi.org/project/anyd/)`
- **GitHub:** `[anatolio-deb/anyd](https://github.com/anatolio-deb/anyd)`
- **Tech:** POSIX sockets, IPC, authentication, validation
- **Execute:** `[/deep-dives/anyd-daemon-framework/](/deep-dives/anyd-daemon-framework/)`

### ▶ VPN Tunneling Architecture

Linux VPN client with TUN/TAP, Netfilter, and DNS redirection.

- **Repositories:** `[vpnm](https://github.com/nikiforidi/vpnm)` (154 commits), `[vpnmd](https://github.com/nikiforidi/vpnmd)` (62 commits)
- **Tech:** TUN/TAP, Netfilter, cloudflared DoH, tun2socks
- **Execute:** `[/deep-dives/vpn-tunneling-architecture/](/deep-dives/vpn-tunneling-architecture/)`

### ▶ ForestVPN CLI

Cross-platform VPN client (Linux, macOS, Windows, OpenWRT).

- **Repository:** `[forestvpn/cli](https://github.com/forestvpn/cli)`
- **Stats:** 792 commits, 116 releases, 8 stars
- **Tech:** Go 82.8%, Shell 17.2%, Homebrew, Chocolatey
- **Execute:** `[/deep-dives/forestvpn-cli/](/deep-dives/forestvpn-cli/)`

---

## System Status

| Metric | Value |
|--------|-------|
| Uptime | 5+ years (2019–2026) |
| Commits | 1,756+ contributions |
| Packages | 1 published (anyd 0.4.1) |
| Docs | 5 architectural specifications |
| Last Build | February 2026 |
| Coffee Consumed | ∞ cups |

> **Note:** All links are verified. All claims are backed by public evidence.

The terminal is warm, the coffee is fresh, and the code is documented.

Stay a while. 🖥️
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

| Decision | Alternative | Rationale |
|----------|-------------|-----------|
| **Nested Hashing** | Flat hash | Component-level change detection |
| **Bidirectional** | One-way comparison | Same algorithm for DB + API |
| **Common Components Only** | All fields | Cross-cloud compatibility |

---

## Metrics

| Metric | Value |
|--------|-------|
| **Hash Calculation Time** | <100ms per CIR |
| **Change Detection Accuracy** | 100% |
| **Supported CIR Types** | VM, Network, Storage |
| **Cloud Providers** | VMware, OpenStack, oVirt, SpaceVM |

---

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| Vendor-specific fields excluded | Some details not tracked |
| Hash collisions possible | Mitigated by nested structure |
| Additional computation overhead | Acceptable for accuracy gain |

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

| Metric | Value |
|--------|-------|
| Input Size | 1,000,000 keys |
| Execution Time | 116.9 ms |
| Complexity | O(n*2) lookup + O(n log n) sort |
| Memory | 2x key slice allocation |

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

| Trade-off | Impact |
|-----------|--------|
| O(n*2) iterations | Acceptable for n <1M |
| Extra slice allocation | Memory overhead ~2x |
| Zero-last semantics | Required for SMP ordering |

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

| State | Source | Purpose |
|-------|--------|---------|
| **Prototype** | Source Unit + Placement | Initial model tied to data sources |
| **Base** | User customization | User overrides prototype values |
| **Complete** | Universe validation + defaults | Ready for deployment |

---

## Key Design Decisions

| Decision | Alternative | Rationale |
|----------|-------------|-----------|
| **Three-state model** | Single-state | Clear separation of concerns |
| **User customization step** | Direct deploy | User control over final config |
| **Validation before deploy** | Validate on target | Catch errors early |

---

## Rollback Mechanism ⚠️

> **Note:** A rollback mechanism was implemented through DRUID API calls to remove redundant CIRs during deployment. This feature exists in the codebase but cannot be publicly documented due to NDA restrictions.

---

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| Multi-stage process | Increased complexity |
| User customization | More flexibility, more validation |
| Default values | Consistency across platforms |

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
```
Validator 1 ✓ → Validator 2 ✗ → STOP
```

### Fault-Tolerant Mode
```
Validator 1 ✓ → Validator 2 ✗ → Validator 3 ✓ → Collect All
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