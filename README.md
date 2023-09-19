# **코리아 IT 아카데미 앱개발**
## DBMS 수업정리

# Oracle
### DB(Database)
데이터가 모여 있는 기지 <br>
추상적인 용어

### DBMS(Database Management System)
DB를 관리할 수 있는 구체적인 체계(시스템)
```
Oracle, MariaDB, MySQL, MS-SQL, MongoDB, Mongoose, ...
```

### 오라클 DBMS 버전
```
9 11 17 21 -> 무조건 홀수 버전 써야됨 -> 짝수는 snapshot이 있음 -> 만들어봤는데 한번 써봐 이런거기 떄문에 못씀.
이상하면 책임 안짐 (버전 10 12 20) -> 9i 11g 19c 21c 요런버전들이 있다.

i : internet
g : grid
c : cloud		-> 이버전에서는 저런게 된다.	-> cloud가 "MSA" 때문에 뜸 -> ex) 배달의 민족 -> Micro Service Architect
```

### 오라클 DBMS 설치 - 11g
```
https://drive.google.com/file/d/1rM1Z7-mA6vjySBgwWLr3ZI883xiL27HN/view?usp=sharing
```
cmd창 키고 -> sqlplus sys as sysdba 친다. 비밀번호 1234

### 계정
```
sys    :  모든 권한
system :  계정 관리
일반계정  : 스키마 관리
```

### 스키마
정리가 잘 되어 있는 표들의 묶음, 상태

### 일반 계정 접속(hr)
```
cmd 접속 > sqlplus system/1234
SQL> show user
SQL> alter user hr account unlock;
SQL> alter user hr identified by hr;
SQL> conn hr/hr
SQL> show user
USER is "HR"
```

### IDE 설치 - DBeaver
```
https://dbeaver.io/download/
```

### New Connection
```
host(서버의 IP주소) : localhost
Database : XE
```

### Edit Driver Settings
Libraries 탭 클릭 <br>
- 기존에 있는 라이브러리 전체 삭제
- Add File
- C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar 추가
- 확인
- Test Connection 클릭
- Connected 성공

### DBMS의 소통 방식
```
----------------------------------------------
		사용자
----------------------------------------------
		  ↕
		응용 프로그램
		  ↕
----------------------------------------------
		DBMS
----------------------------------------------
```

### RDBMS(관계형 데이터베이스 시스템)
테이블끼리 서로 관계를 맺는다
```
Table A(User, Member, Group)		TableB(Order, Product, Market, Sales, Goods)

번호(PK)	이름	나이	아이디		주문번호(PK)	번호(FK)	날짜		상품수량
1	손진혁	20	sjh1234		20230201001	2	2023-02-01	10
2	양수찬	20	ysc8888		20230201002	4	2023-02-01	50
3	김인진	20	kij7777		20230202001	1	2023-02-01	100
4	김보령	19	kbr8888		20230203001	2	2023-02-03	500
```
- 이러한 구조를 가지는 것을 Table, Relation(오라클), Classs라고 부른다

### DBMS 데이터 형식
```
COLUMN(열, 속성, 필드)
	동일한 성격의 값의 주제를 정한 집합.

ROW(행, 튜플, 레코드)
	하나의 정보

PRIMARY KEY(PK)
	고유한 값, 각 행의 구분점으로 사용된다.
	중복이 없고 NULL값을 허용하지 않는다.	

FOREIGN KEY(FK)
	다른 테이블의 PK를 의미한다.
	테이블끼리 관계를 맺을 때 사용한다.
	중복이 가능하고 NULL도 허용한다.
	관계: FK있는 것은 무조건 1:N 중의 N이다.

UNIQUE(UK)
	NULL은 허용하지만 중복을 허용하지 않는다.

조합키(복합키)
	하나의 PK에 여러 컬럼이 설정된 키
	각 컬럼은 중복이 가능하지만 그룹으로는 중복이 불가능하다.
	조합키로 설정된 경우에는 중복이 없다.

슈퍼키와 서브키******(중요함)
	여러 테이블에 공통요소가 있을 때 하나로 묶어줄 테이블을 선언한다.
	이 때 공통요소를 묶은 테이블의 PK를 각 테이블의 FK로 설정함과 동시에 PK로 설정하면
	공통요소를 묶은 테이블의 PK를 슈퍼키라고 하며, 각 테이블의 PK를 서브키라고 한다.
```

