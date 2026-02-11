#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="$REPO_ROOT/.env"
EXAMPLE_FILE="$REPO_ROOT/.env.example"

if [[ ! -f "$ENV_FILE" ]]; then
  cp "$EXAMPLE_FILE" "$ENV_FILE"
  echo "Created $ENV_FILE from .env.example"
else
  echo "$ENV_FILE already exists; leaving unchanged"
fi

export OPENCODE_CONFIG="$REPO_ROOT/opencode.json"

echo "Configured OPENCODE_CONFIG=$OPENCODE_CONFIG"

echo
cat <<MSG
Headless VPS next steps (Ubuntu 24.04):
1. Edit .env and provide non-secret placeholders first, then keys/tokens via secure channel.
2. Source env vars: set -a; source .env; set +a
3. Run device-code OAuth flow from this shell if supported by CLI:
   - opencode auth login openai --device
   - opencode auth login codex --device
4. Keep auth file local only (~/.local/share/opencode/auth.json) and never commit it.
5. Start optional MCP services with Docker when needed.
MSG
