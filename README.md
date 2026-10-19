# personal-development-workflow

> 面向个人开发者的端到端、高度自动化的 AI 驱动编程工作流规范。

---

## 📖 项目简介

本项目旨在构建一套规范化、自动化的 AI 编程工作流。通过以 **`AGENTS.md`** 为统一调度总控，结合各生命周期阶段专属的 Skill 工具链与严格的质量基线，指导 AI 智能体规范完成从前置自检、需求打磨、架构设计、编码实现到测试运维的完整研发闭环，彻底消除 AI 盲目猜测、机械黑话和低效返工。

---

## ⚙️ 前置准备与网络代理策略 (Prerequisites)

在开始任何项目开发任务前，AI 必须首先执行环境自检，确认环境基线是否就绪：

### 网络受限与 Clash 代理处理 SOP

当 AI 在执行拉取 Docker 镜像、GitHub 访问/克隆/推送等外网操作遭遇网络超时或阻断时，必须遵循以下处理策略：

```
[检测到网络受阻]
       │
       ▼
[Step 1: 尝试默认代理] ──> 访问本地 Clash 默认端口 127.0.0.1:7890
       │
    失败 / 不可达
       ▼
[Step 2: 主动询问交互] ──> 严禁静默报错或无限死循环重试！
                         立即主动询问用户：“检测到当前网络无法访问，默认 7890 端口不可用，请问您的代理端口号是多少？”
```

### Stitch MCP 原型工具集成配置

