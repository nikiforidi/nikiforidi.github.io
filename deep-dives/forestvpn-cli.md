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

The CLI is structured around a modular package design that separates high-level actions from low-level system interactions. The core logic resides in the `actions` package, which orchestrates WireGuard connections through a unified `State` structure.

### Core Package Structure

- **`actions`**: Contains high-level command implementations using `urfave/cli v2`. This package manages the connection lifecycle.
- **`api`**: Wraps the `wgrest` API client for server communication.
- **`auth`**: Handles Firebase REST API authentication and profile management.
- **`cmd`**: The application entry point.
- **`utils`**: Provides cross-platform helper functions for OS detection and system commands.

### Connection State Management

The heart of the CLI is the `State` struct within the `actions` package. It abstracts the complexities of managing WireGuard interfaces across disparate operating systems.

**Platform Abstraction Strategy**
The `State` struct employs runtime OS detection to branch logic into three distinct execution paths:

1.  **Windows**: Interacts directly with the WireGuard NT service using `wireguard.exe` commands (`/installtunnelservice`, `/uninstalltunnelservice`).
2.  **OpenWRT**: Utilizes `uci` commands for network configuration. It includes specialized logic for firewall management, SSH client exclusion, and persistent routing rules tailored for embedded environments.
3.  **Linux/macOS**: Leverages standard `wg-quick` utilities for interface management, IP assignment, and routing.

**Key Implementation Details (`state.go`)**

- **Status Polling**: The `GetStatus` method deprecated direct shell parsing in favor of API-driven status checks, though legacy support remains via `wg show` or `uci show` depending on the platform.
- **Connection Setup**: The `SetUp` method handles profile loading from the `auth` package. It dynamically constructs IP routes and assigns IPv4/IPv6 addresses. On OpenWRT, it specifically manages peer endpoints and allowed IPs based on active SSH clients to prevent lockouts.
- **Teardown**: The `SetDown` method ensures clean removal of interfaces and routes, committing UCI changes on OpenWRT or uninstalling services on Windows.

## Distribution Strategy

The project supports a wide matrix of package managers to ensure seamless installation across target environments:

- **macOS**: Distributed via Homebrew (stable and beta taps).
- **Windows**: Available through Chocolatey community repositories.
- **Linux**: Provided as `.deb` (Debian/Ubuntu), `.rpm` (Fedora), and `.apk` (Alpine) packages via GitHub Releases.
- **Embedded**: OpenWRT targets receive `.ipk` packages directly from releases.

## CI/CD Pipeline

Automation was built to support high-frequency release cycles (116 releases in ~1 year).

- **Build Automation**: Drone CI handles automated building across multiple architectures.
- **Release Management**: GoReleaser manages versioning, changelog generation, and artifact packaging for both stable and beta channels.
- **Observability**: Sentry is integrated for real-time error tracking and crash reporting.
- **Delivery**: Artifacts are continuously delivered to GitHub Releases and associated package repositories.

---

[Full source code](https://github.com/forestvpn/cli)  
[← Back to Deep Dives](/deep-dives/)
