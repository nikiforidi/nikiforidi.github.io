---
layout: page
title: "v2sub: systemd-run Integration & Interactive Menu"
permalink: /deep-dives/v2sub-systemd-integration/
---

## Overview

**Project:** [v2sub](https://github.com/nikiforidi/v2sub) — A v2ray subscription manager written in Python

**Commit:** `feat: systemd-run and interactive menu` · [0899bf5](https://github.com/nikiforidi/v2sub/commit/0899bf5)

**Period:** 2020-2021

**Role:** Python Developer & System Engineer

---

## Problem Statement

### Original Architecture Issues

The v2sub project had several critical limitations that prevented widespread adoption:

| Problem                       | Impact                                                    | Root Cause                                      |
| ----------------------------- | --------------------------------------------------------- | ----------------------------------------------- |
| **Root privileges required**  | Users hesitant to run unknown scripts as root             | `systemctl restart v2ray.service` requires sudo |
| **Config in `/etc/v2ray/`**   | File operations need elevated permissions                 | Traditional system-wide config location         |
| **No node selection UI**      | Users must manually edit config or remember index numbers | CLI-only with `--index` argument                |
| **No clean shutdown**         | Orphaned v2ray processes after script exit                | No process tracking or lifecycle management     |
| **Unreliable user detection** | `SUDO_USER` fallback breaks in some environments          | Inconsistent environment variable availability  |

### User Experience Pain Points

```bash
# Before: Clunky workflow requiring root
$ sudo python3 v2sub.py run --index 5
Password: [sudo password required]
[!] Security concern: Why does a VPN client need root?

# Before: No way to see available nodes
$ python3 v2sub.py list
# Raw JSON output, no formatting

# Before: No clean shutdown
$ Ctrl+C
# v2ray process keeps running in background
```

---

## Motivation

### Why This Refactor Was Necessary

1. **Security First** — Running third-party scripts as root is a security anti-pattern. Users should never need to trust a script with full system access for VPN functionality.

2. **User Experience** — Interactive selection is more intuitive than remembering index numbers. Think `htop` vs `ps aux | grep`.

3. **Proper Lifecycle Management** — Services should start cleanly and stop cleanly. No orphaned processes.

4. **Portability** — User-level systemd units work across different Linux distributions without requiring system-wide configuration.

5. **Maintainability** — Separating systemd logic into its own module makes the codebase easier to test and extend.

---

## Technical Solutions

### 1. User-Level systemd Units (No Root Required)

**Before:**

```python
# utils.py - Required root
def restart_server():
    click.echo("Going to restart v2ray service...")
    result = call("systemctl restart v2ray.service", shell=True)
    # [-] Requires: sudo python3 v2sub.py
```

**After:**

```python
# systemd.py - User-level service management
SYSTEMD_RUN_CMD = [
    "systemd-run",
    "--user",           # [+] No root needed
    "--collect",        # [+] Auto-cleanup when done
    "-p", "Restart=on-failure",
]

def start(cmd: Iterable) -> dict:
    SYSTEMD_RUN_CMD.extend(cmd)
    proc = run(SYSTEMD_RUN_CMD, check=True, capture_output=True)
    # Extract unit name from stderr: "Running as unit: user@12345.service"
    return {"unit": proc.stderr.decode().split(":")[1].strip()}
```

**Why `systemd-run --user`?**

- Creates transient service units (no permanent config files)
- Runs in user session (no root required)
- `--collect` flag ensures automatic cleanup after service stops
- Output includes unit name for later management (stop/restart)

### 2. Interactive Terminal Menu

**Before:**

```bash
$ python3 v2sub.py run --index 5
# User must remember: "Which index was the US server?"
```

**After:**

```python
# command.py - Interactive node selection
from simple_term_menu import TerminalMenu

def run(name, port):
    servers = subscribe.get_servers(name)
    menu = TerminalMenu(servers, title=name)
    index = menu.show()  # [+] Interactive selection
    node = subscribe.get_node(index, name)
    # ... start connection
```

**Why `simple_term_menu`?**

- Pure Python (no external dependencies beyond pip)
- Keyboard navigation (arrow keys, Enter)
- Works in any terminal (no GUI required)
- Minimal code footprint (~20 lines)

### 3. State Tracking for Clean Shutdown

**Problem:** How do we stop a v2ray instance we started earlier?

**Solution:** Persist the systemd unit name to JSON state file.

```python
# subscribe.py - Initialize state file
def init():
    # ... existing init code ...
    if not os.path.exists(SYSTEMD_UNIT):
        os.mknod(SYSTEMD_UNIT)  # Create state file

# command.py - Track unit name
def run(name, port):
    existing_unit = utils.read_from_json(systemd.SYSTEMD_UNIT).get("unit", "")
    existing_config = utils.read_from_json(config.V2RAY_CONFIG_FILE)

    if existing_config != node:
        systemd.stop(existing_unit)  # [+] Stop old instance first
        config.update_config(node, port)

    if not systemd.is_active(existing_unit):
        unit = systemd.start(["v2ray", "-config", config.V2RAY_CONFIG_FILE])
        utils.write_to_json(unit, systemd.SYSTEMD_UNIT)  # [+] Save for later

# command.py - Clean shutdown
def stop():
    unit = utils.read_from_json(systemd.SYSTEMD_UNIT).get("unit", "")
    if systemd.is_active(unit):
        systemd.stop(unit)
        click.echo("Stopped")
```

**State File Structure:**

```json
// ~/.v2sub/unit.json
{
  "unit": "user@12345.service"
}
```

### 4. Simplified User Detection

**Before:**

```python
# Unreliable in some environments
user = os.getenv("SUDO_USER") or os.getenv("USER")
```

**After:**

```python
# Reliable: USER is always set in login shells
user = os.getenv("USER")
```

**Why the change?**

- `SUDO_USER` only set when script is run with `sudo`
- Since we no longer require sudo, `USER` is sufficient
- Simpler code = fewer edge cases

### 5. Config File Location Change

**Before:**

```python
V2RAY_CONFIG_FILE = "/etc/v2ray/config.json"  # [-] Requires root
```

**After:**

```python
V2RAY_CONFIG_FILE = "/tmp/config.json"  # [+] User-writable
```

**Trade-offs:**

| Aspect          | `/etc/v2ray/`     | `/tmp/`                                    |
| --------------- | ----------------- | ------------------------------------------ |
| **Permissions** | Root required     | User-writable                              |
| **Persistence** | Survives reboot   | Cleared on reboot                          |
| **Security**    | Protected by root | World-readable (but config has no secrets) |
| **Use Case**    | System service    | User session                               |

**Decision:** For user-level VPN client, `/tmp/` is acceptable because:

- Config is regenerated on each connection
- No sensitive data in config (auth is in subscription URL)
- Reboot clears stale configs (actually a feature)

---

## Architecture Changes

### Module Structure

```
v2sub/
├── __init__.py          # Version, global variables
├── command.py           # CLI commands (run, stop, ping)
├── config.py            # V2Ray config generation
├── subscribe.py         # Subscription management
├── systemd.py           # [+] NEW: systemd-run integration
└── utils.py             # Helper functions (ping, JSON I/O)
```

### Service Lifecycle Flow

```
┌──────────────┐
│  User Input  │ (Select node from menu)
└──────┬───────┘
       ▼
┌──────────────┐
│ Check State  │ (Read unit.json)
└──────┬───────┘
       ▼
┌──────────────┐
│ Config Diff? │ (Compare with existing)
└──────┬───────┘
       │
       ├── Yes ──▶ systemd.stop(existing_unit)
       │           config.update_config(node)
       │           systemd.start(new_unit)
       │           utils.write_to_json(unit)
       │
       └── No ───▶ systemd.is_active(unit)?
                   ├── Yes ──▶ Already running
                   └── No ───▶ systemd.start(unit)
```

### Command Comparison

| Command  | Before                                | After                                 |
| -------- | ------------------------------------- | ------------------------------------- |
| **Run**  | `sudo python3 v2sub.py run --index 5` | `python3 v2sub.py run` (interactive)  |
| **Stop** | [-] Not available                     | `python3 v2sub.py stop`               |
| **Ping** | `python3 v2sub.py ping --index 5`     | `python3 v2sub.py ping` (interactive) |
| **Root** | [+] Required                          | [-] Not required                      |

---

## Key Design Decisions

### 1. Why `systemd-run` Instead of `systemctl`?

| Aspect           | `systemctl`                           | `systemd-run`           |
| ---------------- | ------------------------------------- | ----------------------- |
| **Unit Type**    | Permanent (`.service` file)           | Transient (in-memory)   |
| **Config Files** | Creates files in `/etc/systemd/user/` | No files created        |
| **Cleanup**      | Manual (`systemctl disable`)          | Automatic (`--collect`) |
| **Use Case**     | Long-running services                 | One-off sessions        |

**Decision:** `systemd-run --user --collect` is perfect for VPN sessions because:

- No permanent configuration clutter
- Automatic cleanup when session ends
- User-level (no root)
- Unit name returned for management

### 2. Why JSON for State Tracking?

**Alternatives Considered:**

- **PID file** — Only tracks process ID, not systemd unit
- **Environment variable** — Lost when shell closes
- **Database** — Overkill for single value
- **JSON file** — [+] Simple, human-readable, easy to parse

**Decision:** JSON strikes the right balance between simplicity and functionality.

### 3. Why Interactive Menu Instead of Fuzzy Search?

**Alternatives Considered:**

- **Fuzzy search** (like `fzf`) — Requires external dependency
- **Numbered list** — What we had before (poor UX)
- **Interactive menu** — [+] Built-in to `simple_term_menu`

**Decision:** Interactive menu provides:

- Visual feedback (highlighted selection)
- Keyboard navigation
- No external dependencies beyond pip
- Works in any terminal

---

## Metrics & Impact

### Code Changes

| Metric            | Value            |
| ----------------- | ---------------- |
| **Files Changed** | 7                |
| **Lines Added**   | +96              |
| **Lines Removed** | -37              |
| **Net Change**    | +59 lines        |
| **New Modules**   | 1 (`systemd.py`) |
| **New Commands**  | 1 (`stop`)       |

### User Experience Improvements

| Metric              | Before                | After            |
| ------------------- | --------------------- | ---------------- |
| **Root Required**   | [+] Yes               | [-] No           |
| **Node Selection**  | Manual index          | Interactive menu |
| **Clean Shutdown**  | [-] No                | [+] Yes          |
| **Config Location** | `/etc/v2ray/`         | `/tmp/`          |
| **User Detection**  | `SUDO_USER` or `USER` | `USER` only      |

### Security Improvements

| Risk                        | Before                      | After             |
| --------------------------- | --------------------------- | ----------------- |
| **Root Privileges**         | Required for all operations | Not required      |
| **Config File Permissions** | 644 (root-owned)            | 644 (user-owned)  |
| **Process Isolation**       | System-wide service         | User session      |
| **Attack Surface**          | Full system access          | User session only |

---

## Trade-offs

### 1. `/tmp/` vs `/etc/v2ray/`

| Trade-off                 | Impact                                  |
| ------------------------- | --------------------------------------- |
| **Config lost on reboot** | [+] Acceptable (regenerated on connect) |
| **World-readable config** | [+] Acceptable (no secrets in config)   |
| **No system-wide config** | [+] Intentional (user-level tool)       |

### 2. `systemd-run` vs Direct Process

| Trade-off                 | Impact                                           |
| ------------------------- | ------------------------------------------------ |
| **Systemd dependency**    | [+] Acceptable (most Linux distros have systemd) |
| **Slightly more complex** | [+] Worth it for lifecycle management            |
| **User session required** | [+] Intentional (no root)                        |

### 3. Interactive Menu vs CLI Arguments

| Trade-off            | Impact                                          |
| -------------------- | ----------------------------------------------- |
| **Not scriptable**   | [!] Minor (can add `--index` flag if needed)    |
| **Extra dependency** | [+] Minimal (`simple_term_menu` is pure Python) |
| **Better UX**        | [+] Significant improvement                     |

---

## Lessons Learned

### 1. Don't Require Root Unless Absolutely Necessary

**Lesson:** Users are (rightfully) suspicious of scripts that require root. Always ask: "Can this work without elevated privileges?"

**Application:** Use `systemd-run --user` instead of `systemctl` for user sessions.

### 2. State Management is Critical for Service Lifecycle

**Lesson:** If you start a service, you need a way to stop it later. Persist state somewhere durable.

**Application:** JSON state file for tracking systemd unit names.

### 3. Interactive UX > CLI Arguments for Human Users

**Lesson:** Remembering index numbers is cognitively demanding. Visual selection is intuitive.

**Application:** `simple_term_menu` for node selection.

### 4. Separate Concerns into Modules

**Lesson:** systemd logic doesn't belong in `utils.py`. Give it its own module.

**Application:** New `systemd.py` module with clear responsibilities.

---

## Future Improvements

### 1. Add `--index` Flag for Scripting

```python
@cli.command()
@click.option("--index", type=click.INT, default=None)
def run(name, port, index):
    if index is not None:
        # Scripting mode
        node = subscribe.get_node(index, name)
    else:
        # Interactive mode
        servers = subscribe.get_servers(name)
        menu = TerminalMenu(servers, title=name)
        index = menu.show()
        node = subscribe.get_node(index, name)
```

### 2. Add `status` Command

```python
@cli.command()
def status():
    unit = utils.read_from_json(systemd.SYSTEMD_UNIT).get("unit", "")
    if systemd.is_active(unit):
        click.echo(f"[+] Active: {unit}")
    else:
        click.echo("[-] Inactive")
```

### 3. Add Connection History

```python
# Track last 10 connections
history = utils.read_from_json(HISTORY_FILE)
history.append({"node": node, "timestamp": datetime.now()})
history = history[-10:]  # Keep last 10
utils.write_to_json(history, HISTORY_FILE)
```

### 4. Add Auto-Reconnect on Network Change

```python
# Watch for NetworkManager events
# Reconnect if connection drops
```

---

## See Also

- [v2sub Repository](https://github.com/nikiforidi/v2sub)
- [Commit 0899bf5](https://github.com/nikiforidi/v2sub/commit/0899bf5)
- [systemd-run Documentation](https://www.freedesktop.org/software/systemd/man/systemd-run.html)
- [simple_term_menu](https://pypi.org/project/simple-term-menu/)

---

[← Back to Deep Dives](/deep-dives/)
