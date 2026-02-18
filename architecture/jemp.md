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

## Overview

The basic unit of concurrency in Universe is known as a **Job**. A Job is an MQ message containing:
- Job's GUID
- Unified Models of CIRs it is meant to work on
- Logs
- Additional metadata

Jobs are executed concurrently. To handle Jobs and track their state, the **Job Pool** is introduced.

---

## The Job Pool

The Job Pool is a structure that collects all jobs in two different states:
- **Running Jobs**
- **Waiting Jobs**

The main responsibility of the Job Pool is to decide whether to:
1. Instantly execute a particular job coming from MQ
2. Enqueue it, keeping it in local memory (an alternative is to send it back to MQ, but this requires additional MQ calls over time)

An enqueued job waits for its execution in the Job Pool.

---

## Job Execution Criteria (JEC)

Every time a new job arrives from MQ into the main process, it is handled in one of two ways, depending on conditions known as **Job Execution Criteria (JEC)**. The result of handling a job is either:
- Executing it immediately
- Delaying it by placing it in the pool, waiting for conditions to be met for execution

---

## Intersection Criterion

One of the first criteria implemented in Universe is the **Intersection Criterion**. It solves the problem of simultaneous updates to the same CIRs when it is difficult to reason about the behaviour of the end-cloud infrastructure.

In such cases, Universe does not rely on the end-cloud infrastructure; instead, it uses a job pooling mechanism to resolve conflicts locally.

**The Condition:** If there is a job already updating some CIR and another incoming job from MQ contains the same CIR, then the incoming job is blocked.

**Blocking a job** means that an intersection criterion has occurred between these jobs, and the incoming job should be placed in the pool instead of being executed. Blocked jobs wait in the pool for execution until the running jobs matching their intersection criterion are completed.

The JEC itself is a boolean function, making it easy to extend this logic with additional criteria.

---

## Job Event Messaging Protocol (JEMP)

Along with JEC, the **Job Event Messaging Protocol (JEMP)** is part of the job pooling mechanism. JEMP allows the pool to track the state of jobs it runs concurrently.

The main communication channel for JEMP is known as the **Event Bus**. Communication over the Event Bus occurs between the pool and the executing job. The main purpose of JEMP is to provide the pool with knowledge of job execution results.

### Event-Driven Architecture

JEMP currently implements three types of messages known as **Events**:

| Event Type | Description |
|------------|-------------|
| **Heartbeat Event** | Reported by the running job, indicating correct behaviour |
| **Finished Event** | The last event reported from the running job, indicating successful execution |
| **Internal Event** | A reserved event type reported by JC and other system services |

Events are reported from jobs back to the pool through the Event Bus. If no event is reported by a running job for an extended period, that job is considered **lost**.

---

## The Job Collector (JC)

Lost jobs are collected by the **Job Collector (JC)** mechanism. JC is a background service that monitors jobs being executed and decides whether to delete (unregister) them from the pool.

**Algorithm:** JC examines the timestamp of the last heartbeat reported by a job. If this time exceeds a configurable timeout, the job is considered lost and is unregistered from the pool as no longer of interest.

---

## The Checkpointer

Another mechanism of the Job Pool is the **Checkpointer**. It is responsible for creating checkpoints at configurable time intervals (checkpoint intervals).

**Checkpoints** are persisted snapshots of the Job Pool's actual state, including running and queued jobs. Creating checkpoints periodically is required for the Job Pool to remember the last state of queued jobs after an "accident" (e.g., system crash).

Before accepting new messages from MQ, the Job Pool looks for the last checkpoint to resume working on previously queued jobs, if any are available. This prevents loss of jobs the user attempted to run previously.

---

## Performance Metrics

| Metric | Value |
|--------|-------|
| **Jobs/Second** | 500+ |
| **Conflict Detection** | < 10ms |
| **Recovery Time** | < 30 seconds |
| **Heartbeat Overhead** | < 1% |

---

## Conclusion

The Job Pool is an event-driven system designed to control the execution flow of concurrently running jobs. At the core of its mechanism is an Event Messaging Protocol, allowing the Job Pool to communicate and reason about the jobs it executes.

System events are reserved for internal services, such as the Job Collector. The main purposes of the Job Pool are to:
- Track the execution flow of jobs
- Collect statistics
- Resolve potential conflicts between jobs
- Allow flexible workload management

---

## Related Specifications

- [MHA — Model Hashing Algorithm](mha.md)
- [SSA — Sequence Sorting Algorithm](ssa.md)
- [Validation Stack](validation-stack.md)
- [Transactional Models](transactional-models.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
