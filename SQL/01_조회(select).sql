-- system 계정으로 접근하고 계정을 생성하고 권한을 부여한다
--==========================================
-- 사용자 생성및 권한 부여 
-- 오라클에서 제공하는 객체를 만들고 수정하고 삭제
-- DDL
-- ctrl + enter
create user user01 IDENTIFIED by 1234;

-- 권한 부여 (접근, 리소스)
-- 실습테이블 생성
grant connect, resource to user01;
--=========================================
-- 실습용 테이블 생성
--=========================================
-- user01계정으로 접속을 생성
-- 사용자 계정으로 접속하여 실습스크립트를 실행


select *        -- 조회할 컬럼명을 나열, * 테이블이 가진 모든 컬럼을 조회
from employee;   -- 테이블 이름
--where
--order by ;
-- 테이블 이름 변경
-- sql 문장으로 실행 할 수도 있고 sqlDeveloper의 기능을 이용 할 수도 있다
rename department to dept;

-- 사원 테이블에서 사원의 이름, 급여, 입사일 을 조회 해보세요
SELECT  EMP_NAME, SALARY, HIRE_DATE
FROM    EMP
-- 조건절 
-- ~으로 시작하는, ~으로 끝나는, ~을 포함하는, ~과 일치하는
-- 날자, 숫자 비교
WHERE   EMP_NAME = '송종기';

-- 급여가 300만원 이상인 사원의 이름과 직급코드을 조회 하시요
SELECT  EMP_NAME, JOB_CODE
FROM    EMP
WHERE   SALARY >= 3000000
-- 정렬
-- ASC  - 오름차순(기본)
-- DESC - 내림차순
ORDER BY EMP_NAME desc;

-- 한줄주석
/* 
여러줄 주석

SELECT 구문 : 테이블에 있는 데이터를 조회 할때 사용
SELECT  컬럼명, ...
FROM    테이블명
WHERE   조건 AND(OR) 조건
ORDER BY    정렬컬럼

- SELECT절을 통해서 조회된 결과물을 RESULT SET이라고 한다(조회된 행들의 집합)
- SELECT절에 나열되는 컬럼명은 FROM절에 기술된 테이블에 존재 하는 컬럼 이여야 한다!!!!!!!!
*/
-- EMPLOYEE 테이블에서 전체 사원의 사번, 이름, 월급을 조회
-- 별칭주기
-- 컬럼명 별칭
-- as키워드를 붙일수도 있고 생략 할 수도 있다
-- 별칭에 공백이나 특수문자가 있는경우 ""로 묶어주어야 한다
SELECT EMP_ID AS "사번", EMP_NAME 사원명, SALARY as 월급
FROM EMP;

-- 대소문자를 가리지 않지만, 관례상 대문자로 작성한다

/*
    <컬럼 값을 통한 산술연산>
        SELECT 절에 컬럼명 입력 부분에서 산술 연산을 이용해서 결과를 조회할 수 있다.
*/
select EMP_NAME, salary, salary * 12, bonus
from emp;

-- 보너스 구하기 (보너스율 * 급여)
-- 보너스율과 보너스를 함께 출력
-- 보너스를 포함한 급여 구하기
-- null은 연산 결과는 null ---------> nvl(컬럼, 별경할값)함수를 이용해서 null이면 0으로 치환
-- nvl(bonus,0) : bonus컬럼의 값이 null 이라면 0으로 바꿔줘
-- 연산식이나 함수를 이용할 경우, 컬럼명이 연산식으로 변경됨
select  bonus 보너스율, nvl(bonus,0) * salary 보너스
            , nvl(bonus, 0) * salary +  salary "보너스를 포함한 급여"
from    emp;

-- dual : 테스트용 테이블
select sysdate from dual;

-- 날자출력형식 변경
-- 도구 > 환경설정 > 데이터베이스 > NLS
-- 오늘날자 : sysdate
-- floor : 소수점 버림 함수
-- 날자와 날자의 연산, 날자와 숫자의 연산 = 일수
select sysdate, hire_date, sysdate - 2, floor(sysdate - hire_date)
from    emp;

/*
    <컬럼명에 별칭 지정하기>
        [표현법]
            컬럼명 AS 별칭 / 컬럼명 AS "별칭" / 컬럼명 별칭 / 컬럼명 "별 칭"
            
        - 산술연산을 하게 되면 컬럼명이 지저분해진다. 이때 컬럼명에 별칭을 부여해서 깔끔하게 보여줄 수 있다.
        - 별칭을 부여할 때 띄어쓰기 혹은 특수문자가 포함될 경우에는 반드시 큰 따옴표("")로 감싸줘야 한다.
*/
-- EMP 테이블에서 직원명, 연봉, 보너스가 포함된 연봉 조회
-- 컬럼명은 직원명, 연봉, 보너스가 포함된 연봉 으로 한다
select  EMP_NAME 직원명, SALARY 연봉
        , (nvl(BONUS,0) * SALARY + SALARY) * 12 "보너스가 포함된 연봉"
