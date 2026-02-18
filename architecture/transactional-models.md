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

This document describes the backends of creating virtual machines (VM further) through the Universe. In the second implementation Universe starts deploying VMs from building the **Unified Model** (model further). The build of a model is a **multistage** and a **multi-source-based (transactional)** process.

---

## The States of Unified Model

### Figure 1: States of Unified Model During Universe Deploy

<div class="figure-container">
![Model States](../../assets/images/architecture/transactional-figure1.png)
</div>

*The states of Unified Model during Universe Deploy*

There are **three states** of the model during deploy known as **prototype**, **base** and **complete**. Those states are indicating the readiness of the model for deployment.

---

## The Prototype Model State

The **prototype** or **proto-model** is the first step to take before deploying the VM. It is built from two data sources known as the **Source Unit** and the **Placement**. This is a logical place in the code and architecture where the model is born. In this state the model is tied tightly to the data of a Source Unit as well as to the Placement values. The model then goes to the user for further customisation to get the next state known as the **Base**.

---

## The Base Model State

When the proto-model is customised by the user it goes into state of the **Base model**. The prototype values could be overridden by the user input and after that the model is one step closer to the deploy. After customisation is done the model transferred to the Universe to get the final alterations there.

---

## The Complete Model State

This is the **final step** before deploying VM. The model consider **complete** if it has been **validated** by the Universe and enriched with some default values known as **custom arguments**. Those values are some default platfrom-specific API parameters needed to deploy VM. After validation and finalisation of the model it is ready to deploy on the target platform.

---

## State Transitions

### Figure 2: Model State Transitions

<div class="figure-container">
![State Transitions](../../assets/images/architecture/transactional-figure2.png)
</div>

*State transitions with rollback support*

| State | Description | Mutable | Validated |
|-------|-------------|---------|-----------|
| **Prototype** | Source Unit + Placement | ✅ Yes | ❌ No |
| **Base Model** | User customized | ✅ Yes | ⚠️ Partial |
| **Complete Model** | Validated + enriched | ❌ No | ✅ Yes |

---

## Related Specifications

- [MHA](mha.md)
- [JEMP](jemp.md)
- [SSA](ssa.md)
- [Validation Stack](validation-stack.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
