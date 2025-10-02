#!/usr/bin/env bash
set -euo pipefail
# Minimal build: copies src/pages and public into ./dist
rm -rf dist
mkdir -p dist
cp -r src/pages/* dist/ 2>/dev/null || true
mkdir -p dist/styles dist/scripts dist/assets
cp -r src/styles/* dist/styles/ 2>/dev/null || true
cp -r src/scripts/* dist/scripts/ 2>/dev/null || true
cp -r public/* dist/ 2>/dev/null || true
echo "Built to ./dist"
