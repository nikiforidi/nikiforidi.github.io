---
layout: page
title: "ForestVPN CLI"
permalink: /deep-dives/forestvpn-cli/
---

## Overview

Cross-platform VPN CLI client for Linux, OpenWRT, macOS, and Windows.

**External Resources:**
- [Repository](https://github.com/forestvpn/cli) — 792 commits, 116 releases
- **Period:** May 2022 — April 2023
- **Role:** Go Technical Lead

---

## Repository Statistics

| Metric | Value |
|--------|-------|
| **Commits** | 792 |
| **Releases** | 116 (Latest: v0.3.5, Jun 27, 2023) |
| **Stars** | 8 |
| **Forks** | 1 |
| **Contributors** | 5 |
| **Languages** | Go 82.8%, Shell 17.2% |
| **License** | MIT |

---

## Architecture

### Package Structure

| Package | Purpose |
|---------|---------|
| [actions](https://github.com/forestvpn/cli/tree/main/src/actions) | High-level Actions (urfave/cli v2) |
| [api](https://github.com/forestvpn/cli/tree/main/src/api) | API client (wgrest) |
| [auth](https://github.com/forestvpn/cli/tree/main/src/auth) | Authentication (Firebase REST API) |
| [cmd](https://github.com/forestvpn/cli/tree/main/src/cmd) | Entry point |
| [utils](https://github.com/forestvpn/cli/tree/main/src/utils) | Helper functions |

---

## Distribution Channels

| Platform | Package Type | Delivery |
|----------|--------------|----------|
| **macOS** | Homebrew | [stable](https://github.com/forestvpn/homebrew-stable), [beta](https://github.com/forestvpn/homebrew-beta) |
| **Debian/Ubuntu** | .deb | GitHub Releases |
| **Fedora** | .rpm | GitHub Releases |
| **Alpine** | .apk | GitHub Releases |
| **Windows** | Chocolatey | [community.chocolatey.org/packages/fvpn](https://community.chocolatey.org/packages/fvpn) |
| **OpenWRT** | .ipk | GitHub Releases |

---

## CI/CD Pipeline

| Tool | Purpose |
|------|---------|
| [Drone CI](https://www.drone.io/) | Automated builds |
| [GoReleaser](https://goreleaser.com/) | Stable & beta releases |
| [Sentry](https://sentry.io/welcome/) | Error tracking |
| GitHub Releases | Continuous delivery |

---

## See Also

- [Full source code](https://github.com/forestvpn/cli)

---

[← Back to Deep Dives](/deep-dives/)
