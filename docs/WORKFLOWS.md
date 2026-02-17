# Workflow Playbooks

## Jira Ticket -> Branch -> Code -> PR -> Release Notes
1. Use Jira MCP (read) to fetch ticket details and acceptance criteria.
2. Create a feature branch:
   ```bash
   git checkout -b feature/<ticket-key>-short-name
   ```
3. Implement changes with OpenCode using `build` or specialist agents.
4. Run checks/tests:
   ```bash
   ./scripts/check.sh
   ```
5. Commit logically grouped changes.
6. Open PR including ticket link, risk notes, and validation output.
7. Use `release-notes` skill template to draft changelog entry.

## Confluence Spec -> Implementation Plan
1. Pull requirements from Confluence MCP.
2. Use planning agent prompt to produce implementation steps.
3. Convert steps into small commits and track TODOs.

## Incident Debug Loop (GitHub/GitLab + Postgres)
1. Gather issue/CI context from SCM MCP server.
2. Reproduce locally with minimal input.
3. Query read-only Postgres MCP for diagnostic data.
4. Patch, test, and publish PR with mitigation notes.

## Headless VPS Operation
1. Bootstrap with `scripts/setup-vps.sh`.
2. Run device-code OAuth where applicable.
3. Execute scripted checks before every push.
