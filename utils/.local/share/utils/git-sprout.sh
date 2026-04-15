#!/bin/bash

# Usage: ./git-sprout.sh <repo_url> <target_directory_name>

REPO_URL=$1
TARGET_DIR=$2

if [ -z "$REPO_URL" ] || [ -z "$TARGET_DIR" ]; then
    echo "Usage: git-sprout <repo_url> <target_directory_name>"
    exit 1
fi

echo "🌱 Sprouting workspace in: $TARGET_DIR..."

# 1. Create the parent directory
mkdir -p "$TARGET_DIR/agents"
cd "$TARGET_DIR" || exit

# 2. Clone the bare repository
echo "📦 Cloning bare repository..."
git clone --bare "$REPO_URL" .repository

# 3. Define a helper to add worktrees from the bare repo
# We use the --git-dir flag so we don't have to cd into .repository
add_agent() {
    local branch=$1
    echo "🌿 Creating worktree for branch: $branch..."
    
    # Check if branch exists in the bare repo
    if git --git-dir=.repository rev-parse --verify "origin/$branch" >/dev/null 2>&1; then
        git --git-dir=.repository worktree add "agents/$branch" "origin/$branch"
    elif git --git-dir=.repository rev-parse --verify "$branch" >/dev/null 2>&1; then
        git --git-dir=.repository worktree add "agents/$branch" "$branch"
    else
        echo "⚠️  Branch '$branch' not found. Skipping."
    fi
}

# 4. Create worktrees for the big three
for b in main master develop; do
    add_agent "$b"
done

echo "✅ Done! Your agents are ready in $TARGET_DIR/agents/"