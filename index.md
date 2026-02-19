---
layout: home
title: Technical Portfolio
tagline: Architecture, Algorithms, System Design
permalink: /
---

## Welcome, Traveler <span class="cursor-blink"></span>

```bash
$ whoami
> Anatoly Nikiforov
$ status
> Ready for remote work
$ location
> Moscow, Russia
```

This portfolio is designed for **cozy reading** about engineering craft. Grab a cup of tea ☕, pull up a chair, and explore the **how** and **why** behind the systems I've built.

---

## System Modules

| Module | Content | Access |
|--------|---------|--------|
| `[specs/]` | 5 architectural specs (MHA, SSA, JEMP) | `[ENTER]` |
| `[deep-dives/]` | Technical breakdowns of key projects | `[ENTER]` |
| `[about/]` | Engineering philosophy, career timeline | `[ENTER]` |

---

## Featured Processes

### ▶ Model Hashing Algorithm (MHA)
Bidirectional hashing for cloud infrastructure resource comparison.
- **Problem:** Detect CIR changes across different cloud providers
- **Solution:** Nested hashing with unified model abstraction
- **Metrics:** <100ms hash calculation, 100% change detection
- **Execute:** [`/specs/mha/`](/specs/mha/)

### ▶ Sequence Sorting Algorithm (SSA)
Custom Go algorithm for ordered map iteration with zero-last semantics.
- **Problem:** Go maps are unordered, but we need `[1, 2, 4, 7, 0]`
- **Solution:** O(n*2) lookup with mismatch counter
- **Benchmark:** 1,000,000 keys in 116.9 ms
- **Execute:** [`/specs/ssa/`](/specs/ssa/)

### ▶ Job Event Messaging Protocol (JEMP)
Event-driven concurrency model for distributed job execution.
- **Problem:** Track concurrent jobs without MQ overhead
- **Solution:** Heartbeat events + Job Collector + Checkpointer
- **Execute:** [`/specs/jemp/`](/specs/jemp/)

---

## System Status

| Metric | Value |
|--------|-------|
| **Uptime** | 5+ years (2019–2026) |
| **Commits** | 1,756+ contributions |
| **Packages** | 1 published (anyd 0.4.1) |
| **Docs** | 5 architectural specifications |
| **Last Build** | February 2026 |

---

> **Note:** All links are verified. All claims are backed by public evidence.
> 
> **End of Line.**