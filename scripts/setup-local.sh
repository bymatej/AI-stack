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
echo "OPENCODE_CONFIG set to: $OPENCODE_CONFIG"

echo
cat <<MSG
Next steps (local machine):
1. Edit .env with your API keys and tokens.
2. Source environment variables: set -a; source .env; set +a
3. Run OpenCode OAuth from your desktop session when needed:
   - OpenAI ChatGPT OAuth: opencode auth login openai
   - OpenAI Codex OAuth: opencode auth login codex
4. Start optional MCP stack: docker compose -f mcp/docker-compose.mcp.yml up -d
MSG
