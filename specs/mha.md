---
layout: page
title: Model Hashing Algorithm (MHA)
permalink: /specs/mha/
author: Anatoly Nikiforov, 2023
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

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Model-Hashing-Algorithm-MHA-e725fd99f9d74481965cb542c1727d0e)

---

[← Back to Specifications](/specs/)
