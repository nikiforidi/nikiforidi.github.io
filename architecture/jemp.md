---
layout: page
title: Job Event Messaging Protocol (JEMP)
---

# Job Event Messaging Protocol (JEMP)

**Status:** ✅ Production | **Period:** 2023-2025 | **Company:** MIND Software

---

## Problem

Coordinate parallel task execution without resource conflicts.

---

## Solution

Event-driven orchestration with heartbeat monitoring and checkpoint recovery.

---

## Components

| Component | Purpose |
|-----------|---------|
| Job Pool | Running + waiting jobs |
| Intersection Criterion | Conflict detection |
| Checkpointer | State snapshots |
| Heartbeat Monitor | Liveness detection |

---

## Links

- [Full Specification](https://alert-hardcover-322.notion.site/Universe-concurrency-model-4ea53fe313bb47eeaf8711db26828c39?pvs=4)
- [Related: MHA](mha.md)
