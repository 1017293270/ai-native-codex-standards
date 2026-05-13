# AI Native Codex Standards

[English](#english) | [中文](#中文)

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)
[![Codex](https://img.shields.io/badge/Codex-AGENTS.md-blue)](./AGENTS.md)
[![AI Native](https://img.shields.io/badge/AI--Native-Engineering-purple)](./AGENTS.md)

---

## English

**Make Codex work like a senior full-stack engineering agent.**

A global engineering standard for Codex and AI coding agents, including `AGENTS.md`, task routing,
frontend/backend consistency, AI interaction rules, security, testing, design quality gates, and
delivery checklists.

### Why This Exists

AI coding agents are powerful, but without durable standards they can drift into happy-path code,
inconsistent architecture, generic UI, missing error states, weak tests, or unsafe AI tool behavior.

This repository gives Codex a reusable global operating system:

- Classify the task before coding.
- Load the right engineering rules.
- Treat AI UX as a first-class product surface.
- Keep frontend, backend, data, security, testing, and deployment aligned.
- Make quality gates explicit instead of relying on memory.

### What Is Included

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

### Install

#### Windows PowerShell

```powershell
git clone https://github.com/1017293270/ai-native-codex-standards.git
cd ai-native-codex-standards
.\install.ps1
```

#### macOS / Linux

```bash
git clone https://github.com/1017293270/ai-native-codex-standards.git
cd ai-native-codex-standards
chmod +x ./install.sh
./install.sh
```

After installation, every Codex project will inherit the global AI-native engineering standard.

### Manual Install

Copy the files to your global Codex and rules directories:

```text
AGENTS.md -> ~/.codex/AGENTS.md
rules/    -> ~/.claude/rules/
```

Project-level `AGENTS.md` files can still add local constraints. They should not weaken the global
safety, quality, testing, or AI-native UX rules.

### Core Standards

- **AI-native UX:** thinking state, streaming output, cancel, retry, skeleton, timeout feedback.
- **Full-stack consistency:** UI, state, API, backend, data model, permissions, logs, tests, deploy.
- **Prompt and model discipline:** centralized prompts, model adapters, structured parsing, trace logs.
- **Tool safety:** schema, permission boundary, timeout, retry policy, audit log, loop limit.
- **Design quality:** non-generic UI, clear hierarchy, complete states, responsive layout, reduced motion.
- **Security:** no hardcoded secrets, validated inputs, authz, safe logs, high-risk confirmations.
- **Testing:** risk-based unit, integration, E2E, AI fixtures, and failure-path coverage.

### Recommended GitHub Topics

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

### Repository Description

An AI-native full-stack engineering standard for Codex and AI coding agents, including global
AGENTS.md, task routing, frontend/backend consistency, AI interaction rules, security, testing,
design, and delivery quality gates.

### Roadmap

- Add example projects for AI chat, tool calling, dashboards, and full-stack feature delivery.
- Add visual diagrams for the task router and AI feature architecture.
- Add rule validation scripts.
- Add starter templates for project-level `AGENTS.md` files.

### Contributing

Issues, pull requests, and rule proposals are welcome. See [CONTRIBUTING.md](./CONTRIBUTING.md).

### License

MIT. See [LICENSE](./LICENSE).

---

## 中文

**让 Codex 像资深全栈工程师一样工作。**

这是面向 Codex 和 AI 编程 Agent 的 AI Native 全栈工程规范，包含全局 `AGENTS.md`、
任务路由、前后端一致性、AI 交互规则、安全、测试、设计质量门禁和交付检查清单。

### 为什么需要这个项目

AI 编程 Agent 很强，但如果没有稳定的工程规范，很容易滑向只实现 happy path、
架构不一致、界面模板化、缺少错误状态、测试薄弱，或者 AI 工具调用不够安全。

这个仓库为 Codex 提供一套可复用的全局工程操作系统：

- 写代码前先识别任务类型。
- 根据任务加载对应工程规则。
- 把 AI 用户体验当成一等产品能力。
- 让前端、后端、数据、安全、测试和部署保持一致。
- 把质量门禁显式化，而不是依赖记忆和临场发挥。

### 包含内容

```text
.
|-- AGENTS.md       # 全局 Codex 任务路由与 AI Native 工程规范
|-- rules/          # 通用、Web、TypeScript、设计和多语言规则
|-- install.ps1     # Windows 安装脚本
|-- install.sh      # macOS/Linux 安装脚本
|-- CHANGELOG.md
|-- CONTRIBUTING.md
|-- SECURITY.md
`-- LICENSE
```

### 安装

#### Windows PowerShell

```powershell
git clone https://github.com/1017293270/ai-native-codex-standards.git
cd ai-native-codex-standards
.\install.ps1
```

#### macOS / Linux

```bash
git clone https://github.com/1017293270/ai-native-codex-standards.git
cd ai-native-codex-standards
chmod +x ./install.sh
./install.sh
```

安装后，每个 Codex 项目都会继承这套全局 AI Native 工程规范。

### 手动安装

把文件复制到你的全局 Codex 和规则目录：

```text
AGENTS.md -> ~/.codex/AGENTS.md
rules/    -> ~/.claude/rules/
```

项目级 `AGENTS.md` 仍然可以补充本地约束，但不应削弱全局的安全、质量、测试和
AI Native 用户体验规则。

### 核心标准

- **AI Native 体验：** thinking state、streaming output、cancel、retry、skeleton、timeout feedback。
- **全栈一致性：** UI、状态、API、后端、数据模型、权限、日志、测试、部署统一考虑。
- **Prompt 和模型纪律：** 集中管理 prompts、模型适配器、结构化解析、trace logs。
- **工具调用安全：** schema、权限边界、超时、重试策略、审计日志、循环限制。
- **设计质量：** 避免模板化 UI、清晰层级、完整状态、响应式布局、支持 reduced motion。
- **安全：** 不硬编码密钥、输入校验、权限校验、安全日志、高风险操作二次确认。
- **测试：** 按风险分层覆盖单元测试、集成测试、E2E、AI fixtures 和失败路径。

### 推荐 GitHub Topics

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

### 仓库描述

AI Native 全栈工程规范：为 Codex / AI 编程 Agent 提供全局 AGENTS.md、任务路由、
前后端一致性、AI 交互、安全、测试、设计与交付质量门禁。

### Roadmap

- 增加 AI chat、tool calling、dashboard、full-stack feature delivery 示例项目。
- 增加任务路由和 AI 功能架构图。
- 增加规则校验脚本。
- 增加项目级 `AGENTS.md` starter templates。

### 参与贡献

欢迎提交 issue、pull request 和规则提案。详见 [CONTRIBUTING.md](./CONTRIBUTING.md)。

### License

MIT. See [LICENSE](./LICENSE).
