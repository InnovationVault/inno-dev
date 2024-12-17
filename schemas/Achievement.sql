create table Achievement (
    id int primary key auto_increment,
    title varchar(50), -- 标题
    type int, -- 类型
    abstract varchar(255), -- 摘要
    detail varchar(255), -- 详情
    content text, -- 内容
    cover varchar(255), -- 封面
    attachments json, -- 附件
    created datetime,
    team int,
    status int
)