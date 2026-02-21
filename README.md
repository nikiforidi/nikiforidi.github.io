# nikiforidi.github.io

> **Technical Portfolio** — Architecture, Algorithms, System Design  
> 🌐 [nikiforidi.github.io](https://nikiforidi.github.io)

[![Jekyll](https://img.shields.io/badge/jekyll-4.3-%23c00)](https://jekyllrb.com)
[![GitHub Pages](https://img.shields.io/badge/github-pages-%23222?logo=github)](https://pages.github.com)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A documentation-first technical portfolio showcasing systems engineering work, architectural specifications, and deep-dive project breakdowns. Built with Jekyll, designed for veteran engineers who remember when README files actually mattered.

---

## 🚀 Quick Start

### Prerequisites
- Ruby 3.0+ with Bundler
- Python 3.8+ (for portfolio management scripts)
- Git

### Local Development
```bash
# 1. Clone the repository
git clone https://github.com/nikiforidi/nikiforidi.github.io.git
cd nikiforidi.github.io

# 2. Install dependencies
bundle install

# 3. Start local server
bundle exec jekyll serve

# 4. Open in browser
open http://127.0.0.1:4000
```

### Deployment
This site is automatically deployed to GitHub Pages when you push to the `main` branch.

1. Push your changes:
   ```bash
   git add .
   git commit -m "Your message"
   git push origin main
   ```
2. GitHub Pages will build and deploy automatically (~1-2 minutes)
3. Visit: https://nikiforidi.github.io

---

## 📁 Project Structure

```
.
├── _config.yml              # Jekyll configuration
├── Gemfile                  # Ruby dependencies
├── index.md                 # Homepage
├── about/                   # About section
│   ├── index.md
│   ├── philosophy.md
│   ├── timeline.md
│   ├── communities.md
│   └── contact.md
├── specs/                   # Architectural specifications
│   ├── index.md
│   ├── mha.md              # Model Hashing Algorithm
│   ├── ssa.md              # Sequence Sorting Algorithm
│   ├── jemp.md             # Job Event Messaging Protocol
│   ├── validation-stack.md
│   └── transactional-models.md
├── deep-dives/             # Project deep dives
│   ├── index.md
│   ├── anyd-daemon-framework.md
│   ├── vpn-tunneling-architecture.md
│   ├── forestvpn-cli.md
│   ├── jetbrains-academy.md
│   └── mind-universe.md
├── assets/                  # Static assets
│   ├── css/style.scss      # Custom theme (amber/monospace)
│   ├── images/
│   └── js/
├── _layouts/                # Jekyll layouts
│   ├── default.html
│   ├── home.html
│   └── page.html
├── init_portfolio.py        # Context → files generator
├── generate_context.py      # Files → context exporter (optional)
├── portfolio_context.md     # 🎯 Source of truth (single file)
└── rebuild.sh              # One-command rebuild script
```

---

## ⚙️ Configuration

### `_config.yml`
```yaml
title: Anatoly Nikiforov
description: Architecture, Algorithms, System Design
theme: minima  # Or remove for custom theme
plugins:
  - jekyll-feed
header_pages:
  - index.md
  - about/
  - specs/
  - deep-dives/
```

### Front Matter (required for all pages)
```yaml
---
layout: page          # or: home, default
title: Your Page Title
permalink: /your/path/
---
```

---

## 🔄 Portfolio Management Workflow

This portfolio supports two workflows:

### Option A: Edit Files Directly (Traditional)
```bash
# Edit any .md file
code specs/mha.md

# Preview changes
bundle exec jekyll serve

# Commit
git add specs/mha.md
git commit -m "Update MHA spec"
git push
```

### Option B: Context-Based Workflow (Recommended for AI/automation)
```bash
# 1. Edit portfolio_context.md (single source of truth)
#    - All content in one parseable file
#    - ASCII art preserved with ```text blocks
#    - File markers: File: `path/to/file.md`

# 2. Regenerate file structure
python3 init_portfolio.py

# 3. Deploy
git add .
git commit -m "Update portfolio from context"
git push
```

#### Context File Format Example
```markdown
title: Portfolio Context Export
generated: 2026-02-20 22:32:58
format: Markdown
scope: .md files only

File: `specs/mha.md`
---
layout: page
title: Model Hashing Algorithm (MHA)
---

## Content here...

File: `specs/ssa.md`
---
layout: page
...
```

---

## 🎨 Theme & Styling

Custom SCSS theme (`assets/css/style.scss`) features:
- **Colors**: Amber (#ffb000) on dark brown (#1a1510)
- **Font**: Monospace ('Courier New')
- **ASCII Art Protection**: `white-space: pre !important` to preserve diagrams

```css
:root {
  --base-color: #ffb000;
  --background-color: #1a1510;
  --text-color: #ffcc80;
}
```

---

## 📝 Content Guidelines

### ASCII Diagrams
Always wrap in ` ```text ` blocks to preserve formatting:
````markdown
### Algorithm Flow

```text
┌───────────────────┐
│   Input Map       │
└─────────┬─────────┘
          │
          ▼
```
````

### Internal Links
Use clean URLs (no `.md` extension):
```markdown
✅ [MHA Spec](/specs/mha/)
❌ [MHA Spec](/specs/mha.md)
```

### Tables
Use standard Markdown tables:
```markdown
| Component | Responsibility |
|-----------|---------------|
| Server    | Executes ops  |
| Client    | Requests ops  |
```

---

## 🧪 Testing & Validation

```bash
# Check Jekyll config
bundle exec jekyll doctor

# Build with verbose output
bundle exec jekyll build --verbose

# Test ASCII art rendering
grep -A 10 "┌───" specs/*.md | head -30

# Validate links
bundle exec jekyll build --trace
```

---

## 🛠 Scripts Reference

### `init_portfolio.py`
**Purpose**: Parse `portfolio_context.md` → generate file structure

```bash
python3 init_portfolio.py
```
- ✅ Parses `File: \`path.md\`` markers
- ✅ Preserves ASCII art whitespace exactly
- ✅ Creates directory structure automatically
- ✅ UTF-8 encoding with LF line endings

### `generate_context.py` (Optional)
**Purpose**: Export existing `.md` files → `portfolio_context.md`

```bash
python3 generate_context.py
```
> ⚠️ **Note**: This script is optional. The context file is meant to be edited manually or by AI agents, not auto-generated from files (to prevent accidental overwrites).

### `rebuild.sh`
**Purpose**: One-command rebuild + restart

```bash
chmod +x rebuild.sh  # First time only
./rebuild.sh
```

---

## 🌐 GitHub Pages Configuration

1. Go to **Repository Settings → Pages**
2. Set **Source** to `Deploy from a branch`
3. Select branch: `main`, folder: `/ (root)`
4. Save — site deploys automatically on push

**Custom domain**: Add a `CNAME` file with your domain (e.g., `anatoly.dev`)

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing`)
3. Make your changes (follow content guidelines above)
4. Test locally (`bundle exec jekyll serve`)
5. Submit a pull request

**For AI Agents**: Edit `portfolio_context.md` directly, then run `python3 init_portfolio.py` to regenerate files before committing.

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---

## ☕ A Note for Veteran Engineers

> If you remember debugging with print statements, deploying via FTP, or celebrating when your code fit in 64KB of RAM—you'll feel at home here.  
>   
> This portfolio is written with the same care we used to put into our README files back when documentation actually mattered.  
>   
> The terminal is always warm. The coffee is always fresh.  
>   
> — Anatoly

---

**Last Updated**: February 2026  
**Built With**: ☕ + `vi` + `git` + ❤️