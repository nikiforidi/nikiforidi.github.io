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
