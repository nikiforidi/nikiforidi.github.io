---
layout: page
title: Sequence Sorting Algorithm (SSA)
permalink: /specs/ssa/
---

## Full Specification

📎 [**View on Notion →**](https://www.notion.so/Sequence-Sorting-Algorithm-SSA-44f828765101456d9ed1a3b6898088a1)

---

## Overview

**Purpose:** Sort Go map integer keys in ascending order with zero key last: `[1, 2, 4, 7, 0]`

**Context:** Sequential Model Processing (SMP) in MIND Universe DRUID API.

**Problem:** Go maps are unordered; we need deterministic iteration with zero-last semantics.

---

## Architecture

### Algorithm Flow

```
┌─────────────────┐
│   Input Map     │
│ {0:1, 2:3, 4:5} │
└────────┬────────┘
│
▼
┌─────────────────┐
│  Extract Keys   │
│   [0, 2, 4]     │
└────────┬────────┘
│
▼
┌─────────────────┐
│  Sort + Zero    │
│   Last Logic    │
└────────┬────────┘
│
▼
┌─────────────────┐
│  Output Slice   │
│   [2, 4, 0]     │
└─────────────────┘
```

---

## Implementation

```go
func SequenceSorting(m map[int]int) (order []int) {
    mlen := len(m)
    keys := make([]int, mlen)
    var mismatchCounter int
    for i := 0; i < mlen*2; i++ {
        _, ok := m[i]
        if ok {
            keys[i-mismatchCounter] = i
        } else {
            mismatchCounter++
        }
    }
    sort.Ints(keys)
    order = make([]int, mlen)
    for i := 1; i < mlen; i++ {
        order[i-1] = keys[i]
    }
    return
}
```

---

## Benchmarks

| Metric | Value |
|--------|-------|
| **Input Size** | 1,000,000 keys |
| **Execution Time** | 116.9 ms |
| **Complexity** | O(n*2) lookup + O(n log n) sort |
| **Memory** | 2x key slice allocation |

### Benchmark Results

```
Keys processed: 1000000
2023/05/26 15:17:32 Sort took 116.915073ms
```

---

## Mutations

```
Input:  {0: 1, 2: 3, 4: 5, 6: 7, 8: 9}
Keys:   [0, 2, 4, 6, 8]
Output: [2, 4, 6, 8, 0]
```

---

## Trade-offs

| Trade-off | Impact |
|-----------|--------|
| O(n*2) iterations | Acceptable for n<1M |
| Extra slice allocation | Memory overhead ~2x |
| Zero-last semantics | Required for SMP ordering |

---

## Proof of Concept

🔗 [**Go Playground: SSA PoC →**](https://go.dev/play/p/gXdgi47OGDO)

---

## Related Specifications

- [MHA](/specs/mha/) — Model hashing
- [JEMP](/specs/jemp/) — Job messaging
- [Validation Stack](/specs/validation-stack/) — Model validation
- [Transactional Models](/specs/transactional-models/) — Deployment states

---

[← Back to Specifications](/specs/)
