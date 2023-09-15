create database test;

/*등록하고 아래 사용하고 왼쪽에서 새로고침까지*/
use test;

create table tbl_guest(
	/*	양수만 자료형(0~42억까지) 시퀀스만들기  */
	guest_id int unsigned auto_increment primary key,
	guest_email varchar(500) not null unique,
	guest_password varchar(500) not null,
	guest_age tinyint unsigned
);
/*fk는 오라클과 똑같다*/

select * from tbl_guest;

alter table tbl_guest add column(birth date);

insert into tbl_guest
(guest_email, guest_password, guest_age)
values('friend_7-9@naver.com', '1234', 20);


/*연결*/
select concat(guest_age, '살') from tbl_guest;
/*현재 시간*/
select current_timestamp() from dual;
/*형식 변경*/
select date_format(current_timestamp(), '%Y년 %m월 %d일 %H: %i: %s') from dual;

select guest_email, ifnull(birth, current_timestamp()) birth from tbl_guest;
 
