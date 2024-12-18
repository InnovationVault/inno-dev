## User

**个人信息**

指的是在 `User` 表中的信息

**用户状态 Status**

| 值  | 含义                             |
| --- | -------------------------------- |
| -2  | 账号被删除                       |
| -1  | 账号被禁用                       |
| 0   | 有效                             |
| 1   | 待管理员审核（加入团队）         |
| 2   | 未通过管理员审核（未能加入团队） |
| 3   | 待管理员审核（个人简历信息）     |
| 4   | 未通过管理员审核（个人简历信息） |

**用户身份 Role**

| 值  | 含义             |
| --- | ---------------- |
| -1  | 普通用户（默认） |
| 0   | 团队成员         |
| 1   | 团队管理员       |
| 2   | 超级管理员       |

**用户权限 Permission**

| 值  | 含义                                         |
| --- | -------------------------------------------- |
| 0   | 默认权限（指普通用户，团队成员，超级管理员） |
| 1   | 发布科研成果                                 |
| 2   | 修改科研成果                                 |
| 4   | 删除科研成果                                 |
| 8   | 审核用户                                     |

二进制

- 0：0000
- 1：0001
- 2：0010
- 4：0100
- 8：1000
- 7：0101

## Article | Achievements

1. 内容均为硬删除
2. 只允许管理员撰写内容

**内容状态**

| 值  | 含义             |
| --- | ---------------- |
| -3  | 已隐藏           |
| -2  | 未通过审核       |
| -1  | 草稿             |
| 0   | 已发布           |
| 1   | 审核通过         |
| 2   | 待超级管理员审核 |

## Team

timeline 格式：[{time: "2024-11-02", event: "xxx 事件"}]

## Question && Comment

**Question 状态**

| 值  | 含义   |
| --- | ------ |
| -1  | 待回复 |
| 0   | 已完成 |
| 1   | 重复   |
| 2   | 无效   |

## 前台

1. 团队信息浏览：/unauthorized/team
2. 团队信息详情：/unauthorized/team/users -> 点击查看更多：/unauthorized/user/detail
3. 研究成果列表：/unauthorized/achievement/list -> 点击查看更多：/unauthorized/achievement
4. 文章列表：/unauthorized/article/list -> 点击查看更多：/unauthorized/article
5. 普通用户注册：/unauthorized/user/register （status=0, role=-1, permission=0），在 UserDetail 表中插入一行
6. 普通用户登录：/unauthorized/user/login
7. 普通用户个人信息：GET /user/profile， PUT /user/profile
8. 普通用户重置密码：/user/pwd 三件套
9. 互动交流（先登录）：
   - 获取文章/成果问题列表：/unauthorized/question/list （status < 2）
   - 获取文章/成果回复列表：/unauthorized/comment/list（status < 2）
   - 用户提问：dialog，/question
   - 用户回复：drawer，/comment

## 后台

### 个人信息管理（非超级管理员）

1. 个人信息：GET /user/profile， PUT /user/profile
2. 重置密码：/user/pwd 三件套
3. 个人简历信息：
   - 团队管理员：/team/detail
   - 团队成员：/user/detail

### 超级管理员

1. 创建团队管理员：/unauthorized/user/register （status=0, role=1, permission=8）
2. 删除团队管理员：DELETE /user （block=0）
3. 修改权限：/admin/permission
4. 内容审核：
   - 获取列表：/article/list & /comment/list （status=2）
   - 获取详情：/article & /comment
   - 进行审核：/verify

### 团队管理员

1. 团队信息管理：
   - 获取团队信息：/unauthorized/team
   - 修改团队信息：/team
2. 团队成员管理：
   - 获取成员列表：/user/list （0 ≤ status < 2）
   - 新增成员：/unauthorized/user/register（status=0, role=0, permission=0）
   - 修改成员简历：/team/detail
   - 审核团队成员简历修改：
     - 获取所有待审核名单：/user/list （status=3，role=0）
     - 获取详情：/user/detail
     - 审核：/verify
3. 成果/文章管理：
   - 获取成果/文章列表：/article/list & /comment/list
   - 查看成果/文章详情：/article & /comment
     - 获取不通过原因：/verify/result
   - 修改成果/文章：点击修改状态转为草稿 PUT /article & /comment
   - 发布成果/文章：/achievement/publish & /article/publish
   - 删除成果/文章：DELETE /achievement & /comment
   - 新增成果/文章：POST /achievement & /comment （存为草稿，提交审核）
4. 用户管理
   - 获取待审核列表：/user/list （status=1, role=-1）
   - 获取用户简历详情：/user/detail
   - 审核：/verify
   - 注销用户：DELETE /user （block=1）
   - 重置他人密码：/team/password
   - 设置团队管理员：/team/role
5. 留言管理
   - 获取列表：/question/list
   - 获取回复列表：/comment/list
   - 回复反馈：/comment/reply（回复评论后，默认将该问题标记为已完成）
   - 状态管理：/question/status

### 普通用户（已注册）

1. 加入团队：/team/enroll
2. 不通过原因：/verify/result
3. 个人简历修改（包括团队成员）：/user/detail

## 权限分配方法

二进制与运算：

| 值  | 含义                                         |
| :-- | :------------------------------------------- |
| 0   | 默认权限（指普通用户，团队成员，超级管理员） |
| 1   | 发布科研成果                                 |
| 2   | 修改科研成果                                 |
| 4   | 删除科研成果                                 |
| 8   | 审核用户                                     |

用户的权限是累加的。

如果一个团队管理员有发布，修改，审核用户的权限，那么 permission 字段值为 11。

在进行具体操作时，例如，进行成果发布时，由于 11 & 1 = 1，所以该团队管理员有发布权限。又例如，进行删除操作时，由于 11 & 4 = 0，所以该团队管理员没有删除权限。

## 获取问题列表关联用户状态

status < -1 显示用户已注销

## 注册账号

不管是管理员 / 用户自主注册，在 UserDetail 表中插入记录：uid，其他字段为空字符串

## 文章/成果状态

查看文章/成果时：

- 已发布：隐藏，删除，编辑
- 隐藏：取消隐藏，编辑，删除
- 草稿：删除，编辑，提交审核
- 审核中：撤回，删除
- 审核通过：发布，删除，编辑（单独列表）
- 审核不通过：删除，编辑（单独列表）
