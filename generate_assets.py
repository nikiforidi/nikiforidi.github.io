#!/usr/bin/env python3
# ==============================================================================
# Script: generate_assets.py
# Purpose: Export Jekyll config, CSS, and layout files to portfolio_assets.md
# Output: portfolio_assets.md
# Version: 1.0.0 (Companion to generate_context.py)
# Author: Anatoly Nikiforov
# ==============================================================================
import os
import sys
from datetime import datetime
from pathlib import Path

# --- Configuration ---
OUTPUT_FILE = "portfolio_assets.md"
EXCLUDE_DIRS = {".git", "vendor", "node_modules", "_site", "__pycache__", ".venv", "assets/images", "assets/js"}
EXCLUDE_FILES = {"generate_context.py", "generate_assets.py", "init_portfolio.py", "portfolio_context.md", "portfolio_assets.md"}

# Files to export (prioritized)
PRIORITY_FILES = {
    "_config.yml",
    "assets/css/style.scss",
    "assets/css/style.css",
    "_layouts/default.html",
    "_layouts/home.html",
    "_layouts/page.html",
    "Gemfile",
    "Gemfile.lock",
    ".gitignore",
    "rebuild.sh",
}

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

# --- Get Language for Syntax Highlighting ---
def get_language(file_path):
    """Get syntax highlighting language from file extension or name."""
    path = Path(file_path)
    ext = path.suffix.lower()
    name = path.name.lower()
    
    language_map = {
        ".yml": "yaml",
        ".yaml": "yaml",
        ".scss": "scss",
        ".css": "css",
        ".html": "html",
        ".sh": "bash",
        ".bash": "bash",
        ".lock": "text",
        ".gitignore": "gitignore",
        "gemfile": "ruby",
        "gemfile.lock": "text",
        "rebuild.sh": "bash",
    }
    
    # Check special filenames first
    if name in language_map:
        return language_map[name]
    
    # Check extension
    return language_map.get(ext, "text")

