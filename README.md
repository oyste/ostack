# ostack

My personal set of agent skills for Claude Code and Codex. One repo, any project.

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

## Claude Code

Type `/<skill>` to run a skill. Most pstack skills only run when typed.

### Main mode and setup

| Skill | What it does | Try |
|---|---|---|
| `poteto-mode` | Picks a playbook (feature, bug fix, refactor, perf, investigation…), runs the other skills as needed, and ends in the `full-send` PR pipeline | `/poteto-mode export duplicates rows on retry. repro first, then fix and verify.` |
| `setup-ostack` | Picks which model and effort each role uses, and writes the choice to `~/.claude/rules/ostack-models.md` | `/setup-ostack` once per machine |
| `poteto-help` | Answers "which skill fits?" and hands you a prompt to send | `/poteto-help which skill should I use to review this branch?` |
| `create-verification-skill` | Writes a project skill that drives the real app the way a user does, so agents can prove changes work | `/create-verification-skill for the API server` |
| `maintain-verification-skill` | Brings that verification skill back in line with the app | `/maintain-verification-skill` |

### Understand

| Skill | What it does | Try |
|---|---|---|
| `how` | Explains how a part of the code works, and where new code should live | `/how does auth refresh work?` |
| `why` | Explains why code is the way it is, citing commits and PR discussions | `/why is the retry limit 3?` |
| `teach` | Runs `how` and `why`, then explains the result plainly at your pace | `/teach me the ingest pipeline` |
| `in-your-own-words` | Restates your goal and the problem behind it | `/in-your-own-words` |
| `bro` | Restates the last reply in plain words | `/bro` |
| `ketchup` | Catches you up on this chat since your last message, and lists what waits on you | `/ketchup` |

### Design and build

| Skill | What it does | Try |
|---|---|---|
| `architect` | Sketches types, signatures and modules before code, then stays in the loop while it is built | `/architect a rate limiter for the public API` |
| `arena` | Runs several attempts at the same task, picks the best base and grafts in the best parts of the rest | `/arena the cache key design` |
| `swarm` | Splits work across parallel workers and returns one report | `/swarm check every endpoint for missing auth` |
| `figure-it-out` | Designs a rigorous, logged plan for work no playbook fits | `/figure-it-out migrate all jobs to the new queue` |
| `sharpen` | Rewrites your prompt into a deeper version of the task | `/sharpen <your prompt>` |
| `tdd` | Writes a failing test first, then the fix | `/tdd fix the off-by-one in pagination` |
| `no-comments` | Has the Comment Sicko agent strip needless comments and fix what they hid | `/no-comments` |
| `ponytail` | Smallest change that fully solves the task. Starts on any coding task | `/ponytail ultra` |
| `ponytail-debt` | Lists every `shortcut:` comment as a debt ledger | `/ponytail-debt` |
| `show-me-your-work` | Keeps a decision log for long or unattended runs | `/show-me-your-work` before you step away |
| `typescript-best-practices` | TypeScript rules: unions, branded types, no `as` casts | Loads by itself when Claude works on `.ts` or `.tsx` files |

### Review and verify

| Skill | What it does | Try |
|---|---|---|
| `blast-radius` | Finds what a change breaks outside the diff, and proves the one fact it is safe because of | `/blast-radius of this branch` |
| `council` | Three models from different providers review until they agree | "council on this diff" |
| `sol-loop` | GPT Sol reviews the change in a loop until both agents agree | "sol loop" |
| `benchmark-checklist` | Checks a perf number before you report it | `/benchmark-checklist` after a benchmark run |
| `correct` | Turns mistakes agents keep repeating into checks that make them impossible | `/correct` |

### Ship

| Skill | What it does | Try |
|---|---|---|
| `full-send` | Proves, reviews, files, babysits and merges a change, once a human approves and required checks pass | "full send" |
| `full-stop` | Same as `full-send`, but stops when the PR is ready for you to merge | "full stop" |
| `file-pr` | Files a short PR in the repo's own format | "file a PR" |
| `babysit-pr` | Watches a PR through CI and review bots, and fixes real findings | "babysit #123" |
| `takeover` | Finishes someone else's PR, branch or agent thread | "take over #123" |
| `modernize` | Rebases an old PR and decides if it should still exist | "modernize #123" |
| `leaving-pr-comments` | Formats comments agents post on GitHub | Used by the other PR skills |

### Writing

| Skill | What it does | Try |
|---|---|---|
| `unslop` | Cuts AI tells from text | `/unslop this README` |
| `technical-writing` | Style rules for docs, READMEs, PR descriptions and commit messages | `/technical-writing review docs/setup.md` |

### Principles

`poteto-mode` cites these when they shape a decision. Type one to apply it directly.

