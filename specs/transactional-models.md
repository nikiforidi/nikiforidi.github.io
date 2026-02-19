---
layout: page
title: Transactional Models
permalink: /specs/transactional-models/
author: Anatoly Nikiforov, 2023
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

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Unified-model-transactions-in-the-Universe-Deploy-1561ff431c37452bb1e2645b27586b75)

---

[← Back to Specifications](/specs/)
