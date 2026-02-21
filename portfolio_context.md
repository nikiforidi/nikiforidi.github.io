title: Portfolio Context Export
generated: 2026-02-21 06:30:00
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

```text
Share Early → Accept Feedback → Improve → Repeat
↓              ↓              ↓
GitHub        Issues, PRs    Real-world usage
Habr          Comments       237K views
PyPI          Downloads      anyd 0.4.1
```

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
- [✓] VPN tunneling (network privileges)
- [✓] Secrets management (memory protection)
- [✓] Hardware control (GPIO/USB access)
- [✓] System administration (service restarts)
- [✓] Database operations (credential isolation)

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
| **Input Size** | 1,000,000 keys |
| **Execution Time** | 116.9 ms |
| **Complexity** | O(n*2) lookup + O(n log n) sort |
| **Memory** | 2x key slice allocation |

### Benchmark Results

```text
Keys processed: 1000000
2023/05/26 15:17:32 Sort took 116.915073ms
```

### Mutations

```text
Input:  {0: 1, 2: 3, 4: 5, 6: 7, 8: 9}
Keys:   [0, 2, 4, 6, 8]
Output: [2, 4, 6, 8, 0]
```

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

Export Summary
| Metric | Value |
|--------|-------|
| Total Files | 18 |
| Generated | 2026-02-21 06:30:00 |
| Format | Markdown (.md) |
| Scope | .md files only |
| Total Size | 95KB |

Auto-generated by generate_context.py
```

---

## `portfolio_assets.md` (Updated with CRT Effect + Syntax Highlighting)

```markdown
title: Portfolio Assets Export
generated: 2026-02-21 06:30:00
format: Markdown
scope: CSS, HTML, JavaScript
Portfolio Assets Export
Export of stylesheets, layouts, and scripts with CRT TV effect.

File: `assets/css/style.scss`
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

File: `assets/js/crt-effect.js`
```javascript
/**
 * CRT TV Effect for Code Blocks & ASCII Art
 * Adds animated noise and scanlines to elements with class "crt-block"
 * Progressive enhancement: degrades gracefully if canvas unsupported
 */
(function() {
  'use strict';

  // Skip if canvas not supported or reduced motion preferred
  if (!document.createElement('canvas').getContext || 
      window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    return;
  }

  // Initialize CRT effect on matching blocks
  function initCRTBlocks() {
    const blocks = document.querySelectorAll('.crt-block');
    
    blocks.forEach(block => {
      // Skip if already initialized
      if (block.dataset.crtInitialized) return;
      block.dataset.crtInitialized = 'true';

      // Create canvas for noise
      const canvas = document.createElement('canvas');
      canvas.className = 'crt-canvas';
      block.insertBefore(canvas, block.firstChild);

      const ctx = canvas.getContext('2d');
      
      // Low-res canvas for performance
      const scale = 0.2;
      let width, height;

      function resize() {
        width = block.offsetWidth;
        height = block.offsetHeight;
        canvas.width = width * scale;
        canvas.height = height * scale;
      }

      // Generate noise frame
      function generateNoise() {
        const w = canvas.width;
        const h = canvas.height;
        const imageData = ctx.createImageData(w, h);
        const data = imageData.data;
        
        // Random grayscale noise
        for (let i = 0; i < data.length; i += 4) {
          const val = Math.random() * 255;
          data[i] = val;     // R
          data[i+1] = val;   // G
          data[i+2] = val;   // B
          data[i+3] = 255;   // A
        }
        ctx.putImageData(imageData, 0, 0);
      }

      // Animation loop (throttled)
      let animationFrame;
      const fps = 12;
      const frameDuration = 1000 / fps;
      let lastTime = 0;

      function animate(timestamp) {
        if (timestamp - lastTime >= frameDuration) {
          generateNoise();
          lastTime = timestamp;
        }
        animationFrame = requestAnimationFrame(animate);
      }

      // Initialize
      resize();
      animationFrame = requestAnimationFrame(animate);

      // Handle resize
      const resizeObserver = new ResizeObserver(resize);
      resizeObserver.observe(block);

      // Optional: power-on animation
      setTimeout(() => block.classList.add('crt-power-on'), 100);
    });
  }

  // Auto-wrap code blocks and ASCII art with CRT container
  function wrapCodeBlocks() {
    // Wrap pre > code blocks
    document.querySelectorAll('pre code').forEach(code => {
      const pre = code.parentElement;
      if (!pre.closest('.crt-block')) {
        const wrapper = document.createElement('div');
        wrapper.className = 'crt-block';
        pre.parentNode.insertBefore(wrapper, pre);
        wrapper.appendChild(pre);
      }
    });

    // Wrap ASCII art (detect by monospace + box-drawing chars)
    document.querySelectorAll('pre').forEach(pre => {
      const text = pre.textContent;
      // Simple heuristic: contains box-drawing characters
      if (/[\u2500-\u257F\u2580-\u259F]/.test(text) && !pre.closest('.crt-block')) {
        pre.classList.add('ascii-art');
        const wrapper = document.createElement('div');
        wrapper.className = 'crt-block';
        pre.parentNode.insertBefore(wrapper, pre);
        wrapper.appendChild(pre);
      }
    });
  }

  // Initialize on DOM ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
      wrapCodeBlocks();
      initCRTBlocks();
    });
  } else {
    wrapCodeBlocks();
    initCRTBlocks();
  }

  // Reinitialize after Jekyll navigation (if using AJAX)
  document.addEventListener('jekyll:loaded', () => {
    wrapCodeBlocks();
    initCRTBlocks();
  });
})();
```

File: `_layouts/default.html`
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

Export Summary
| Metric | Value |
|--------|-------|
| Total Files | 3 |
| Generated | 2026-02-21 06:30:00 |
| Format | Markdown (.md) |
| Scope | CSS, HTML, JavaScript with CRT effect |
| Total Size | 18KB |

Auto-generated by generate_assets.py
