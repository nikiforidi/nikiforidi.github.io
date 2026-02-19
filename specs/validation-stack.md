---
layout: page
title: Universe Validation Stack
permalink: /specs/validation-stack/
author: Anatoly Nikiforov, 2023
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

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Universe-Models-Validation-479bb17669ea446d8ea67e74f3be475f)

---

[← Back to Specifications](/specs/)
