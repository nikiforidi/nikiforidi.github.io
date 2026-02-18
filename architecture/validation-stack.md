---
layout: page
title: Universe Validation Stack
---

# Universe Validation Stack

**Author:** Anatoly Nikiforov, 2023  
**Status:** ✅ Production  
**Period:** 2023-2025  
**Company:** MIND Software

---

## Overview

The main objects of validation are so-called **Unified Models**. They are usually located in the Job as part of the execution scenario.

In Universe, we validate these models because their data is used to interact with target infrastructures. The validation itself is not strictly necessary, as we could always rely on the target site infrastructures. However, we prefer to have an **additional validation layer** to handle possible user input errors in Universe before they reach the actual infrastructure. This is possible because Universe has knowledge of legitimate requests it sends to the sites it supports.

Thus, we use a **single place for all validations** that may occur during job execution. This place is known as the **Validation Stack**.

---

## The Validation Stack

The Validation Stack, as the name suggests, is a **classic stack data structure**. It is used to store Validators in a standard stack manner.

**Validator:** A programmer-defined, pluggable entity that validates a single Unified Model and reports the result. Each validator can:
- Validate a single field of a Unified Model
- Implement more complex validation logic

After pushing Validators into the Validation Stack, we can run this **Validation Chain in FILO order** (First-In-Last-Out). The Validation Stack then executes the Validators and collects the validation results for further analysis. At the end of execution, the Validation Stack is empty.

---

## Reusable Validators

Validators may be **reusable** if we want to run the same validations multiple times. In that case, the Validation Stack will keep them even after running the Validation Chain.

Moreover, it will keep only those Validators from the Validation Chain that were marked as **reusable**. This means we can have a sequence of reusable and non-reusable Validators in the Validation Stack.

After running this type of Validation Chain, the Validation Stack will keep **N - N(reusable)** Validators to be run again. In other words, the Validation Chain becomes shorter by the number of non-reusable chain links.

---

## Scopes of Usage

There are two known scopes for applying the Validation Stack:

| Scope | Name | Purpose |
|-------|------|---------|
| **Global** | Site Worker | Validate across the Job (e.g., look for duplicates) |
| **Models** | Site Driver | Check specific fields of Unified Models |

The behaviour of the Validation Stack is scope-dependent. For example:
- In the **global scope**, we use a Validator that looks for duplicates of Unified Models across the Job
- In the **models scope**, we check specific fields of Unified Models

This two-layered architecture sets the relevant modes of the Validation Stack.

---

## Execution Modes

### Strict Mode

Each Validator reports a **positive or negative result**. The strict mode of the Validation Stack determines whether to:
- Proceed running Validators after a negative result occurs
- Stop immediately

**Workflow:** Stop on first negative result → Use for critical validations

---

### Fault-Tolerant Mode

In tolerant mode, the Validation Stack will:
- Run Validators until the last one
- Ignore negative results during execution
- Keep them along with positive ones for further analysis

**Workflow:** Collect all results → Use for comprehensive reporting

---

## Application

| Validation Point | Mode | Description |
|-----------------|------|-------------|
| **Model Creation** | Strict | Validate before model creation |
| **Configuration Update** | Strict | Validate before applying changes |
| **Deployment** | Fault-Tolerant | Collect all issues before deployment |
| **Health Check** | Fault-Tolerant | Report all health issues |

---

## Related Specifications

- [MHA — Model Hashing Algorithm](mha.md)
- [JEMP — Job Event Messaging Protocol](jemp.md)
- [SSA — Sequence Sorting Algorithm](ssa.md)
- [Transactional Models](transactional-models.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
