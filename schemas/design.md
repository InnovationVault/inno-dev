### User

| id  | username    | email        | password     | avatar       | role | status | created  |
| --- | ----------- | ------------ | ------------ | ------------ | ---- | ------ | -------- |
| pk  | varchar(50) | varchar(255) | varchar(255) | varchar(255) | int  | int    | datetime |

### UserDetail

| id  | user_id | title（职务） | research（研究方向） | reason（申请理由） | background（学术背景） | achievements（成果） |
| --- | ------- | ------------- | -------------------- | ------------------ | ---------------------- | -------------------- |
| pk  | int     | varchar(50)   | varchar(255)         | varchar(255)       | varchar(255)           | varchar(255)         |

### Team

| id  | name        | description（简介） | realm（领域） | created  | creator |
| --- | ----------- | ------------------- | ------------- | -------- | ------- |
| pk  | varchar(50) | varchar(255)        | varchar(255)  | datetime | int     |

### Achievement

| id  | title（标题） | type（类型） | abstract（摘要） | detail（详情） | content（内容） | cover（封面） | attachments（附件） | created  | team | status |
| --- | ------------- | ------------ | ---------------- | -------------- | --------------- | ------------- | ------------------- | -------- | ---- | ------ |
| pk  | varchar(50)   | int          | varchar(255)     | varchar(255)   | text            | varchar(255)  | json                | datetime | int  | int    |

### Article

| id  | title（标题） | type（类型） | abstract（摘要） | content（内容） | cover（封面） | attachments（附件） | created  | team | status |
| --- | ------------- | ------------ | ---------------- | --------------- | ------------- | ------------------- | -------- | ---- | ------ |
| pk  | varchar(50)   | int          | varchar(255)     | text            | varchar(255)  | json                | datetime | int  | int    |

### File

| id  | name（名称） | path（路径） | created  |
| --- | ------------ | ------------ | -------- |
| pk  | varchar(255) | varchar(255) | datetime |

### Reason

| id  | reason（审核不通过理由） | ref_id（参考 ID） | type（审核类型） | created  |
| --- | ------------------------ | ----------------- | ---------------- | -------- |
| pk  | varchar(255)             | int               | int              | datetime |

### Question

| id  | title       | content      | user_id | created  | status |
| --- | ----------- | ------------ | ------- | -------- | ------ |
| pk  | varchar(50) | varchar(255) | int     | datetime | int    |

### Comment

| id  | user_id | qid | content      | created  |
| --- | ------- | --- | ------------ | -------- |
| pk  | int     | int | varchar(255) | datetime |
