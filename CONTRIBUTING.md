# Contributing

Thanks for helping improve AI Native Codex Standards.

## What Makes a Good Contribution

- Fixes a real ambiguity in agent behavior.
- Adds a rule that is broadly useful across projects.
- Improves safety, testability, design quality, or maintainability.
- Keeps global standards project-agnostic.
- Avoids private company details, secrets, or machine-specific paths.

## Rule Writing Principles

- Be specific enough for an AI agent to act on.
- Prefer checklists and clear constraints over vague advice.
- Use existing rule files before creating new categories.
- Keep examples short and free of real credentials.
- Do not weaken existing safety, security, testing, or AI-native UX requirements.

## Pull Request Checklist

- [ ] The change is project-agnostic.
- [ ] No secrets, tokens, private URLs, customer data, or local absolute paths are included.
- [ ] Referenced files and paths exist.
- [ ] Installation instructions still work.
- [ ] New rules are easy for a coding agent to follow.

## Local Validation

Before opening a pull request, run:

```bash
git status --short
```

And scan for accidental secrets or local paths with your preferred secret scanner.