### 컴파일 언어와 스크립트 언어
- 컴파일 언어 <br>
	파일 단위로 해석한다(일괄 처리). <br>
	부분 수정이 거의 없을 떄 효율적이다. 

- 스크립트 언어 <br>
	한 줄 단위로 해석한다(개별 처리). <br>
	빈번한 수정 시 효율적이다. <br>
	번역 파일 없이 바로 실행.

# SQL문(쿼리문)
- DDL, DML(회사에서 쓰는거), DCL, TCL
- 스크립트 언어, 데이터베이스와 소통하는 언어.

## DDL(Data Definition Language)
```
1. CREATE : 테이블 생성
  CREATE TABLE [테이블명]([컬럼명][자료형(용량)] [제약조건,...]);

2. DROP : 테이블 삭제
  DROP TABLE [테이블명];		

3. ALTER : 테이블 수정
  ALTER TABLE [테이블명]

  - 테이블 이름 수정   : RENAME TO [새로운 테이블명]
  - 컬럼 추가 	       : ADD([새로운 컬럼명] [자료형(용량)]
  - 컬럼명 변경 	       : RENAME COLUMN [기존 컬럼명] TO [새로운 컬럼명]
  - 컬럼 삭제	       : DROP COLUMN [기존 컬럼명]

4. TRUNCATE : 테이블 내용 전체 삭제
  TRUNCATE TABLE [테이블명];
```

### 자료형(TYPE)
용량은 항상 넉넉하게 주도록 한다.
```
숫자
  NUMBER	        : 정수(default) 
  NUMBER(n, 0(생략))	: 정수
  NUMBER(n, m)		: 실수

문자열
  CHAR(n)	: 고정형, CHAR(4)에 'A'를 넣으면 A^^^, 길이가 절대 변하지 않는 값을 넣을 때 사용.
  VARCHAR(n), VARCHAR2(n)(요걸로써야됨) : 가변형, 값의 길이만큼 공간이 배정된다.

날짜
  DATE: FORMAT에 맞춰서 날짜를 저장하는 타입
```

### 무결성
데이터의 정확성, 일관성, 유효성이 유지되는 것. <br>

- 정확성: 데이터가 애매하지 않아야 한다.
- 일광성: 각 사용자가 일관된 데이터를 볼 수 있도록 해야한다.
-	유효성: 데이터가 실제 존재하는 데이터여야 한다. <br>

1. 개체 무결성 <br>
  모든 테이블이 PK로 선택된 컬럼을 가져야 한다.		

2. 참조 무경성 <br>
  두 테이블의 데이터가 항상 일관된 값을 가지도록 유지하는 것.

3. 도메인 무결성 <br>
  컬럼의 타입, NULL 값의 허용 등에 대한 사항을 정의하고 <br>
  올바른 데이터가 입력되었는 지를 확인하는 것.