# ==============================================================================
# MAIN
# ==============================================================================
def main():
    log_header("🚀 Starting Assets Generation v1.0.0")
    log("INFO", "Config, CSS, and Layout Export Mode")
    log("INFO", "✓ Companion to generate_context.py")
    log("INFO", "✓ Preserves all whitespace and formatting")
    log("INFO", "✓ LF line endings")
    
    # Check project root
    if not os.path.isfile("_config.yml"):
        log("WARN", "_config.yml not found. Are you in the project root?")
    else:
        log("INFO", "✓ _config.yml found (confirmed project root)")
    
    # Collect files to export
    log_header("Step 1: Scanning for Asset Files")
    files_to_process = []
    current_path = Path(".")
    
    # First, add priority files if they exist
    for priority_file in sorted(PRIORITY_FILES):
        if Path(priority_file).exists():
            files_to_process.append(priority_file)
            log("DEBUG", f"  Priority: {priority_file}")
    
    # Then scan for additional CSS/SCSS, layouts, and config files
    for file_path in current_path.rglob("*"):
        # Skip directories
        if file_path.is_dir():
            continue
        
        # Skip excluded directories
        if any(excl in file_path.parts for excl in EXCLUDE_DIRS):
            continue
        
        # Skip excluded files
        if file_path.name in EXCLUDE_FILES:
            continue
        
        # Get clean path
        clean_path = str(file_path)
        if clean_path.startswith("./"):
            clean_path = clean_path[2:]
        
        # Only include specific file types
        if not any(clean_path.endswith(ext) for ext in [".yml", ".yaml", ".scss", ".css", ".html", ".sh", ".lock", ".gitignore"]):
            continue
        
        # Skip if already in priority list
        if clean_path in files_to_process:
            continue
        
        files_to_process.append(clean_path)
        log("DEBUG", f"  Found: {clean_path}")
    
    # Sort files for consistent output
    files_to_process.sort()
    
    if len(files_to_process) == 0:
        log("ERROR", "No asset files found!")
        log("INFO", "Expected files:")
        log("INFO", "  - _config.yml")
        log("INFO", "  - assets/css/style.scss")
        log("INFO", "  - _layouts/*.html")
        log("INFO", "  - Gemfile, Gemfile.lock")
        sys.exit(1)
    
    log("INFO", f"Found {len(files_to_process)} asset files to process")
    
    # Write output
    log_header("Step 2: Writing portfolio_assets.md")
    files_processed = 0
    total_size = 0
    
    with open(OUTPUT_FILE, "w", encoding="utf-8", newline='\n') as outfile:
        # Header
        outfile.write("title: Portfolio Assets Export\n")
        outfile.write(f"generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        outfile.write("format: Markdown\n")
        outfile.write("scope: Config, CSS, Layouts, Scripts\n")
        outfile.write("Portfolio Assets Export\n")
        outfile.write("Complete export of Jekyll configuration and theme assets.\n")
        outfile.write("\n")
        
        # Process each file
        for clean_path in files_to_process:
            file_path = Path(clean_path)
            
            if not file_path.is_file():
                log("WARN", f"Skipped (not a file): {clean_path}")
                continue
            
            try:
                file_size = file_path.stat().st_size
                total_size += file_size
                
                # Get language for syntax highlighting
                language = get_language(clean_path)
                
                # Priority highlighting
                if clean_path in PRIORITY_FILES:
                    log("INFO", f"📄 {clean_path} ({format_size(file_size)}) [{language}] {Colors.MAGENTA}[PRIORITY]{Colors.NC}")
                else:
                    log("INFO", f"📄 {clean_path} ({format_size(file_size)}) [{language}]")
                
                # Write file marker
                outfile.write(f"File: `{clean_path}`\n")
                
                # Write content with language-specific code block
                # CRITICAL: Preserve all whitespace (especially for CSS/SCSS)
                with open(file_path, "r", encoding="utf-8", newline='') as infile:
                    content = infile.read()
                    outfile.write(f"```{language}\n")
                    outfile.write(content)
                    outfile.write("\n```\n")
                
                outfile.write("\n")
                files_processed += 1
                
            except Exception as e:
                log("WARN", f"Failed to process {clean_path}: {e}")
        
        # Footer
        outfile.write("Export Summary\n")
        outfile.write("| Metric | Value |\n")
        outfile.write("|--------|-------|\n")
        outfile.write(f"| Total Files | {files_processed} |\n")
        outfile.write(f"| Generated | {datetime.now().strftime('%Y-%m-%d %H:%M:%S')} |\n")
        outfile.write("| Format | Markdown (.md) |\n")
        outfile.write("| Scope | Config, CSS, Layouts, Scripts |\n")
        outfile.write(f"| Total Size | {format_size(total_size)} |\n")
        outfile.write("\n")
        outfile.write("Auto-generated by generate_assets.py\n")
    
    # Summary
    output_size = Path(OUTPUT_FILE).stat().st_size
    
    log_header("✨ Generation Complete")
    log("INFO", "📊 Summary Report:")
    log("INFO", f"   Files Processed: {files_processed}")
    log("INFO", f"   Output Size:     {format_size(output_size)}")
    log("INFO", f"   Total Content:   {format_size(total_size)}")
    log("INFO", f"   Output File:     {OUTPUT_FILE}")
    print("")
    log("INFO", "📝 Features:")
    log("INFO", "   ✓ Config files (_config.yml, Gemfile)")
    log("INFO", "   ✓ CSS/SCSS theme files")
    log("INFO", "   ✓ Layout HTML files (_layouts/)")
    log("INFO", "   ✓ Shell scripts (rebuild.sh)")
    log("INFO", "   ✓ Syntax highlighting by file type")
    log("INFO", "   ✓ UTF-8 encoding with LF line endings")
    log("INFO", "   ✓ Compatible with generate_context.py format")
    print("")
    print(f"{Colors.GREEN}=============================================={Colors.NC}")
    print(f"{Colors.GREEN}✨ Done! {files_processed} files processed.{Colors.NC}")
    print(f"{Colors.GREEN}=============================================={Colors.NC}")
    print("")
    print(f"{Colors.CYAN}📋 Next Steps:{Colors.NC}")
    print("   1. Review portfolio_assets.md")
    print("   2. git add portfolio_assets.md")
    print("   3. Use with init_assets.py to restore assets")
    print("   4. Or manually extract files as needed")
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