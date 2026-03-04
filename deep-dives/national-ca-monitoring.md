---
layout: page
title: "National CA Certificate Monitoring & Verification Pipeline"
permalink: /deep-dives/national-ca-monitoring/
---

## Overview

A secure, automated pipeline for monitoring, verifying, and distributing trusted CA certificates from the Russian Ministry of Digital Development (MinTsifry).

As cloud infrastructure relies on trusted PKI chains, missing or compromised root certificates can break service connectivity or expose systems to MITM attacks. Since MinTsifry does not provide a push-API for certificate updates, I engineered a pull-based monitoring service that verifies cryptographic signatures using **GOST R 34.11-2012** and **GOST R 34.10-2012** algorithms before automating distribution via GitLab Merge Requests.

**Period:** 2025 — Present  
**Role:** Service Engineer / Security Architect  
**Primary Language:** Go  
**Related Projects:** [Secure Secret Storage](/deep-dives/secure-secret-storage/), [ForestVPN CLI](/deep-dives/forestvpn-cli/)  
**Repository:** `certbot` (Internal)

## Problem Statement

| Problem             | Impact                                         | Root Cause                                              |
| ------------------- | ---------------------------------------------- | ------------------------------------------------------- |
| No Push API         | Delayed updates, manual polling required       | MinTsifry provides static HTTP endpoints only           |
| Integrity Risk      | Potential for MITM or XML injection            | Certificates distributed via signed XML (TSL)           |
| Manual Distribution | Human error, inconsistent state across servers | No automated pipeline for PEM conversion and deployment |
| Logging Blindness   | Unable to debug cron jobs in containers        | Docker + Cron stdout/stderr mismatch                    |

**Thesis:** Automation without verification is dangerous. A certificate monitoring service must verify the **Electronic Digital Signature (EDS)** of the source data using federal standards (GOST) before trusting any changes.

## Architecture

The system runs as a Docker container scheduled via `cron`. It polls the E-Trust portal, verifies the XML-DSig signature using GOST algorithms, converts certificates to PEM, and pushes changes to GitLab.

```text
┌─────────────────────────────────────────────────────────────────┐
│                     Docker Container (cron)                     │
├─────────────────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │   Poller     │  │   Verifier   │  │   Converter  │          │
│  │ (E-Trust API)│  │ (GOST Crypto)│  │ (XML → PEM)  │          │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘          │
│         │                 │                 │                   │
│         └─────────────────┴─────────────────┘                   │
│                           │                                     │
│                           ▼                                     │
│                  ┌─────────────────┐                            │
│                  │   Git Client    │                            │
│                  │ (Commit + MR)   │                            │
│                  └────────┬────────┘                            │
└───────────────────────────┼─────────────────────────────────────┘
                            │
                            ▼
                  ┌─────────────────┐
                  │   GitLab Repo   │
                  │  (gostca PEMs)  │
                  └─────────────────┘
```

## Cryptographic Verification (GOST Standards)

The core security requirement is verifying the **National CA Electronic Signature** on the Trust Service List (TSL) XML. This ensures the certificate list hasn't been tampered with during transit. The implementation strictly adheres to Russian Federal Standards.

### Signature Standards

| Component        | Standard              | Algorithm                                        | Parameters                               |
| ---------------- | --------------------- | ------------------------------------------------ | ---------------------------------------- |
| Hash Function    | **GOST R 34.11-2012** | Streebog                                         | 512-bit block, 256-bit digest            |
| Signature        | **GOST R 34.10-2012** | ECDSA                                            | Elliptic curves over finite prime fields |
| Format           | XML-DSig              | `urn:ietf:params:xml:ns:cpxmlsec:algorithms:...` | Based on W3C XML Signature               |
| Canonicalization | Exclusive C14N        | `http://www.w3.org/2001/10/xml-exc-c14n#`        | Required before hashing                  |

### Verification Flow (Standard Compliant)

