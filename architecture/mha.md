---
layout: page
title: Model Hashing Algorithm (MHA)
---

# Model Hashing Algorithm (MHA)

**Author:** Anatoly Nikiforov, 2023  
**Status:** ✅ Production  
**Period:** 2023-2025  
**Company:** MIND Software

---

## Overview

The core concept of MIND Universe that enables effective operation is known as **Unified Models**. These represent a unified abstraction of a Cloud Infrastructure Resource (CIR) containing information common across different cloud computing services.

The **Model Hashing Algorithm (MHA)** is applied during **Refresh** and **Update** actions of Universe's DRUID action stack. It serves to detect changes between the latest database record of a CIR stored by Universe and the current information about that CIR in the target cloud infrastructure.

MHA compares these facts with database records and determines changes to a particular CIR. It is a **nested hashing algorithm** designed to follow a specific CIR structure. Additionally, MHA is **bidirectional**, meaning it allows comparing CIR records and related facts in a consistent manner.

---

## Nested Hashing

Universe uses a nested hashing model to build a hash of a CIR such as a virtual machine or virtual server. The structure of a virtual machine may consist of components like:

- CPU
- RAM
- Operating System
- ID
- Disks
- Network

Some components are common across different cloud computing services, while others are vendor-specific. For example, one service may report a virtual machine ID in GUID format, while another uses a natural number sequence.

Similarly, the structure of a CIR itself differs across cloud computing services. For instance, one service's virtual machine representation might include vendor-specific information like floppy drives or serial ports, while another service does not support these devices.

**The MHA Approach:** Build a hash of CIR components present universally: CPU, RAM, Disks, etc. The variable values of those components act as the **source of truth** for calculating a hash of the entire virtual machine. This approach makes it possible to build and compare hashes for both the unified CIR model and the facts of the concrete CIR present in the target infrastructure.

---

## Bidirectional Design

### First Direction: Unified Models

Unified Models are stored by Universe as database records of related CIRs. The purpose of MHA is to calculate a hash of these records to compare with the relevant state of related CIRs, known as **facts**.

### Second Direction: Facts

Facts about a specific CIR come from Universe requests to cloud computing services. These facts serve as the source from which the unified model is built. Thus, facts contain all the information the unified model contains, making it possible to apply MHA to the CIR in its relevant state in nearly the same way as for the unified model itself.

**Result:** Universe compares the hashes of both directions to detect CIR changes during **Refresh** and **Update** actions.

---

## Application in DRUID API

| Operation | MHA Usage |
|-----------|-----------|
| **Deploy** | Initial hash creation |
| **Refresh** | Compare current vs target hash |
| **Update** | Detect drift before update |
| **Import** | Hash existing infrastructure |
| **Destroy** | Validate before deletion |

---

## Benefits

| Benefit | Description |
|---------|-------------|
| **Vendor Agnostic** | Single hash format across all hypervisors |
| **Efficient** | O(n) complexity, fast comparison |
| **Deterministic** | Same configuration always produces same hash |
| **Extensible** | Easy to add new component types |

---

## Related Specifications

- [JEMP — Job Event Messaging Protocol](jemp.md)
- [SSA — Sequence Sorting Algorithm](ssa.md)
- [Validation Stack](validation-stack.md)
- [Transactional Models](transactional-models.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
