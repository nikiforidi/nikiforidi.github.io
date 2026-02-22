---
layout: page
title: "ForestVPN CLI"
permalink: /deep-dives/forestvpn-cli/
---

## Overview

A cross-platform VPN CLI client engineered for Linux, OpenWRT, macOS, and Windows. As the Go Technical Lead, I drove the architecture and release cycle from May 2022 to April 2023.

**Project Metrics**

- **Commits:** 792
- **Releases:** 116 (Latest: v0.3.5)
- **Contributors:** 5
- **Primary Language:** Go (82.8%)
- **License:** MIT

[Repository](https://github.com/forestvpn/cli) | [Homebrew Stable](https://github.com/forestvpn/homebrew-stable) | [Chocolatey](https://community.chocolatey.org/packages/fvpn)

## Architecture & Design

The CLI is structured around a modular package design that separates high-level actions from low-level system interactions.

### Package Structure

```text
┌────────────────────────────────────────────────────────────┐
│                         cmd (Entry Point)                  │
│                         main.go                            │
└─────────────────────────┬──────────────────────────────────┘
                          │
                          ▼
┌────────────────────────────────────────────────────────────┐
│                      actions (Core Logic)                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │   State      │  │   Connect    │  │  Disconnect  │      │
│  │  Structure   │  │   Command    │  │   Command    │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────┬────────────────────┬────────────────┬────────────┘
          │                    │                │
          ▼                    ▼                ▼
┌─────────────┐      ┌─────────────┐  ┌─────────────────────┐
│    auth     │      │     api     │  │       utils         │
│  (Firebase) │      │   (wgrest)  │  │  (OS Detection)     │
└─────────────┘      └─────────────┘  └─────────────────────┘
```

### State Management Logic (`state.go`)

The `State` struct abstracts WireGuard interface management. It employs runtime OS detection to branch logic into three distinct execution paths.

**Struct Definition**

```text
┌─────────────────────────────────────────────────────────────────┐
│                      actions.State                              │
├─────────────────────────────────────────────────────────────────┤
│  Fields:                                                        │
│  • status              (bool)                                   │
│  • WireGuardInterface  (string)                                 │
├─────────────────────────────────────────────────────────────────┤
│  Methods:                                                       │
│  • GetStatus()         → Checks wg show / uci show              │
│  • SetUp()             → Establishes connection (See Flow)      │
│  • SetDown()           → Terminates connection                  │
└─────────────────────────────────────────────────────────────────┘
```

**Connection Flow (SetUp Method)**

```text
      ┌──────────────┐
      │  User Input  │ (Profile ID, Persist Flag)
      └──────┬───────┘
             ▼
      ┌──────────────┐
      │ Load Profile │ (auth.LoadDevice)
      └──────┬───────┘
             ▼
      ┌───────────────┐
      │ OS Detection  │ (utils.Os / IsOpenWRT)
      └───────┬───────┘
              │
     ┌────────┼───────┬────────────────────────┐
     ▼        │       ▼                        ▼
┌──────────┐  │  ┌────────────────┐      ┌──────────────┐
│ Windows  │  │  │   OpenWRT      │      │ Linux/macOS  │
│          │  │  │                │      │              │
│ wireguard│  │  │ persist?       │      │ wg-quick     │
│ .exe     │  │  │                │      │ up           │
│ install  │  │  │ Yes → uci      │      │              │
│ service  │  │  │       utils    │      └──────────────┘
└──────────┘  │  │       .Network │
              │  │                │
              │  │ No  → ip link. │
              │  │       wg set   │
              │  │       conf     │
              │  └────────────────┘
              │
      ┌───────┴───────┬────────────────────────┐
      ▼               ▼                        ▼
┌──────────┐  ┌──────────────┐      ┌──────────────┐
│ Windows  │  │   OpenWRT    │      │ Linux/macOS  │
│          │  │              │      │              │
│ wireguard│  │ uci delete   │      │ wg-quick     │
│ .exe     │  │ network.wg   │      │ down         │
│ uninstall│  │ commit       │      │              │
│ service  │  │              │      │              │
└──────────┘  └──────────────┘      └──────────────┘
```

**Key Implementation Details**

- **Status Polling**: `GetStatus` originally parsed shell output (`wg show`), deprecated in favor of API-driven checks.
- **OpenWRT Persistence**: The `persist` flag determines whether to use UCI for permanent configuration (including firewall rules) or transient `ip` commands.
- **SSH Safety**: On OpenWRT, active SSH client IPs are excluded from the VPN tunnel to prevent lockouts.

## Distribution Strategy

- **macOS**: Homebrew (stable and beta taps).
- **Windows**: Chocolatey community repositories.
- **Linux**: `.deb` (Debian/Ubuntu), `.rpm` (Fedora), `.apk` (Alpine).
- **Embedded**: OpenWRT `.ipk` packages.

## CI/CD Pipeline

- **Build Automation**: Drone CI (multi-architecture).
- **Release Management**: GoReleaser (versioning, changelogs, artifacts).
- **Observability**: Sentry (error tracking).
- **Delivery**: GitHub Releases & Package Repositories.

---

[Full source code](https://github.com/forestvpn/cli)  
[← Back to Deep Dives](/deep-dives/)
