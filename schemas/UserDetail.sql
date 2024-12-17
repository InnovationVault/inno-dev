create table UserDetail {
    id int primary key auto_increment,
    user_id int,
    title varchar(50), -- 职务
    research varchar(255), -- 研究方向
    reason varchar(255), -- 申请原因
    background varchar(255), -- 学术背景
    achievements varchar(255) -- 学术成果
}