---
layout: page
title: "JetBrains Academy: Multilingual Translator"
permalink: /deep-dives/jetbrains-academy/
---

## Overview

Educational Python project developed for JetBrains Academy Hyperskill track.

- **Period:** October 2019 — March 2020
- **Role:** Python Software Engineer
- **Project:** [Multilingual Online Translator](https://github.com/anatolio-deb/Multilingual-online-translator)
- **Platform:** [Hyperskill Project #99](https://hyperskill.org/projects/99)
- **Track:** Python Core

---

## Architecture

The translate_word() function handles both interactive mode and command-line arguments. The Reverso Context API is queried via requests.get() with custom User-Agent headers. BeautifulSoup parses the HTML response to extract translations and examples. Results are saved to file ({word}-translation.txt) and printed to console.

```text
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│   User CLI    │────▶│  Translator   │────▶│   Reverso     │
│   Input       │     │   Logic       │     │   Context     │
└───────────────┘     └───────┬───────┘     └───────────────┘
                              │
                              ▼
                      ┌───────────────┐
                      │    hs-test    │
                      │  (Testing)    │
                      └───────────────┘
```

### Input Modes

| Mode | Trigger | Behavior |
|------|---------|----------|
| **Interactive** | No arguments | Prompts for source language, target language, word |
| **CLI** | 3 arguments | Direct translation: `python translator.py english french word` |
| **All Languages** | `all` as target | Translates to all 12 supported languages |

### Supported Languages

Arabic, German, English, Spanish, French, Hebrew, Japanese, Dutch, Polish, Portuguese, Romanian, Russian, Turkish (13 total).

---

## Key Features

- Translate text between multiple languages
- Built on Reverso Context API
- Covered with `hs-test` framework tests
- English documentation included

---

## Teaching Impact

| Metric | Value |
|--------|-------|
| **Project Page** | [hyperskill.org/projects/99](https://hyperskill.org/projects/99) |
| **GitHub** | [github.com/anatolio-deb/Multilingual-online-translator](https://github.com/anatolio-deb/Multilingual-online-translator) |
| **Purpose** | Educational resource for Python learners |
| **Track** | Python Core |

---

## Skills Applied

- Python
- Git
- Software Testing (hs-test framework)
- API Integration (Reverso Context)
- Technical Documentation (English)

---

[← Back to Deep Dives](/deep-dives/)