create table Question (
    id int primary key auto_increment,
    user_id int,
    title varchar(50), -- 标题
    type int, -- 针对成果/文章提问
    ref_id int, -- 对应ID
    content varchar(255),
    created datetime,
    status int
)