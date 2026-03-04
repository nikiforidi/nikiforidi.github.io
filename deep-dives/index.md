---
layout: page
title: Deep Dives
permalink: /deep-dives/
---

## Technical Deep Dives

Detailed architectural breakdowns of key projects, sorted by technical complexity and system depth.

## Available Deep Dives

| Project                                                   | Complexity | Description                                                                            | Links                                                                                    |
| --------------------------------------------------------- | ---------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| [MIND Universe](mind-universe/)                           | ★★★★★      | Cloud infrastructure management, custom algorithms (MHA, SSA), distributed concurrency | [Specs](/specs/)                                                                         |
| [National CA Monitoring](national-ca-monitoring/)         | ★★★★★      | GOST crypto verification, XML-DSig, secure PKI pipeline                                | [Deep Dive](/deep-dives/national-ca-monitoring/)                                         |
| [VPN Tunneling Architecture](vpn-tunneling-architecture/) | ★★★★☆      | Linux kernel networking, TUN/TAP, iptables, split-privilege daemon                     | [vpnm](https://github.com/nikiforidi/vpnm), [vpnmd](https://github.com/nikiforidi/vpnmd) |
| [anyd Daemon Framework](anyd-daemon-framework/)           | ★★★★☆      | Unix daemon IPC framework, privilege separation, socket security                       | [PyPI](https://pypi.org/project/anyd/), [GitHub](https://github.com/anatolio-deb/anyd)   |
| [ForestVPN CLI](forestvpn-cli/)                           | ★★★☆☆      | Cross-platform Go CLI, WireGuard integration, CI/CD distribution                       | [GitHub](https://github.com/forestvpn/cli)                                               |
| [JWT Security & Secret Storage](secure-secret-storage/)   | ★★★☆☆      | Secure secret storage strategies, keyring integration, threat modeling                 | [vpnm](https://github.com/nikiforidi/vpnm)                                               |
| [v2sub systemd Integration](v2sub-systemd-integration/)   | ★★☆☆☆      | Rootless v2ray manager, systemd user units, interactive TUI                            | [GitHub](https://github.com/nikiforidi/v2sub)                                            |
| [JetBrains Academy](jetbrains-academy/)                   | ★☆☆☆☆      | Python educational project, API integration, testing                                   | [Hyperskill](https://hyperskill.org/projects/99)                                         |

## Complexity Legend

| Stars | Level        | Focus                                                |
| ----- | ------------ | ---------------------------------------------------- |
| ★★★★★ | Expert       | Distributed systems, cryptography, custom algorithms |
| ★★★★☆ | Advanced     | Kernel interaction, IPC, security architecture       |
| ★★★☆☆ | Intermediate | Cross-platform development, security patterns        |
| ★★☆☆☆ | Fundamental  | System integration, CLI UX                           |
| ★☆☆☆☆ | Introductory | Educational, basic API usage                         |

[← Back to Home](/)
