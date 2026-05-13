#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODEX_DIR="${HOME}/.codex"
CLAUDE_RULES_DIR="${HOME}/.claude/rules"

mkdir -p "${CODEX_DIR}" "${CLAUDE_RULES_DIR}"

cp "${REPO_ROOT}/AGENTS.md" "${CODEX_DIR}/AGENTS.md"
cp -R "${REPO_ROOT}/rules/." "${CLAUDE_RULES_DIR}/"

echo "Installed AI Native Codex standards:"
echo "  AGENTS.md -> ${CODEX_DIR}/AGENTS.md"
echo "  rules     -> ${CLAUDE_RULES_DIR}"
