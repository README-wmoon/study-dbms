create database star;
use star;

create table tbl_user(
	user_number int unsigned auto_increment primary key,
	user_id varchar(500) unique key not null,
	user_password varchar(100) not null,
	user_name varchar(100) not null,
	user_address varchar(500) not null,
	user_phonenumber varchar(100) not null,
	user_age int not null,
	user_gender varchar(100),
	user_status varchar(100) not null,
	user_title varchar(100),
	user_content varchar(500),
	user_star int
);
select * from tbl_user;

drop table tbl_user;

create table tbl_pet(
	pet_number int unsigned auto_increment primary key,
	pet_name varchar(100) not null,
	pet_type varchar(100) not null,
	pet_species varchar(100) not null,
	pet_age int not null,
	user_number int unsigned not null,
	foreign key(user_number) references tbl_user (user_number)
);
drop table tbl_pet ;
select * from tbl_pet;
create table tbl_use(
	use_number int unsigned auto_increment primary key,
	use_useddate datetime default current_timestamp,
	target_number int not null,
	use_status varchar(100) not null,
	user_number int unsigned not null,
	foreign key(user_number) references tbl_user (user_number)
);
drop table tbl_use;
create table tbl_report(
	report_id int unsigned auto_increment primary key,
	report_title varchar(500) not null,
	user_number int unsigned not null,
	report_content varchar(1000) not null,
	foreign key(user_number) references tbl_user (user_number),
	use_number int unsigned not null,
	foreign key(use_number) references tbl_use (use_number)
	);
drop table tbl_report;
create table tbl_quest(
	quest_id int unsigned auto_increment primary key,
	quest_category varchar(1000) not null,
	quest_content varchar(2000),
	user_number int unsigned not null,
	foreign key(user_number) references tbl_user (user_number),
	use_number int unsigned not null,
	foreign key(use_number) references tbl_use (use_number)
);
drop table tbl_quest;

create table tbl_review(
	review_number int unsigned auto_increment primary key,
	review_comment varchar(500) not null,
	review_date datetime default current_timestamp,
	review_updatedate datetime default current_timestamp,
	review_star int not null,
	use_number int unsigned not null,
	foreign key(use_number) references tbl_use (use_number)
);
drop table tbl_review;
create table tbl_board(
	board_number int unsigned auto_increment primary key,
	board_type varchar(1000) not null,
	board_title varchar(1000) not null,
	board_content varchar(1000),
	board_date datetime default current_timestamp,
	board_update datetime default current_timestamp
);
drop table tbl_board;
   

create table tbl_answer(
	answer_number int unsigned auto_increment primary key,
	answer_content varchar(2000),
	user_number int unsigned not null,
	foreign key(user_number) references tbl_user (user_number),
	board_number int unsigned not null,
	foreign key(board_number) references tbl_board (board_number)
);
drop table tbl_answer ;
create table tbl_file(
	file_number int unsigned auto_increment primary key,
	file_origin_name varchar(1000) not null,
	file_size int not null,
	file_image varchar(1000) not null,
	file_type varchar(100) not null,
	user_number int unsigned not null,
	foreign key(user_number) references tbl_user (user_number)
);
drop table tbl_file;

insert into tbl_user (user_number ,user_id,user_password,user_name,user_address,user_phonenumber,user_age,user_gender,user_status,user_star)
values(1,"rerr2@naver.com","12345","홍윤기","관악구","010-1234-1234",20,"남","normal",1);
insert into tbl_user (user_number ,user_id,user_password,user_name,user_address,user_phonenumber,user_age,user_gender,user_status,user_star)
values(2,"rerr@naver.com","12345","홍윤기","관악구","010-1234-1234",20,"남","normal",1);
insert into tbl_user (user_number ,user_id,user_password,user_name,user_address,user_phonenumber,user_age,user_gender,user_status,user_star)
values(3,"rerr3@naver.com","12345","홍윤기","관악구","010-1234-1234",20,"남","normal",1);

insert into tbl_user (user_id,user_password,user_name,user_address1,user_address2,user_address3 ,user_phonenumber,user_age,user_gender,user_email ,user_status,user_star)
(select tbl_user (user_id,user_password,user_name,user_address1,user_address2,user_address3 ,user_phonenumber,user_age,user_gender,user_email ,user_status,user_star from tbl_user)










