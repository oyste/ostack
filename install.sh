#!/usr/bin/env bash
# Link ostack skills and agents into Claude Code and Codex, and drop stale links.
set -euo pipefail

repo=$(cd "$(dirname "$0")" && pwd)
git -C "$repo" config core.hooksPath .githooks

# link_all <source dir> <glob> <target dir>
link_all() {
	local src=$1 glob=$2 dst=$3 item name
	mkdir -p "$dst"
	# Remove links into this repo whose target is gone.
	for item in "$dst"/*; do
		[[ -L $item && ! -e $item && $(readlink "$item") == "$repo"/* ]] && rm "$item"
	done
	for item in "$src"/$glob; do
		[[ -e $item ]] || continue
		name=$(basename "$item")
		if [[ -e $dst/$name && ! -L $dst/$name ]]; then
			echo "skip $dst/$name (not managed by ostack)"
			continue
		fi
		ln -sfn "$item" "$dst/$name"
	done
}

link_all "$repo/claude/skills" '*' ~/.claude/skills
link_all "$repo/claude/agents" '*.md' ~/.claude/agents
link_all "$repo/codex/skills" '*' ~/.codex/skills

echo "ostack: $(find ~/.claude/skills -maxdepth 1 -lname "$repo/*" | wc -l) skills in Claude Code, $(find ~/.codex/skills -maxdepth 1 -lname "$repo/*" | wc -l) in Codex"
