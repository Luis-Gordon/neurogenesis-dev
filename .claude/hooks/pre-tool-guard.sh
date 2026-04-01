#!/usr/bin/env bash
# Pre-tool guard — blocks destructive git operations
# Register as a PreToolUse hook on Bash in settings.local.json

set -euo pipefail

# Read the tool input from stdin (JSON with tool_name and tool_input fields)
INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name // ""')
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

# Only check Bash tool calls
[ "$TOOL" = "Bash" ] || { echo '{"decision":"approve"}'; exit 0; }

# 1. Block git clean (any flags)
if echo "$CMD" | grep -qE 'git\s+clean\b'; then
  echo '{"decision":"block","reason":"BLOCKED: git clean permanently deletes untracked files. Use git checkout -- <file> for tracked files."}' >&2
  echo '{"decision":"block","reason":"git clean blocked by pre-tool-guard"}'
  exit 0
fi

# 2. Block blanket git checkout (-- . or just .)
if echo "$CMD" | grep -qE 'git\s+checkout\s+--\s+\.\s*$|git\s+checkout\s+\.\s*$'; then
  echo '{"decision":"block","reason":"BLOCKED: git checkout -- . discards ALL uncommitted changes. Specify individual files instead."}' >&2
  echo '{"decision":"block","reason":"git checkout -- . blocked by pre-tool-guard"}'
  exit 0
fi

# 3. Block git reset --hard
if echo "$CMD" | grep -qE 'git\s+reset\s+--hard'; then
  echo '{"decision":"block","reason":"BLOCKED: git reset --hard discards commits. Use git revert or git stash instead."}' >&2
  echo '{"decision":"block","reason":"git reset --hard blocked by pre-tool-guard"}'
  exit 0
fi

# 4. Block force push to main/master
if echo "$CMD" | grep -qE 'git\s+push\s+.*(-f|--force)' && echo "$CMD" | grep -qE '\b(main|master)\b'; then
  echo '{"decision":"block","reason":"BLOCKED: Force push to main/master destroys remote history. Use a feature branch."}' >&2
  echo '{"decision":"block","reason":"force push to main blocked by pre-tool-guard"}'
  exit 0
fi

# 5. Block git add on .env files (but allow .env.example, .env.template)
if echo "$CMD" | grep -qE 'git\s+add\s+.*\.env(\s|$)' && ! echo "$CMD" | grep -qE '\.(example|template|sample)'; then
  echo '{"decision":"block","reason":"BLOCKED: .env files contain secrets. Use .env.example for templates."}' >&2
  echo '{"decision":"block","reason":".env file staging blocked by pre-tool-guard"}'
  exit 0
fi

# All checks passed — approve
echo '{"decision":"approve"}'