from    emp;

-- vscode에서 한글 깨짐 방지
-- 도구 > 환경설정 > 환경 > 인코딩 > utf-8 선택

/*
    <리터럴>
        SELECT 절에 리터럴을 사용하면 테이블에 존재하는 데이터처럼 조회가 가능하다.
        리터럴은 RESULT SET의 모든 행에 반복적으로 출력된다.
*/

select  '안녕' "안녕", emp_name || '님의 급여는 ' || salary || '원 입니다' as "급여"
from    emp;

/*
    <연결 연산자> 문자열 연결 ||
    여러 컬럼 값을 하나의 컬럼인것 처럼 연결 하거나 컬럼과 리터럴을 연결 하기 위해 사용
*/

-- 형식을 지정해서 문자열로 변경하는 함수
SELECT to_char(salary, '999,999,999') 
from emp;

-- 00사원의 급여는 00원 입니다.
-- 타이틀 :  사원급여
SELECT  EMP_NAME || '사원의 급여는 ' || 
            to_char(salary, '999,999,999')
            || '원 입니다.' 사원급여
from    emp;


/*
    <DISTINCT> 중복제거
        컬럼에 포함된 중복 값을 한 번씩만 표시하고자 할 때 사용한다.
        SELECT 절에 한 번만 기술할 수 있다.
        컬럼이 여러 개이면 컬럼 값들이 모두 동일해야 중복 값으로 판단되어 중복이 제거된다.
*/
-- 중복제거 키워드를 붙였을때, 붙이지 않았을때를 각각 확인해보세요
SELECT  job_code
FROM    emp;

SELECT  distinct job_code
FROM    emp;

select  DISTINCT job_code 직급코드,  dept_code 부서코드
from    emp;


/*
    <WHERE 절>
        [표현법]
            SELECT 컬럼, 컬럼, ..., 컬럼
              FROM 테이블명
             WHERE 조건식;
             
        - 조회하고자 하는 테이블에서 해당 조건에 만족하는 결과만을 조회하고자 할 때 사용한다.
        - 조건식에는 다양한 연산자들을 사용할 수 있다.
        
    <비교 연산자>
        >, <, >=, <= : 대소 비교
        =            : 동등 비교
        !=, ^=, <>   : 같지 않다
*/
-- EMP 테이블에서 부서 코드가 D9와 일치하는 사원들의 모든 컬럼 정보 조회
select  * 
from    emp
-- 쿼리는 대소문자를 구분하지 않지만 데이터는 대소문자를 구분한다
WHERE   dept_code = 'D9';

-- 부서테이블의 부서 코드가 D9와 일치하는 모든 내용을 조회
select  * 
from    dept
WHERE   dept_id = 'D9';

-- EMP 테이블에서 부서 코드가 D9가 아닌 사원들의 사번, 사원명, 부서 코드 조회
select  EMP_ID 사번, EMP_NAME 사원명, DEPT_CODE "부서 코드"
FROM    emp
-- 부정연산자는 3가지 방식이 존재
-- !=, ^=, <>
--where   DEPT_CODE != 'D9'
--where   DEPT_CODE <> 'D9'
where   DEPT_CODE ^= 'D9'
order by DEPT_CODE DESC;

-- EMP 테이블에서 급여가 400만원 이상인 직원들의 직원명, 부서 코드, 급여 조회
select  EMP_NAME 직원명, DEPT_CODE "부서 코드", SALARY 급여
from    emp
where   salary >= 4000000;

------------------ 실습 문제 -----------------
-- 1. EMP 테이블에서 재직 중(ENT_YN 컬럼 값이 'N')인 직원들의 사번, 이름, 입사일 조회 
select  EMP_NO 사번, EMP_NAME 이름, HIRE_DATE 입사일
from    emp
where   ENT_YN = 'N';

-- 2. EMP 테이블에서 연봉이 5000만원 이상인 직원의 직원명, 급여, 연봉, 입사일 조회
-- 연봉 : (급여*보너스율 + 급여) * 12
-- null 의 연산결과는 null이므로 
-- nvl함수를 이용하여 0으로 바꿔준다!!!!!!
SELECT  EMP_NAME 직원명, SALARY 급여, 
        TO_CHAR ( (SALARY* nvl(BONUS,0) + SALARY) *12 , '999,999,999') 연봉,
        HIRE_DATE 입사일
FROM    emp;