为实现 UI 原型的自动化生成，推荐接入 Google Stitch MCP 服务：
1. 访问设置页：前往 [Stitch Settings](https://stitch.withgoogle.com/settings) 获取并配置 Stitch MCP。
2. 导入配置：将 Stitch MCP 配置到当前 Coding Agent 的 MCP 服务设置中。
3. 自动化联动：配置完成后，智能体在 UI/UX 设计阶段可通过 MCP 协议直接与 Stitch 通信，自动推演原型并落盘至 `docs/stitch/` 目录。

---

## 🔄 全生命周期研发流程

整个工作流严格按照研发次序推进，每个阶段均设定了准入与准出标准：

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│ 0. 前置检查   │ ──> │ 1. 需求分析   │ ──> │ 2. 架构设计   │ ──> │ 3. 研发与规范 │ ──> │ 4. 交付与运维 │
└──────────────┘     └──────────────┘     └──────────────┘     └──────────────┘     └──────────────┘
  - 环境/工具探测       - /grill-me 质询     - 系统技术架构推演    - UI/UX 界面设计      - Git 规范提交
  - 依赖技能核验       - 产出标准 PRD        - 接口契约规范定义    - 多智能体协同开发    - 线上 Bug 溯源闭环
  - Clash 网络联通性                         - 技术可行性决策      - 自动化测试与验收
```

### 阶段与规范详细定义

| 阶段 | 模块 | 核心执行规则与产出 |
| :--- | :--- | :--- |
| **0. 前置检查** | 环境与网络预检 | 验证必要 CLI 工具、预检 Clash 7890 端口连通性 |
| **1. 需求分析** | 需求研读与 PRD 撰写 | 结合设计树与严苛质询深入推演，深挖场景与异常分支，最终输出无歧义 PRD |
| **2. 架构分析** | 技术架构与方案推演 | 评估系统依赖、模块边界、数据流向及技术选型可行性，产出技术方案或 ADR 记录 |
| **3. 规范定义** | UI/UX 与接口契约 | 在根目录产出 DESIGN.md 并导入 Stitch 生成原型放置于 docs/stitch 目录；制定统一 RESTful/RPC 接口文档与契约 |
| **4. 开发协同** | 多智能体协作与实现 | 主 Agent 与子 Agent 职责隔离与并行协作，严格按架构与接口契约实现业务逻辑 |
| **5. 测试规范** | 质量防线与验收 | 编写单元测试、端到端集成测试，严格以真实验证数据作为任务通过标准，严禁破坏已有测试 |
| **6. 提交规范** | 版本控制与提交 | 严格遵循 Conventional Commits 规范，保证提交具备原子性与可溯源性 |
| **7. 运维保障** | 正式上线与 Bug 处理 | 规范化日志排查、故障复现实验、最小化修复与回归测试验证闭环 |

---

## 📚 参考与致谢 (References & Acknowledgements)

本项目在设计人机协作与需求分析规范时，参考并内置了以下优秀开源项目的核心理念，均遵循其开源协议（MIT License）：

1. **[gpt-with-taste](https://github.com/NB-Corp/gpt-with-taste)** (MIT License, Copyright (c) 2026 NB-Corp)
   - 核心理念：高品味、高密度自然工程师人话沟通，消除防御性免责声明与过度客套。
   - 归档路径：`references/gpt-with-taste/`（仅供设计参考与理念沉淀，不作为运行时外部 skill 依赖）
2. **[grill-me](https://github.com/mattpocock/skills/tree/main/skills/productivity)** (MIT License, Copyright (c) Matt Pocock)
   - 核心理念：通过多轮严苛面试与设计树（Design Tree）推演，消除隐式假设，全面打磨需求。
   - 归档路径：`references/grill-me/`（设计理念已完全吸收并内化至 `skills/requirements/SKILL.md`）
3. **[architect (nagi-studio/skills)](https://github.com/nagi-studio/skills/tree/main/skills/pondering/architect)** (MIT License, Copyright (c) 2026 Nagi Studio)
   - 核心理念：真实约束提取、优先成熟稳妥技术、比选两至三套方案并明确推荐理由。
   - 归档路径：`references/architect/`（设计理念已完全吸收并内化至 `skills/architecture/SKILL.md`）

---

## 📂 仓库目录设计

```text
personal-development-workflow/
├── AGENTS.md               # AI 调度中枢：各阶段规范索引与优先级控制
├── README.md               # 工作流设计理念与全局操作指南
├── DESIGN.md               # 界面视觉设计系统、上下流式布局与全状态交互契约
├── skills/                 # 各阶段工作流专属规范库：00至09阶段
│   ├── preflight/          # 00. 前置检查
│   ├── requirements/       # 01. 需求分析
│   ├── architecture/       # 02. 架构分析
│   ├── prd/                # 03. PRD 文档撰写
│   ├── ui-ux/              # 04. UI/UX 界面设计
│   └── ...
├── references/             # 开源设计参考与 MIT 协议归档：gpt-with-taste、grill-me 与 architect
└── docs/                   # 核心设计交付物与规范
    ├── prd/                # 沉淀的 PRD 需求文档
    └── stitch/             # 由 Stitch（https://stitch.withgoogle.com/）根据 DESIGN.md 生成的原型页面实现方案
```

---

## 🚀 推荐协作工作流 (How to Start)

1. **载入总控**：AI 接入项目后，首要动作读取 `AGENTS.md`。
2. **环境预检**：AI 自主巡检前置条件（基础环境依赖、网络连通性）。
3. **需求攻坚**：
   - 自然人话沟通，消除多余机械客套；
   - 收到业务需求后，AI 结合设计树与关键质询与用户打磨设计边界，随后落笔 PRD 沉淀到 `docs/prd/` 目录。
4. **架构决策**：提取现实硬约束，比选两至三套技术方案并确立推荐栈，输出环境依赖清单。
5. **界面原型落地**：
   - 依据 PRD 与设计规范，在根目录生成 `DESIGN.md`；
   - 借助已配置在 Coding Agent 中的 Stitch MCP 服务，或访问 https://stitch.withgoogle.com/ 生成高保真交互原型，统一归档到 `docs/stitch/` 目录，作为前端页面开发落地的唯一实体方案。
6. **接口定义与编码**：依据架构、接口契约与 `docs/stitch/` 原型逐项展开高质量编码与测试闭环。

---

## 🗺️ 待办事项 (Roadmap)

- [ ] 细化并补齐 `skills/` 下 00~09 各阶段标准操作指南（SOP）
- [ ] 任务交接队列与待确认交接机制演进实现（待下一次优化中落地）
- [ ] 编写 Clash 代理连通性自动探测与交互提示脚本
- [ ] 完善上线后 Bug 排查的标准 SOP 模板与回滚规范
