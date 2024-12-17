create table User {
    id int primary key auto_increment,
    username varchar(50),
    email varchar(255) unique,
    password varchar(255),
    avatar varchar(255),
    name varchar(50),
    role int,
    status int,
    created datetime
}