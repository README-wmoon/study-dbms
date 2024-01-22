create table tbl_translate(
    id bigint auto_increment primary key,
    original_content varchar(255) not null,
    translated_content varchar(255) not null
);

select * from tbl_translate;

create table tbl_ocr(
    id bigint auto_increment primary key,
    path varchar(255) not null,
    text varchar(255) not null
);

select * from tbl_ocr;