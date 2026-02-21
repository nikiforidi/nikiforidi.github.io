title: Portfolio Assets Export
generated: 2026-02-21 04:38:54
format: Markdown
scope: Config, CSS, Layouts, Scripts
Portfolio Assets Export
Complete export of Jekyll configuration and theme assets.

File: `.github/workflows/deploy.yml`
```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v4
      - uses: actions/jekyll-build-pages@v1
        with:
          source: ./
          destination: ./_site
      - uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - uses: actions/deploy-pages@v4

```

File: `.gitignore`
```gitignore
_site/
.sass-cache/
.jekyll-cache/
*~
.DS_Store
.idea/
.vscode/
.devcontainer/
```

File: `.jekyll-cache/.gitignore`
```gitignore
# ignore everything in this directory
*
```

File: `Gemfile`
```ruby
source "https://rubygems.org"

gem "jekyll", "~> 4.3"
gem "jekyll-feed", "~> 0.15"
gem "webrick", "~> 1.8"
gem "minima", "~> 2.5"

```

File: `Gemfile.lock`
```text
GEM
  remote: https://rubygems.org/
  specs:
    addressable (2.8.8)
      public_suffix (>= 2.0.2, < 8.0)
    base64 (0.2.0)
    colorator (1.1.0)
    concurrent-ruby (1.3.6)
    csv (3.2.8)
    em-websocket (0.5.3)
      eventmachine (>= 0.12.9)
      http_parser.rb (~> 0)
    eventmachine (1.2.7)
    ffi (1.17.3-aarch64-linux-gnu)
    forwardable-extended (2.6.0)
    google-protobuf (3.25.8-aarch64-linux)
    http_parser.rb (0.8.1)
    i18n (1.14.8)
      concurrent-ruby (~> 1.0)
    jekyll (4.4.1)
      addressable (~> 2.4)
      base64 (~> 0.2)
      colorator (~> 1.0)
      csv (~> 3.0)
      em-websocket (~> 0.5)
      i18n (~> 1.0)
      jekyll-sass-converter (>= 2.0, < 4.0)
      jekyll-watch (~> 2.0)
      json (~> 2.6)
      kramdown (~> 2.3, >= 2.3.1)
      kramdown-parser-gfm (~> 1.0)
      liquid (~> 4.0)
      mercenary (~> 0.3, >= 0.3.6)
      pathutil (~> 0.9)
      rouge (>= 3.0, < 5.0)
      safe_yaml (~> 1.0)
      terminal-table (>= 1.8, < 4.0)
      webrick (~> 1.7)
    jekyll-feed (0.17.0)
      jekyll (>= 3.7, < 5.0)
    jekyll-sass-converter (3.0.0)
      sass-embedded (~> 1.54)
    jekyll-seo-tag (2.8.0)
      jekyll (>= 3.8, < 5.0)
    jekyll-watch (2.2.1)
      listen (~> 3.0)
    json (2.7.2)
    kramdown (2.5.2)
      rexml (>= 3.4.4)
    kramdown-parser-gfm (1.1.0)
      kramdown (~> 2.0)
    liquid (4.0.4)
    listen (3.10.0)
      logger
      rb-fsevent (~> 0.10, >= 0.10.3)
      rb-inotify (~> 0.9, >= 0.9.10)
    logger (1.6.0)
    mercenary (0.4.0)
    minima (2.5.2)
      jekyll (>= 3.5, < 5.0)
      jekyll-feed (~> 0.9)
      jekyll-seo-tag (~> 2.1)
    pathutil (0.16.2)
      forwardable-extended (~> 2.6)
    public_suffix (7.0.2)
    rb-fsevent (0.11.2)
    rb-inotify (0.11.1)
      ffi (~> 1.0)
    rexml (3.4.4)
    rouge (4.7.0)
    safe_yaml (1.0.5)
    sass-embedded (1.62.1-aarch64-linux-gnu)
      google-protobuf (~> 3.21)
    terminal-table (3.0.2)
      unicode-display_width (>= 1.1.1, < 3)
    unicode-display_width (2.6.0)
    webrick (1.9.2)

PLATFORMS
  aarch64-linux

DEPENDENCIES
  jekyll (~> 4.3)
  jekyll-feed (~> 0.15)
  minima (~> 2.5)
  webrick (~> 1.8)

CHECKSUMS
  addressable (2.8.8) sha256=7c13b8f9536cf6364c03b9d417c19986019e28f7c00ac8132da4eb0fe393b057
  base64 (0.2.0) sha256=0f25e9b21a02a0cc0cea8ef92b2041035d39350946e8789c562b2d1a3da01507
  colorator (1.1.0) sha256=e2f85daf57af47d740db2a32191d1bdfb0f6503a0dfbc8327d0c9154d5ddfc38
  concurrent-ruby (1.3.6) sha256=6b56837e1e7e5292f9864f34b69c5a2cbc75c0cf5338f1ce9903d10fa762d5ab
  csv (3.2.8) sha256=2f5e11e8897040b97baf2abfe8fa265b314efeb8a9b7f756db9ebcf79e7db9fe
  em-websocket (0.5.3) sha256=f56a92bde4e6cb879256d58ee31f124181f68f8887bd14d53d5d9a292758c6a8
  eventmachine (1.2.7) sha256=994016e42aa041477ba9cff45cbe50de2047f25dd418eba003e84f0d16560972
  ffi (1.17.3-aarch64-linux-gnu) sha256=28ad573df26560f0aedd8a90c3371279a0b2bd0b4e834b16a2baa10bd7a97068
  forwardable-extended (2.6.0) sha256=1bec948c469bbddfadeb3bd90eb8c85f6e627a412a3e852acfd7eaedbac3ec97
  google-protobuf (3.25.8-aarch64-linux) sha256=5869d1a31f39ee3361e85f3ef3db0512c19f0e0c75cd69d7303c177e17590044
  http_parser.rb (0.8.1) sha256=9ae8df145b39aa5398b2f90090d651c67bd8e2ebfe4507c966579f641e11097a
  i18n (1.14.8) sha256=285778639134865c5e0f6269e0b818256017e8cde89993fdfcbfb64d088824a5
  jekyll (4.4.1) sha256=4c1144d857a5b2b80d45b8cf5138289579a9f8136aadfa6dd684b31fe2bc18c1
  jekyll-feed (0.17.0) sha256=689aab16c877949bb9e7a5c436de6278318a51ecb974792232fd94d8b3acfcc3
  jekyll-sass-converter (3.0.0) sha256=e2e7674f186e906b9d99b8066e13f9b4d5cb9f806d36f7bc8cf2610053d8c902
  jekyll-seo-tag (2.8.0) sha256=3f2ed1916d56f14ebfa38e24acde9b7c946df70cb183af2cb5f0598f21ae6818
  jekyll-watch (2.2.1) sha256=bc44ed43f5e0a552836245a54dbff3ea7421ecc2856707e8a1ee203a8387a7e1
  json (2.7.2) sha256=1898b5cbc81cd36c0fd4d0b7ad2682c39fb07c5ff682fc6265f678f550d4982c
  kramdown (2.5.2) sha256=1ba542204c66b6f9111ff00dcc26075b95b220b07f2905d8261740c82f7f02fa
  kramdown-parser-gfm (1.1.0) sha256=fb39745516427d2988543bf01fc4cf0ab1149476382393e0e9c48592f6581729
  liquid (4.0.4) sha256=4fcfebb1a045e47918388dbb7a0925e7c3893e58d2bd6c3b3c73ec17a2d8fdb3
  listen (3.10.0) sha256=c6e182db62143aeccc2e1960033bebe7445309c7272061979bb098d03760c9d2
  logger (1.6.0) sha256=0ab7c120262dd8de2a18cb8d377f1f318cbe98535160a508af9e7710ff43ef3e
  mercenary (0.4.0) sha256=b25a1e4a59adca88665e08e24acf0af30da5b5d859f7d8f38fba52c28f405138
  minima (2.5.2) sha256=9c434e3b7bc4a0f0ab488910438ed3757a0502ff1060d172f361907fc38aa45a
  pathutil (0.16.2) sha256=e43b74365631cab4f6d5e4228f812927efc9cb2c71e62976edcb252ee948d589
  public_suffix (7.0.2) sha256=9114090c8e4e7135c1fd0e7acfea33afaab38101884320c65aaa0ffb8e26a857
  rb-fsevent (0.11.2) sha256=43900b972e7301d6570f64b850a5aa67833ee7d87b458ee92805d56b7318aefe
  rb-inotify (0.11.1) sha256=a0a700441239b0ff18eb65e3866236cd78613d6b9f78fea1f9ac47a85e47be6e
  rexml (3.4.4) sha256=19e0a2c3425dfbf2d4fc1189747bdb2f849b6c5e74180401b15734bc97b5d142
  rouge (4.7.0) sha256=dba5896715c0325c362e895460a6d350803dbf6427454f49a47500f3193ea739
  safe_yaml (1.0.5) sha256=a6ac2d64b7eb027bdeeca1851fe7e7af0d668e133e8a88066a0c6f7087d9f848
  sass-embedded (1.62.1-aarch64-linux-gnu) sha256=e9c591197aafab1badc6664b73ef05d051319d52e5e326c5b05f8d8bcafefccb
  terminal-table (3.0.2) sha256=f951b6af5f3e00203fb290a669e0a85c5dd5b051b3b023392ccfd67ba5abae91
  unicode-display_width (2.6.0) sha256=12279874bba6d5e4d2728cef814b19197dbb10d7a7837a869bab65da943b7f5a
  webrick (1.9.2) sha256=beb4a15fc474defed24a3bda4ffd88a490d517c9e4e6118c3edce59e45864131

BUNDLED WITH
  4.0.5

```

