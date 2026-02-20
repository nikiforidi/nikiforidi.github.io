---
layout: home
title: Technical Portfolio
tagline: Architecture, Algorithms, System Design
permalink: /
---

## Welcome, Traveler ☕

```bash
$ whoami
> Anatoly Nikiforov
$ status
> Ready for remote work
$ location
> Moscow, Russia
$ echo "Grab a coffee, make yourself comfortable"
```

Pull up a chair. This portfolio is designed for **cozy reading** about engineering craft—the kind of late-night coding sessions where the only company is your terminal, a warm cup of coffee, and the satisfaction of solving hard problems.

Whether you're here to review architecture, reminisce about the old days, or just enjoy well-documented systems, **make yourself at home**.

---

## System Modules

| Module | Content | Access |
|--------|---------|--------|
| [`[specs/]`](/specs/) | 5 architectural specs (MHA, SSA, JEMP) | [`[ENTER]`](/specs/){: .theme-enter} |
| [`[deep-dives/]`](/deep-dives/) | Technical breakdowns of key projects | [`[ENTER]`](/deep-dives/){: .theme-enter} |
| [`[about/]`](/about/) | Engineering philosophy, career timeline | [`[ENTER]`](/about/){: .theme-enter} |

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

> "What I cannot create, I do not understand."
> 
> — **Richard Feynman**

---

## Featured Deep Dives

### ▶ anyd Daemon Framework
Unix daemon IPC framework published on PyPI.
- **PyPI:** [`anyd 0.4.1`](https://pypi.org/project/anyd/)
- **GitHub:** [`anatolio-deb/anyd`](https://github.com/anatolio-deb/anyd)
- **Tech:** POSIX sockets, IPC, authentication, validation
- **Execute:** [`/deep-dives/anyd-daemon-framework/`](/deep-dives/anyd-daemon-framework/)

### ▶ VPN Tunneling Architecture
Linux VPN client with TUN/TAP, Netfilter, and DNS redirection.
- **Repositories:** [`vpnm`](https://github.com/nikiforidi/vpnm) (154 commits), [`vpnmd`](https://github.com/nikiforidi/vpnmd) (62 commits)
- **Tech:** TUN/TAP, Netfilter, cloudflared DoH, tun2socks
- **Execute:** [`/deep-dives/vpn-tunneling-architecture/`](/deep-dives/vpn-tunneling-architecture/)

### ▶ ForestVPN CLI
Cross-platform VPN client (Linux, macOS, Windows, OpenWRT).
- **Repository:** [`forestvpn/cli`](https://github.com/forestvpn/cli)
- **Stats:** 792 commits, 116 releases, 8 stars
- **Tech:** Go 82.8%, Shell 17.2%, Homebrew, Chocolatey
- **Execute:** [`/deep-dives/forestvpn-cli/`](/deep-dives/forestvpn-cli/)

---

## System Status

| Metric | Value |
|--------|-------|
| **Uptime** | 5+ years (2019–2026) |
| **Commits** | 1,756+ contributions |
| **Packages** | 1 published (anyd 0.4.1) |
| **Docs** | 5 architectural specifications |
| **Last Build** | February 2026 |
| **Coffee Consumed** | ∞ cups |

---

> **Note:** All links are verified. All claims are backed by public evidence.
>
> The terminal is warm, the coffee is fresh, and the code is documented.
>
> **Stay a while.** 🖥️