| Skill | Apply when |
|---|---|
| `principle-attack-the-premise` | Two fixes built on the same premise have failed |
| `principle-boundary-discipline` | Wiring validation, errors or adapters: guard at the edges, trust inside |
| `principle-build-the-lever` | Any non-trivial work: build the script or tool instead of working by hand |
| `principle-encode-lessons-in-structure` | You give the same instruction twice: make it a lint or check |
| `principle-exhaust-the-design-space` | A decision with no precedent: prototype 2–3 options first |
| `principle-experience-first` | Product or UX tradeoffs: favour the user over convenience |
| `principle-explain-the-number` | Before trusting a measured number: find what limits it |
| `principle-fix-root-causes` | Debugging: fix where it first went wrong, not the symptom |
| `principle-foundational-thinking` | Before logic: get the types and data structures right |
| `principle-guard-the-context-window` | Context filling up: send bulk work to subagents |
| `principle-laziness-protocol` | Sizing a diff: prefer deletion and the smallest change |
| `principle-make-operations-idempotent` | Steps that can crash or retry: same end state every time |
| `principle-migrate-callers-then-delete-legacy-apis` | New API with old callers: migrate and delete in one go |
| `principle-minimize-reader-load` | Hard-to-trace code: fewer layers and less hidden state |
| `principle-model-the-domain` | Branchy or stateful code: encode the domain in a structure |
| `principle-never-block-on-the-human` | Tempted to ask about reversible work: do it, then show |
| `principle-outcome-oriented-execution` | Planned migrations: go straight to the target, no throwaway layers |
| `principle-prove-it-works` | Before saying done: check the real thing, not a proxy |
| `principle-redesign-from-first-principles` | A new requirement: redesign as if it was there from day one |
| `principle-separate-before-serializing-shared-state` | Parallel writers: remove the sharing first |
| `principle-sequence-verifiable-units` | Multi-step work: small units, each checked before the next |
| `principle-subtract-before-you-add` | Before adding: remove dead code first |
| `principle-test-behavior-not-implementation` | Writing tests: assert what users can observe |
| `principle-type-system-discipline` | Designing types: make illegal states unrepresentable |

### Agents

| Agent | What it does |
|---|---|
| `poteto-agent` | Delegate that `poteto-mode` spawns for code-writing and helper tasks |
| `comment-sicko` | Read-only comment reviewer that `no-comments` spawns |

## Codex

Type `$<skill>` or name the skill in your prompt. The pstack skills here only run when you ask for them.

| Skill | What it does | Try |
|---|---|---|
| `full-send` | Proves, reviews, files, babysits and merges a change, once a human approves and required checks pass | "full send" |
| `full-stop` | Same as `full-send`, but stops when the PR is ready for you to merge | "full stop" |
| `file-pr` | Files a short PR in the repo's own format | "file a PR" |
| `babysit-pr` | Watches a PR through CI and review bots, and fixes real findings | "babysit #123" |
| `takeover` | Finishes someone else's PR, branch or agent thread | "take over #123" |
| `modernize` | Rebases an old PR and decides if it should still exist | "modernize #123" |
| `leaving-pr-comments` | Formats comments agents post on GitHub | Used by the other PR skills |
| `council` | Three models from different providers review until they agree | "council on this diff" |
| `sol-loop` | GPT Sol reviews the change in a loop until both agents agree | "sol loop" |
| `ponytail` | Smallest change that fully solves the task. Starts on any coding task | `$ponytail ultra` |
| `ponytail-debt` | Lists every `shortcut:` comment as a debt ledger | `$ponytail-debt` |
| `blast-radius` | Finds what a change breaks outside the diff, and proves the one fact it is safe because of | `$blast-radius of this branch` |
| `benchmark-checklist` | Checks a perf number before you report it | `$benchmark-checklist` after a benchmark run |
| `tdd` | Writes a failing test first, then the fix | `$tdd fix the off-by-one in pagination` |
| `correct` | Turns mistakes agents keep repeating into checks that make them impossible | `$correct` |
| `why` | Explains why code is the way it is, citing commits and PR discussions | `$why is the retry limit 3?` |
| `sharpen` | Rewrites your prompt into a deeper version of the task | `$sharpen <your prompt>` |
| `bro` | Restates the last reply in plain words | `$bro` |
| `unslop` | Cuts AI tells from text | `$unslop this README` |

## Thanks

ostack started as a copy of these projects and grew from there. Thank you to their authors. Their licenses are in `licenses/`.

- [pstack](https://github.com/cursor/plugins/tree/main/pstack) by poteto
- [tstack](https://github.com/t3dotgg/tstack) by Theo Browne
- [ponytail](https://github.com/dietrichgebert/ponytail) by Dietrich Gebert
