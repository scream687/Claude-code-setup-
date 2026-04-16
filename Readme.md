# Claude Code — Complete Project Setup

> The complete `.claude/` configuration system for professional Claude Code projects. Drop it into any codebase and Claude becomes a disciplined, opinionated AI teammate.

---

## What's Inside

```
CLAUDE.md                          ← Project brain — Claude reads this first
.claude/
├── agents/                        ← AI teammates that work autonomously
│   ├── code-reviewer.md
│   ├── debugger.md
│   ├── test-writer.md
│   ├── refactorer.md
│   ├── doc-writer.md
│   └── security-auditor.md
├── commands/                      ← Slash commands — one word, multi-step workflows
│   ├── fix-issue.md
│   ├── deploy.md
│   └── pr-review.md
├── hooks/                         ← Shell scripts that run before/after Claude's actions
│   ├── pre-commit.sh              ← Blocks commits with type errors, lint errors, or failing tests
│   └── lint-on-save.sh            ← Auto-lints and formats every file Claude edits
├── rules/                         ← Guardrails scoped to specific file paths
│   ├── frontend.md                ← app/, components/
│   ├── database.md                ← supabase/, lib/db/
│   └── api.md                     ← app/api/, pages/api/
├── skills/                        ← Reusable capability bundles
│   └── frontend-design/
│       └── SKILL.md               ← Brand colors, typography, component patterns
└── settings.json                  ← Permissions, model, hooks config, memory
```

---

## The 7 Components

### CLAUDE.md — Project Brain
The root context file Claude reads at the start of every session. Contains your tech stack, folder structure, commands, coding conventions, git rules, security requirements, and what Claude should and should never do.

### agents/ — AI Teammates
Autonomous agents invoked with `@agent-name`:
- `@code-reviewer` — reviews PRs across security, performance, quality, correctness
- `@debugger` — diagnoses root causes, not symptoms
- `@test-writer` — comprehensive test suites with full edge case coverage
- `@refactorer` — improves structure without changing behavior
- `@doc-writer` — docstrings, READMEs, API docs, inline comments
- `@security-auditor` — OWASP Top 10 audit with proof-of-concept attacks

### commands/ — One-Word Automations
Slash commands invoked with `/command-name`:
- `/fix-issue` — full bug fix flow: reproduce → diagnose → patch → test → PR
- `/deploy` — pre-flight checks → deploy → post-deploy verification
- `/pr-review` — structured review with APPROVE / REQUEST CHANGES / BLOCK verdict

### hooks/ — Auto-Run Scripts
Shell scripts that trigger automatically:
- `pre-commit.sh` — runs TypeScript check + ESLint + tests before every commit. Blocks on failure.
- `lint-on-save.sh` — auto-lints and Prettiers every file Claude writes or edits

### rules/ — Scoped Guardrails
Markdown rules that apply only to specific file paths:
- `frontend.md` — component structure, Tailwind, state management, performance, a11y
- `database.md` — queries, RLS, migrations, data integrity, security
- `api.md` — input validation (Zod), auth, error handling, rate limiting, security

### skills/ — Capability Bundles
Reusable knowledge invoked with user-invocable triggers:
- `frontend-design` — brand colors, typography scale, spacing system, component patterns, animation standards

### settings.json — Control Panel
Permissions (what Bash commands Claude can/cannot run), hook wiring, model selection, memory configuration.

---

## Installation

### New project
```bash
git clone https://github.com/yourusername/claude-code-setup
cp -r claude-code-setup/.claude ./
cp claude-code-setup/CLAUDE.md ./
```

### Existing project
```bash
# Copy the entire .claude folder
cp -r /path/to/claude-code-setup/.claude ./

# Copy the project brain
cp /path/to/claude-code-setup/CLAUDE.md ./

# Make hooks executable
chmod +x .claude/hooks/*.sh
```

### Global install (all projects)
```bash
cp -r .claude/ ~/.claude/
```

---

## Customization

### CLAUDE.md
Edit to match your actual tech stack, folder structure, and team conventions. This is the most important file — Claude reads it before every session.

### settings.json
Update `"allow"` and `"deny"` lists to match your project's allowed commands. Change `"model"` if needed.

### rules/
Add new rule files for any folder that needs specific standards. The `paths` array in the YAML frontmatter scopes when each rule applies.

### skills/frontend-design/SKILL.md
Replace brand colors, typography, and component patterns with your actual design system.

---

## Requirements

- Claude Code (claude.ai/code or CLI)
- Node.js project with npm scripts (or adapt hooks for your stack)

---

## License

MIT — use freely, modify for your project.
