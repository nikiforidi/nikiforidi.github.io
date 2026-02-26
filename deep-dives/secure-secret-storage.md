---
layout: page
title: "JWT Security & Secret Storage on Linux"
permalink: /deep-dives/secure-secret-storage/
---

## Overview

JSON Web Tokens (JWTs) are stateless, but storage is stateful. When building CLI tools like `vpnm` (VPN Manager), the security chain is only as strong as the weakest link: **where you store the token**.

During the VPN Manager tenure (2020-2021), we initially stored JWTs in plain JSON files. This deep dive analyzes why **unencrypted JSON is an anti-pattern** on Linux desktops and outlines the **right way to store secrets** using system keyrings, encryption at rest, and strict permission models.

**Period:** 2020 — 2021
**Role:** Python Tech Lead / Security Architect  
**Primary Language:** Python  
**Related Projects:** [VPN Tunneling Architecture](/deep-dives/vpn-tunneling-architecture/), [anyd Daemon Framework](/deep-dives/anyd-daemon-framework/)

## Problem Statement

CLI tools need persistent authentication. The naive approach is writing the JWT to a file:

```python
# [-] Anti-Pattern: Plain JSON Storage
import json

def save_token(token):
    with open("~/.vpn_manager/secret.json", "w") as f:
        json.dump({"token": token}, f)
```

| Risk                  | Impact                                                     | Likelihood |
| :-------------------- | :--------------------------------------------------------- | :--------- |
| **File Permissions**  | Other users on multi-tenant systems can read secrets       | Medium     |
| **Backup Leakage**    | Secrets included in unencrypted backups (Timeshift, rsync) | High       |
| **Memory Scraping**   | Token loaded into plaintext memory during runtime          | Medium     |
| **Accidental Commit** | Developers accidentally commit `secret.json` to Git        | High       |

**Thesis:** File permissions (`chmod 600`) are necessary but **insufficient**. The right way is **System Keyring** or **Encryption at Rest**.

## Architecture: Secure Storage Layers

We evolved the storage strategy from plain text to a layered security model.

```text
┌─────────────────────────────────────────────────────────────────┐
│                      Application Layer                          │
│                      (vpnm CLI)                                 │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                   Secret Management Layer                       │
├───────────────────┬───────────────────┬─────────────────────────┤
│   Preferred       │   Fallback        │   Legacy (Deprecated)   │
│   System Keyring  │   Encrypted File  │   Plain JSON            │
│   (libsecret)     │   (AES-256)       │   (chmod 600)           │
└─────────┬─────────┴─────────┬─────────┴───────────┬─────────────┘
          │                   │                     │
          ▼                   ▼                     ▼
┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
│ GNOME Keyring   │ │ Master Password │ │ File System     │
│ KWallet         │ │ Derived Key     │ │ Permissions     │
│ macOS Keychain  │ │ (PBKDF2)        │ │ (Owner Only)    │
└─────────────────┘ └─────────────────┘ └─────────────────┘
```

## Implementation Strategies

### 1. System Keyring (The Right Way)

Use the OS-native secret storage. On Linux, this interfaces with `libsecret` (GNOME Keyring, KWallet).

