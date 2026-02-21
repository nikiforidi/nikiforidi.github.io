#!/usr/bin/env python3
# ==============================================================================
# Script: init_assets.py
# Purpose: Parse portfolio_assets.md and extract config, CSS, layouts, scripts
# Version: 1.2.0 (Fixed code fence stripping)
# Author: Anatoly Nikiforov
# ==============================================================================
import os
import sys
import re
from datetime import datetime
from pathlib import Path

# --- Colors ---
class Colors:
    GREEN = '\033[0;32m'
    BLUE = '\033[0;34m'
    YELLOW = '\033[1;33m'
    RED = '\033[0;31m'
    CYAN = '\033[0;36m'
    MAGENTA = '\033[0;35m'
    WHITE = '\033[1;37m'
    NC = '\033[0m'

# --- Logging ---
def log(level, message):
    timestamp = datetime.now().strftime("%H:%M:%S")
    color = {
        "INFO": Colors.GREEN,
        "WARN": Colors.YELLOW,
        "ERROR": Colors.RED,
        "DEBUG": Colors.WHITE
    }.get(level, Colors.NC)
    print(f"{color}[{timestamp}] [{level}]  {message}{Colors.NC}")

def log_header(message):
    print("")
    log("INFO", "==============================================")
    log("INFO", message)
    log("INFO", "==============================================")
    print("")

# ==============================================================================
# ASSETS PARSER
# ==============================================================================
def parse_portfolio_assets(assets_path):
    """
    Parse portfolio_assets.md and extract individual file contents.
    
    Format in assets file:
    File: `_layouts/default.html`
    ```html
    ...content...
    ```
    """
    files = {}
    
    if not os.path.exists(assets_path):
        log("ERROR", f"portfolio_assets.md not found at: {assets_path}")
        return files
    
    log("INFO", f"Reading {assets_path}...")
    
    with open(assets_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # ✅ FIXED: Pattern that properly excludes code fence markers
    # Captures: File path + content (without ```lang or closing ```)
    pattern = r"File:\s*`([^`]+)`\s*\n```[\w.+-]*\s*\n(.*?)\n```(?=\s*(?:\nFile:\s*`|\nExport Summary|$))"
    
    matches = re.findall(pattern, content, re.DOTALL)
    
    for file_path, file_content in matches:
        file_path = file_path.strip()
        
        # ✅ CRITICAL: Strip any remaining fence markers and outer newlines
        file_content = file_content.strip()
        
        # Remove any leading ``` lines that might have been captured
        lines = file_content.split('\n')
        if lines and lines[0].strip().startswith('```'):
            lines = lines[1:]
        if lines and lines[-1].strip().startswith('```'):
            lines = lines[:-1]
        
        file_content = '\n'.join(lines)
        
        # Skip if content is empty
        if not file_content or file_content.isspace():
            continue
        
        files[file_path] = file_content
        log("DEBUG", f"  Found: {file_path}")
    
    return files

# ==============================================================================
# MAIN
# ==============================================================================
def main():
    log_header("🚀 Starting Assets Restoration v1.2.0")
    log("INFO", "Pure Assets Extraction Mode")
    log("INFO", "✓ All assets loaded from portfolio_assets.md")
    log("INFO", "✓ Code fences properly stripped")
    log("INFO", "✓ LF line endings")
    
    # Directory selection
    print("")
    print(f"{Colors.YELLOW}Step 1: Choose Portfolio Directory{Colors.NC}")
    print("")
    print(f"  {Colors.GREEN}✓{Colors.NC} Press {Colors.YELLOW}Enter{Colors.NC} to use current directory: {Colors.GREEN}{os.getcwd()}{Colors.NC}")
    print(f"  {Colors.GREEN}✓{Colors.NC} Or type a directory name (e.g., {Colors.YELLOW}portfolio{Colors.NC})")
    print("")
    portfolio_dir = input("  > Directory name: ").strip()
    
    if not portfolio_dir:
        portfolio_dir = "."
        log("INFO", "→ Using current directory")
    else:
        if not os.path.isabs(portfolio_dir):
            portfolio_dir = os.path.join(os.getcwd(), portfolio_dir)
        log("INFO", f"→ Target: {portfolio_dir}")
    
    # Create directory
    if not os.path.exists(portfolio_dir):
        log("INFO", "Creating directory...")
        os.makedirs(portfolio_dir)
    
    original_dir = os.getcwd()
    os.chdir(portfolio_dir)
    
    # Parse portfolio_assets.md
    log_header("Step 2: Parsing portfolio_assets.md")
    assets_path = os.path.join(original_dir, "portfolio_assets.md")
    
    # Also check in current directory if not found in original
    if not os.path.exists(assets_path):
        assets_path = os.path.join(portfolio_dir, "portfolio_assets.md")
    
    files = parse_portfolio_assets(assets_path)
    
    if not files:
        log("WARN", "No files extracted from portfolio_assets.md")
        log("INFO", "Make sure portfolio_assets.md is in the correct location")
        os.chdir(original_dir)
        sys.exit(1)
    
    log("INFO", f"Extracted {len(files)} asset files from context")
    
    # Write extracted files
    log_header("Step 3: Writing Asset Files")
    files_created = 0
    dirs_created = set()
    
    for file_path, content in files.items():
        path = Path(file_path)
        
        # Track directories
        if path.parent != Path('.'):
            dirs_created.add(str(path.parent))
        
        # Create parent directories
        path.parent.mkdir(parents=True, exist_ok=True)
        
        # Write file with LF line endings
        with open(path, "w", encoding="utf-8", newline='\n') as f:
            f.write(content)
        
        log("INFO", f"✓ {file_path}")
        files_created += 1
    
    # Make shell scripts executable
    for file_path in files.keys():
        if file_path.endswith('.sh'):
            script_path = Path(file_path)
            if script_path.exists():
                os.chmod(script_path, 0o755)
                log("INFO", f"✓ {file_path} made executable")
    
    # Summary
    log_header("✨ Assets Restored")
    log("INFO", "📊 Summary Report:")
    log("INFO", f"   Directory: {portfolio_dir}")
    log("INFO", f"   Files Created: {files_created}")
    log("INFO", f"   Directories: {len(dirs_created)}")
    print("")
    log("INFO", "📝 Features:")
    log("INFO", "   ✓ All assets from portfolio_assets.md")
    log("INFO", "   ✓ Code fence markers stripped (```html, etc.)")
    log("INFO", "   ✓ CSS/SCSS theme files")
    log("INFO", "   ✓ Layout HTML files (_layouts/)")
    log("INFO", "   ✓ UTF-8 encoding with LF line endings")
    print("")
    print(f"{Colors.GREEN}=============================================={Colors.NC}")
    print(f"{Colors.GREEN}✨ Done! {files_created} files created.{Colors.NC}")
    print(f"{Colors.GREEN}=============================================={Colors.NC}")
    print("")
    print(f"{Colors.CYAN}📋 Directory Structure:{Colors.NC}")
    for dir_name in sorted(dirs_created):
        print(f"   📁 {dir_name}/")
    print("")
    
    # Return to original directory
    os.chdir(original_dir)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n⚠️  Interrupted by user.")
        sys.exit(1)
    except Exception as e:
        log("ERROR", f"Fatal error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)