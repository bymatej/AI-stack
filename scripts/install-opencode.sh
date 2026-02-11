#!/usr/bin/env bash
set -euo pipefail

if command -v opencode >/dev/null 2>&1; then
  echo "OpenCode already installed: $(opencode --version || echo unknown version)"
  exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required but not installed." >&2
  exit 1
fi

echo "Installing OpenCode via official installer..."
curl -fsSL https://opencode.ai/install | bash

echo "Installation complete. Verify with: opencode --version"
