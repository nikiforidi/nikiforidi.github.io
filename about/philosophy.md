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