```text
┌──────────────────┐              ┌──────────────────┐
│  TSL XML Source  │              │  National CA Pub │
│  (E-Trust)       │              │  Key (X509)      │
└────────┬─────────┘              └────────┬─────────┘
         │                                 │
         ▼                                 │
┌───────────────────┐                      │
│ 1. Extract        │                      │
│    SignedInfo     │                      │
└────────┬──────────┘                      │
         │                                 │
         ▼                                 │
┌───────────────────┐                      │
│ 2. Canonicalize   │                      │
│    (Exc C14N)     │                      │
└────────┬──────────┘                      │
         │                                 │
         ▼                                 │
┌───────────────────┐                      │
│ 3. Hash (Streebog)│                      │
│    ГОСТ 34.11-2012│                      │
│    (256-bit)      │                      │
└────────┬──────────┘                      │
         │                                 │
         ▼                                 │
┌───────────────────┐      ┌───────────────▼─────────┐
│ 4. Verify Signature│◀────│ 5. Decrypt Signature    │
│    ГОСТ 34.10-2012│      │    Value (Base64)       │
│    (ECDSA GOST)   │      │    OpenSSL Engine       │
└───────────────────┘      └─────────────────────────┘
```

### Implementation Details (Alt Linux & OpenSSL)

To perform GOST operations reliably, the service relies on the `openssl-gost-engine` package available in Alt Linux repositories. Pure Go implementations were evaluated but deemed risky for federal compliance without FSB certification.

#### Engine Configuration

The OpenSSL engine must be explicitly enabled in the container environment.

```bash
# Install GOST engine package (OpenSSL 1.1+)
apt-get install openssl-gost-engine

# Enable the engine via control script
control openssl-gost enabled

# Verify availability
openssl ciphers | grep GOST
# Output: GOST2001-GOST89-GOST89 ...
```

#### Verification Command

The core verification logic wraps the OpenSSL CLI to ensure standard compliance:

```bash
openssl pkeyutl -verify \
  -pubin -inkey <public_key_file> \
  -in <digest_file> \
  -sigfile <signature_value_file>
```

_Note: All XML values (`DigestValue`, `SignatureValue`, `X509Certificate`) must be Base64 decoded before passing to OpenSSL._

### Implementation Challenges

| Challenge                 | Solution                                                                                    | Standard Reference        |
| ------------------------- | ------------------------------------------------------------------------------------------- | ------------------------- |
| `gostribog` Hash Mismatch | Wrapped `openssl-gost-engine` (AltLinux) to handle "long addition" carry bugs fixed in 2018 | Bugzilla #37922 (p1-alt2) |
| Engine Activation         | Used `control openssl-gost enabled` script instead of manual `openssl.cnf` editing          | Alt Linux Wiki            |
| Base64 Encoding           | XML values decoded before passing to OpenSSL CLI                                            | XML-DSig Spec             |
| Key Extraction            | Public key extracted from `<X509Certificate>` within `<KeyInfo>`                            | GOST R 34.10-2012         |

## Automation & Operations

### Docker + Cron Logging Workaround

Running cron inside Docker typically hides job output from `docker logs` because cron captures stdout/stderr separately from the container's PID 1.

**Problem:**

```bash
# Default cron behavior
crond ...
# Job output goes to /var/log/cron.log or mail, not docker logs
```

**Solution:**
Redirect cron job output directly to the container's main file descriptor (`/proc/1/fd/1`).

```bash
# Dockerfile CMD
CMD ["crond", "-l", "0", "-f"]

# Crontab Entry
*/30 * * * * /usr/local/bin/certbot >> /proc/1/fd/1 2>&1
```

**Result:** Full visibility into `docker logs` without volume mounts or log aggregation services.

### GitLab Integration

The service acts as a bot user (`certbot`):

1.  **Clone:** Fetches `gostca` repository (PEM storage).
2.  **Diff:** Checks `git status` for new/changed PEM files.
3.  **Commit:** Authors changes as `certbot <bot@1c.ru>`.
4.  **Merge Request:** Creates MR from `dev` → `main` for human review.

#### Orchestration Logic (Go)

The entry point handles the lifecycle of the job, ensuring the working directory is correct and the git state is managed before attempting updates.

```go
// main.go (Entry Point)
func main() {
    // ... git initialization ...

    // Ensure we are in the home directory for cloning
    homeDir, _ := os.UserHomeDir()
    os.Chdir(homeDir)

    // Clone or skip
    if !exists { git.Clone() }

    // Enter repo directory
    os.Chdir(repoDir)

    // Branch management
    if !git.RemoteBranchExist() { git.BranchCreate() }
    if !inBranch { git.Checkout() }

    // Fetch and Process CA
    resp, _ := ca.Get(os.Getenv("CA_SOURCE_URL"))
    resp.DumpToPEM(repoDir)

    // Commit and MR if changes exist
    out, _ := git.Status()
    if !strings.Contains(out, "nothing to commit") {
        git.Add()
        git.Commit("update")
        git.Push(!exists)
        git.CreateMergeRequest("update")
    }
}
```

