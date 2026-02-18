bash
#!/bin/bash

################################################################################
# Portfolio Architecture Pages — With Responsive Image CSS
# Version: 13.0 (Fixed Large Images)
################################################################################

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

mkdir -p architecture
mkdir -p assets/images/architecture
mkdir -p assets/css

echo -e "${BLUE}Creating pages with responsive image CSS...${NC}"

################################################################################
# Create Responsive Image CSS
################################################################################
echo -e "${GREEN}Creating responsive image CSS...${NC}"
cat > assets/css/main.css << 'CSSEOF'
/* Responsive Images */
img {
    max-width: 100%;
    height: auto;
    display: block;
}

/* Image containers for figures */
.figure-container {
    max-width: 100%;
    overflow: hidden;
    margin: 2em 0;
}

.figure-container img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 0 auto;
}

/* Figure captions */
em {
    display: block;
    text-align: center;
    font-size: 0.9em;
    color: #666;
    margin-top: 0.5em;
    font-style: italic;
}

/* Prevent image overflow in markdown content */
.markdown-body img {
    max-width: 100%;
    box-sizing: border-box;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
    img {
        max-width: 100%;
    }
    
    .figure-container {
        padding: 0 10px;
    }
}

/* Large image handling */
img[src*=".jpg"],
img[src*=".png"] {
    max-width: 100%;
    height: auto;
    object-fit: contain;
}
CSSEOF

################################################################################
# Update _config.yml to include CSS
################################################################################
echo -e "${GREEN}Updating _config.yml...${NC}"
cat > _config.yml << 'CONFIGEOF'
title: "Anatoly Nikiforov — Software Engineer"
description: "Professional Portfolio: 5+ years experience, Distributed Systems, Cloud Infrastructure"
url: "https://nikiforidi.github.io"
baseurl: ""
theme: "minima"
markdown: "kramdown"
highlighter: "rouge"
plugins:
  - "jekyll-github-metadata"
  - "jekyll-seo-tag"
exclude:
  - "README.md"
  - "LICENSE"
  - ".gitignore"
  - "init-portfolio.sh"
CONFIGEOF

################################################################################
# Update _includes/head.html for custom CSS (create if not exists)
################################################################################
echo -e "${GREEN}Creating custom head include...${NC}"
mkdir -p _includes
cat > _includes/head.html << 'HEADEOF'
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  {%- seo -%}
  <link rel="stylesheet" href="{{ "/assets/css/main.css" | relative_url }}">
  <link rel="stylesheet" href="{{ "/assets/main.css" | relative_url }}">
  {%- feed_meta -%}
</head>
HEADEOF

################################################################################
# MHA
################################################################################
echo -e "${GREEN}[1/5] MHA...${NC}"
cat > architecture/mha.md << 'MHAEOF'
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

The core concept of MIND Universe that allows it to work effectively is known as **Unified Models**. Those are considered a unified representation of a cloud infrastructure resource (CIR) containing an information that is common across different cloud computing services.

The **Model Hashing Algorithm** is applied during **Refresh and Update** actions of Universe's DRUID action stack. It serves for detecting changes between the latest database record of a CIR that Universe stores and the information about this CIR on the site of specific cloud infrastructure.

The MHA compares those facts with a database record and decides about changes of a particular CIR. It is a **nested hashing algorithm** designed to follow a particular CIR structure. Meanwhile, MHA is **bidirectional**, meaning that it allows comparing CIR records and related facts the same way.

---

## Nested Hashing

### Figure 1: Universe Hashing Model for a Virtual Machine

<div class="figure-container">
![Universe Hashing Model](../assets/images/architecture/mha-figure1.png)
</div>

*Figure 1: Universe hashing model for a virtual machine*

The figure 1 shows a nested hashing model that Universe uses to build a hash of such CIR as a virtual machine or virtual server. The structure of a virtual machine may consist of components like CPU, RAM, Operating system, ID, etc. Some components are common across different cloud computing services, while others are vendor-specific. For example, some service reports and ID of a virtual machine in format of GUID while another one uses a natural numbers sequence for that.

In the same time, the structure of CIR itself differs across cloud computing services. For example, the virtual machine representation of some service could imply a vendor-specific information like the virtual machine's floppy drives or serial ports while some other service does not support these devices. The approach of MHA, again, is to build a hash of the CIR components present everywhere: CPU, RAM, Disks, etc. The variable values of those components act as source of true for calculating a hash of the entire virtual machine. This approach makes it possible to build and compare hashes for both the unified CIR model and the facts of the concrete CIR present in the target infrastructure. The whole information for building a hash is the same on the both sides.

