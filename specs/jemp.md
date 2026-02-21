---
layout: page
title: Job Event Messaging Protocol (JEMP)
permalink: /specs/jemp/
---

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Universe-concurrency-model-4ea53fe313bb47eeaf8711db26828c39)

---

## Overview

**Purpose:** Track concurrent job execution state without MQ overhead.

**Context:** MIND Universe Job Pool concurrency model.

**Problem:** Need to track job state (running, lost, finished) without constant MQ polling.

---

## Architecture

### Event-Driven Model

The Job Pool maintains all active jobs and communicates with them through the Event Bus. Three event types flow from jobs back to the pool: Heartbeat indicates the job is alive, Finished signals successful completion, and Internal is reserved for system services like the Job Collector. This event-driven approach eliminates the need for constant polling while maintaining full visibility into job state.

```text
┌─────────────────┐         ┌─────────────────┐
│    Job Pool     │◀───────▶│    Event Bus    │
└────────┬────────┘         └─────────────────┘
         │
         ├───────────────────┼───────────────────┐
         ▼                   ▼                   ▼
┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
│   Heartbeat     │ │   Finished      │ │   Internal      │
│   Event         │ │   Event         │ │   Event         │
└─────────────────┘ └─────────────────┘ └─────────────────┘
```

### Job Lifecycle

Jobs transition through four states from Queued to Running to Finished. The Lost state is reached when no Heartbeat is received within the configurable timeout threshold. This lifecycle allows the Job Collector to identify and unregister stalled jobs without blocking the execution of healthy ones.

```text
┌───────────┐     ┌───────────┐     ┌───────────┐     ┌───────────┐
│  Queued   │────▶│  Running  │────▶│  Finished │     │   Lost    │
└───────────┘     └─────┬─────┘     └───────────┘     └─────▲─────┘
                        │                                   │
                        └───────── Heartbeat ───────────────┘
                          (Timeout → Lost)
```

---

## Event Types

| Event Type | Description | Frequency |
|------------|-------------|-----------|
| **Heartbeat** | Job alive indicator | Every N seconds |
| **Finished** | Job completed successfully | Once per job |
| **Internal** | System events (JC, Checkpointer) | As needed |

---

## Components

### Job Collector (JC)

| Metric | Value |
|--------|-------|
| **Timeout Threshold** | Configurable (default: 5 min) |
| **Check Interval** | Every 30 seconds |
| **Action** | Unregister lost jobs from pool |

### Checkpointer

| Metric | Value |
|--------|-------|
| **Checkpoint Interval** | Configurable (default: 1 min) |
| **Persistence** | Local disk snapshot |
| **Recovery** | Restore queued jobs after restart |

---

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| Event bus overhead | Minimal (in-process) |
| Heartbeat frequency | Network traffic vs. detection speed |
| Checkpoint frequency | Disk I/O vs. recovery point |

---

## Related Specifications

- [MHA](/specs/mha/) — Model hashing
- [SSA](/specs/ssa/) — Sequence ordering
- [Validation Stack](/specs/validation-stack/) — Model validation
- [Transactional Models](/specs/transactional-models/) — Deployment states

---

[← Back to Specifications](/specs/)