/*
    <논리 연산자>
        여러 개의 조건을 엮을 때 사용한다.
        AND (~ 이면서, 그리고)
        OR  (~ 이거나, 또는)
*/
-- EMP 테이블에서 부서 코드가 D6이면서 급여가 300만원 이상인 직원들의 사번, 직원명, 부서 코드, 급여 조회
SELECT  EMP_NO, EMP_NAME, DEPT_CODE, SALARY
from    emp
WHERE   DEPT_CODE = 'D6'
AND     SALARY >=3000000;

-- EMP 테이블에서 급여가 400만원 이상 이고, 직급 코드가 J2인 사원의 모든 컬럼 조회
select *
from    emp
WHERE   SALARY >= 4000000
AND     JOB_CODE = 'J2';

-- EMP 테이블에서 급여가 350만원 이상 600만원 이하를 받는 직원의 사번, 직원명, 부서 코드, 급여 조회
SELECT EMP_NO, EMP_NAME, DEPT_CODE, SALARY
from    emp
WHERE   SALARY >= 3500000
    and SALARY <= 6000000;
/*
    <BETWEEN AND>
        [표현법]
            WHERE 비교대상컬럼 BETWEEN 하한값 AND 상한값
            
        - WHERE 절에서 사용되는 구문으로 범위에 대한 조건을 제시할 때 사용한다.
        - 비교대상컬럼 값이 하한값 이상이고, 상한값 이하인 경우 TRUE를 리턴한다.
*/
SELECT EMP_NO, EMP_NAME, DEPT_CODE, SALARY
from    emp
-- WHERE 비교대상컬럼 BETWEEN 하한값 AND 상한값
WHERE   SALARY between 3500000 and 6000000;

-- EMP 테이블에서 입사일 '90/01/01' ~ '01/01/01'인 사원의 모든 컬럼 조회
select  * 
from    emp
where   HIRE_DATE BETWEEN '1990/01/01' and '2001/01/01';

/*
    <LIKE>
        [표현법]
            WHERE 비교대상컬럼 LIKE '특정 패턴';
            
        - 비교하려는 컬럼 값이 지정된 특정 패턴에 만족할 경우 TRUE를 리턴한다.
        - 특정 패턴에는 '%', '_'를 와일드카드로 사용할 수 있다.
          '%' : 0글자 이상
            ex) 시작하는 -  비교대상컬럼 LIKE '문자%'  => 비교대상컬럼 값 중에 '문자'로 시작하는 모든 행을 조회한다.
                끝나는 - 비교대상컬럼 LIKE '%문자'  => 비교대상컬럼 값 중에 '문자'로 끝나는 모든 행을 조회한다.
                포함하는 - 비교대상컬럼 LIKE '%문자%' => 비교대상컬럼 값 중에 '문자'가 포함되어 있는 모든 행을 조회한다.
                
          '_' : 1글자
            ex) 비교대상컬럼 LIKE '_문자'  => 비교대상컬럼 값 중에 '문자'앞에 무조건 한 글자가 오는 모든 행을 조회한다.
                비교대상컬럼 LIKE '__문자' => 비교대상컬럼 값 중에 '문자'앞에 무조건 두 글자가 오는 모든 행을 조회한다.
*/
-- EMP 테이블에서 성이 전 씨인 사원의 사원명, 급여, 입사일 조회
select  EMP_NAME 사원명, SALARY 급여, HIRE_DATE 입사일
from    emp
WHERE   EMP_NAME like '전%';
-- EMP 테이블에서 이름 중에 '하'가 포함된 사원의 사원명, 주민번호, 부서 코드 조회
select  EMP_NAME 사원명, EMP_NO 주민번호, DEPT_CODE 부서코드
from    emp
WHERE   EMP_NAME like '%하%';
-- EMP 테이블에서 전화번호 4번째 자리가 9로 시작하는 사원의 사번, 사원명, 전화번호, 이메일 조회
SELECT  EMP_NO, EMP_NAME, PHONE, EMAIL
from    emp
WHERE   PHONE like '___9%';
-- EMP 테이블에서 이메일 중 _ 앞 글자가 3자리인 이메일 주소(ex sun_di@or.kr)를 
-- 가진 사원의 사번 사원명, 이메일 조회
-- $_ : 이메일 주소에 _가 입력된 경우, _를 와일드 카드가 아닌 문자열로 사용
SELECT  email
from    emp
-- WHERE EMAIL LIKE '____%'; -- 와일드카드와 문자가 구분되지 않음 
-- 데이터로 처리할 값 앞에 임의의 문자를 제시하고 임의의 문자를 ESCAPE 옵션에 등록한다.
where   EMAIL like '___$_%' ESCAPE '$';

-- EMP 테이블에서 김씨 성이 아닌 직원 사번, 사원명, 입사일 조회
-- NOT 컬럼이름 LIKE ''
SELECT  EMP_ID, EMP_NAME, HIRE_DATE 
FROM    EMP
WHERE   not EMP_NAME like '김%';


