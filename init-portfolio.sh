#!/bin/bash
################################################################################
# Portfolio Generator
# Version: 10.5 (DRUID API References MIND Universe)
################################################################################
set -e
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Portfolio Generator                                  ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

################################################################################
# 1. Directory Selection (Interactive)
################################################################################
echo -e "${YELLOW}Step 1: Choose Portfolio Directory${NC}"
echo ""
echo -e "  ${GREEN}✓${NC} Press ${YELLOW}Enter${NC} to use current directory: ${GREEN}$(pwd)${NC}"
echo -e "  ${GREEN}✓${NC} Or type a directory name (e.g., ${YELLOW}portfolio${NC}, ${YELLOW}tech-portfolio${NC})"
echo ""
read -p "  > Directory name: " PORTFOLIO_DIR

if [ -z "$PORTFOLIO_DIR" ]; then
    PORTFOLIO_DIR="."
    echo -e "  ${GREEN}→ Using current directory${NC}"
else
    if [[ "$PORTFOLIO_DIR" != /* ]]; then
        PORTFOLIO_DIR="$(pwd)/$PORTFOLIO_DIR"
    fi
    echo -e "  ${GREEN}→ Target: $PORTFOLIO_DIR${NC}"
fi

if [ ! -d "$PORTFOLIO_DIR" ]; then
    echo -e "  ${YELLOW}Creating directory...${NC}"
    mkdir -p "$PORTFOLIO_DIR"
fi

cd "$PORTFOLIO_DIR"

################################################################################
# 2. Create Directory Structure
################################################################################
echo ""
echo -e "${YELLOW}Step 2: Creating Directory Structure...${NC}"
echo ""

dirs=("specs" "deep-dives" "about" "assets" "assets/images" "assets/css" "assets/js")
for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo -e "  ${GREEN}✓${NC} $dir exists"
    else
        mkdir -p "$dir"
        echo -e "  ${GREEN}+${NC} $dir created"
    fi
done

################################################################################
# 3. Create _config.yml
################################################################################
echo ""
echo -e "${YELLOW}Step 3: Creating Configuration...${NC}"
echo ""

cat > _config.yml << 'CONFIGEOF'
title: Anatoly Nikiforov - Technical Portfolio
description: Architecture, Algorithms, System Design
theme: minima
plugins:
  - jekyll-feed

header_pages:
  - index.md
  - about/
  - specs/
  - deep-dives/
CONFIGEOF
echo -e "  ${GREEN}+${NC} _config.yml created"

################################################################################
# 4. Create index.md (Home Page)
################################################################################
echo ""
echo -e "${YELLOW}Step 4: Creating Home Page...${NC}"
echo ""

cat > index.md << 'INDEXEOF'
---
layout: home
title: Technical Portfolio
tagline: Architecture, Algorithms, System Design
permalink: /
---

## Grab a Cup of Tea ☕

This portfolio is designed for **cozy reading** about engineering craft.

Here you'll find the **how** and **why** behind the systems I've built.

---

## What You'll Find Here

| Section | Content | For Whom |
|---------|---------|----------|
| [Specifications](/specs/) | 5 architectural specs (MHA, SSA, JEMP) | System Architects |
| [Deep Dives](/deep-dives/) | Technical breakdowns of key projects | Senior Engineers |
| [About](/about/) | Engineering philosophy, career timeline | All Readers |

---

## Featured Specifications

### Model Hashing Algorithm (MHA)
Bidirectional hashing for cloud infrastructure resource comparison.
- **Problem:** Detect CIR changes across different cloud providers
- **Solution:** Nested hashing with unified model abstraction
- **Metrics:** <100ms hash calculation, 100% change detection
- **Read:** [specs/mha.md](/specs/mha.md)

### Sequence Sorting Algorithm (SSA)
Custom Go algorithm for ordered map iteration with zero-last semantics.
- **Problem:** Go maps are unordered, but we need `[1, 2, 4, 7, 0]`
- **Solution:** O(n*2) lookup with mismatch counter
- **Benchmark:** 1,000,000 keys in 116.9 ms
- **Read:** [specs/ssa.md](/specs/ssa.md)

### Job Event Messaging Protocol (JEMP)
Event-driven concurrency model for distributed job execution.
- **Problem:** Track concurrent jobs without MQ overhead
- **Solution:** Heartbeat events + Job Collector + Checkpointer
- **Read:** [specs/jemp.md](/specs/jemp.md)

---

## Featured Deep Dives

### anyd Daemon Framework
Unix daemon IPC framework published on PyPI.
- **PyPI:** [anyd 0.4.1](https://pypi.org/project/anyd/)
- **GitHub:** [anatolio-deb/anyd](https://github.com/anatolio-deb/anyd)
- **Tech:** POSIX sockets, IPC, authentication, validation
- **Read:** [deep-dives/anyd-daemon-framework.md](/deep-dives/anyd-daemon-framework.md)

### VPN Tunneling Architecture
Linux VPN client with TUN/TAP, Netfilter, and DNS redirection.
- **Repositories:** [vpnm](https://github.com/nikiforidi/vpnm) (154 commits), [vpnmd](https://github.com/nikiforidi/vpnmd) (62 commits)
- **Tech:** TUN/TAP, Netfilter, cloudflared DoH, tun2socks
- **Read:** [deep-dives/vpn-tunneling-architecture.md](/deep-dives/vpn-tunneling-architecture.md)

### ForestVPN CLI
Cross-platform VPN client (Linux, macOS, Windows, OpenWRT).
- **Repository:** [forestvpn/cli](https://github.com/forestvpn/cli)
- **Stats:** 792 commits, 116 releases, 8 stars
- **Tech:** Go 82.8%, Shell 17.2%, Homebrew, Chocolatey
- **Read:** [deep-dives/forestvpn-cli.md](/deep-dives/forestvpn-cli.md)

---

## At a Glance

| Metric | Value |
|--------|-------|
| **Professional Experience** | 5+ years (2019–2026) |
| **Community Activity** | 9 years (Habr since 2017) |
| **Companies** | 7 (1C, MIND, MIPT, ForestVPN, Carrierproxy, VPN Manager, JetBrains) |
| **Publications** | 9 Habr articles (237K+ views, 13K+ karma) |
| **GitHub** | 1,756 contributions, 26 repositories |
| **PyPI Packages** | 1 published ([anyd 0.4.1](https://pypi.org/project/anyd/), Aug 2021) |
| **Architecture Specs** | 5 documented specifications |
| **Lectures** | 11 (MIPT Go Course) |

---

> **Note:** All links are verified. All claims are backed by public evidence.
> 
> **Last Updated:** February 2026
INDEXEOF
echo -e "  ${GREEN}+${NC} index.md created"

################################################################################
# 5. Create about/index.md (About Hub)
################################################################################
echo ""
echo -e "${YELLOW}Step 5: Creating About Hub...${NC}"
echo ""

cat > about/index.md << 'ABOUTINDEXEOF'
---
layout: page
title: About
permalink: /about/
---

## Анатолий Никифоров
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
ABOUTINDEXEOF
echo -e "  ${GREEN}+${NC} about/index.md created"

################################################################################
# 6. Create about/philosophy.md
################################################################################
echo ""
echo -e "${YELLOW}Step 6: Creating Engineering Philosophy...${NC}"
echo ""

cat > about/philosophy.md << 'PHILOSOPHYEOF'
---
layout: page
title: Engineering Philosophy
permalink: /about/philosophy/
---

## Core Principles

### 1. Systems Thinking

I work comfortably across all layers of the stack:

```
┌─────────────────────────────────────────┐
│  Application (Go, Python, Vue.js)       │
│  - REST APIs, CLI clients, Web UI       │
├─────────────────────────────────────────┤
│  System (Linux, Docker, systemd)        │
│  - Daemons, IPC, network tunneling      │
├─────────────────────────────────────────┤
│  Kernel (Netfilter, TUN/TAP, POSIX)     │
│  - Kernel modules, sockets, syscalls    │
└─────────────────────────────────────────┘
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

```
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
PHILOSOPHYEOF
echo -e "  ${GREEN}+${NC} about/philosophy.md created"

################################################################################
# 7. Create about/timeline.md
################################################################################
echo ""
echo -e "${YELLOW}Step 7: Creating Career Timeline...${NC}"
echo ""

cat > about/timeline.md << 'TIMELINEEOF'
---
layout: page
title: Career Timeline
permalink: /about/timeline/
---

## Visual Timeline

```
2017 ──── 2018 ──── 2019 ──── 2020 ──── 2021 ──── 2022 ──── 2023 ──── 2024 ──── 2025 ──── 2026
  │         │         │         │         │         │         │         │         │         │
  ▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼         ▼
Habr      DNSCrypt  JetBrains VPN       Carrier   Forest    MIPT      MIND      MIND      1C
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
TIMELINEEOF
echo -e "  ${GREEN}+${NC} about/timeline.md created"

################################################################################
# 8. Create about/communities.md
################################################################################
echo ""
echo -e "${YELLOW}Step 8: Creating Professional Communities...${NC}"
echo ""

cat > about/communities.md << 'COMMUNITIESEOF'
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
COMMUNITIESEOF
echo -e "  ${GREEN}+${NC} about/communities.md created"

################################################################################
# 9. Create about/contact.md
################################################################################
echo ""
echo -e "${YELLOW}Step 9: Creating Contact Page...${NC}"
echo ""

cat > about/contact.md << 'CONTACTEOF'
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
CONTACTEOF
echo -e "  ${GREEN}+${NC} about/contact.md created"

################################################################################
# 10. Create specs/index.md
################################################################################
echo ""
echo -e "${YELLOW}Step 10: Creating Specifications Index...${NC}"
echo ""

cat > specs/index.md << 'SPECSINDEXEOF'
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
| [MHA](mha.md) | Model Hashing Algorithm — CIR change detection | ✅ Documented |
| [SSA](ssa.md) | Sequence Sorting Algorithm — Go map ordering | ✅ Documented |
| [JEMP](jemp.md) | Job Event Messaging Protocol — Concurrency model | ✅ Documented |
| [Validation Stack](validation-stack.md) | Unified Model validation layer | ✅ Documented |
| [Transactional Models](transactional-models.md) | VM deployment transaction process | ✅ Documented |

---

## Related Concepts

- [DRUID API](/deep-dives/mind-universe.md) — Deploy, Refresh, Update, Import, Destroy (see MIND Universe)

---

**Author:** Anatoly Nikiforov, 2023-2025
SPECSINDEXEOF
echo -e "  ${GREEN}+${NC} specs/index.md created"

################################################################################
# 11. Create specs/mha.md
################################################################################
echo ""
echo -e "${YELLOW}Step 11: Creating MHA Specification...${NC}"
echo ""

cat > specs/mha.md << 'MHAEOF'
---
layout: page
title: Model Hashing Algorithm (MHA)
permalink: /specs/mha/
author: Anatoly Nikiforov, 2023
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

```
┌─────────────────────────────────────────────────────────┐
│                    Virtual Machine                       │
├─────────────┬─────────────┬─────────────┬──────────────┤
│     CPU     │     RAM     │    Disks    │  OS / ID     │
│   (hash)    │   (hash)    │   (hash)    │   (hash)     │
└─────────────┴─────────────┴─────────────┴──────────────┘
                          │
                          ▼
              ┌───────────────────────┐
              │   Combined VM Hash    │
              └───────────────────────┘
```

### Bidirectional Comparison

```
┌──────────────────┐              ┌──────────────────┐
│  Unified Model   │              │      Facts       │
│   (DB Record)    │              │  (Cloud API)     │
├──────────────────┤              ├──────────────────┤
│  MHA Hash Calc   │              │  MHA Hash Calc   │
└────────┬─────────┘              └────────┬─────────┘
         │                                 │
         └─────────────┬───────────────────┘
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

- [SSA](ssa.md) — Sequence ordering for model processing
- [JEMP](jemp.md) — Job concurrency model
- [Validation Stack](validation-stack.md) — Input validation
- [Transactional Models](transactional-models.md) — VM deployment states

---

[← Back to Specifications](/specs/)
MHAEOF
echo -e "  ${GREEN}+${NC} specs/mha.md created"

################################################################################
# 12. Create specs/ssa.md
################################################################################
echo ""
echo -e "${YELLOW}Step 12: Creating SSA Specification...${NC}"
echo ""

cat > specs/ssa.md << 'SSAEOF'
---
layout: page
title: Sequence Sorting Algorithm (SSA)
permalink: /specs/ssa/
author: Anatoly Nikiforov, 2023
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

```
┌─────────────────┐
│   Input Map     │
│ {0:1, 2:3, 4:5} │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Extract Keys   │
│   [0, 2, 4]     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Sort + Zero    │
│   Last Logic    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Output Slice   │
│   [2, 4, 0]     │
└─────────────────┘
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

```
Keys processed: 1000000
2023/05/26 15:17:32 Sort took 116.915073ms
```

---

## Mutations

```
Input:  {0: 1, 2: 3, 4: 5, 6: 7, 8: 9}
Keys:   [0, 2, 4, 6, 8]
Output: [2, 4, 6, 8, 0]
```

---

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| O(n*2) iterations | Acceptable for n<1M |
| Extra slice allocation | Memory overhead ~2x |
| Zero-last semantics | Required for SMP ordering |

---

## Proof of Concept

🔗 [**Go Playground: SSA PoC →**](https://go.dev/play/p/gXdgi47OGDO)

---

## Related Specifications

- [MHA](mha.md) — Model hashing
- [JEMP](jemp.md) — Job messaging
- [Validation Stack](validation-stack.md) — Model validation
- [Transactional Models](transactional-models.md) — Deployment states

---

[← Back to Specifications](/specs/)
SSAEOF
echo -e "  ${GREEN}+${NC} specs/ssa.md created"

################################################################################
# 13. Create specs/jemp.md
################################################################################
echo ""
echo -e "${YELLOW}Step 13: Creating JEMP Specification...${NC}"
echo ""

cat > specs/jemp.md << 'JEMPEOF'
---
layout: page
title: Job Event Messaging Protocol (JEMP)
permalink: /specs/jemp/
author: Anatoly Nikiforov, 2023
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

```
┌─────────────┐         ┌─────────────┐
│  Job Pool   │◄───────►│  Event Bus  │
└─────────────┘         └─────────────┘
                              │
         ┌────────────────────┼────────────────────┐
         ▼                    ▼                    ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Heartbeat     │  │   Finished      │  │   Internal      │
│   Event         │  │   Event         │  │   Event         │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

### Job Lifecycle

```
┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐
│  Queued │───▶│ Running │───▶│Finished │    │  Lost   │
└─────────┘    └────┬────┘    └─────────┘    └────▲────┘
                    │                              │
                    └────── Heartbeat ─────────────┘
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

- [MHA](mha.md) — Model hashing
- [SSA](ssa.md) — Sequence ordering
- [Validation Stack](validation-stack.md) — Model validation
- [Transactional Models](transactional-models.md) — Deployment states

---

[← Back to Specifications](/specs/)
JEMPEOF
echo -e "  ${GREEN}+${NC} specs/jemp.md created"

################################################################################
# 14. Create specs/validation-stack.md
################################################################################
echo ""
echo -e "${YELLOW}Step 14: Creating Validation Stack Specification...${NC}"
echo ""

cat > specs/validation-stack.md << 'VALIDEOF'
---
layout: page
title: Universe Validation Stack
permalink: /specs/validation-stack/
author: Anatoly Nikiforov, 2023
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

```
┌─────────────────────────────────────────┐
│           Validation Stack              │
├─────────────────────────────────────────┤
│  Validator N (Top)                      │
│  Validator N-1                          │
│  ...                                    │
│  Validator 1 (Bottom)                   │
└─────────────────────────────────────────┘
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

- [MHA](mha.md) — Model hashing
- [SSA](ssa.md) — Sequence ordering
- [JEMP](jemp.md) — Job messaging
- [Transactional Models](transactional-models.md) — Deployment states

---

[← Back to Specifications](/specs/)
VALIDEOF
echo -e "  ${GREEN}+${NC} specs/validation-stack.md created"

################################################################################
# 15. Create specs/transactional-models.md
################################################################################
echo ""
echo -e "${YELLOW}Step 15: Creating Transactional Models Specification...${NC}"
echo ""

cat > specs/transactional-models.md << 'TRANSEOF'
---
layout: page
title: Transactional Models
permalink: /specs/transactional-models/
author: Anatoly Nikiforov, 2023
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

```
┌─────────────┐      ┌─────────────┐      ┌─────────────┐
│  Prototype  │─────▶│    Base     │─────▶│  Complete   │
│   Model     │      │   Model     │      │   Model     │
└─────────────┘      └─────────────┘      └─────────────┘
      │                    │                    │
      ▼                    ▼                    ▼
 Source Unit +        User Input          Validation +
 Placement          Customization        Default Values
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

- [MHA](mha.md) — Model hashing
- [SSA](ssa.md) — Sequence ordering
- [JEMP](jemp.md) — Job messaging
- [Validation Stack](validation-stack.md) — Model validation

---

[← Back to Specifications](/specs/)
TRANSEOF
echo -e "  ${GREEN}+${NC} specs/transactional-models.md created"

################################################################################
# 16. Create deep-dives/index.md
################################################################################
echo ""
echo -e "${YELLOW}Step 16: Creating Deep Dives Index...${NC}"
echo ""

cat > deep-dives/index.md << 'DIVESINDEXEOF'
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
| [anyd Daemon Framework](anyd-daemon-framework.md) | Unix daemon IPC framework | [PyPI](https://pypi.org/project/anyd/), [GitHub](https://github.com/anatolio-deb/anyd) |
| [VPN Tunneling Architecture](vpn-tunneling-architecture.md) | Linux VPN client with TUN/TAP | [vpnm](https://github.com/nikiforidi/vpnm), [vpnmd](https://github.com/nikiforidi/vpnmd) |
| [ForestVPN CLI](forestvpn-cli.md) | Cross-platform VPN client | [GitHub](https://github.com/forestvpn/cli) |
| [JetBrains Academy](jetbrains-academy.md) | Python educational project | [Hyperskill](https://hyperskill.org/projects/99) |
| [MIND Universe](mind-universe.md) | Cloud infrastructure management | [Specs](/specs/) |

---

[← Back to Home](/)
DIVESINDEXEOF
echo -e "  ${GREEN}+${NC} deep-dives/index.md created"

################################################################################
# 17. Create deep-dives/anyd-daemon-framework.md
################################################################################
echo ""
echo -e "${YELLOW}Step 17: Creating anyd Deep Dive...${NC}"
echo ""

cat > deep-dives/anyd-daemon-framework.md << 'ANYDEOF'
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
ANYDEOF
echo -e "  ${GREEN}+${NC} deep-dives/anyd-daemon-framework.md created"

################################################################################
# 18. Create deep-dives/vpn-tunneling-architecture.md
################################################################################
echo ""
echo -e "${YELLOW}Step 18: Creating VPN Deep Dive...${NC}"
echo ""

cat > deep-dives/vpn-tunneling-architecture.md << 'VPNEOF'
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
- [anyd Deep Dive](/deep-dives/anyd-daemon-framework.md)

---

[← Back to Deep Dives](/deep-dives/)
VPNEOF
echo -e "  ${GREEN}+${NC} deep-dives/vpn-tunneling-architecture.md created"

################################################################################
# 19. Create deep-dives/forestvpn-cli.md
################################################################################
echo ""
echo -e "${YELLOW}Step 19: Creating ForestVPN Deep Dive...${NC}"
echo ""

cat > deep-dives/forestvpn-cli.md << 'FORESTEOF'
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
- [VPN Tunneling Architecture](/deep-dives/vpn-tunneling-architecture.md)

---

[← Back to Deep Dives](/deep-dives/)
FORESTEOF
echo -e "  ${GREEN}+${NC} deep-dives/forestvpn-cli.md created"

################################################################################
# 20. Create deep-dives/jetbrains-academy.md
################################################################################
echo ""
echo -e "${YELLOW}Step 20: Creating JetBrains Academy Deep Dive...${NC}"
echo ""

cat > deep-dives/jetbrains-academy.md << 'JETBRAINFEOF'
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

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   User CLI  │────▶│  Translator │────▶│  Reverso    │
│   Input     │     │   Logic     │     │   Context   │
└─────────────┘     └─────────────┘     └─────────────┘
                           │
                           ▼
                    ┌─────────────┐
                    │   hs-test   │
                    │  (Testing)  │
                    └─────────────┘
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
JETBRAINFEOF
echo -e "  ${GREEN}+${NC} deep-dives/jetbrains-academy.md created"

################################################################################
# 21. Create deep-dives/mind-universe.md
################################################################################
echo ""
echo -e "${YELLOW}Step 21: Creating MIND Universe Deep Dive...${NC}"
echo ""

cat > deep-dives/mind-universe.md << 'MINDEOF'
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
| [MHA](/specs/mha.md) | Model Hashing Algorithm — CIR change detection | Nested hashing, bidirectional comparison |
| [SSA](/specs/ssa.md) | Sequence Sorting Algorithm — Go map ordering | Zero-last semantics, 116ms benchmark |
| [JEMP](/specs/jemp.md) | Job Event Messaging Protocol — Concurrency model | Heartbeat events, Job Collector |
| [Validation Stack](/specs/validation-stack.md) | Unified Model validation layer | FILO execution, strict/tolerant modes |
| [Transactional Models](/specs/transactional-models.md) | VM deployment transaction process | Prototype → Base → Complete states |

---

## Supported Providers

| Provider | Status |
|----------|--------|
| VMware | ✅ Implemented |
| OpenStack | ✅ Implemented |
| oVirt | ✅ Implemented |
| SpaceVM | ✅ Implemented |

---

## Technologies

- **Languages:** Go, Python
- **Message Queue:** RabbitMQ
- **Database:** PostgreSQL
- **APIs:** REST, SOAP
- **OS:** Linux

---

## See Also

- [Full Specifications](/specs/)

---

[← Back to Deep Dives](/deep-dives/)
MINDEOF
echo -e "  ${GREEN}+${NC} deep-dives/mind-universe.md created"

################################################################################
# Summary
################################################################################
echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Portfolio Generated!                                 ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}What was created:${NC}"
echo "  ✓ Directory: $PORTFOLIO_DIR"
echo "  ✓ Configuration: _config.yml"
echo "  ✓ Pages: index.md, about/index.md, about/philosophy.md, about/timeline.md, about/communities.md, about/contact.md"
echo "  ✓ Specs: 5 specifications (MHA, SSA, JEMP, Validation Stack, Transactional Models)"
echo "  ✓ Deep Dives: 5 project breakdowns (anyd, VPN, ForestVPN, JetBrains, MIND)"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. cd $PORTFOLIO_DIR"
echo "  2. git add ."
echo "  3. git commit -m 'Generate technical portfolio v10.5'"
echo "  4. git push origin main"
echo "  5. Wait 5-10 minutes for GitHub Pages"
echo ""

exit 0
