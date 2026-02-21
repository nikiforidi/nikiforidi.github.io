#!/usr/bin/env python3
# ==============================================================================
# Script: generate_context.py
# Purpose: Dumps all .md files into a single parseable .md file
# Output: portfolio_context.md
# Version: 4.0.0 (No --- Delimiters)
# ==============================================================================
import os
import sys
from datetime import datetime
from pathlib import Path

# --- Configuration ---
OUTPUT_FILE = "portfolio_context.md"
EXCLUDE_DIRS = {".git", "vendor", "node_modules", "_site", "__pycache__", ".venv", "assets"}
EXCLUDE_FILES = {"generate_context.py", "init_portfolio.py", "portfolio_context.md", "README.md"}

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

# ==============================================================================
# MAIN
# ==============================================================================
def main():
    log_header("🚀 Starting Context Generation v4.0.0")
    log("INFO", "No Delimiters Mode")
    log("INFO", "✓ No --- separators")
    log("INFO", "✓ Clean metadata header")
    log("INFO", "✓ Only .md files")
    
    # Directory selection
    print("")
    print(f"{Colors.YELLOW}Step 1: Choose Source Directory{Colors.NC}")
    print("")
    print(f"  {Colors.GREEN}✓{Colors.NC} Press {Colors.YELLOW}Enter{Colors.NC} to use current directory: {Colors.GREEN}{os.getcwd()}{Colors.NC}")
    print(f"  {Colors.GREEN}✓{Colors.NC} Or type a directory name")
    print("")
    source_dir = input("  > Directory: ").strip()
    
    if not source_dir:
        source_dir = "."
        log("INFO", "→ Using current directory")
    else:
        if not os.path.isabs(source_dir):
            source_dir = os.path.join(os.getcwd(), source_dir)
        log("INFO", f"→ Target: {source_dir}")
    
    # Validate directory
    if not os.path.exists(source_dir):
        log("ERROR", f"Directory not found: {source_dir}")
        sys.exit(1)
    
    # Get output path
    print("")
    print(f"{Colors.YELLOW}Step 2: Choose Output Location{Colors.NC}")
    print("")
    print(f"  {Colors.GREEN}✓{Colors.NC} Press {Colors.YELLOW}Enter{Colors.NC} to save as portfolio_context.md")
    print(f"  {Colors.GREEN}✓{Colors.NC} Or type a custom path")
    print("")
    output_path = input("  > Output path: ").strip()
    
    if not output_path:
        output_path = OUTPUT_FILE
    
    if not os.path.isabs(output_path):
        output_path = os.path.join(os.getcwd(), output_path)
    
    log("INFO", f"→ Output: {output_path}")
    
    # Collect .md files
    log_header("Step 3: Scanning for Markdown Files")
    files_to_process = []
    source_path = Path(source_dir)
    
    for md_file in source_path.rglob("*.md"):
        # Skip excluded directories
        if any(excl in md_file.parts for excl in EXCLUDE_DIRS):
            continue
        
        # Skip excluded files
        if md_file.name in EXCLUDE_FILES:
            continue
        
        # Get relative path from source directory
        try:
            clean_path = str(md_file.relative_to(source_path))
        except ValueError:
            clean_path = str(md_file)
        
        if clean_path.startswith("./"):
            clean_path = clean_path[2:]
        
        files_to_process.append(clean_path)
        log("DEBUG", f"  Found: {clean_path}")
    
    # Sort files for consistent output
    files_to_process.sort()
    
    if len(files_to_process) == 0:
        log("ERROR", "No .md files found!")
        log("INFO", "Expected structure:")
        log("INFO", "  - index.md")
        log("INFO", "  - about/*.md")
        log("INFO", "  - specs/*.md")
        log("INFO", "  - deep-dives/*.md")
        sys.exit(1)
    
    log("INFO", f"Found {len(files_to_process)} markdown files")
    
    # Write output
    log_header("Step 4: Writing portfolio_context.md")
    files_processed = 0
    total_size = 0
    
    # CRITICAL: Use newline='\n' to force LF line endings (preserves ASCII art)
    with open(output_path, "w", encoding="utf-8", newline='\n') as outfile:
        # Header (NO --- delimiters)
        outfile.write("title: Portfolio Context Export\n")
        outfile.write(f"generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        outfile.write("format: Markdown\n")
        outfile.write("scope: .md files only\n")
        outfile.write("Portfolio Context Export\n")
        outfile.write("Complete markdown export for audit and review.\n")
        outfile.write("\n")
        
        # Process each file
        for clean_path in files_to_process:
            file_path = Path(source_dir) / clean_path
            
            if not file_path.is_file():
                log("WARN", f"Skipped (not a file): {clean_path}")
                continue
            
            try:
                file_size = file_path.stat().st_size
                total_size += file_size
                
                log("INFO", f"📄 {clean_path} ({format_size(file_size)})")
                
                # Write file marker (matches init_portfolio.py regex pattern)
                outfile.write(f"File: `{clean_path}`\n")
                
                # Write content PRESERVING ALL WHITESPACE (including ASCII art)
                # NO ```markdown wrapper, NO --- delimiters
                with open(file_path, "r", encoding="utf-8", newline='') as infile:
                    content = infile.read()
                    outfile.write(content)
                
                # Add separator newline
                outfile.write("\n")
                files_processed += 1
                
            except Exception as e:
                log("WARN", f"Failed to process {clean_path}: {e}")
        
        # Footer (NO --- delimiters)
        outfile.write("Export Summary\n")
        outfile.write("| Metric | Value |\n")
        outfile.write("|--------|-------|\n")
        outfile.write(f"| Total Files | {files_processed} |\n")
        outfile.write(f"| Generated | {datetime.now().strftime('%Y-%m-%d %H:%M:%S')} |\n")
        outfile.write("| Format | Markdown (.md) |\n")
        outfile.write("| Scope | .md files only |\n")
        outfile.write(f"| Total Size | {format_size(total_size)} |\n")
        outfile.write("\n")
        outfile.write("Auto-generated by generate_context.py\n")
    
    # Summary
    output_size = Path(output_path).stat().st_size
    
    log_header("✨ Generation Complete")
    log("INFO", "📊 Summary Report:")
    log("INFO", f"   Files Processed: {files_processed}")
    log("INFO", f"   Output Size:     {format_size(output_size)}")
    log("INFO", f"   Total Content:   {format_size(total_size)}")
    log("INFO", f"   Output File:     {output_path}")
    print("")
    log("INFO", "📝 Features:")
    log("INFO", "   ✓ No Jekyll dependencies")
    log("INFO", "   ✓ Only .md files exported")
    log("INFO", "   ✓ ASCII art preserved without modification")
    log("INFO", "   ✓ No --- delimiters (clean format)")
    log("INFO", "   ✓ UTF-8 encoding with LF line endings")
    log("INFO", "   ✓ Compatible with init_portfolio.py v12.0.0+")
    print("")
    print(f"{Colors.GREEN}=============================================={Colors.NC}")
    print(f"{Colors.GREEN}✨ Done! {files_processed} files processed.{Colors.NC}")
    print(f"{Colors.GREEN}=============================================={Colors.NC}")
    print("")
    print(f"{Colors.CYAN}📋 Next Steps:{Colors.NC}")
    print("   1. Review portfolio_context.md")
    print("   2. git add portfolio_context.md")
    print("   3. python3 init_portfolio.py (to regenerate structure)")
    print("")

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