# AGENTS.md — 项目 AI 开发总规范

## 基本原则
- 开始任务前，读取 README.md、相关设计文档及 TASKS.md。
- 根据任务类型读取下方对应的 SKILL.md；涉及多个领域时组合使用。
- 确认目标、修改范围和验收标准后再行编码；优先复用既有代码和约定。
- 数据删除、版本库重置、生产环境变更及密钥调用等高风险操作，仅在持有明确授权许可时执行。
- 任务交付时提交：变更清单、测试验证数据、系统指标偏差说明及同步更新的文档。

## 规范入口

### 前端规范
涉及 UI、页面、组件、交互或前端构建时，读取 .agents/skills/frontend/SKILL.md。

### 后端规范
涉及 API、业务逻辑、数据库、鉴权或后台服务时，读取 .agents/skills/backend/SKILL.md。

### 测试规范
涉及测试用例、自动化测试、缺陷修复或验收时，读取 .agents/skills/testing/SKILL.md。

### 多模型协作规范
涉及主 Agent、子 Agent、跨模型分工或并行开发时，读取 .agents/skills/multi-model/SKILL.md。

### 文档规范
涉及需求、设计、接口、任务、使用手册或版本记录时，读取 .agents/skills/documentation/SKILL.md。

### 工作流规范
涉及项目规划、阶段推进、任务拆解或交付管理时，读取 .agents/skills/workflow/SKILL.md。

## 优先级与冲突处理
- 判定优先级：用户明确要求 > 当前项目已确认的需求和技术约束 > AGENTS.md > 对应 SKILL.md > 通用实践。
- 出现规范冲突时，完整标明冲突细节，执行风险最低方案，并严格依照既定需求基线执行变更。
- 任务标记通过严格基于既定验收标准与真实验证数据。