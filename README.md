# ostack

My personal agent skills for Claude Code and Codex.

## Install

```bash
git clone https://github.com/oyste/ostack.git ~/ostack
~/ostack/install.sh
```

`install.sh` links every folder in `skills/` into `~/.claude/skills` and `~/.codex/skills`, and every file in `agents/` into `~/.claude/agents`. It never touches folders it didn't create.

## Use

- Edit a skill: save it. Both tools read the repo files directly.
- Add or remove a skill: run the VS Code task **ostack: install skills**. `git pull` runs it automatically.

## Sources

Copied once, not tracked upstream. Licenses in `licenses/`.

- [pstack](https://github.com/cursor/plugins/tree/main/harness/pstack/claude-code) (Claude Code build) @ `b63c29f`: skills, `agents/`. Its docs live in `skills/poteto-help/docs/`.
- [tstack](https://github.com/t3dotgg/tstack) @ `11e37a7`
- [ponytail](https://github.com/dietrichgebert/ponytail) @ `96608e0`: skills only, no hooks.
