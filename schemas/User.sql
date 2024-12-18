create table User (
    id int primary key auto_increment,
    username varchar(50),
    email varchar(255) unique,
    password varchar(255),
    avatar varchar(255),
    name varchar(50),
    gender int,
    role int,
    status int,
    permission int, -- 权限
    created datetime
)