**Library:** [`keyring`](https://pypi.org/project/keyring/) (Python)

```python
# [+] Best Practice: System Keyring
import keyring

SERVICE_NAME = "vpn_manager"
USERNAME = "user_token"

def save_token(token):
    # Stored in encrypted OS keyring
    keyring.set_password(SERVICE_NAME, USERNAME, token)

def get_token():
    return keyring.get_password(SERVICE_NAME, USERNAME)

def delete_token():
    keyring.delete_password(SERVICE_NAME, USERNAME)
```

| Pros                                     | Cons                                           |
| :--------------------------------------- | :--------------------------------------------- |
| **Encrypted at Rest**                    | **Headless Server Issues** (no keyring daemon) |
| **Integrated Unlock** (via user login)   | **Dependency** (requires libsecret-dev)        |
| **No Backup Leakage** (usually excluded) | **CLI Prompt** (may require unlock dialog)     |

### 2. Encrypted File (The Fallback)

For headless servers or environments without a keyring, encrypt the file locally using a key derived from a user password or hardware ID.

**Library:** [`cryptography`](https://pypi.org/project/cryptography/)

```python
# [+] Fallback: Encrypted JSON
from cryptography.fernet import Fernet
import os

def get_key():
    # Derive key from environment or master password
    return os.getenv("VPN_MASTER_KEY").encode()

def save_token(token):
    f = Fernet(get_key())
    encrypted = f.encrypt(token.encode())
    with open("~/.vpn_manager/secret.enc", "wb") as f:
        f.write(encrypted)
    os.chmod("~/.vpn_manager/secret.enc", 0o600)
```

### 3. Plain JSON (The Legacy Way)

Used in early `vpnm` versions. Mitigated strictly with file permissions.

```python
# [!] Legacy: Plain JSON with Permissions
import os
import json

def save_token(token):
    path = os.path.expanduser("~/.vpn_manager/secret.json")
    with open(path, "w") as f:
        json.dump({"token": token}, f)
    # Critical: Restrict access to owner only
    os.chmod(path, 0o600)
```

## Security Comparison

| Feature                 | System Keyring       | Encrypted File        | Plain JSON (`600`)     |
| :---------------------- | :------------------- | :-------------------- | :--------------------- |
| **Encryption at Rest**  | [+] Yes (OS Managed) | [+] Yes (App Managed) | [-] No                 |
| **Backup Safety**       | [+] Excluded         | [!] Encrypted blob    | [-] Leaked             |
| **Multi-User Safety**   | [+] Yes              | [+] Yes               | [+] Yes (if perms set) |
| **Headless Support**    | [-] Limited          | [+] Yes               | [+] Yes                |
| **Implementation Cost** | Low                  | Medium                | Low                    |
| **Security Score**      | **10/10**            | **8/10**              | **4/10**               |

## Key Design Decisions

| Decision                | Alternative           | Rationale                                                                |
| :---------------------- | :-------------------- | :----------------------------------------------------------------------- |
| **Keyring First**       | Always Encrypted File | Leverage OS security model; don't roll your own crypto unless necessary. |
| **Fallback Encryption** | Plain Text            | Headless servers (CI/CD, Docker) often lack keyring daemons.             |
| **Strict Permissions**  | Default Permissions   | Defense in depth. Even encrypted files should be `600`.                  |
| **Memory Clearing**     | Garbage Collection    | Overwrite token variable after use to reduce memory scraping risk.       |

## Lessons Learned

1. **Permissions Are Not Encryption**  
   `chmod 600` prevents casual access but does not protect against root, backups, or disk forensics. Always encrypt sensitive data at rest.

2. **Headless Environments Are Tricky**  
   System keyrings often fail in Docker or SSH sessions without X11. Always implement a fallback (env var or encrypted file) for automation.

3. **Don't Roll Your Own Crypto**  
   Use established libraries (`cryptography`, `keyring`). Implementing AES/PBKDF2 manually introduces subtle vulnerabilities.

4. **Secrets Rotations Matter**  
   JWTs expire, but refresh tokens persist. Ensure your storage mechanism supports easy deletion/rotation (`logout` command must wipe the keyring).

## Recommendations for 2026

If you are building a CLI tool today:

1. **Default to `keyring`** for desktop users (Linux, macOS, Windows).
2. **Use Environment Variables** for CI/CD and headless servers (`VPN_TOKEN`).
3. **Encrypt Local Files** if keyring is unavailable (use `cryptography.fernet`).
4. **Never Commit Secrets** — Add `*.secret`, `*.key`, `*.enc` to `.gitignore`.
5. **Audit Dependencies** — Ensure libraries storing secrets don't log them to stdout.

## Related Specifications

- [VPN Tunneling Architecture](/deep-dives/vpn-tunneling-architecture/) — Where tokens authorize network changes
- [anyd Daemon Framework](/deep-dives/anyd-daemon-framework/) — IPC authentication using similar principles
- [Engineering Philosophy](/about/philosophy/) — Verification Over Assumption

[<- Back to Deep Dives](/deep-dives/)
