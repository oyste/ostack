# Prompts worth copying

Swap in the real paths, skills, and done checks. Informal wording works.

## Understand

- `/oyste-mode read <thread>. restate the underlying issue in your own words, in plain english.`
- `/in-your-own-words <long or messy ask>`
- `/sharpen <the prompt you're about to send>`
- `/oyste-mode investigate why <symptom>. give me what we know, what data you used, and your best hypotheses. don't change any code yet.`
- `use /how to understand <subsystem>. then use /why to find out why it broke recently.`
- `/teach me why you implemented it this way and not <other way>. what did you trade off?`
- `/oyste-mode take over this branch. read the decision log, find what's done, and continue. don't redo finished work.`

## Build

- Bug: `/oyste-mode <symptom>. repro first, then fix and verify.`
- Bug in an app: `/oyste-mode repro this with /verify-<app>. if it repros on main, fix it and show me a video as proof.`
- Bug with a cheap test: `/oyste-mode repro <bug> first. if there's a cheap test path, /tdd it. then fix and rerun.`
- Feature: `/oyste-mode add <behavior>. <current output> stays byte-identical. verify both.`
- Refactor: `/oyste-mode move <code> into one module, zero behavior change. record the current output first and prove it's unchanged after.`
- Perf: `/oyste-mode <operation> takes <time> on <fixture>. trace it, fix the measured cause, show me before and after.`

## Design and plan

- `/oyste-mode prototype a few options for <feature>. take screenshots or videos for me to compare.`
- `/oyste-mode we need <feature>. /architect it first, and answer open questions with prototypes. let me review before proceeding.`
- `/oyste-mode write a tutorial for how i would use <new package> first. then /teach me why it beats the current one.`
- `ask /arena for a second opinion on this thread and our approach.`
- `/oyste-mode turn this design into a plan. small verifiable PRs, each with its own verification steps.`
- `/oyste-mode plan the migration of <library> to <target>. small verifiable PRs. the result must match the original exactly, bugs included.`

## Review and ship

- `/swarm check every package under <dir> against its check script. one worker per package. one report.`
- `/oyste-mode open the pr. small ordered commits, evidence in the description.`
- `/oyste-mode babysit this pr. get it green.` For status only: `/oyste-mode check on pr <number>. anything outstanding?`
- `/oyste-mode land the stack.`

## Away and back

- `/oyste-mode im going to bed. <goal> in a fresh worktree off <base>. done means <checks>. keep a decision log. don't ask me before committing. /loop until done. if you're truly stuck after a few hours, stop and write up why.`
- `/show-me-your-work catch me up on what you did last night.` Read its Attention section first.
- `/ketchup` catches you up on this chat since your last message and lists every call that waits on you.
- `/oyste-mode full autopilot on this queue. each item is independent.`
- `/oyste-mode autopilot these changes, but don't merge. i'll land them.`
- `/bro` restates the last reply in plain words.
