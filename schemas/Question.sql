create table Question (
    id int primary key auto_increment,
    user_id int,
    title varchar(50), -- 标题
    content varchar(255),
    created datetime,
    status int
)