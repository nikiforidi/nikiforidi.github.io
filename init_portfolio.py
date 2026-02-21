#!/usr/bin/env python3
# ==============================================================================
# Script: init_portfolio.py
# Purpose: Parse portfolio_context.md and extract files to directory structure
# Version: 14.0.0 (Pure Context Extraction - No Jekyll)
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
# CONTEXT PARSER
# ==============================================================================
def parse_portfolio_context(context_path):
    files = {}
    
    if not os.path.exists(context_path):
        log("ERROR", f"portfolio_context.md not found at: {context_path}")
        return files
    
    log("INFO", f"Reading {context_path}...")
    
    with open(context_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Pattern to match file blocks
    pattern = r"File:\s*`([^`]+)`\s*\n(.*?)(?=File:\s*`|Export Summary|$)"
    #                                              ^^^^^^^^^^^^
    #                                              Без \n перед File:
    
    matches = re.findall(pattern, content, re.DOTALL)
    
    for file_path, file_content in matches:
        file_path = file_path.strip()
        # ❌ БЫЛО: file_content = file_content.strip()
        # ✅ СТАЛО: Только newlines, не пробелы
        file_content = file_content.strip('\n')
        
        # Skip if content is empty or just whitespace
        if not file_content or file_content.isspace():
            continue
        
        files[file_path] = file_content
        log("DEBUG", f"  Found: {file_path}")
    
    return files
# ==============================================================================
# MAIN
# ==============================================================================
def main():
    log_header("🚀 Starting Portfolio Generation v14.0.0")
    log("INFO", "Pure Context Extraction Mode")
    log("INFO", "✓ All content loaded from portfolio_context.md")
    log("INFO", "✓ No Jekyll configuration")
    log("INFO", "✓ No static files generated")
    log("INFO", "✓ ASCII art preserved without modification")
    
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
    
    # Parse portfolio_context.md
    log_header("Step 2: Parsing portfolio_context.md")
    context_path = os.path.join(original_dir, "portfolio_context.md")
    
    # Also check in current directory if not found in original
    if not os.path.exists(context_path):
        context_path = os.path.join(portfolio_dir, "portfolio_context.md")
    
    files = parse_portfolio_context(context_path)
    
    if not files:
        log("WARN", "No files extracted from portfolio_context.md")
        log("INFO", "Make sure portfolio_context.md is in the correct location")
        os.chdir(original_dir)
        sys.exit(1)
    
    log("INFO", f"Extracted {len(files)} files from context")
    
    # Write extracted files
    log_header("Step 3: Writing Markdown Files")
    files_created = 0
    dirs_created = set()
    
    for file_path, content in files.items():
        path = Path(file_path)
        
        # Track directories
        if path.parent != Path('.'):
            dirs_created.add(str(path.parent))
        
        # Create parent directories
        path.parent.mkdir(parents=True, exist_ok=True)
        
        # Write file
        with open(path, "w", encoding="utf-8", newline='\n') as f:
            f.write(content)
        
        log("INFO", f"✓ {file_path}")
        files_created += 1
    
    # Summary
    log_header("✨ Portfolio Generated")
    log("INFO", "📊 Summary Report:")
    log("INFO", f"   Directory: {portfolio_dir}")
    log("INFO", f"   Files Created: {files_created}")
    log("INFO", f"   Directories: {len(dirs_created)}")
    print("")
    log("INFO", "📝 Features:")
    log("INFO", "   ✓ All content from portfolio_context.md")
    log("INFO", "   ✓ No Jekyll configuration files")
    log("INFO", "   ✓ No static assets generated")
    log("INFO", "   ✓ ASCII art preserved without modification")
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