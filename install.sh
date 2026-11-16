#!/usr/bin/env bash
# Link ostack skills and agents into Claude Code and Codex, and drop stale links.
set -euo pipefail

repo=$(cd "$(dirname "$0")" && pwd)
git -C "$repo" config core.hooksPath .githooks

# link_all <source dir> <glob> <target dir> [file listing names to leave out]
link_all() {
	local src=$1 glob=$2 dst=$3 exclude=${4:-/dev/null} item name
	mkdir -p "$dst"
	# Remove links into this repo whose target is gone or now excluded.
	for item in "$dst"/*; do
		[[ -L $item && $(readlink "$item") == "$repo"/* ]] || continue
		if [[ ! -e $item ]] || grep -qx "$(basename "$item")" "$exclude"; then
			rm "$item"
		fi
	done
	for item in "$src"/$glob; do
		[[ -e $item ]] || continue
		name=$(basename "$item")
		grep -qx "$name" "$exclude" && continue
		if [[ -e $dst/$name && ! -L $dst/$name ]]; then
			echo "skip $dst/$name (not managed by ostack)"
			continue
		fi
		ln -sfn "$item" "$dst/$name"
	done
}

link_all "$repo/skills" '*' ~/.claude/skills
link_all "$repo/skills" '*' ~/.codex/skills "$repo/claude-only.txt"
link_all "$repo/agents" '*.md' ~/.claude/agents

echo "ostack: $(find ~/.claude/skills -maxdepth 1 -lname "$repo/*" | wc -l) skills in Claude Code, $(find ~/.codex/skills -maxdepth 1 -lname "$repo/*" | wc -l) in Codex"
