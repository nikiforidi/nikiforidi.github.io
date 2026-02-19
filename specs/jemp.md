---
layout: page
title: Job Event Messaging Protocol (JEMP)
permalink: /specs/jemp/
author: Anatoly Nikiforov, 2023
---

## Overview

**Purpose:** Track concurrent job execution state without MQ overhead.

**Context:** MIND Universe Job Pool concurrency model.

**Problem:** Need to track job state (running, lost, finished) without constant MQ polling.

---

## Architecture

### Event-Driven Model

```
┌─────────────┐         ┌─────────────┐
│  Job Pool   │◄───────►│  Event Bus  │
└─────────────┘         └─────────────┘
                              │
         ┌────────────────────┼────────────────────┐
         ▼                    ▼                    ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│   Heartbeat     │  │   Finished      │  │   Internal      │
│   Event         │  │   Event         │  │   Event         │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

### Job Lifecycle

```
┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐
│  Queued │───▶│ Running │───▶│Finished │    │  Lost   │
└─────────┘    └────┬────┘    └─────────┘    └────▲────┘
                    │                              │
                    └────── Heartbeat ─────────────┘
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

- [MHA](mha.md) — Model hashing
- [SSA](ssa.md) — Sequence ordering
- [Validation Stack](validation-stack.md) — Model validation
- [Transactional Models](transactional-models.md) — Deployment states

---

## Full Specification

📎 [**View on Notion →**](https://alert-hardcover-322.notion.site/Universe-concurrency-model-4ea53fe313bb47eeaf8711db26828c39)

---

[← Back to Specifications](/specs/)
