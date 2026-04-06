#!/bin/bash
set -e
REPO_DIR="/root/inspo-dashboard"
DASHBOARD_SOURCE="/root/.openclaw/workspace-inspo/dashboard/index.html"

if [ ! -f "$DASHBOARD_SOURCE" ]; then
  echo "No dashboard generated today. Skipping deploy."
  exit 0
fi

cp "$DASHBOARD_SOURCE" "$REPO_DIR/index.html"
cd "$REPO_DIR"

if git diff --quiet; then
  echo "No changes to deploy."
  exit 0
fi

git add index.html
git commit -m "Daily brief — $(date +%Y-%m-%d)"
git push origin main
echo "Dashboard deployed: $(date)"
