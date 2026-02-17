#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

required=(
  ".gitignore"
  "opencode.json"
  ".env.example"
  "AGENTS.md"
  "mcp/README.md"
  "mcp/.env.example"
  "scripts/install-opencode.sh"
  "scripts/setup-local.sh"
  "scripts/setup-vps.sh"
  "docs/SETUP.md"
  "docs/MODELS.md"
  "docs/MCP.md"
  "docs/WORKFLOWS.md"
)

for file in "${required[@]}"; do
  [[ -f "$file" ]] || { echo "Missing required file: $file" >&2; exit 1; }
done

if command -v jq >/dev/null 2>&1; then
  jq -e . opencode.json >/dev/null
else
  python3 - <<'PY'
import json
from pathlib import Path
json.loads(Path('opencode.json').read_text())
print('opencode.json is valid JSON')
PY
fi

if rg -n --hidden --glob '!.git' '(AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{36}|glpat-[A-Za-z0-9_-]{20,}|-----BEGIN (RSA|EC|OPENSSH) PRIVATE KEY-----)' .; then
  echo "Potential secret pattern detected." >&2
  exit 1
fi

echo "All checks passed."
