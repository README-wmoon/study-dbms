/*JOIN
 * 
 * 여러 테이블에 흩어져 있는 정보 중
 * 사용자가 필요한 정보만 가져와서 가상의 테이블처럼 만들고 결과를 보여주는 것.
 * 정규화를 통해 조회 테이블이 너무 많이 쪼개져 있으면 작업이 불편하기 때문에
 * 입력, 수정, 삭제의 성능을 향상시키기 위해서 JOIN을 통해 합친 후 사용한다.
 * 
 */

/*EMP 테이블 사원번호로 DEPT 테이블의 지역 검색*/

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT ENAME, LOC 
FROM DEPT D JOIN EMP E
ON D.DEPTNO = E.DEPTNO;

/*SQL 실행 순서*/
/*FROM > ON > JOIN > WHERE > GROUP BY > HAVING > SELECT > ORDER BY*/

/*PLAYER 테이블에서 송종국 선수가 속한 팀의 전화번호 검색하기*/
SELECT PLAYER_NAME, P.TEAM_ID, TEL 
FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID AND PLAYER_NAME = '송종국';

/*JOBS 테이블에서 JOB_ID로 직원들의 JOB_TITLE, EMAIL, 성, 이름 검색*/
SELECT * FROM JOBS;

SELECT JOB_TITLE, EMAIL, FIRST_NAME, LAST_NAME FROM 
(
	SELECT 

)

/*EMP 테이블의 SAL을 SALGRADE 테이블의 등급으로 나누기*/
/*EMPLOYEES 테이블에서 HIREDATE가 2003~2005년까지인 사원의 정보와 부서명 검색*/
/*JOB_TITLE 중 'Manager'라는 문자열이 포함된 직업들의 평균 연봉을 JOB_TITLE별로 검색*/
/*EMP 테이블에서 ENAME에 L이 있는 사원들의 DNAME과 LOC 검색*/
/*축구 선수들 중에서 각 팀별로 키가 가장 큰 선수들 전체 정보 검색*/
/*EMP 테이블에서 사원의 이름과 매니저 이름을 검색*/



