# personal-development-workflow

> 面向个人开发者的端到端、高度自动化的 AI 驱动编程工作流规范。

---

## 📖 项目简介

本项目旨在构建一套规范化、自动化的 AI 编程工作流。通过以 **`AGENTS.md`** 为统一调度总控，结合各生命周期阶段专属的 Skill 工具链与严格的质量基线，指导 AI 智能体规范完成从前置自检、需求打磨、架构设计、编码实现到测试运维的完整研发闭环，彻底消除 AI 盲目猜测、机械黑话和低效返工。

---

## ⚙️ 前置准备与网络代理策略 (Prerequisites)

网络受限与 Clash 代理处理统一见 [`skills/preflight/SKILL.md`](skills/preflight/SKILL.md) 第三、四节，本文件不复述。

### Stitch MCP 原型工具集成配置

为实现 UI 原型的自动化生成，推荐接入 Google Stitch MCP 服务：
1. 访问设置页：前往 [Stitch Settings](https://stitch.withgoogle.com/settings) 获取并配置 Stitch MCP。
2. 导入配置：将 Stitch MCP 配置到当前 Coding Agent 的 MCP 服务设置中。
3. 自动化联动：配置完成后，智能体在 UI/UX 设计阶段可通过 MCP 协议直接与 Stitch 通信，自动推演原型并落盘至 `docs/stitch/` 目录。

---

## 🔄 全生命周期研发流程

阶段编号、职责、门禁与准出交付物以 [`AGENTS.md`](AGENTS.md) 第二节为唯一真源。当前为 00~08 共 9 个阶段，本文件不再维护副本。

---

## 📚 参考与致谢 (References & Acknowledgements)

本项目在设计人机协作与需求分析规范时，参考并内置了以下优秀开源项目的核心理念，均遵循其开源协议（MIT License）：

1. **[gpt-with-taste](https://github.com/NB-Corp/gpt-with-taste)** (MIT License, Copyright (c) 2026 NB-Corp)
   - 核心理念：高品味、高密度自然工程师人话沟通，消除防御性免责声明与过度客套。
   - 归档路径：`references/gpt-with-taste/`（仅供设计参考与理念沉淀，不作为运行时外部 skill 依赖）
2. **[grill-me](https://github.com/mattpocock/skills/tree/main/skills/productivity)** (MIT License, Copyright (c) Matt Pocock)
   - 核心理念：通过多轮严苛面试与设计树（Design Tree）推演，消除隐式假设，全面打磨需求。
   - 归档路径：`references/grill-me/`（设计理念已吸收至 `skills/requirements/SKILL.md`，运行时依赖外部 `grilling` 技能；`/grill-me` 仅为其入口包装）
3. **[architect (nagi-studio/skills)](https://github.com/nagi-studio/skills/tree/main/skills/pondering/architect)** (MIT License, Copyright (c) 2026 Nagi Studio)
   - 核心理念：真实约束提取、优先成熟稳妥技术、比选两至三套方案并明确推荐理由。
   - 归档路径：`references/architect/`（设计理念已完全吸收并内化至 `skills/architecture/SKILL.md`）

---

## 📂 仓库目录设计

```text
personal-development-workflow/          # 本仓库：只承载规范
├── AGENTS.md               # AI 调度中枢：阶段索引、门禁与交付物清单
├── README.md               # 工作流设计理念与全局操作指南
├── skills/                 # 00~08 阶段规范库
│   ├── preflight/          # 00. 前置检查
│   ├── requirements/       # 01. 需求分析
│   ├── architecture/       # 02. 架构分析
│   ├── prd/                # 03. PRD 文档撰写
│   ├── ui-ux/              # 04. UI/UX 设计
│   ├── api-spec/           # 05. 前后端接口规范
│   ├── testing/            # 06. 实现与测试
│   ├── git-commit/         # 07. 提交规范
│   └── production-bug/     # 08. 上线后 Bug 处理
└── references/             # 上游设计参考与许可归档：gpt-with-taste、grill-me、architect

目标项目根目录/                          # 阶段 01 起按需生成，不属于本仓库
├── DESIGN.md                           # 阶段 04 产出
└── docs/
    ├── decisions-requirements.md       # 阶段 01 产出
    ├── decisions-architecture.md       # 阶段 02 产出
    ├── prd/<topic>.md                  # 阶段 03 产出
    ├── api/openapi.yaml                # 阶段 05 产出
    └── stitch/                         # 阶段 04 产出
```

---

## 🚀 推荐协作工作流 (How to Start)

1. **载入总控**：AI 接入项目后，首要动作读取 `AGENTS.md`。
2. **环境预检**：AI 自主巡检前置条件（基础环境依赖、网络连通性）。
3. **需求攻坚**：自然人话沟通，消除多余机械客套；结合设计树与关键质询打磨设计边界，落盘需求基线到 `docs/decisions-requirements.md`。
4. **架构决策**：提取现实硬约束，比选两至三套技术方案，落盘 `docs/decisions-architecture.md` 并输出环境依赖清单。
5. **PRD 沉淀**：依据需求基线与架构方案撰写 PRD，落到 `docs/prd/<主题>.md`。
6. **界面原型落地**：
   - 依据 PRD 与设计规范，在根目录生成 `DESIGN.md`；
   - 借助已配置在 Coding Agent 中的 Stitch MCP 服务，或访问 https://stitch.withgoogle.com/ 生成高保真交互原型，统一归档到 `docs/stitch/` 目录，作为前端页面开发落地的唯一实体方案。
7. **接口定义与编码**：依据架构、接口契约与 `docs/stitch/` 原型逐项展开高质量编码与测试闭环。

---

## 🗺️ 待办事项 (Roadmap)

- [ ] 补齐 `skills/testing`（06）与 `skills/git-commit`（07）两份空规范
- [ ] 任务交接队列与待确认交接机制演进实现（待下一次优化中落地）
- [ ] 编写 Clash 代理连通性自动探测与交互提示脚本
- [ ] 完善上线后 Bug 排查的标准 SOP 模板与回滚规范
