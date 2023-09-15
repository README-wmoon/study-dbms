use app;

create table tbl_board(
	board_id int unsigned auto_increment primary key,
	board_title varchar(500) not null,
	board_content varchar(500) not null,
	board_register_date datetime default current_timestamp(),
	board_update_date datetime default current_timestamp(),
	board_read_count int unsigned default 0,
	member_id int unsigned,
	constraint fk_board_member foreign key(member_id)
	references tbl_member(member_id) on delete cascade
);

select * from tbl_board;
INSERT INTO tbl_board
(board_title, board_content, member_id)
VALUES('테스트 제목1', '테스트 내용1', 1);










