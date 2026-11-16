# ostack

My personal agent skills for Claude Code and Codex.

## Install

```bash
git clone https://github.com/oyste/ostack.git ~/ostack
~/ostack/install.sh
```

`install.sh` links each folder in `claude/skills/` into `~/.claude/skills`, each file in `claude/agents/` into `~/.claude/agents`, and each folder in `codex/skills/` into `~/.codex/skills`. It never touches folders it didn't create.

## Use

- Each tool has its own copy. A skill for both tools lives in both folders, and you keep the copies in step yourself.
- Edit a skill: save it. The tool reads the repo file directly.
- Add or remove a skill: run the VS Code task **ostack: install skills**. `git pull` runs it automatically.
- Codex copies of skills that should only run when typed have `agents/openai.yaml` with `allow_implicit_invocation: false`.

## Sources

Copied once, not tracked upstream. Licenses in `licenses/`.

- [pstack](https://github.com/cursor/plugins/tree/main/harness/pstack/claude-code) (Claude Code build) @ `b63c29f`: skills and `claude/agents/`. Its docs live in `claude/skills/poteto-help/docs/`. Codex gets only the skills that don't need the Claude Code adapter. `statechart` test files removed.
- [tstack](https://github.com/t3dotgg/tstack) @ `11e37a7`
- [ponytail](https://github.com/dietrichgebert/ponytail) @ `96608e0`: skills only, no hooks.
