# AI Native Codex Standards

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)
[![Codex](https://img.shields.io/badge/Codex-AGENTS.md-blue)](./AGENTS.md)
[![AI Native](https://img.shields.io/badge/AI--Native-Engineering-purple)](./AGENTS.md)

**Make Codex work like a senior full-stack engineering agent.**

A global engineering standard for Codex and AI coding agents, including `AGENTS.md`, task routing,
frontend/backend consistency, AI interaction rules, security, testing, design quality gates, and
delivery checklists.

**中文：**让 Codex 像资深全栈工程师一样工作。本仓库提供一套 AI Native 全栈工程规范，
用于统一 AI 编程 Agent 的任务路由、工程约束、设计质量、安全、测试和交付标准。

---

## Why This Exists

AI coding agents are powerful, but without durable standards they can drift into happy-path code,
inconsistent architecture, generic UI, missing error states, weak tests, or unsafe AI tool behavior.

This repository gives Codex a reusable global operating system:

- Classify the task before coding.
- Load the right engineering rules.
- Treat AI UX as a first-class product surface.
- Keep frontend, backend, data, security, testing, and deployment aligned.
- Make quality gates explicit instead of relying on memory.

## What Is Included

```text
.
|-- AGENTS.md       # Global Codex task router and AI-native engineering standard
|-- rules/          # Common, web, TypeScript, design, and language-specific rules
|-- install.ps1     # Windows installer
|-- install.sh      # macOS/Linux installer
|-- CHANGELOG.md
|-- CONTRIBUTING.md
|-- SECURITY.md
`-- LICENSE
```

## Install

### Windows PowerShell

```powershell
git clone https://github.com/1017293270/ai-native-codex-standards.git
cd ai-native-codex-standards
.\install.ps1
```

### macOS / Linux

```bash
git clone https://github.com/1017293270/ai-native-codex-standards.git
cd ai-native-codex-standards
chmod +x ./install.sh
./install.sh
```

After installation, every Codex project will inherit the global AI-native engineering standard.

安装后，每个 Codex 项目都会继承这套全局 AI Native 工程规范。

## Manual Install

Copy the files to your global Codex and rules directories:

```text
AGENTS.md -> ~/.codex/AGENTS.md
rules/    -> ~/.claude/rules/
```

Project-level `AGENTS.md` files can still add local constraints. They should not weaken the global
safety, quality, testing, or AI-native UX rules.

## Core Standards

- **AI-native UX:** thinking state, streaming output, cancel, retry, skeleton, timeout feedback.
- **Full-stack consistency:** UI, state, API, backend, data model, permissions, logs, tests, deploy.
- **Prompt and model discipline:** centralized prompts, model adapters, structured parsing, trace logs.
- **Tool safety:** schema, permission boundary, timeout, retry policy, audit log, loop limit.
- **Design quality:** non-generic UI, clear hierarchy, complete states, responsive layout, reduced motion.
- **Security:** no hardcoded secrets, validated inputs, authz, safe logs, high-risk confirmations.
- **Testing:** risk-based unit, integration, E2E, AI fixtures, and failure-path coverage.

## Recommended GitHub Topics

Use these topics to make the repository easier to discover:

```text
codex
agents-md
ai-agent
ai-coding
ai-native
developer-tools
full-stack
engineering-standards
prompt-engineering
software-engineering
```

## Repository Description

**English:**  
An AI-native full-stack engineering standard for Codex and AI coding agents, including global
AGENTS.md, task routing, frontend/backend consistency, AI interaction rules, security, testing,
design, and delivery quality gates.

**中文：**  
AI Native 全栈工程规范：为 Codex / AI 编程 Agent 提供全局 AGENTS.md、任务路由、
前后端一致性、AI 交互、安全、测试、设计与交付质量门禁。

## Roadmap

- Add example projects for AI chat, tool calling, dashboards, and full-stack feature delivery.
- Add visual diagrams for the task router and AI feature architecture.
- Add rule validation scripts.
- Add starter templates for project-level `AGENTS.md` files.

## Contributing

Issues, pull requests, and rule proposals are welcome. See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

MIT. See [LICENSE](./LICENSE).
