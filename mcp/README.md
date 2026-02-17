# MCP Integrations Blueprint

This directory defines the Model Context Protocol (MCP) servers targeted for Phase 1 scaffolding.

## Target MCP Servers
- **Atlassian Jira + Confluence**: Prefer `mcp-atlassian` community server. Alternative: Atlassian Rovo remote MCP.
- **Atlassian Trello**: Use a dedicated Trello MCP server package with key/token auth.
- **GitHub**: Prefer official GitHub MCP server.
- **GitLab**: Use a GitLab MCP server package supporting PAT auth.
- **Filesystem**: Local filesystem MCP server with repository-root allowlist.
- **Web search**: Brave Search MCP (API key) or DuckDuckGo-backed server for keyless fallback.
- **Postgres SQL**: Postgres MCP server using `DATABASE_URL`.
- **Optional AWS**: AWS MCP servers for docs, billing, or service operations (read-only by default).

## Security Defaults
- Keep tokens in `.env` only.
- Configure all servers as read-only where supported.
- Use scoped tokens and rotation policy.

## Bootstrap
1. Copy `mcp/.env.example` to `mcp/.env`.
2. Fill credentials locally (never commit `.env`).
3. Start optional services with `docker compose -f mcp/docker-compose.mcp.yml up -d`.
4. Wire command/env values into root `opencode.json` placeholders.

## Notes
- Some MCP servers are easiest to run via `npx` or `pipx` rather than Docker.
- Use scripts in `scripts/` to standardize setup across local and VPS machines.
