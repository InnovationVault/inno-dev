create table Comment (
    id int primary key auto_increment,
    user_id int,
    qid int, -- Question ID,
    content varchar(255),
    created datetime
)