File: `_config.yml`
```yaml
title: Anatoly Nikiforov
description: Architecture, Algorithms, System Design
theme: minima
plugins:
  - jekyll-feed
header_pages:
  - index.md
  - about/
  - specs/
  - deep-dives/
highlighter: rouge
markdown: kramdown
kramdown:
  syntax_highlighter: rouge
  syntax_highlighter_opts:
    block:
      line_numbers: false
    span:
      line_numbers: false
```

File: `_layouts/default.html`
```html
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{% if page.title %}{{ page.title }} | {{ site.title }}{% else %}{{ site.title }}{% endif %}</title>
  <link rel="stylesheet" href="{{ '/assets/css/style.css' | relative_url }}">
</head>
<body>
  <header class="site-header">
    <div class="wrapper">
      <a class="site-title" href="{{ '/' | relative_url }}">{{ site.title }}</a>
      <nav class="site-nav">
        {% for path in site.header_pages %}
          {% assign page = site.pages | where: "path", path | first %}
          {% if page.title %}
            <a class="nav-link" href="{{ page.url | relative_url }}">{{ page.title }}</a>
          {% endif %}
        {% endfor %}
      </nav>
    </div>
  </header>

  <main class="page-content" aria-label="Content">
    <div class="wrapper">
      {{ content }}
    </div>
  </main>

  <footer class="site-footer">
    <div class="wrapper">
      <p>&copy; {{ site.time | date: '%Y' }} {{ site.title }}</p>
    </div>
  </footer>

  <!-- CRT Effect JS (deferred, non-blocking) -->
  <script src="{{ '/assets/js/crt-effect.js' | relative_url }}" defer></script>
</body>
</html>
```
```

File: `_layouts/home.html`
```html
---
layout: default
---
<div class="home">
  {{ content }}
