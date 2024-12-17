create table Team (
    id int primary key auto_increment,
    name varchar(50), -- 团队名称
    description varchar(255), -- 团队简介
    realm varchar(255), -- 研究领域
    created datetime, -- 创建时间
    creator int -- 创建人
)