# **코리아 IT 아카데미 KDT**
## DBMS with 파이썬 연결

### DBMS의 소통 방식
```
-----------------------------------------------------
         사용자
-----------------------------------------------------
   ↕               ↕
고객 관리 응용프로그램      ↕   주문 관리 응용프로그램
   ↕               ↕
-----------------------------------------------------
         DBMS
-----------------------------------------------------
```
### MySQL 기본 세팅
```
	1) 로그인
		> mysql -u root -p
		> 1234


	2) 기본 데이터베이스 선택
			> use mysql;

	3) 로컬에서만 접속 가능한 계정 생성
			> create user 'userid'@localhost identified by '비밀번호';


	4) 원격으로도 접속 가능한 계정 생성
			> create user 'userid'@'%' identified by '비밀번호';
	
	5) 데이터베이스 생성
			> create database [데이터베이스 이름];

	6) 데이터베이스 사용
			> use [데이터베이스 이름];

	7) 데이터베이스 삭제
			> drop database [데이터베이스 이름];

	8) 사용자 비밀번호 변경
			> set password for 'userid'@'%' = '신규 비밀번호';

	9) 사용자 삭제
			> drop user 'userid'@'%'; 또는 'userid'@localhost;

	10) 연결 권한
			> grant all privileges on *.* to 'userid'@'%' with grant option;

	11) 권한 관련 명령어 확정
			> flush privileges;
```

## DDL(Data Definition Language): 데이터 정의어
```
	- 테이블을 조작하거나 제어할 수 있는 쿼리문

   	1. create: 테이블 생성
      	create table [테이블명] ([컬럼명] [자료형(용량)] [제약조건], ...);

   	2. drop: 테이블 삭제
      	drop table [테이블명];

   	3. alter: 테이블 수정
      	- 테이블명 수정
         		alter table [테이블명] rename [새로운 테이블명]
      	- 컬럼 맨 뒤에 추가
         		alter table [테이블명] add [컬럼명] [자료형] [제약조건];
      	- 컬럼 맨 앞에 추가
         		alter table [테이블명] add [컬럼명] [자료형] [제약조건] first;
      	- 컬럼 지정 위치에 추가
         		alter table [테이블명] add [컬럼명] [자료형] [제약조건] after [기존 컬럼명];
      	- 컬럼 삭제
         		alter table [테이블명] drop [컬럼명];
      	- 컬럼명 변경
         		alter table [테이블명] change [기존컬럼명] [변경할 컬럼명] [컬럼타입];
      	- 컬럼 타입 변경
         		alter table [테이블명] modify [컬럼명] [변경할 컬럼타입];
      	- 제약 조건 확인
         		desc [데이터베이스명].[테이블명];
      	- 제약 조건 추가
         		alter table [테이블명] add constraint [제약조건 이름];
      	- 제약 조건 삭제
         		alter table [테이블명] drop constraint [제약조건 이름];

   	4. truncate: 테이블 내용 전체 삭제
      	truncate table [테이블명];
```

### 자료형(TYPE)
용량은 항상 넉넉하게 주도록 한다.
```
	- 정수
      		tinyint
      		smallint
      		mediumint
      		int
      		bigint

   	- 실수
      		decimal(m, d) : m자리 정수, d자리 소수점으로 표현

   	- 날짜
      		date : 1000-01-01 ~ 9999-12-31(3byte)
      		time : -838:59:59 ~ 838:59:59(3byte)
      		datetime : 1000-01-01 00:00:00 ~ 9999-12-31 23:59:59(8byte)

   	- 문자
      		char(m) : 고정 길이 문자열(0~255)
      		varchar(m) : 가변 길이 문자열(0~65535)

	- Boolean
		MySQL에서는 tinyint를 사용하는 것이 가장 좋다.
		bit(1)로 설정해도 어차피 byte 단위로 데이터를 저장하고,
		bool, boolean으로 설정해도 자동으로 tinyint로 변경된다.
		만약 값에 의미부여를 하고 싶다면, varchar로 설정한 뒤
		check 제약조건으로 이상 데이터 삽입을 막아준다.
		enum을 사용하면 정규화를 위반하게 되며, 설정해놓은 데이터 수정이 어렵고
		다른 DBMS로 이관할 경우, MySQL에만 존재하는 enum을 모두 다른 타입으로 변경해야한다.
		만약 enum을 사용하고자 한다면, 정규화 위반이 가능하도록 약속했고, 유일하고 변하지 않은 값이며,
		2~10개의 값일 경우에만 사용한다.
```


## join
여러 테이블에 흩어져 있는 정보 중 <br>
사용자가 필요한 정보만 가져와서 가상의 테이블처럼 만들고 결과를 보여주는 것.<br>
정규화를 통해 조회 테이블이 너무 많이 쪼개져 있으면,<br>
작업이 불편하기 때문에 조회의 성능을 향상시키고자 join을 사용한다.<br>

### 내부 조인(inner join)
조건에 일치하는 값만 합쳐서 조회
```
	from [테이블명]
	inner join [테이블명]
	on 조건식
	inner join [테이블명]
	on 조건식
	inner join [테이블명]
	on 조건식
	inner join [테이블명]
	on 조건식
	...
```
- 등가 조인
	- on절에 등호가 있을 때, 서로 관계를 맺고 있는 테이블끼리 JOIN할 때 자주 사용된다.

- 비등가 조인
	- on절에 등호가 없을 때, 서로 관계를 맺지 않고 있는 테이블끼리 JOIN할 때 주로 사용된다.

### 외부 조인(outer join)
조건에 일치하지 않아도 원하는 정보까지 합쳐서 조회
- left outer join
	- 선행 테이블의 모든 정보를 가져오고 싶을 때 사용한다.

- right outer join
	- 후행 테이블의 모든 정보를 가져오고 싶을 때 사용한다.

### 옵티마이저(Optimizer)
- SQL을 가장 빠르고 효율적으로 수행할 최적의 처리경로(최저비용)을 생성해주는 DBMS 내부의 핵심 엔진
- 사용자가 쿼리문(SQL)으로 결과를 요청하면, 이를 생성하는 데 필요한 처리경로는 DBMS에 내장된 옵티마이저가 자동으로 생성한다.
- 옵티마이저가 생성한 SQL 처리경로를 실행 계획(Execution Plan)이라고 한다. <br>
**COST**: 예상 수행 시간, 쿼리를 수행하는 데 소요되는 일량 또는 시간 <br> <br>
**CARDINALITY**: 실행 결과의 건수

### MySQL 설치할때 주의할점
1. 제어판에 mysql이 설치되어 있는 지 확인
2. cmd창 > mysql -u root -p > 1234(비밀번호)

### MySQL 기초 문법
- 데이터베이스 생성 create database [데이터베이스명];
- 사용할 데이터베이스 선택 use [데이터베이스명];
- CRUD 작성
- mysql 언더바 + 소문자
