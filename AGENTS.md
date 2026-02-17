# Repository Rules

## Security and Secrets
- Never commit secrets, API keys, tokens, private certificates, or auth dumps.
- Never print secret values in logs, CI output, or screenshots.
- Keep all secrets in `.env` or environment variables outside git.

## Access and Safety
- Use least-privilege credentials and MCP scopes.
- Configure MCP servers in read-only mode by default.
- Escalate to write actions only when explicitly required by the task.

## Code Change Workflow
- Keep changes small and logically grouped.
- Run formatters, linters, and tests when available before committing.
- Prefer idempotent scripts and reproducible setup.

## Pull Request Checklist
- [ ] No secrets are added to tracked files.
- [ ] Setup docs updated when behavior or configuration changes.
- [ ] Scripts were run or validated where feasible.
- [ ] Phase/TODO notes included for unfinished integrations.
