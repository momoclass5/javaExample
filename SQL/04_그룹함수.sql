/*
    <그룹함수>
        대량의 데이터들로 집계나 통계같은 작업을 처리해야 하는 경우 사용 하는 함수
        모든 그룹함수는 NULL 값을 자동으로 제외
        => NVL()함수와 함께 사용하는것을 권장 합니다.
    
    1) SUM(NUMBER) 
        - 해당 컬럼의 총 합계를 반환 합니다
    2) AVG(NUMBER)
        - 해당 컬럼의 평균을 반환 합니다.
    3) MIN(모든타입) / MAX(모든타입)
        - MIN : 해당 컬럼의 값들중 가장 작은 값을 반환 합니다.
        - MAX : 해당 컬럼의 값들중 가장 큰 값을 반환 합니다.
    4) COUNT(*|컬럼명)
        - 결과 행의 갯수를 세서 반환 하는 함수
        - COUNT(*) : 조회결과에 해당하는 모든 행의 갯수를 반환
        - COUNT(컬럼명) : 제시한 컬럼값이 NULL이 아닌 행의 갯수를 반환
        - COUNT(DISTINCT 컬럼명) : 해당 컬럼의 중복을 제거한 후 행의 갯수를 반환
*/
-- 집계함수 : 여러행 또는 테이블 전체 행으로 부터 하나의 결과값을 반환
SELECT  COUNT(*) 
FROM    EMP;

SELECT  COUNT(EMP_ID)
FROM    EMP;

-- NULL값 2건을 제외
SELECT  COUNT(DEPT_CODE)
FROM    EMP;

-- 중복제거
SELECT  COUNT(DISTINCT DEPT_CODE)
FROM    EMP;

SELECT  DISTINCT DEPT_CODE
FROM    EMP;

SELECT * FROM EMP ;

-- 사원은 총 급여의 합계
SELECT  SUM(SALARY)
FROM    EMP;

-- 사원의 총 급여의 평균
SELECT AVG(SALARY) FROM EMP;

-- 새로운 사원번호 = 최대값 + 1 
SELECT MAX(EMP_ID) + 1 FROM EMP;

-- 급여의 최대값, 최소값 구하기
SELECT  MAX(SALARY), MIN(SALARY)
FROM    EMP;

/*
    <GROUP BY>
        - 그룹에 대한 기준을 제시할 수 있는 구문
        여러개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용한다.
        SELECT 
        FROM
        [WHERE]
        [GROUP BY]
        [ORDER BY]
        생략이 가능 한 절도 있지만 
        - 쿼리를 작성시 순서대로 작성 해야 한다
        - SELECT 절에는 집계함수와 GROUP BY절에 명시된 컬럼만 작성이 가능하다
*/

-- 부서별 급여의 합계
SELECT      DEPT_CODE, SUM(SALARY) 부서별총급여, COUNT(EMP_ID), COUNT(*) 부서별사원수
FROM        EMP
GROUP BY    DEPT_CODE
ORDER BY    1;

-- 직급별 사원의 수
SELECT  JOB_CODE, COUNT(*) 직급별사원수
FROM    EMP
GROUP BY    JOB_CODE;

-- 각 부서별 보너스를 받는 사원수
-- NULL을 세어 주지 않으므로 
SELECT   DEPT_CODE, COUNT(BONUS)
FROM     EMP
GROUP BY DEPT_CODE;

-- 직급별 급여의 평균
-- FLOOR : 소수점 버리기 
-- TO_CHAR(컬럼,형식)
-- 형식 : 3자리 컴마, 소수점 자릿수
SELECT  JOB_CODE, TO_CHAR(AVG(SALARY), '999,999,999.00')||'원'
FROM    EMP
GROUP BY JOB_CODE;


-- 부서별 
-- 사원수, 보너스를 받는 사원수
-- , 급여의 합, 평균급여, 최고급여, 최저급여
-- 금액 3자리콤마, 사원수에는 명을 붙여서 왼쪽 정렬
SELECT  DEPT_CODE 부서코드, COUNT(*)||'명' 사원수, SUM(SALARY) 급여합, TO_CHAR(AVG(SALARY), '999,999,999') 급여평균
        , MAX(SALARY) 최고급여, MIN(SALARY) 최저급여
FROM    EMP
GROUP BY    DEPT_CODE
ORDER BY 부서코드;

-- 남자사원의 총급여의 합계
SELECT  EMP_NO, SUBSTR(EMP_NO, 8, 1) 
FROM    EMP;

SELECT  SUM(SALARY)
FROM    EMP
WHERE   SUBSTR(EMP_NO, 8, 1) IN ('1', '3');

-- 퇴직한 직원의 수
SELECT  COUNT(*) 퇴사자의수
FROM    EMP
WHERE   ENT_YN = 'Y';





-- 실습문제 
-- 보너스를 받는 사원들의 사번, 사원명, 보너스, 부서명을 조회
-- 오라클
SELECT  EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM    EMP, DEPT
-- 보너스를 받는 사람들을 조회
-- BONUS가 NULL이 아니고 0이 아니다
WHERE   DEPT_ID = DEPT_CODE
  AND   BONUS IS NOT NULL 
  AND   BONUS != 0;
  
