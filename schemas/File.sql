create table File (
    id int primary key auto_increment,
    user_id int,
    name varchar(255),
    path varchar(255),
    created datetime
)