# Model and Provider Strategy

## Target Providers

### OpenAI ChatGPT OAuth
- Auth method: OAuth via OpenCode CLI login.
- Intended usage: interactive coding and high-quality generation.

### OpenAI Codex OAuth
- Auth method: OAuth via OpenCode CLI login.
- Intended usage: code-first workflows and tooling-heavy tasks.

### MiniMax M2.1 (API key)
- Auth method: API key via `.env`.
- Intended usage: fast or lower-cost generation tiers.

### Google Gemini (free tier)
- Auth method: project/account credential from Google AI platform.
- Requirement: user must provision credential and set env var placeholders.

## Alias Convention
Set aliases in `.env` for `opencode.json` model mapping:
- `OPENCODE_MODEL_FAST`: lower-latency model.
- `OPENCODE_MODEL_STRONG`: highest-quality default.
- `OPENCODE_MODEL_CHEAP`: low-cost fallback.

Recommended initial mapping strategy:
- `fast` -> MiniMax M2.1 or Gemini free tier.
- `strong` -> OpenAI ChatGPT/Codex premium tier.
- `cheap` -> Gemini free tier or lowest-cost provider option.

Phase 2 will validate concrete model IDs per provider and use-case benchmarks.