</div>
```

File: `_layouts/page.html`
```html
---
layout: default
---
<article class="post">
  <header class="post-header">
    <h1 class="post-title">{{ page.title }}</h1>
  </header>
  <div class="post-content">
    {{ content }}
  </div>
</article>
```

File: `_sass/_hacker.scss`
```scss
/**
Warm Nostalgia Theme - For veteran computer scientists
Inspired by: Vintage terminals, amber monitors, coffee shops, late-night coding
*/
@mixin theme() {
  :root {
    /* Warm amber/sepia palette (like old monitors + coffee) */
    --base-color: #ffb000;           /* Amber glow */
    --base-color-dim: #cc8c00;       /* Dimmed amber */
    --background-color: #1a1510;     /* Warm dark brown (not pure black) */
    --background-alt: #251e17;       /* Slightly lighter brown */
    --text-color: #ffcc80;           /* Warm light orange */
    --text-muted: #997755;           /* Muted brown-orange */
    
    /* Borders & Dividers */
    --border: solid 1px rgba(255, 176, 0, 0.3);
    --border-dashed: dashed 1px rgba(255, 176, 0, 0.2);
    
    /* Selection */
    --selection-background: rgba(255, 176, 0, 0.4);
    --selection-text: #1a1510;
    
    /* Links */
    --link-color: #ffb000;
    --link-hover: #ffcc80;
    
    /* Code Colors (warm palette) */
    --code-comment: #887766;
    --code-string: #ffcc80;
    --code-keyword: #ffb000;
    --code-function: #ffaa66;
    --code-number: #ff9966;
    --code-type: #ffcc99;
    
    /* Accents */
    --accent-warm: #ff9966;          /* Warm orange */
    --accent-coffee: #8b6f47;        /* Coffee brown */
    --accent-cream: #fff8e7;         /* Cream (for highlights) */
  }
}
```

File: `assets/css/style.scss`
```scss
```scss
---
---

/* =============================================================================
   WARM & COZY NOSTALGIA THEME + CRT TV EFFECT
   For veteran computer scientists
   ============================================================================= */

/* --- Warm Color Palette --- */
:root {
  --base-color: #ffb000;
  --base-color-dim: #cc8c00;
  --background-color: #1a1510;
  --background-alt: #251e17;
  --text-color: #ffcc80;
  --text-muted: #997755;
  --border: solid 1px rgba(255, 176, 0, 0.3);
  --border-dashed: dashed 1px rgba(255, 176, 0, 0.2);
  --selection-background: rgba(255, 176, 0, 0.4);
  --selection-text: #1a1510;
  --link-color: #ffb000;
  --link-hover: #ffcc80;
  
  /* Code Colors (warm palette) */
  --code-comment: #887766;
  --code-string: #ffcc80;
  --code-keyword: #ffb000;
  --code-function: #ffaa66;
  --code-number: #ff9966;
  --code-type: #ffcc99;
  
  /* CRT Effect Variables */
  --crt-noise-opacity: 0.12;
  --crt-scanline-opacity: 0.25;
  --crt-rgb-intensity: 0.03;
  --crt-power-duration: 400ms;
}

/* --- Global Base --- */
html, body {
  background-color: var(--background-color);
  color: var(--text-color);
  font-family: 'Courier New', 'Monaco', 'Consolas', monospace;
  font-size: 17px;
  line-height: 1.7;
  margin: 0;
  padding: 0;
}

/* --- Warm Background Gradient --- */
body {
  background: linear-gradient(180deg, var(--background-color) 0%, var(--background-alt) 100%);
  min-height: 100vh;
}

/* --- Selection --- */
::selection {
  background: var(--selection-background);
  color: var(--selection-text);
}

/* --- Links --- */
a {
  color: var(--link-color);
  text-decoration: none;
  border-bottom: var(--border-dashed);
  transition: all 0.3s ease;
}

a:hover {
  color: var(--link-hover);
  text-shadow: 0 0 8px rgba(255, 176, 0, 0.5);
  border-bottom-color: var(--link-hover);
}

/* --- Headers --- */
h1, h2, h3, h4, h5, h6 {
  color: var(--base-color);
  font-weight: bold;
  margin-top: 2.5em;
  margin-bottom: 1em;
  letter-spacing: 1px;
  text-shadow: 0 0 15px rgba(255, 176, 0, 0.3);
}

h1 {
  font-size: 2.2em;
  border-bottom: var(--border);
  padding-bottom: 0.5em;
}

h2 {
  font-size: 1.6em;
  border-left: 4px solid var(--base-color);
  padding-left: 1em;
}

h3 {
  font-size: 1.3em;
  color: #ff9966;
}

/* --- Site Header --- */
.site-header {
  background: var(--background-alt);
  border-bottom: var(--border);
  padding: 1.5em 0;
  box-shadow: 0 2px 20px rgba(255, 176, 0, 0.1);
}

.site-header .site-title {
  font-size: 1.8em;
  color: var(--base-color);
  letter-spacing: 2px;
}

.site-header .site-title:hover {
  text-shadow: 0 0 20px var(--base-color);
}

.site-header .site-nav {
  margin-top: 1em;
}

.site-header .nav-link {
  color: var(--text-color);
  margin-right: 1.5em;
  border: var(--border);
  padding: 0.4em 1em;
  border-radius: 3px;
}

.site-header .nav-link:hover {
  background: var(--base-color);
  color: var(--background-color);
  box-shadow: 0 0 15px rgba(255, 176, 0, 0.5);
}

/* --- Main Content --- */
.page-content {
  max-width: 850px;
  margin: 0 auto;
  padding: 3em 1.5em;
  background: rgba(255, 248, 231, 0.02);
  border-radius: 8px;
}

/* =============================================================================
   SYNTAX HIGHLIGHTING (Rouge-compatible)
   Warm Nostalgia Theme
   ============================================================================= */

/* --- Code Block Base --- */
pre, code {
  background: var(--background-alt);
  border: var(--border);
  font-family: 'Courier New', 'Monaco', 'Consolas', monospace;
  border-radius: 4px;
}

pre {
  padding: 1.5em;
  overflow-x: auto;
  margin: 2em 0;
  box-shadow: inset 0 0 30px rgba(0, 0, 0, 0.3);
  position: relative;
}

.highlight {
  background: var(--background-alt);
  border-radius: 4px;
  margin: 1.5em 0;
  
  pre {
    margin: 0;
    padding: 1.5em;
    background: transparent;
    border: none;
    box-shadow: none;
  }
  
  code {
    background: transparent;
    padding: 0;
    font-size: 0.9em;
    line-height: 1.6;
  }
}

/* Rouge token classes */
.highlight {
  .c   { color: var(--code-comment); font-style: italic; }
  .cm  { color: var(--code-comment); font-style: italic; }
  .cp  { color: var(--code-keyword); font-weight: bold; }
  .c1  { color: var(--code-comment); font-style: italic; }
  .cs  { color: var(--code-comment); font-style: italic; }
  
  .k   { color: var(--code-keyword); font-weight: bold; }
  .kc  { color: var(--code-keyword); font-weight: bold; }
  .kd  { color: var(--code-keyword); font-weight: bold; }
  .kn  { color: var(--code-keyword); font-weight: bold; }
  .kp  { color: var(--code-keyword); font-weight: bold; }
  .kr  { color: var(--code-keyword); font-weight: bold; }
  .kt  { color: var(--code-type); }
  
  .n   { color: var(--text-color); }
  .na  { color: var(--code-function); }
  .nb  { color: var(--code-function); }
  .bp  { color: var(--code-function); }
  .nc  { color: var(--code-type); font-weight: bold; }
  .no  { color: var(--accent-warm); }
  .nd  { color: var(--code-function); }
  .ni  { color: var(--text-color); }
  .ne  { color: var(--code-keyword); font-weight: bold; }
  .nf  { color: var(--code-function); font-weight: bold; }
  .nl  { color: var(--code-function); }
  .nn  { color: var(--code-type); font-weight: bold; }
  .nx  { color: var(--text-color); }
  .py  { color: var(--text-color); }
  .nt  { color: var(--code-keyword); font-weight: bold; }
  .nv  { color: var(--text-color); }
  
  .l   { color: var(--code-number); }
  .ld  { color: var(--code-string); }
  .s   { color: var(--code-string); }
  .sa  { color: var(--code-string); }
  .sb  { color: var(--code-string); }
  .sc  { color: var(--code-string); }
  .dl  { color: var(--code-string); }
  .sd  { color: var(--code-comment); font-style: italic; }
  .s2  { color: var(--code-string); }
  .se  { color: var(--accent-warm); font-weight: bold; }
  .sh  { color: var(--code-string); }
  .si  { color: var(--code-string); }
  .sx  { color: var(--code-string); }
  .sr  { color: var(--code-string); }
  .s1  { color: var(--code-string); }
  .ss  { color: var(--code-string); }
  
  .m   { color: var(--code-number); }
  .mb  { color: var(--code-number); }
  .mf  { color: var(--code-number); }
  .mh  { color: var(--code-number); }
  .mi  { color: var(--code-number); }
  .mo  { color: var(--code-number); }
  
  .o   { color: var(--code-keyword); font-weight: bold; }
  .ow  { color: var(--code-keyword); font-weight: bold; }
  
  .p   { color: var(--text-muted); }
  .pi  { color: var(--code-keyword); }
  
  .ge  { font-style: italic; }
  .gr  { color: var(--red); }
  .gh  { color: var(--base-color); font-weight: bold; }
  .gi  { color: var(--green); }
  .go  { color: var(--text-muted); }
  .gp  { color: var(--text-muted); }
  .gs  { font-weight: bold; }
  .gu  { color: var(--base-color); font-weight: bold; }
  .gt  { color: var(--red); }
  
  .w   { color: var(--text-muted); }
}

/* --- Inline Code --- */
:not(pre) > code {
  background: var(--background-alt);
  color: var(--code-string);
  padding: 0.2em 0.4em;
  border-radius: 3px;
  font-size: 0.9em;
}

/* --- Language Labels --- */
.highlight::before {
  content: attr(data-lang);
  position: absolute;
  top: 0.5em;
  right: 1em;
  font-size: 0.75em;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 1px;
  opacity: 0.7;
}

/* --- ASCII Art / Diagrams - No Highlighting --- */
pre.language-ascii,
pre.language-text,
pre.language-plaintext {
  .highlight {
    code {
      color: var(--base-color) !important;
      .c, .cm, .c1, .cs { color: var(--text-muted) !important; }
    }
  }
}

/* =============================================================================
   CRT TV EFFECT FOR CODE BLOCKS & ASCII ART
   Adapted from: https://codepen.io/Mobius1/pen/zZpoXj
   ============================================================================= */

/* --- CRT Container for code/ascii blocks --- */
.crt-block {
  position: relative;
  border-radius: 4px;
  overflow: hidden;
  background: var(--background-alt, #251e17);
  border: var(--border, solid 1px rgba(255, 176, 0, 0.3));
  margin: 2em 0;
}

/* --- CRT Canvas (Noise) --- */
.crt-canvas {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  opacity: var(--crt-noise-opacity);
  mix-blend-mode: overlay;
  z-index: 1;
}

/* --- Scanlines Overlay --- */
.crt-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 2;
  background: linear-gradient(
    transparent 50%,
    rgba(0, 0, 0, var(--crt-scanline-opacity)) 50%
  );
  background-size: 100% 3px;
  animation: scanline-scroll 8s linear infinite;
}

@keyframes scanline-scroll {
  0% { background-position: 0 0; }
  100% { background-position: 0 100%; }
}

/* --- RGB Shift / Chromatic Aberration --- */
.crt-rgb {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 3;
  background: linear-gradient(
    90deg,
    rgba(255, 0, 0, var(--crt-rgb-intensity)),
    rgba(0, 255, 0, calc(var(--crt-rgb-intensity) * 0.33)),
    rgba(0, 0, 255, var(--crt-rgb-intensity))
  );
  background-size: 4px 100%;
  animation: crt-shift 0.08s infinite steps(1);
  opacity: 0.7;
}

@keyframes crt-shift {
  0%, 100% { transform: translateX(0); }
  25% { transform: translateX(1px); }
  50% { transform: translateX(-1px); }
  75% { transform: translateX(0); }
}

/* --- Content Layer (above effects) --- */
.crt-block pre,
.crt-block code,
.crt-block .ascii-art {
  position: relative;
  z-index: 4;
  background: transparent !important;
  border: none !important;
  color: var(--text-color);
}

/* --- ASCII Art Specific Styling --- */
.ascii-art {
  font-family: 'Courier New', monospace;
  font-size: 14px;
  line-height: 1.4;
  white-space: pre;
  color: var(--base-color);
  text-shadow: 0 0 5px rgba(255, 176, 0, 0.3);
}

/* --- Optional: Glitch on Hover --- */
.crt-block:hover .crt-rgb {
  animation-duration: 0.04s;
  opacity: 1;
}

/* --- Power-On Animation --- */
.crt-power-on {
  animation: crt-power var(--crt-power-duration) ease-out forwards;
}

@keyframes crt-power {
  0% {
    opacity: 0;
    filter: brightness(0) contrast(0) saturate(0);
  }
  30% {
    opacity: 1;
    filter: brightness(3) contrast(2) saturate(1.5);
  }
  60% {
    filter: brightness(1.5) contrast(1.2) saturate(1.1);
  }
  100% {
    opacity: 1;
    filter: brightness(1.1) contrast(1) saturate(1);
  }
}

/* --- Disable on Mobile (performance) --- */
@media (max-width: 768px), (prefers-reduced-motion: reduce) {
  .crt-canvas,
  .crt-rgb {
    display: none;
  }
  .crt-overlay {
    opacity: 0.4;
    animation: none;
  }
}

/* --- Tables --- */
table {
  width: 100%;
  border-collapse: collapse;
  margin: 2em 0;
  border: var(--border);
  border-radius: 4px;
  overflow: hidden;
}

table th, table td {
  border: var(--border);
  padding: 1em;
  text-align: left;
}

table th {
  background: var(--background-alt);
  color: var(--base-color);
  letter-spacing: 1px;
}

table tr:hover {
  background: rgba(255, 176, 0, 0.05);
}

/* --- Blockquotes --- */
blockquote {
  border-left: 4px solid var(--base-color);
  margin: 2em 0;
  padding: 1.5em 2em;
  background: var(--background-alt);
  color: var(--text-muted);
  font-style: italic;
  border-radius: 0 4px 4px 0;
}

blockquote p {
  margin: 0;
}

/* --- Horizontal Rule --- */
hr {
  border: none;
  border-top: var(--border-dashed);
  margin: 3em 0;
  opacity: 0.5;
}

/* --- Site Footer --- */
.site-footer {
  border-top: var(--border);
  padding: 3em 0;
  margin-top: 4em;
  text-align: center;
  color: var(--text-muted);
  font-size: 0.9em;
  background: var(--background-alt);
}

.site-footer a {
  color: var(--base-color);
}

/* --- Hide Duplicate Footer Elements --- */
.site-footer .site-title,
.site-footer h2,
.site-footer .author {
  display: none;
}

/* --- Custom Classes --- */
.coffee-break {
  text-align: center;
  margin: 3em 0;
  padding: 2em;
  background: var(--background-alt);
  border: var(--border);
  border-radius: 8px;
}

.coffee-break::before {
  content: "☕ ";
  font-size: 2em;
  display: block;
  margin-bottom: 0.5em;
}

.nostalgia-note {
  background: rgba(255, 176, 0, 0.05);
  border: var(--border-dashed);
  padding: 1.5em;
  border-radius: 4px;
  margin: 2em 0;
  font-size: 0.95em;
}

.nostalgia-note::before {
  content: "📼  ";
}

.terminal-prompt::before {
  content: "$  ";
  color: var(--base-color);
  font-weight: bold;
}

.welcome-box {
  background: var(--background-alt);
  border: var(--border);
  padding: 2em;
  border-radius: 8px;
  margin: 2em 0;
  text-align: center;
}

.welcome-box h2 {
  border: none;
  padding: 0;
  margin-top: 0;
}

.theme-enter {
  display: inline-block;
  border: var(--border);
  padding: 0.5em 1em;
  margin: 0.5em 0;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 0.9em;
}

.theme-enter:hover {
  background: var(--base-color);
  color: var(--background-color);
  box-shadow: 0 0 15px rgba(255, 176, 0, 0.5);
}

/* --- Scrollbar --- */
::-webkit-scrollbar {
  width: 12px;
  height: 12px;
}

::-webkit-scrollbar-track {
  background: var(--background-color);
}

::-webkit-scrollbar-thumb {
  background: var(--base-color-dim);
  border: 2px solid var(--background-color);
  border-radius: 6px;
}

::-webkit-scrollbar-thumb:hover {
  background: var(--base-color);
}

/* --- Responsive --- */
@media (max-width: 600px) {
  html, body {
    font-size: 15px;
  }
  
  .page-content {
    padding: 1.5em 1em;
  }
  
  .site-header .site-nav .nav-link {
    display: block;
    margin: 0.5em 0;
  }
}

/* Terminal Animation Styles */
.terminal-container {
  background: var(--background-alt, #251e17);
  border: var(--border, solid 1px rgba(255, 176, 0, 0.3));
  border-radius: 4px;
  padding: 1.5em;
  font-family: 'Courier New', monospace;
  font-size: 0.95em;
  margin: 2em 0;
  min-height: 150px;
}

.terminal-line {
  display: block;
  margin: 0.5em 0;
  line-height: 1.5;
  color: var(--text-color, #ffcc80);
}

.terminal-prompt {
  color: var(--base-color, #ffb000);
  font-weight: bold;
}

.terminal-output {
  color: var(--text-color, #ffcc80);
}

.terminal-cursor {
  display: inline-block;
  width: 10px;
  height: 1.2em;
  background-color: var(--base-color, #ffb000);
  animation: blink 1s step-end infinite;
}

@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}
```
```

Export Summary
| Metric | Value |
|--------|-------|
| Total Files | 11 |
| Generated | 2026-02-21 04:38:54 |
| Format | Markdown (.md) |
| Scope | Config, CSS, Layouts, Scripts |
| Total Size | 23KB |

Auto-generated by generate_assets.py
