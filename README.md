# Innovation Vault

感谢你为 InnovationVault 组织作出的贡献！本仓库记录数据库表结构设计以及必要的业务逻辑梳理。

## 项目成员（排名不分先后）

- @PREPONDERANCE
- @WM-RF
- @Alexander-Bruce
- @cheng-lao

## 项目分支

- `main` 主分支（生产环境）

  用于生产环境的线上版本代码。不允许直接向 `main` 分支提交代码，需要通过 Pull Request 从 `dev` 分支合并代码。

- `dev` 开发分支（测试环境）

  用于测试新功能和最新的 bug 修改。不允许直接向 `dev` 分支提交代码，需要通过 Pull Request 从 其他 分支合并代码。

- `fix/xxx` bug 修复分支

  `xxx` 为相关 issue ID（下同），用于修复 bug，从 `dev` 分支拉取，修复完成后合并到 `dev` 分支。

- `feat/xxx` 新功能分支

  用于开发新功能，从 `dev` 分支拉取，开发完成后合并到 `dev` 分支。
