---
layout: page
title: Transactional Models
---

# Transactional Models

**Author:** Anatoly Nikiforov, 2023  
**Status:** ✅ Production  
**Period:** 2023-2025  
**Company:** MIND Software

---

## Overview

This document describes the backend process of creating virtual machines (VMs) through Universe. In the second implementation, Universe starts deploying VMs from building the **Unified Model** (referred to as "model" hereafter).

The build of a model is a **multi-stage** and **multi-source-based (transactional)** process.

---

## States of Unified Model

There are **three states** of the model during deployment:
1. **Prototype**
2. **Base**
3. **Complete**

These states indicate the readiness of the model for deployment.

---

## Prototype Model State

The **Prototype** (or Proto-Model) is the first step before deploying a VM. It is built from two data sources:
- **Source Unit**[^1]
- **Placement**

This is the logical place in the code and architecture where the model is born. In this state, the model is tightly coupled to the data of a Source Unit as well as to the Placement values. The model then goes to the user for further customisation to reach the next state, known as **Base**.

---

## Base Model State

When the Proto-Model is customised by the user, it transitions to the **Base Model** state. The Prototype values can be overridden by user input, bringing the model one step closer to deployment.

After customisation is complete, the model is transferred to Universe to receive final modifications.

---

## Complete Model State

This is the **final step** before deploying a VM. The model is considered **Complete** if:
- It has been **validated**[^2] by Universe
- It is enriched with default values known as **Custom Arguments**

These values are default platform-specific API parameters needed to deploy a VM. After validation and finalisation, the model is ready for deployment on the target platform.

---

## State Transitions

```text
Prototype ──► Base Model ──► Complete Model
   │              │              │
   │              │              │
   └── Rollback ──┘              │
                                  │
   └────────── Rollback ──────────┘
```

| State | Description | Mutable | Validated |
|-------|-------------|---------|-----------|
| **Prototype** | Source Unit + Placement | ✅ Yes | ❌ No |
| **Base Model** | User customised | ✅ Yes | ⚠️ Partial |
| **Complete Model** | Validated + enriched | ❌ No | ✅ Yes |

---

## Application

| Use Case | Description |
|----------|-------------|
| **VM Deployment** | Standard deployment workflow |
| **Configuration Update** | Update with rollback support |
| **Template Creation** | Save Prototype for reuse |
| **Migration** | Transform between hypervisors |

---

## References

[^1]: The discussion of Units is beyond the scope of this document.
[^2]: See [Universe Validation Stack](validation-stack.md)

---

## Related Specifications

- [MHA — Model Hashing Algorithm](mha.md)
- [JEMP — Job Event Messaging Protocol](jemp.md)
- [SSA — Sequence Sorting Algorithm](ssa.md)
- [Validation Stack](validation-stack.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