------------------- 실습 문제 -------------------
-- 1. EMP 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호 조회
SELECT  *
FROM    EMP
-- NOT 컬럼이름
-- 컬럼이름 NOT LIKE 
WHERE    PHONE NOT LIKE '010%';
-- 2. DEPT 테이블에서 해외영업부에 대한 모든 컬럼 조회
select * from DEPT;

SELECT  * 
FROM    DEPT
--WHERE   DEPT_TITLE LIKE '해외영업%';
WHERE   DEPT_TITLE LIKE '해외영업_부';

-- 현재 날자형식 출력포맷 확인
SELECT * 
FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- 날자형식 출력포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT * FROM EMP
-- 날자형식으로 자동 변환되어 조회
-- '2000/01/01', '2000-01-01', '20000101'
WHERE HIRE_DATE >= '20000101';

/*
    <IS NULL / IS NOT NULL>
        [표현법]
            WHERE 비교대상컬럼 IS [NOT] NULL;
            
        - 컬럼 값에 NULL이 있을 경우 NULL 값 비교에 사용된다.
          IS NULL : 비교대상컬럼 값이 NULL인 경우 TRUE를 리턴한다.
          IS NOT NULL : 비교대상컬럼 값이 NULL이 아닌 경우 TRUE 리턴한다.
*/ 
-- 보너스를 받고 있는 사람을 조회 
-- 사원명, 보너스율
SELECT  EMP_NAME, BONUS
FROM    emp
where   BONUS is not null;
-- 보너스를 받지 못하는 사람 조회
SELECT  EMP_NAME, BONUS
FROM    emp
where   BONUS is null;


-- EMP 테이블에서 관리자(사수)가 없는 사원 이름, 부서 코드 조회 
select  EMP_NAME, DEPT_CODE, MANAGER_ID 
from    emp
where   MANAGER_ID is null;

-- EMP 테이블에서 부서 배치를 받진 않았지만 보너스는 받는 사원의 사원명, 부서 코드, 보너스 조회
select  EMP_NAME, DEPT_CODE, BONUS
from    EMP
WHERE   DEPT_CODE is null
and     BONUS is not null;

/*
    <IN>
        [표현법]
            WHERE 비교대상컬럼 IN('값', '값', '값', ..., '값');
        
        - 값 목록 중에 일치하는 값이 있을 때 TRUE 리턴한다.
*/

-- EMP 테이블에서 D5 부서원들과 D6 부서원들, D8 부서원들의 사원명, 부서 코드, 급여 조회
SELECT  *
FROM    emp
/*
WHERE   DEPT_CODE = 'D5'
OR      DEPT_CODE = 'D6'
OR      DEPT_CODE = 'D8';
*/
WHERE DEPT_CODE IN ('D5', 'D6', 'D8');

-- EMP 테이블에서 직급 코드가 J2 또는 J7 직급인 사원들 중 
-- 급여가 200만원 이상인 사원들의 모든 컬럼 조회
SELECT  *
FROM    emp
WHERE   JOB_CODE in ('J2', 'J7')
AND     SALARY >= 2000000;
/*
    <ORDER BY>
        [표현법]
            SELECT 컬럼, 컬럼, ..., 컬럼
              FROM 테이블명
             WHERE 조건식
          ORDER BY 정렬시키고자 하는 컬럼명|별칭|컬럼 순번 [ASC|DESC] [NULLS FIRST | NULLS LAST];
          
        - SELECT 문에서 가장 마지막에 기입하는 구문으로 실행 또한 가장 마지막에 진행된다.
        - ASC(기본값) : 오름차순으로 정렬한다. (ASC 또는 DESC 생략 시 기본값)
        - DESC : 내림차순으로 정렬한다.
        - NULLS FIRST : 정렬하고자 하는 컬럼 값에 NULL이 있는 경우 해당 데이터 값을 맨 앞으로 정렬한다.
        - NULLS LAST(기본값) : 정렬하고자 하는 컬럼 값에 NULL이 있는 경우 해당 데이터 값을 맨 뒤로 정렬한다.
*/

select bonus from emp order by BONUS nulls first;

-- EMP 테이블에서 BONUS로 내림차순 정렬
-- (단, BONUS 값이 일치할 경우 그때는 SALARY 가지고 오름차순정렬)
-- 사원명 보너스 급여 
SELECT  EMP_NAME 사원명, BONUS 보너스, SALARY 급여
FROM    emp
--ORDER BY BONUS DESC, SALARY;  -- 컬럼명을 이용
-- where 조건절에서는 컬럼의별칭이나 순서를 사용 할 수 없다!!!!!!!!!!!!!!!!!!!!!!!!!!
--order by 2 desc, 3;           -- 조회되는 컬럼의 순서로
order by 보너스 desc nulls last, 급여;      
-- 별칭을 이용


SELECT sysdate from dual;




