#!/usr/bin/env bash
# Link ostack skills and agents into Claude Code and Codex, and drop stale links.
set -euo pipefail

repo=$(cd "$(dirname "$0")" && pwd)
git -C "$repo" config core.hooksPath .githooks

# link_all <source dir> <glob> <target dir>
link_all() {
	local src=$1 glob=$2 dst=$3 item name
	mkdir -p "$dst"
	for item in "$src"/$glob; do
		[[ -e $item ]] || continue
		name=$(basename "$item")
		if [[ -e $dst/$name && ! -L $dst/$name ]]; then
			echo "skip $dst/$name (not managed by ostack)"
			continue
		fi
		ln -sfn "$item" "$dst/$name"
	done
	# Remove links into this repo whose target no longer exists.
	for item in "$dst"/*; do
		[[ -L $item && ! -e $item && $(readlink "$item") == "$repo"/* ]] && rm "$item"
	done
	return 0
}

link_all "$repo/skills" '*' ~/.claude/skills
link_all "$repo/skills" '*' ~/.codex/skills
link_all "$repo/agents" '*.md' ~/.claude/agents

echo "ostack: $(find "$repo/skills" -mindepth 1 -maxdepth 1 -type d | wc -l) skills linked"
