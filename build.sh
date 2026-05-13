#!/bin/sh
# build.sh — Generate static HTML from Org files
# Usage: ./build.sh

set -e

echo "Building Pawan Jangra's org-mode site..."
emacs -Q --script build-site.el
echo "Done! Open public/index.html to preview."