---

## Bidirectional

The first direction of MHA is known as **Unified Models**. They are stored by the Universe as a database records of related CIR. The purpose of MHA is to calculate a hash of these records to compare with a relevant state of related CIRs known as **facts**.

The second direction of MHA is **facts** about specific CIR coming on request of Universe to some cloud computing service. The facts are meant to be a source from which the unified model is built. Thus, facts contain all the information the unified model does, making it possible to apply MHA to the CIR in its relevant state almost the same way as for the unified model itself. As a result, the Universe compares the hashes of both directions to find CIR changes during **Refresh and Update** actions.

### Figure 2: Universe Applies MHA to Both CIR and DB Record

<div class="figure-container">
![MHA Bidirectional](../assets/images/architecture/mha-figure2.jpg)
</div>

*Figure 2. Universe applies MHA to both CIR and DB record.*

---

## Related Specifications

- [JEMP](jemp.md)
- [SSA](ssa.md)
- [Validation Stack](validation-stack.md)
- [Transactional Models](transactional-models.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
MHAEOF

################################################################################
# Validation Stack
################################################################################
echo -e "${GREEN}[2/5] Validation Stack...${NC}"
cat > architecture/validation-stack.md << 'VALIDEOF'
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

The main objects of validation are so-called **Unified Models**. They are usually located in the Job as a part of execution scenario. In Universe, we try to validate those models because their data is used to interact with target infrastructures. The validation itself is not a necessary, as we may always rely on the target site infrastructures. Anyway, we prefer to have an **additional validation layer** to handle possible user input errors in Universe before they go to the actual infrastructure. This is possible because Universe has knowledge of legit requests it sends to the sites it supports.

Thus, we try to use a **single place for all the validations** that may occur during the job execution. This place is known as the **Validation Stack**.

---

## The Validation Stack

### Figure 1: Pushing the New Validator

<div class="figure-container">
![Validation Stack Push](../assets/images/architecture/validation-figure1.jpg)
</div>

*Figure 1. Pushing the new Validator to the Validation Stack.*

The Validation Stack, as the name suggests, is a **classic stack data structure**. It is used to store Validators in a classic stack manner. A validator is a programmer-defined, pluggable entity, that validates a single Unified Model and reports the result. Each validator could validate a single field of a Unified Model, or implement more complex validation logic.

After pushing some amount of Validators into the Validation Stack, we can run this **Validation Chain as FILO**. The Validation Stack then will run the Validators and collect the validation results for further analysis. At the end of execution, the Validation Stack is empty.

### Figure 2: Running the Validation Stack

<div class="figure-container">
![Validation Stack Run](../assets/images/architecture/validation-figure2.jpg)
</div>

*Figure 2. Running the Validation Stack.*

---

## Reusable Validators

Validators might be **reusable** if we want to run the same validations multiple times. In that case, Validation Stack will keep them even after running the Validation Chain.

Moreover, it will keep only those Validators from the Validation Chain, that were marked to be **reusable**. That means, we could have a sequence of reusable and non-reusable Validators in the Validation Stack. After running this type of Validation Chain, the Validation Stack will keep **N-N(reus.)** amount of Validators to be run again. In other words, the Validation Chain becomes shorter on the amount of non-reusable chain links.

---

## The Scopes of Usage

There are two known scopes of applying the Validation Stack:

| Scope | Name | Purpose |
|-------|------|---------|
| **Global** | Site Worker | Validate across the Job (e.g., look for duplicates) |
| **Models** | Site Driver | Check specific fields of Unified Models |

The behaviour of the Validation Stack is a scope-dependent. For example, in the "global" scope, we want to use a Validator that looks for duplicates of Unified Models across the Job. At the same time, in the models scope, we are interested in checking some specific fields of Unified Models. This two-layered architecture sets the relevant modes of the Validation Stack.

---

## The Strict Mode

Remember, each Validator reports a **positive or negative result**. The strict mode of the Validation Stack stands for whether to proceed running Validators after the negative result occurred, or to stop there.

### Figure 3: Strict Mode Workflow

<div class="figure-container">
![Strict Mode](../assets/images/architecture/validation-figure3.jpg)
</div>

*Figure 3. The Strict mode workflow.*

---

## The Fault-Tolerant Mode

In the tolerant mode, the Validation Stack will run the Validators until the last one ignoring the negative results, but keeping them along with positive ones for further analysis.

### Figure 4: Fault-Tolerant Mode Workflow

<div class="figure-container">
![Fault-Tolerant Mode](../assets/images/architecture/validation-figure4.jpg)
</div>

*Figure 4. The tolerant mode workflow.*

---

## Related Specifications

- [MHA](mha.md)
- [JEMP](jemp.md)
- [SSA](ssa.md)
- [Transactional Models](transactional-models.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
VALIDEOF

################################################################################
# JEMP
################################################################################
echo -e "${GREEN}[3/5] JEMP...${NC}"
cat > architecture/jemp.md << 'JEMPEOF'
---
layout: page
title: Job Event Messaging Protocol (JEMP)
---

# Job Event Messaging Protocol (JEMP)

**Author:** Anatoly Nikiforov, 2023  
**Status:** ✅ Production  
**Period:** 2023-2025  
**Company:** MIND Software

---

The basic unit of concurrency around the Universe is known as **Job**. The Job — is an MQ message containing Job's GUID, the Unified Models of CIRs it meant to work on, logs and so on. Jobs are executed concurrently. To handle Jobs and track down their state, the **Job Pool** introduced.

---

## The Job Pool

The Job Pool is a structure that collects all the jobs in two different states. There are **running** and **waiting** jobs in the Job Pool.

The main responsibility of Job Pool is to decide whether to instantly execute a particular job coming from MQ or enqueue it keeping it in the local memory (another option is to send it back to MQ, but this requires additional MQ calls over time). An enqueued job then waits for its execution in the Job Pool.

---

## Job Execution Criteria (JEC)

Every time a new job arrives from an MQ into the main process, it being handled two different ways, depending on some conditions known as **job execution criteria (JEC)**. The result of handling a job is either executing it immediately or delaying it by putting into the pool as a job, waiting for conditions are met for execution.

---

## The Intersection Criterion

One of the first criteria implemented in Universe is an **intersection criterion**. It is implemented to solve a problem of simultaneous updates of the same CIRs when it's hard to reason about the behaviour of an end-cloud infrastructure. In such cases, Universe does not rely on end-cloud infrastructure, instead it uses a job pooling mechanism to resolve it locally. The condition of solving it this: if there is a job already updating some CIR and there is another incoming job from MQ containing the same CIR, then an incoming one is blocked. The blocking of job means that there is an intersection criterion occurred between these jobs, and an incoming one should be placed in the pool, instead of executing it. The blocked jobs are then waiting their execution in the pool until the running jobs matched their intersection criterion are executed.

### Figure 1: Intersection Criterion Demonstration

<div class="figure-container">
![Intersection Criterion](../assets/images/architecture/jemp-figure1.jpg)
</div>

*The figure 1 below demonstrates an intersection criterion.*

The JEC itself is a boolean function, so it's easy to extend that logic with additional criteria.

---

## The Job Event Messaging Protocol

Along with JEC, **Job Event Messaging Protocol** is a part of the job pooling mechanism. JEMP allows the pool to track the state of jobs it runs concurrently. The main communication channel for JEMP is knows as **Event Bus**. The communication over Event Bus occurs between the pool and the job executed. The main reason for JEMP is to provide the pool with a knowledge of job execution results.

### Event-Driven

JEMP currently implements three type of messages known as **Events**:

| Event Type | Description |
|------------|-------------|
| **Heartbeat Event** | Reported by the running job, indicating the correct behaviour |
| **Finished Event** | The last event reported from the running job, indicating the successful execution |
| **Internal Event** | A reserved event type reported by JC and other system services |

Events are reported from the jobs back to the pool through the event bus. If there is no any event reported by some running job for a long time, then such job considered **lost**.

### Figure 2: Heartbeat Events During Job Execution

<div class="figure-container">
![Heartbeat Events](../assets/images/architecture/jemp-figure2.jpg)
</div>

*The figure 2 below shows how the heartbeat events occurred during the job execution.*

---

## The Job Collector (JC)

Lost jobs are collected by the **Job Collector (JC)** mechanism. JC is a background service that runs over jobs being executed and decides whether to delete (unregister) them from the pool. The algorithm of JC is a straightforward one: it looks at the time the last heartbeat of a job reported. If this time is later than a configurable timeout, then the job considered lost and being unregistered from the pool as none of the interest.

### Figure 3: Resolving Lost Jobs by JC

<div class="figure-container">
![Job Collector](../assets/images/architecture/jemp-figure3.jpg)
</div>

*The figure 3 below shows resolving a lost job by JC while the other job is continuing to run, reporting its heartbeats.*

---

## The Checkpointer

Another mechanism of the Job Pool is a **Checkpointer**. It is responsible for creating checkpoints for configurable amount of time (checkpoint intervals). Checkpoints are persisted snapshots of the Job Pool "actual" state with running and queued jobs. Creating checkpoints with a periodic amount of time is required by the Job Pool to remember the last state of the queued Jobs after an "accident". Before starting to accept new messages from the MQ, the Job Pool is looking for the last checkpoint to start working on the previous queued jobs, if any available. This helps not to lose the Jobs the user attempted to run previously.

---

## Conclusion

The Job Pool is an event-driven system to control an execution flow of jobs running concurrently. At the core of its mechanism, there is an Event Messaging Protocol, allowing the Job Pool to communicate and reason about the jobs it executes. There are system events reserved for the internal services, such as the Job Collector. The main reason behind the Job Pool is to be able to track down an execution flow of jobs, collect the statistics, resolve the potential conflicts between the jobs and allow the flexible workload.

---

## Related Specifications

- [MHA](mha.md)
- [SSA](ssa.md)
- [Validation Stack](validation-stack.md)
- [Transactional Models](transactional-models.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
JEMPEOF

################################################################################
# SSA
################################################################################
echo -e "${GREEN}[4/5] SSA...${NC}"
cat > architecture/ssa.md << 'SSAEOF'
---
layout: page
title: Sequence Sorting Algorithm (SSA)
---

# Sequence Sorting Algorithm (SSA)

**Author:** Anatoly Nikiforov, 2023  
**Status:** ✅ Production  
**Period:** 2023-2025  
**Company:** MIND Software

---

SSA is a custom sorting algorithm used to sort a mapping of integers aka **Sequence Numbers** to Model structures. It is used in Mind Universe as part of **Sequential Model Processing (SMP)** — the way DRUID API works with Models.

**The main idea behind it** is to have keys of integers in a hash map sortes in ascending order, but zero key goes last, i.e. `[1, 2, 4, 7, 0]`.

---

## The Problem

The order of elements in the map is **unordered in Go**. Thus, we can't specify the position of a specific element in the map when adding one.

---

## The Solution

Return ordered keys of a map as a slice and use it when working with map's values.

---

## A Generic Approach

Let's simplify it to the mapping of integers to integers.

```go
func SequenceSorting(m map[int]int) (order []int) {
    // Need to store it's length (number of keys) for further use
    mlen := len(m)

    // Allocate a slice to store map's keys only
    keys := make([]int, mlen)

    // Every time when we lookup for a specific key in the map without success,
    // we need to count unsuccessful lookups
    var mismatchCounter int

    // Using a natural series starting from 0 for map lookups.
    // The total number of iterations is not of length of keys (map),
    // which might seem to be obvious.
    // Instead, it's multiplied by 2 because when we don't find some key in the map,
    // we will proceed to the next iteration and will have mlen-1 iterations left.
    // The problem is that we will then spend some of our iterations
    // on uncsuccessfull lookups (mismatchCounter) and we won't be able to iterate
    // all over the map. The loop will end at mlen-mismatchCounter iteration.
    for i := 0; i < mlen*2; i++ {
        _, ok := m[i]

        if ok {
            keys[i-mismatchCounter] = i
        } else {
            mismatchCounter++
        }
    }

    // sort a slice of sequences via classic algorithm.
    sort.Ints(keys)

    // Allocate a new slice of the same length as keys number in map
    order = make([]int, mlen)

    // Fill the new slice placing positive numbers first and zero last
    for i := 1; i < mlen; i++ {
        order[i-1] = keys[i]
    }
    return
}
```

---

## Usage

```go
m := map[int]int{0: 1, 2: 3, 4: 5, 6: 7, 8: 9}
order := SequenceSorting(m)
for _, k := range order {
    fmt.Println(m[k])
}
```

### Mutations

```
{0: 1, 2: 3, 4: 5, 6: 7, 8: 9} → [0 2 4 6 8] → [2 4 6 8 0]
```

---

## Benchmarks

**Ran it on 1,000,000 input for 116 ms.**

```go
func main() {
    m := make(map[int]int)
    for i := 0; i < 1000000; i++ {
        m[i+2] = i
    }
    start := time.Now()
    order := SequenceSort(m)
    elapsed := time.Since(start)
    fmt.Printf("Keys processed: %d\n", len(order))
    log.Printf("Sort took %s", elapsed)
}
```

### Results

```
Keys processed: 1000000
2023/05/26 15:17:32 Sort took 116.915073ms
```

---

## Proof of Concept

[Go Playground: SSA PoC](https://go.dev/play/p/gXdgi47OGDO)

---

## Related Specifications

- [MHA](mha.md)
- [JEMP](jemp.md)
- [Validation Stack](validation-stack.md)
- [Transactional Models](transactional-models.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
SSAEOF

################################################################################
# Transactional Models
################################################################################
echo -e "${GREEN}[5/5] Transactional Models...${NC}"
cat > architecture/transactional-models.md << 'TRANSEOF'
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
![Model States](../assets/images/architecture/transactional-figure1.png)
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
![State Transitions](../assets/images/architecture/transactional-figure2.png)
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
TRANSEOF

################################################################################
# Architecture Index
################################################################################
echo -e "${GREEN}Updating index...${NC}"
cat > architecture/index.md << 'ARCHEOF'
---
layout: page
title: Architectural Specifications
---

# Architectural Specifications

**5 documented specifications** from MIND Software (2023-2025)

---

## Overview

| Specification | Purpose | Status | Images |
|---------------|---------|--------|--------|
| [MHA](mha.md) | Configuration drift detection | ✅ Production | 1 PNG, 1 JPG |
| [JEMP](jemp.md) | Async task orchestration | ✅ Production | 3 JPG |
| [SSA](ssa.md) | Deterministic sorting in Go | ✅ Production | No images |
| [Validation Stack](validation-stack.md) | Centralized validation | ✅ Production | 4 JPG |
| [Transactional Models](transactional-models.md) | Model lifecycle | ✅ Production | 2 PNG |

---

## Context

All specifications were developed during my tenure as **Lead Backend Developer / Chief Developer** at MIND Software (Февраль 2023 — Февраль 2025).

**Platform:** MIND Universe — Cloud infrastructure management with multi-hypervisor support (VMware, OpenStack, oVirt, SpaceVM).

---

## Related Sections

- [Experience: MIND Software](../experience/mind-software/)
- [Publications](../publications/)
- [Projects](../projects/)
ARCHEOF

################################################################################
# Create .gitkeep
################################################################################
touch assets/images/architecture/.gitkeep

echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   FINAL Version Created! (v13.0)                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Responsive Image CSS Added:${NC}"
echo "  ✓ max-width: 100% for all images"
echo "  ✓ figure-container div wrappers"
echo "  ✓ Mobile responsive breakpoints"
echo "  ✓ Custom head.html include"
echo ""
echo -e "${GREEN}Image Files Needed (11 total):${NC}"
echo "  PNG: mha-figure1.png, transactional-figure1-2.png (3 files)"
echo "  JPG: mha-figure2.jpg, validation-figure1-4.jpg, jemp-figure1-3.jpg (8 files)"
echo ""
echo -e "${GREEN}Next Steps:${NC}"
echo "  1. Copy your 11 images to assets/images/architecture/"
echo "  2. git add ."
echo "  3. git commit -m 'Final portfolio with responsive image CSS'"
echo "  4. git pull origin main --allow-unrelated-histories --no-rebase"
echo "  5. git push origin main"
echo ""
```

---

## 🎨 Что Добавлено для Исправления Изображений

| CSS Правило | Что Делает |
|-------------|------------|
| `max-width: 100%` | Изображения не превышают ширину контейнера |
| `height: auto` | Сохраняет пропорции изображения |
| `display: block` | Убирает лишние отступы |
| `.figure-container` | Обёртка для контроля размеров |
| `@media (max-width: 768px)` | Адаптивность для мобильных |

---

## 📋 Структура Файлов

```
portfolio/
├── _includes/
│   └── head.html          # Подключение custom CSS
├── assets/
│   ├── css/
│   │   └── main.css       # Responsive image styles
│   └── images/
│       └── architecture/
│           ├── *.png      # 3 файла
│           └── *.jpg      # 8 файлов
├── architecture/
│   ├── mha.md
│   ├── jemp.md
│   ├── ssa.md
│   ├── validation-stack.md
│   └── transactional-models.md
└── _config.yml
```