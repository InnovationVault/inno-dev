create table Reason (
    id int primary key auto_increment,
    reason varchar(255),-- 审核不通过理由
    ref_id int, -- 参考ID
    type int, -- 审核类型
    created datetime
)