### 모델링(기획)
추상적인 주제를 DB의 구조에 맞게 설계하는 것.
```
1. 요구사항 분석
	회원, 주문, 상품 : 3가지를 모두 관리하고 싶습니다.

2. 개념적 설계(개념 모델링)
	회원		주문		상품
	회원 번호		주문 번호		상품 번호
	회원 아이디		주문 날짜		상품 이름
	회원 비밀번호	회원 번호		상품 가격
	회원 이름		상품 번호		상품 재고
	회원 주소		주문 개수
	회원 이메일
	회원 생일
	회원 핸드폰 번호

3. 논리적 설계
	회원		주문		상품

	회원 번호PK	주문 번호PK	상품 번호PK
	회원 아이디UK	주문 날짜NN	상품 이름NN
	회원 비밀번호NN	회원 번호FK	상품 가격NN
	회원 이름NN	상품 번호FK	상품 재고NN, D(0)
	회원 주소NN	주문 개수C, D(1)
	회원 이메일UK
	회원 생일
	회원 핸드폰 번호UK

4. 물리적 설계
	TBL_MEMBER
	---------------------------------
	MEMBER_ID: NUMBER PK_MEMBER
	---------------------------------
	MEMBER_IDENTIFICATION: VARCHAR2 NOT NULL UNIQUE
	MEMBER_PASSWORD: VARCHAR2 NOT NULL
	MEMBER_NAME: VARCHAR2 NOT NULL
	MEMBER_ADDRESS: VARCHAR2 NOT NULL
	MEMBER_EMAIL: VARCHAR2 NOT NULL UNIQUE
	MEMBER_BIRTH: DATE
	MEMBER_PHONE: VARCHAR2 NOT NULL UNIQUE

5. 구현
```
```
1. 요구사항 분석
	꽃 테이블과 화분 테이블 2개가 필요하고,
	꽃을 구매할 때 화분도 같이 구매합니다.
	꽃은 이름과 색상, 가격이 있고,
	화분은 제품번호, 색상, 모양이 있습니다.
	화분은 모든 꽃을 담을 수 없고 알맞은 꽃들을 담아야 합니다.

2. 개념적 설계
	꽃		화분


	꽃 이름		화분 제품번호
	꽃 색상		화분 색상
	꽃 가격		화분 모양
			꽃 이름	
			꽃 색상
3. 논리적 설계
	꽃		화분


	꽃 이름PK		화분 제품번호PK
	꽃 색상PK		화분 색상NN
	꽃 가격NN		화분 모양NN
			꽃 이름FKNN	
			꽃 색상FKNN
4. 물리적 설계
	TBL_FLOWER
	---------------------------------
	FLOWER_NAME: VARCHAR2 PK_FLOWER
	FLOWER_COLOR: VARCHAR2 PK_FLOWER
	---------------------------------
	FLOWER_PRICE: NUMBER NOT NULL


	TBL_POT
	---------------------------------
	POT_ID: NUMBER PK_POT
	---------------------------------
	POT_COLOR: VARCHAR2 NOT NULL
	POT_SHAPE: VAHCHAR2 NOT NULL
	FLOWER_NAME: VARCHAR2 FOREIGN KEY NOT NULL
	FLOWER_COLOR: VARCHAR2 FOREIGN KEY NOT NULL

5. 구현
```
```
1. 요구사항 분석
	동물병원을 오픈하려고 합니다.
	동물의 종과 이름, 나이, 병명이 필요하고
	보호자의 이름, 나이, 주소, 핸드폰 번호가 필요합니다.
	한 명의 보호자는 여러 동물을 등록할 수 있어야 합니다.

2. 개념적 설계
	동물		보호자
	

	동물 종		보호자 이름
	동물 이름		보호자 나이
	동물 나이		보호자 주소
	동물 병명		보호자 핸드폰번호
			동물 종
3. 논리적 설계
	동물		보호자
	

	동물 종PK		보호자 이름PK
	동물 이름NN	보호자 나이NN
	동물 나이NN	보호자 주소NN
	동물 병명NN	보호자 핸드폰번호NN
			동물 종NN FK

4. 물리적 설계
	TBL_ANIMAL
	---------------------------------
	ANIMAL_TYPE: VARCHAR2 PK_ANIMAL
	---------------------------------
	ANIMAL_NAME: VARCHAR2 NOT NULL
	ANIMAL_AGE: NUMBER NOT NULL
	ANIMAL_DISEASE: VARCHAR2 NOT NULL


	TBL_CUSTOMER
	---------------------------------
	CUST_NAME: VARCHAR2 PK_CUST
	---------------------------------
	CUST_AGE: NUMBER NOT NULL
	CUST_ADDRESS: VARCHAR2 NOT NULL
	CUST_PHONE: VARCHAR2 NOT NULL
	ANIMAL_TYPE: VARCHAR2 FOREIGN KEY NOT NULL	

5. 구현
```

