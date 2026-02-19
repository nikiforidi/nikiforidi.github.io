---
layout: home
title: Technical Portfolio
tagline: Architecture, Algorithms, System Design
permalink: /
---

## Grab a Cup of Tea ☕

This portfolio is designed for **cozy reading** about engineering craft.

Here you'll find the **how** and **why** behind the systems I've built.

---

## What You'll Find Here

| Section | Content | For Whom |
|---------|---------|----------|
| [Specifications](/specs/) | 5 architectural specs (MHA, SSA, JEMP) | System Architects |
| [Deep Dives](/deep-dives/) | Technical breakdowns of key projects | Senior Engineers |
| [About](/about/) | Engineering philosophy, career timeline | All Readers |

---

## Featured Specifications

### Model Hashing Algorithm (MHA)
Bidirectional hashing for cloud infrastructure resource comparison.
- **Problem:** Detect CIR changes across different cloud providers
- **Solution:** Nested hashing with unified model abstraction
- **Metrics:** <100ms hash calculation, 100% change detection
- **Read:** [specs/mha.md](/specs/mha.md)

### Sequence Sorting Algorithm (SSA)
Custom Go algorithm for ordered map iteration with zero-last semantics.
- **Problem:** Go maps are unordered, but we need `[1, 2, 4, 7, 0]`
- **Solution:** O(n*2) lookup with mismatch counter
- **Benchmark:** 1,000,000 keys in 116.9 ms
- **Read:** [specs/ssa.md](/specs/ssa.md)

### Job Event Messaging Protocol (JEMP)
Event-driven concurrency model for distributed job execution.
- **Problem:** Track concurrent jobs without MQ overhead
- **Solution:** Heartbeat events + Job Collector + Checkpointer
- **Read:** [specs/jemp.md](/specs/jemp.md)

---

## Featured Deep Dives

### anyd Daemon Framework
Unix daemon IPC framework published on PyPI.
- **PyPI:** [anyd 0.4.1](https://pypi.org/project/anyd/)
- **GitHub:** [anatolio-deb/anyd](https://github.com/anatolio-deb/anyd)
- **Tech:** POSIX sockets, IPC, authentication, validation
- **Read:** [deep-dives/anyd-daemon-framework.md](/deep-dives/anyd-daemon-framework.md)

### VPN Tunneling Architecture
Linux VPN client with TUN/TAP, Netfilter, and DNS redirection.
- **Repositories:** [vpnm](https://github.com/nikiforidi/vpnm) (154 commits), [vpnmd](https://github.com/nikiforidi/vpnmd) (62 commits)
- **Tech:** TUN/TAP, Netfilter, cloudflared DoH, tun2socks
- **Read:** [deep-dives/vpn-tunneling-architecture.md](/deep-dives/vpn-tunneling-architecture.md)

### ForestVPN CLI
Cross-platform VPN client (Linux, macOS, Windows, OpenWRT).
- **Repository:** [forestvpn/cli](https://github.com/forestvpn/cli)
- **Stats:** 792 commits, 116 releases, 8 stars
- **Tech:** Go 82.8%, Shell 17.2%, Homebrew, Chocolatey
- **Read:** [deep-dives/forestvpn-cli.md](/deep-dives/forestvpn-cli.md)

---

## At a Glance

| Metric | Value |
|--------|-------|
| **Professional Experience** | 5+ years (2019–2026) |
| **Community Activity** | 9 years (Habr since 2017) |
| **Companies** | 7 (1C, MIND, MIPT, ForestVPN, Carrierproxy, VPN Manager, JetBrains) |
| **Publications** | 9 Habr articles (237K+ views, 13K+ karma) |
| **GitHub** | 1,756 contributions, 26 repositories |
| **PyPI Packages** | 1 published ([anyd 0.4.1](https://pypi.org/project/anyd/), Aug 2021) |
| **Architecture Specs** | 5 documented specifications |
| **Lectures** | 11 (MIPT Go Course) |

---

> **Note:** All links are verified. All claims are backed by public evidence.
> 
> **Last Updated:** February 2026
