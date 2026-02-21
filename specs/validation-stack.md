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