-- ANSI
SELECT  EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
  FROM  EMP
  JOIN  DEPT ON (EMP.DEPT_CODE = DEPT.DEPT_ID)
 WHERE  BONUS IS NOT NULL
   AND  BONUS != 0;
   
-- 인사관리부가 아닌 사원들의 사원명, 부서명, 급여를 조회
-- 누락된 사원이 없도록!(부서코드가 입력되지 않은 사원
SELECT * FROM DEPT;

-- 오라클
-- 17명 + 3명 = 20명
SELECT * FROM EMP;

SELECT  EMP_NAME, DEPT_TITLE, SALARY
FROM    EMP, DEPT
-- INNER JOIN 의 경우, 조건이 일치하는 값만 조회 하므로
-- 부서를 배정받지 못한 사원 2명이 누락 된다
-- OUTTER JOIN을 이용하여 조건이 일치하지 않는 사원도 조회 하도록 한다
-- 오라클 문법에서는 (+) 를 이용하여 OUTTER JOIN 을 구현 할 수 있다
-- 기준이 되는 테이블의 컬럼 반대편에 (+)를 붙여준다.
WHERE   DEPT_CODE(+) = DEPT_ID
--AND     DEPT_TITLE != '인사관리부';
--AND     DEPT_TITLE ^= '인사관리부';
-- NULL은 비교되지 않으므로 따로 확인해야함
AND     (DEPT_TITLE <> '인사관리부' OR DEPT_TITLE IS NULL); 

-- 6의 부서 코드를 사용
SELECT DISTINCT DEPT_CODE FROM EMP;
-- 9개의 부서코드
SELECT DEPT_ID FROM DEPT;

-- ANSI
SELECT  EMP_NAME, DEPT_TITLE, SALARY 
FROM    EMP   LEFT JOIN    DEPT ON (DEPT_CODE = DEPT_ID)
WHERE   NVL(DEPT_TITLE, '부서없음') != '인사관리부' ;

-- EMP - DEPT_CODE
-- DEPT - DEPT_ID, LOCATION_ID
-- LOCATION -      LOCAL_CODE,     NATIONAL_CODE
-- NATIONAL -                      NATIONAL_CODE
-- 사번, 사원명, 부서명, 지역명, 국가명 조회
-- 누락되는 사원이 없이 조회해봅시다
-- 동일한 컬럼명을 사용할 경우, 어떤 테이블의 컬럼인지 테이블명을 명시하지 않으면
-- 오류가 발생 ( ORA-00918: 열의 정의가 애매합니다 )
SELECT  EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME
FROM    EMP, DEPT, LOCATION L, NATIONAL N
-- 여러 테이블을 OUTER JOIN 으로 연결할 경우 JOIN 조건에 모두(+)를 붙여 준다
WHERE   EMP.DEPT_CODE = DEPT.DEPT_ID(+)
AND     DEPT.LOCATION_ID = L.LOCAL_CODE(+)
AND     L.NATIONAL_CODE = N.NATIONAL_CODE(+);

-- OUTER JOIN시 조건에 일치하지 않는 데이터는 모두 NULL로 조회가 되므로 
-- 다음 조건에서 INNER JOIN 으로 비교할 경우 조회 되지 않는다
SELECT EMP_ID, DEPT.*
FROM EMP, DEPT
WHERE EMP.DEPT_CODE = DEPT.DEPT_ID(+)
AND DEPT_CODE IS NULL;

-- ANSI
SELECT  EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME
FROM    EMP 
LEFT JOIN    DEPT        ON  (EMP.DEPT_CODE = DEPT.DEPT_ID)
LEFT JOIN    LOCATION L  ON  (DEPT.LOCATION_ID = L.LOCAL_CODE)
LEFT JOIN    NATIONAL N  USING (NATIONAL_CODE);

-- 부서별 최고 급여를 받는사람
SELECT *
FROM EMP
-- IN : 다중행에 대한 처리
-- = : 단일행에 대한 처리
-- 서브쿼리의 조회결과가 단일행인 경우, = 또는 IN 사용가능
-- 서브쿼리의 조회 결과가 다중행인 경우 = 사용불가!!!!!!!
WHERE (DEPT_CODE, SALARY) IN 
            (SELECT  DEPT_CODE, MAX(SALARY)
            FROM    EMP
            GROUP BY DEPT_CODE)
;
-- GROUP BY 절에 사용되지 않은 컬럼이 조회절에 나올때
-- ORA-00979: GROUP BY 표현식이 아닙니다.
-- 사원이 22명 있는데 부서별별로
SELECT  DEPT_CODE, MAX(SALARY), COUNT(*)
FROM    EMP
GROUP BY DEPT_CODE
;
DROP TABLE EMP;
DROP TABLE DEPT;
RENAME DEPARTMENT TO DEPT;
RENAME EMPLOYEE TO EMP;


















