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
