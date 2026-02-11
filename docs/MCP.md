# MCP Operations Guide

## Enable/Disable MCP Servers
MCP server definitions live in `opencode.json` and use env placeholders.

### Enable a server
1. Set command/args env vars in `.env`.
2. Set provider credentials in `.env`.
3. Reload environment and run OpenCode.

### Disable a server
- Remove or blank the related `MCP_*_COMMAND` and credential vars from runtime environment.
- Alternatively maintain multiple env profiles (e.g., `.env.readonly`, `.env.full`).

## Recommended Read-only Defaults
- GitHub/GitLab: repository read/list permissions first.
- Jira/Confluence/Trello: browsing + search permissions first.
- Postgres: read-only role and restricted schema.
- Filesystem: limit to repository root path.
- AWS: read-only IAM policy for discovery operations.

## Server Choices in this scaffold
- Atlassian: `mcp-atlassian` (or Atlassian Rovo remote MCP as alternative).
- Trello: Trello-specific MCP package with API key/token.
- GitHub: official MCP server package.
- GitLab: community GitLab MCP package.
- Filesystem: official filesystem MCP server package.
- Web Search: Brave Search MCP (keyed) and DuckDuckGo fallback.
- Postgres: official Postgres MCP server package.
- AWS: optional community MCP packages.

## Safety Notes
- Keep all tokens outside git.
- Rotate credentials periodically.
- Use separate credentials for local dev and automation contexts.
