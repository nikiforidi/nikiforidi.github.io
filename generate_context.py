#!/usr/bin/env python3
# ==============================================================================
# Script: generate_context.py
# Purpose: Dumps all .md files into a single parseable .md file
# Output: portfolio_context.md
# Version: 3.0.0 (Fixed File Discovery)
# ==============================================================================

import os
import sys
from datetime import datetime
from pathlib import Path

# --- Configuration ---
OUTPUT_FILE = "portfolio_context.md"
EXCLUDE_DIRS = {".git", "vendor", "node_modules", "_site", "__pycache__", ".venv"}
EXCLUDE_FILES = {"generate_context.py", "generate_context.zsh", "portfolio_context.md", "portfolio_context.txt"}
PRIORITY_FILES = {"index.md", "specs/validation-stack.md", "specs/jemp.md", "specs/mha.md", "specs/ssa.md"}

# --- Colors ---
class Colors:
    GREEN = '\033[0;32m'
    YELLOW = '\033[1;33m'
    CYAN = '\033[0;36m'
    MAGENTA = '\033[0;35m'
    RED = '\033[0;31m'
    NC = '\033[0m'

# --- Logging ---
def log(level, message):
    timestamp = datetime.now().strftime("%H:%M:%S")
    color = {
        "INFO": Colors.GREEN,
        "WARN": Colors.YELLOW,
        "ERROR": Colors.RED
    }.get(level, Colors.NC)
    print(f"{color}[{timestamp}] [{level}]  {message}{Colors.NC}")

def log_header(message):
    print("")
    log("INFO", "==============================================")
    log("INFO", message)
    log("INFO", "==============================================")
    print("")

# --- File Size ---
def format_size(bytes_size):
    if bytes_size < 1024:
        return f"{bytes_size}B"
    elif bytes_size < 1048576:
        return f"{bytes_size // 1024}KB"
    else:
        return f"{bytes_size // 1048576}MB"

# --- Main ---
def main():
    log_header("🚀 Starting Context Generation (Markdown Only)")
    
    log("INFO", f"Output file: {OUTPUT_FILE}")
    log("INFO", f"Working directory: {os.getcwd()}")
    log("INFO", "Scope: .md files only")
    
    # Check project root
    if not os.path.isfile("_config.yml"):
        log("WARN", "_config.yml not found. Are you in the project root?")
    else:
        log("INFO", "✓ _config.yml found (confirmed project root)")
    
    # Collect .md files using pathlib (more reliable than os.walk)
    log("INFO", "Scanning for .md files...")
    files_to_process = []
    
    # Use pathlib for reliable file discovery
    current_path = Path(".")
    
    for md_file in current_path.rglob("*.md"):
        # Skip excluded directories
        if any(excl in md_file.parts for excl in EXCLUDE_DIRS):
            continue
        
        # Skip excluded files
        if md_file.name in EXCLUDE_FILES:
            continue
        
        # Get clean path (remove leading ./)
        clean_path = str(md_file)
        if clean_path.startswith("./"):
            clean_path = clean_path[2:]
        
        files_to_process.append(clean_path)
        log("DEBUG", f"  Found: {clean_path}")
    
    # Sort files for consistent output
    files_to_process.sort()
    
    log("INFO", f"Found {len(files_to_process)} markdown files to process")
    
    if len(files_to_process) == 0:
        log("ERROR", "No .md files found! Check your directory structure.")
        log("INFO", "Expected files:")
        log("INFO", "  - index.md")
        log("INFO", "  - about/*.md (5 files)")
        log("INFO", "  - specs/*.md (6 files)")
        log("INFO", "  - deep-dives/*.md (6 files)")
        sys.exit(1)
    
    print("")
    
    # Write output
    files_processed = 0
    total_size = 0
    
    with open(OUTPUT_FILE, "w", encoding="utf-8") as outfile:
        # Markdown Header
        outfile.write("---\n")
        outfile.write("title: Portfolio Context Export\n")
        outfile.write(f"generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        outfile.write("format: Markdown\n")
        outfile.write("scope: .md files only\n")
        outfile.write("---\n\n")
        outfile.write("# Portfolio Context Export\n\n")
        outfile.write("Complete markdown export for audit and review.\n\n")
        outfile.write("---\n")
        
        # Process each file
        for clean_path in files_to_process:
            file_path = Path(clean_path)
            
            if not file_path.is_file():
                log("WARN", f"Skipped (not a file): {clean_path}")
                continue
            
            try:
                file_size = file_path.stat().st_size
                total_size += file_size
                
                # Priority highlighting
                if clean_path in PRIORITY_FILES:
                    log("INFO", f"📄 {clean_path} ({format_size(file_size)}) {Colors.MAGENTA}[PRIORITY]{Colors.NC}")
                    print(f"   {Colors.MAGENTA}🔹{Colors.NC} {clean_path}")
                else:
                    log("INFO", f"📄 {clean_path} ({format_size(file_size)})")
                    print(f"   {Colors.CYAN}✅{Colors.NC} {clean_path}")
                
                # Write file section
                outfile.write(f"\n## File: `{clean_path}`\n\n")
                outfile.write("```markdown\n")
                
                # Write content
                with open(file_path, "r", encoding="utf-8", errors="ignore") as infile:
                    outfile.write(infile.read())
                
                outfile.write("\n```\n")
                
                files_processed += 1
                
            except Exception as e:
                log("WARN", f"Failed to process {clean_path}: {e}")
    
    # Write Footer
    with open(OUTPUT_FILE, "a", encoding="utf-8") as outfile:
        outfile.write("\n---\n\n")
        outfile.write("## Export Summary\n\n")
        outfile.write("| Metric | Value |\n")
        outfile.write("|--------|-------|\n")
        outfile.write(f"| **Total Files** | {files_processed} |\n")
        outfile.write(f"| **Generated** | {datetime.now().strftime('%Y-%m-%d %H:%M:%S')} |\n")
        outfile.write(f"| **Format** | Markdown (.md) |\n")
        outfile.write(f"| **Scope** | .md files only |\n")
        outfile.write(f"| **Total Size** | {format_size(total_size)} |\n")
        outfile.write("\n---\n\n")
        outfile.write("*Auto-generated by generate_context.py*\n")
    
    # Summary
    output_size = Path(OUTPUT_FILE).stat().st_size
    
    print("")
    log_header("✨ Generation Complete")
    
    log("INFO", "📊 Summary Report:")
    log("INFO", f"   Files Processed: {files_processed}")
    log("INFO", f"   Output Size:     {format_size(output_size)}")
    log("INFO", f"   Total Content:   {format_size(total_size)}")
    log("INFO", f"   Output File:     {OUTPUT_FILE}")
    print("")
    
    print(f"{Colors.GREEN}=============================================={Colors.NC}")
    print(f"{Colors.GREEN}✨ Done! {files_processed} files processed.{Colors.NC}")
    print(f"{Colors.GREEN}=============================================={Colors.NC}")
    print("")
    print(f"{Colors.CYAN}📋 Next Step:{Colors.NC}")
    print(f"   Copy the content of '{OUTPUT_FILE}' and paste it into the chat.")
    print("")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nInterrupted by user.")
        sys.exit(1)
    except Exception as e:
        log("ERROR", f"Fatal error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)