## DML(Data Manipulation Language)
```
1. SELECT : 조회(검색)
	SELECT [컬럼명, ...]
	FROM [테이블명]
	WHERE [조건식]

2. INSERT : 추가
	1) 컬럼은 전부 다 작성하지 않아도 되고 필요한 컬럼만 작성할 수 있다.
	INSERT INTO [테이블명] ([컬럼명, ...])
	VALUES([값, ...]);							// 전체 데이터 다 넣고 싶지 않을때
	
	2) 모든 값을 전부 순서대로 작성해야 되며, 컬럼명은 직접 작성하지 않아도 된다.
	INSERT INTO [테이블명]
	VALUES([값, ...])

3. UPDATE : 수정
	UPDATE [테이블명]
	SET [기존 컬러명] = [값], [기존 컬럼명] = [값], ...
	WHERE [조건식];

4. DELETE : 삭제
	DELETE FROM [테이블명]
	WHERE [조건식];
```

### 조건식
```
>, <		: 초과, 미만
>=, <=		: 이상, 이하
=		: 같다
<>, !=, ^=	: 같지않다.
AND		: 둘 다 참이면 참
OR		: 둘 중 하나라도 참이면 참
```

## TCL(Transaction Control Language)
- 트랜젝션
	- 하나의 서비스를 구현하기 위한 DML의 묶음			
	- DDL은 ROLLBACK이 안됨

- COMMIT
	- 모든 작업을 확정하는 명령어

- ROLLBACK
	- 이전 커밋시점으로 이동


## ★☆★☆★☆★정규화
삽입/수정/삭제의 이상 현상을 제거하기 위한 작업.

### 1차 정규화
- 같은 성격과 내용의 컬럼이 연속적으로 나타날 경우
- 하나의 컬럼에 여러 값이 연속적으로 나타날 경우
```
상품명
바지1, 상의2, 신발3

상품명1	상품명2	상품명3
바지1	상의2	신발3
```
※ 조회가 너무 힘들다. <br>
▶ 1차 정규화 진행
```
상품명
바지1
상의2
신발3
```

### 2차 정규화
- 조합키(복합키)로 구성되었을 경우 조합키의 일부분에만 종속되는 속성이 있을 경우
- 부분 함수 종속(Partial Functional Dependency)
```
FLOWER
이름	색상	꽃말	과
해바라기	노란색	행운	국화
장미	빨간색	사랑	장미
```
※ 이름에만 과가 종속된다. <br>
▶ 2차 정규화 진행
```	
FLOWER
이름	과

해바라기	국화
장미	장미		

FLOWER_LANGUAGE
이름	색상	꽃말

해바라기	노란색	행운
장미	빨간색	사랑
```

### 3차 정규화
- 이행 함수 종속성(Transitive Dependency)
- PK가 아닌 컬럼이 다른 컬럼을 결정하는 경우
```
회원번호	이름	시	구	동	우편변호
1	한동석	남영주시	화도읍	구암리	12345
2	문우람	서울시	관악구	봉천동	55555
3	차유진	서울시	강남구	역삼동	45645
4	정백교	서울시	성북구	종암동	88888
5	손진혁	서울시	영등포구	당산동	88887
```
※ 회원번호가 우편번호를, 우편번호가 시구동을 결정짓기 때문에 3차 정규화 대상이다.<br>
▶ 3차 정규화 진행
```	
회원번호	이름	우편번호
1	한동석	12345


우편번호	시	구	동
12345	남영주시	화도읍	구암리
```

