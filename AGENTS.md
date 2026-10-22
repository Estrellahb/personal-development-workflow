# AGENTS.md — AI 自动化编程总控调度中枢

> 本文件为整个项目 AI 协作的唯一总入口与调度目录。所有 AI 智能体在执行任务前必须首先通读本文件，并根据当前所处开发阶段路由读取对应规范。

---

## 一、核心原则与调度机制

1. **总入口原则**：进入项目或接收任务时，首先读取 `AGENTS.md`，明确上下文与当前所处阶段。
2. **阶段门禁原则**：严禁跳跃阶段执行，禁止在前置检查未通过时编写业务代码，禁止在测试未通过时提交代码。
3. **优先级裁决**：
   - `用户即时指令` > `当前项目已确认的需求基线` > `各阶段 SKILL.md`（阶段执行细则） > `AGENTS.md`（流程与门禁） > `通用经验`。
   - AGENTS.md 与 SKILL.md 冲突时以更具体者为准，并在会话中显式记录偏离点。
4. **自然工程沟通原则**：
   - 全程贯彻高密度、务实精炼的工程交流语言，坚决拒绝冗长客套、无意义吹捧与免责声明，设计思想参照 `references/gpt-with-taste/`。

---

## 二、工作流规范索引目录

| 阶段编号 | 阶段名称 | 职责定位 | 准出交付物 | 规范索引路径 |
| :---: | :--- | :--- | :--- | :--- |
| **00** | **前置检查** | 环境基线探测、网络与 Clash 代理处理 | 会话内环境基线报告 | [skills/preflight/SKILL.md](skills/preflight/SKILL.md) |
| **01** | **需求分析** | 业务目标拆解、设计决策质询与边界确认 | docs/decisions-requirements.md | [skills/requirements/SKILL.md](skills/requirements/SKILL.md) |
| **02** | **架构分析** | 技术选型评估、模块划分与系统方案推演 | docs/decisions-architecture.md | [skills/architecture/SKILL.md](skills/architecture/SKILL.md) |
| **03** | **PRD 文档撰写** | 结构化输出业务需求、用户故事与验收标准文档 | `docs/prd/<主题>.md` | [skills/prd/SKILL.md](skills/prd/SKILL.md) |
| **04** | **UI/UX 设计** | 视觉系统规划、用户交互链路设计与组件原型定义 | DESIGN.md、docs/stitch/ | [skills/ui-ux/SKILL.md](skills/ui-ux/SKILL.md) |
| **05** | **前后端接口规范** | RESTful 接口契约、数据结构与错误码定义 | docs/api/openapi.yaml | [skills/api-spec/SKILL.md](skills/api-spec/SKILL.md) |
| **06** | **实现与测试** | 编码实现、单元与集成验证、真实验收 | 通过的测试命令与零失败用例清单 | [skills/testing/SKILL.md](skills/testing/SKILL.md) |
| **07** | **提交规范** | Git 原子化提交、Conventional Commits 提交规范 | 提交记录 | [skills/git-commit/SKILL.md](skills/git-commit/SKILL.md) |

> 上表交付物路径一律以**目标项目根目录**为基准。本仓库只承载规范，不存放任何阶段的交付物。

---

## 三、各阶段流转指引

```
[00 前置检查] ──> [01 需求分析] ──> [02 架构分析] ──> [03 PRD 撰写]
                                                          │
                                                          ▼
[06 实现与测试] <── [05 接口规范] <── [04 UI/UX 设计]
       │
       ▼
[07 提交规范]
```
> 生产故障处理属人工 runbook，不在本链路内；AI 参与缺陷修复时按阶段 06 的缺陷修复纪律执行。
> 全流程底层网络与环境应急统一由 00. 前置检查 提供支持与容错保障。

1. **阶段准入**：每进入一个新阶段，AI 必须读取该阶段对应的 `SKILL.md`，并输出一句话确认当前规则已载入。
2. **阶段交付物**：严禁无交付物跨阶段流动。
3. **阶段阻断**：任何阶段遇到环境或网络问题，严格依照 [skills/preflight/SKILL.md](skills/preflight/SKILL.md) 执行，禁止死循环盲试。
