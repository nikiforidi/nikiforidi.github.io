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
