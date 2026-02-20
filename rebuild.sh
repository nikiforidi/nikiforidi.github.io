# Stop any running server
Ctrl+C

# Clean previous build
bundle exec jekyll clean

# Install dependencies (if needed)
bundle install

# Rebuild with verbose output
bundle exec jekyll build --verbose

# Or serve locally
bundle exec jekyll serve