# AI Native Codex Standards

English | [中文](#中文)

Global engineering standards for Codex and AI coding agents. This repository provides a reusable
`AGENTS.md`, task routing rules, AI-native UX constraints, full-stack consistency checks, security
rules, testing expectations, design quality gates, and delivery checklists.

## What Is Included

- `AGENTS.md`: Global Codex task router and AI-native engineering standard.
- `rules/`: Reusable engineering rules for common, web, TypeScript, design, and language-specific work.
- `install.ps1`: Windows installer.
- `install.sh`: macOS/Linux installer.

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

## Manual Install

Copy the files to your global Codex and rules directories:

```text
AGENTS.md -> ~/.codex/AGENTS.md
rules/    -> ~/.claude/rules/
```

Project-level `AGENTS.md` files can still add local constraints. They should not weaken the global
safety, quality, testing, or AI-native UX rules.

## Repository Description

An AI-native full-stack engineering standard for Codex and AI coding agents, including global
AGENTS.md, task routing, frontend/backend consistency, AI interaction rules, security, testing,
design, and delivery quality gates.

---

# 中文

面向 Codex 和 AI 编程 Agent 的 AI Native 全栈工程规范。本仓库提供可复用的全局
`AGENTS.md`、任务路由规则、AI Native 用户体验约束、全栈一致性检查、安全规则、
测试要求、设计质量门禁和交付检查清单。

## 包含内容

- `AGENTS.md`：全局 Codex 任务路由与 AI Native 工程规范。
- `rules/`：通用、Web、TypeScript、设计和多语言工程规则。
- `install.ps1`：Windows 安装脚本。
- `install.sh`：macOS/Linux 安装脚本。

## 安装

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

## 手动安装

把文件复制到你的全局 Codex 和规则目录：

```text
AGENTS.md -> ~/.codex/AGENTS.md
rules/    -> ~/.claude/rules/
```

项目级 `AGENTS.md` 仍然可以补充本地约束，但不应削弱全局的安全、质量、测试和
AI Native 用户体验规则。

## 仓库描述

AI Native 全栈工程规范：为 Codex / AI 编程 Agent 提供全局 AGENTS.md、任务路由、
前后端一致性、AI 交互、安全、测试、设计与交付质量门禁。