### 데이터베이스에서 정규화가 필요한 이유
데이터베이스를 잘못 설계하면 불필요한 데이터 중복으로 인해 공간이 낭비된다. <br>
이런 현상을 이상(Anomaly)현상이라고 한다.
※ 회원번호와 프로젝트코드 두 컬럼의 조합키로 설정되어 있는 테이블이고 한 사람은 하나의 부서만 가질 수 있다.
```
회원번호		이름	부서	프로젝트코드	급여	부서별 명수
22080101	한동석	개발팀	ABC0001		3000	4
22080101	한동석	개발팀	DEF1112		2000	4
22080101	한동석	개발팀	CBA9474		4000	4
22080104	홍길동	기획팀	EFG0881		5000	2
22081106	이순신	디자인팀	GHI9991		6000	3
```
### 이상 현상의 종류
- 삽입 이상
	- 새로운 데이터를 삽입하기 위해 불필요한 데이터도 삽입해야 하는 문제
	- 담당 프로젝트 코드가 정해지지 않은 신입 사원이 있다면, <br>
	프로젝트 코드에 NOT NULL 제약조건이 있다면, 이 사원은 테이블에 추가될 수 없다. <br>
	따라서 '미정' 이라는 프로젝트 코드를 따로 만들어서 삽입해야 한다.
- 갱신 이상
	- 중복 행 중에서 일부만 변경하여 데이터가 불일치하게 되는 모순의 문제
	- 한 명의 사원은 반드시 하나의 부서에만 속할 수 있다. <br>
	만약 "한동석"이 보안팀으로 부서를 옮길 시 3개 모두 갱신해주지 않는다면, <br>
	개발팀인지 보안팀인지 알 수 없다.

- 삭제 이상
	- 행을 삭제하면 꼭 필요한 데이터까지 함께 삭제되는 문제
	- "이순신"이 담당한 프로젝트 박살내서 드랍된다면, "이순신" 행을 모두 삭제하게 된다. <br>
	따라서 프로젝트에서 드랍되면 회사에서도 드랍된다. <br>

▶ 2차 정규화 진행
```
회원번호		이름	부서	부서별 명수
22080101	한동석	개발팀	4
22080104	홍길동	기획팀	2
22081106	이순신	디자인팀	3

회원번호		프로젝트코드	급여
22080101	ABC0001		3000	
22080101	DEF1112		2000	
22080101	CBA9474		4000	
22080104	EFG0881		5000	
22081106	GHI9991		6000
```
▶  3차 정규화 진행
```
회원번호		이름	부서
22080101	한동석	개발팀	
22080104	홍길동	기획팀	
22081106	이순신	디자인팀	

부서	부서별 명수
개발팀	4
기획팀	2
디자인팀	3
```




# MySQL
- 웹 사이트와 다양한 애플리케이션에서 사용되는 DBMS이다.
- 오라클은 관리 비용이 고가이지만 MySQL은 저가형 데이터베이스이다.
- 문법이 간결하고 쉬우며, 메모리 사용량이 현저히 낮아서 부담없이 사용 가능하다.
                                                       
### MySQL 설치할때 주의할점
1. 제어판에 mysql이 설치되어 있는 지 확인
2. cmd창 > mysql -u root -p > 1234(비밀번호)

### MySQL 기초 문법
- 데이터베이스 생성 create database [데이터베이스명];
- 사용할 데이터베이스 선택 use [데이터베이스명];
- CRUD 작성
- mysql 언더바 + 소문자

### MySQL 자료형
```
정수
  tinyint
  smallint
  mediumint
  int <-- 이거 쓰세요	
  bigint
  
실수
  decimal(m, d): m자리 정수, d자리 소수점으로 표현
  
날짜
  date : 날짜
  time : 시간
  datetime : 날짜 + 시간
  
문자
  char(m): 고정 길이 문자열(0~255)
  varchar(m): 가변 길이 문자열(0~65535)
```
