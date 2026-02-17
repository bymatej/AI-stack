# Setup Guide

## Quickstart (Local)
1. Install prerequisites: `bash`, `curl`, `git`, `docker` (optional).
2. Install OpenCode:
   ```bash
   ./scripts/install-opencode.sh
   ```
3. Initialize project environment:
   ```bash
   ./scripts/setup-local.sh
   ```
4. Edit `.env` and provide credentials/tokens.
5. Load environment variables:
   ```bash
   set -a; source .env; set +a
   ```
6. Start optional local MCP stack:
   ```bash
   docker compose -f mcp/docker-compose.mcp.yml up -d
   ```
7. Run checks:
   ```bash
   ./scripts/check.sh
   ```

## Quickstart (Headless VPS, Ubuntu 24.04)
1. SSH into VPS and clone repository.
2. Run:
   ```bash
   ./scripts/install-opencode.sh
   ./scripts/setup-vps.sh
   ```
3. Populate `.env` with secure values.
4. Load environment variables:
   ```bash
   set -a; source .env; set +a
   ```
5. Perform device-code OAuth when available:
   ```bash
   opencode auth login openai --device
   opencode auth login codex --device
   ```
6. Optional MCP services:
   ```bash
   docker compose -f mcp/docker-compose.mcp.yml up -d
   ```

## Configuration in Git, Secrets out of Git
- Commit non-secret defaults (`opencode.json`, scripts, docs, `.env.example`).
- Keep secrets in `.env` (ignored by `.gitignore`).
- Never commit keys, tokens, private keys, or auth output files.

## OpenCode Auth Storage
OpenCode local auth is typically stored in:
- `~/.local/share/opencode/auth.json`

This file contains credentials and must never be committed.
