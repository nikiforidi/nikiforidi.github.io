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
```

---

### Step 4: Update `assets/js/theme-toggle.js` (Add Typing Effect)

Add a small typing effect when the page loads for extra retro feel.

```javascript
// Add this to the end of your existing theme-toggle.js
(function() {
    // Simple typing effect for h1 elements
    const headings = document.querySelectorAll('h1');
    headings.forEach(heading => {
        const text = heading.textContent;
        heading.textContent = '';
        let i = 0;
        const typeWriter = () => {
            if (i < text.length) {
                heading.textContent += text.charAt(i);
                i++;
                setTimeout(typeWriter, 50);
            }
        };
        // Start typing after a short delay
        setTimeout(typeWriter, 500);
    });
})();
```

---

## 3. Why This Works for Interviewers

| Psychological Trigger | Implementation | Effect |
|----------------------|----------------|--------|
| **Nostalgia** | Monospace fonts, amber colors | Reminds them of late-night coding sessions |
| **Comfort** | Warm colors (not harsh green/black) | Feels inviting, not stressful |
| **Competence** | Clean specs, working links | Shows you care about details |
| **Personality** | Terminal prompts, ASCII art | Shows you have a sense of humor |
| **Memorability** | Unique visual style | Stands out among 100+ standard portfolios |
