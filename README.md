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

## SQL문(쿼리문)
- DDL, DML(회사에서 쓰는거), DCL, TCL
- 스크립트 언어, 데이터베이스와 소통하는 언어.

### DDL(Data Definition Language)
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