#### XML Parsing & PEM Conversion

The CA parser handles the specific XML structure of the E-Trust portal, extracting certificate data and formatting them into standard PEM blocks with 76-character line wrapping.

```go
// ca/main.go (Parser)
func (x xmlCAResponse) DumpToPEM(outDir string) error {
    decoder := xml.NewDecoder(x.Body)
    for {
        t, _ := decoder.Token()
        switch _e := t.(type) {
        case xml.StartElement:
            if _e.Name.Local == "УдостоверяющийЦентр" {
                var ca tCertificateAuthority
                decoder.DecodeElement(&ca, &_e)
                // Iterate SWHW, Keys, Certs...
                for _, crt := range key.Certs {
                    // Format PEM with 76 char wrap
                    _cert := "-----BEGIN CERTIFICATE-----\n"
                    for i := 76; i-76 < len(crt.Data); i += 76 {
                        _cert += crt.Data[i-76:i] + "\n"
                    }
                    _cert += "-----END CERTIFICATE-----\n"
                    // Write to file...
                }
            }
        }
    }
    return nil
}
```

## Monitoring Strategies Comparison

| Strategy           | Coverage          | Reliability          | Complexity        | Verdict          |
| ------------------ | ----------------- | -------------------- | ----------------- | ---------------- |
| **TSL Polling**    | All CA/CRL/Status | High (Signed XML)    | Medium (XML-DSig) | **[✓] Selected** |
| **CRL Polling**    | Revocations Only  | High                 | Low               | Backup           |
| **CT Logs**        | Leaf Certs        | Low (RU CA optional) | Low               | Supplemental     |
| **Browser Config** | Root Only         | Medium               | Low               | Supplemental     |

## Metrics

| Metric            | Value                       |
| ----------------- | --------------------------- |
| Polling Interval  | 30 minutes                  |
| TSL Size          | ~4 MB                       |
| Verification Time | < 500ms (OpenSSL engine)    |
| False Positives   | 0 (Signature verified)      |
| MR Creation Time  | < 2 minutes after detection |

## Trade-offs

| Trade-off            | Impact                                                                    |
| -------------------- | ------------------------------------------------------------------------- |
| **Polling vs. Push** | Increased latency (up to 30 min) but no dependency on vendor webhooks     |
| **OpenSSL Engine**   | Dependency on AltLinux packages vs. pure Go crypto (limited GOST support) |
| **Bot Account**      | Requires managing separate GitLab credentials vs. using personal tokens   |
| **MR Review**        | Adds human latency to deployment vs. auto-merge (security benefit)        |

## Lessons Learned

### 1. Standards Compliance Requires Mature Libraries

Pure Go implementations of GOST algorithms (`gostribog`) may have edge-case bugs compared to mature OpenSSL engines.
**Lesson:** When dealing with national standards (GOST R 34.11-2012), wrap established C libraries (`openssl-gost-engine`) rather than relying on newer pure-Go ports for critical verification. Specifically, the Alt Linux engine fixed a "long addition" carry bug (Bugzilla #37922) that caused hash mismatches in earlier versions.

### 2. Logging Visibility is Critical

A silent cron job is a broken cron job.
**Lesson:** In containerized schedulers, always redirect job output to `/proc/1/fd/1` to maintain observability via standard Docker tooling.

### 3. Trust But Verify (Literally)

Downloading certificates from a trusted URL is not enough.
**Lesson:** Always verify the **Electronic Digital Signature (EDS)** of the metadata (TSL) before trusting the contents. This protects against compromised mirrors or DNS hijacking. The verification must adhere to **GOST R 34.10-2012** processes.

### 4. Human-in-the-Loop for PKI

Automating certificate updates is risky.
**Lesson:** Use Merge Requests instead of direct pushes to `main`. This allows security teams to audit new root CAs before they are distributed to production infrastructure.

## Related Specifications

- [Secure Secret Storage](/deep-dives/secure-secret-storage/) — Handling tokens for GitLab API
- [Engineering Philosophy](/about/philosophy/) — Verification Over Assumption
- [ForestVPN CLI](/deep-dives/forestvpn-cli/) — Similar distribution strategy (Homebrew/Chocolatey)

## References

- **GOST R 34.11-2012** — Hash Function (Streebog)
- **GOST R 34.10-2012** — Digital Signature Process
- **Alt Linux Wiki** — OpenSSL GOST Engine Configuration
- **XML-DSig** — W3C Signature Syntax and Processing

[← Back to Deep Dives](/deep-dives/)
