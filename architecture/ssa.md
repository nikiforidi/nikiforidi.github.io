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

## Overview

SSA is a custom sorting algorithm used to sort a mapping of integers (aka **Sequence Numbers**) to Model structures. It is used in MIND Universe as part of **Sequential Model Processing (SMP)** — the mechanism by which DRUID API works with Models.

**The Main Idea:** Have integer keys in a hash map sorted in ascending order, with the zero key positioned last, i.e., `[1, 2, 4, 7, 0]`.

---

## The Problem

The order of elements in a Go map is **unordered**. Thus, we cannot specify the position of a specific element in the map when adding one.

---

## The Solution

Return ordered keys of a map as a slice and use it when working with the map's values.

---

## Implementation

```go
func SequenceSorting(m map[int]int) (order []int) {
    // Need to store its length (number of keys) for further use
    mlen := len(m)

    // Allocate a slice to store map's keys only
    keys := make([]int, mlen)

    // Every time we lookup for a specific key in the map without success,
    // we need to count unsuccessful lookups
    var mismatchCounter int

    // Using a natural series starting from 0 for map lookups.
    // The total number of iterations is not the length of keys (map),
    // which might seem obvious.
    // Instead, it's multiplied by 2 because when we don't find some key in the map,
    // we proceed to the next iteration and will have mlen-1 iterations left.
    // The problem is that we will spend some iterations
    // on unsuccessful lookups (mismatchCounter) and won't be able to iterate
    // all over the map. The loop will end at mlen-mismatchCounter iteration.
    for i := 0; i < mlen*2; i++ {
        _, ok := m[i]

        if ok {
            keys[i-mismatchCounter] = i
        } else {
            mismatchCounter++
        }
    }

    // Sort a slice of sequences via classic algorithm
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

<<<<<<< HEAD
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

**Test:** Ran on 1,000,000 input

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
Sort took 116.915073ms
```

---

## Performance by Dataset Size

| Keys | Time | Memory |
|------|------|--------|
| 1,000 | ~120 μs | 8 KB |
| 10,000 | ~1.2 ms | 80 KB |
| 100,000 | ~12 ms | 800 KB |
| 1,000,000 | 116 ms | 8 MB |

---

## Application in MIND Universe

| Use Case | Description |
|----------|-------------|
| **Sequential Model Processing** | Deterministic VM processing order |
| **DRUID API** | Consistent resource ordering |
| **API Responses** | Reproducible JSON output |
| **Testing** | Deterministic test execution |

---

## Proof of Concept

[Go Playground: SSA PoC](https://go.dev/play/p/gXdgi47OGDO)

---

## Related Specifications

- [MHA — Model Hashing Algorithm](mha.md)
- [JEMP — Job Event Messaging Protocol](jemp.md)
- [Validation Stack](validation-stack.md)
- [Transactional Models](transactional-models.md)

---

## Source

**Experience:** [MIND Software](../experience/mind-software/) | **Period:** Февраль 2023 — Февраль 2025
=======
## Links

- [Full Specification](https://www.notion.so/Sequence-Sorting-Algorithm-SSA-44f828765101456d9ed1a3b6898088a1?pvs=4)
- [Related: MHA](mha.md)
>>>>>>> 0ba548165a7efc68efc999d4cf370060a997a8aa
