/*
    <SUBQUERY>
        하나의 SQL문 안에 포함된 또다른 SQL 문을 뜻한다.
        메인 쿼리 (기존쿼리)를 보조하는 역할을 하는 쿼리문
*/
-- 노옹철 사원과 같은 부서인 사원들의 이름과 부서코드 부서명을 조회 하시오!
-- 1. 노옹철 사원의 부서를 조회
SELECT  DEPT_CODE FROM EMP WHERE   EMP_NAME = '노옹철';
-- 2. 조건문에 값대신 서브쿼리를 대입
-- 주의) 서브쿼리는 괄호로 묶어준다!!!!
SELECT  EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM    EMP, DEPT
--WHERE   DEPT_CODE = 'D9'
WHERE   DEPT_CODE = DEPT_ID
AND     DEPT_CODE = (SELECT  DEPT_CODE FROM EMP WHERE   EMP_NAME = '노옹철');

-- 단일행서브쿼리 : 서브쿼리의 실행결과 행과 열의 갯수가 1개인 쿼리 
-- 비교 연산자(>,<,=,>=,<=,!=)를 이용할때 

-- 2. 전 직원의 평균 급여보다 급여를 적게 받는 직원의 이름, 직급코드, 직급코드명, 급여를 조회
SELECT FLOOR(AVG(SALARY)) FROM EMP;
SELECT  EMP_NAME, EMP.JOB_CODE, JOB_NAME, TO_CHAR(SALARY, '999,999,999') 급여
FROM    EMP, JOB
WHERE   EMP.JOB_CODE = JOB.JOB_CODE
AND     SALARY < (SELECT FLOOR(AVG(SALARY)) FROM EMP);

-- 3. 최저 급여를 받는 직원의 사번, 이름, 직급 코드, 급여, 입사일 조회
SELECT MIN(SALARY) FROM EMP;
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, HIRE_DATE
FROM    EMP
--WHERE   SALARY = 1380000;
WHERE   SALARY = (SELECT MIN(SALARY) FROM EMP);


-- 4. 노옹철 사원의 급여보다 더 많은 급여받는 
-- 사원들의 사번, 사원명, 부서명, 직급 코드, 급여 조회
-- 노옹철 사원의 급여를 조회




-- 5. 부서별 급여의 합이 가장 큰 부서의 
--    부서 코드, 급여의 합 조회
--    각 부서별 급여의 합 중에 가장 큰 급여의 합을 조회

-- 그룹으로 묶으면 묶을때 사용한 컬럼만 SELECT 절에 올 수 있다

-- 전체 사원에 대한 급여의 합계 - 단일행 단일컬럼
SELECT  SUM(SALARY)
FROM    EMP;

-- 부서별 급여의 합계 - 다중행
SELECT  SUM(SALARY)
FROM    EMP
GROUP BY DEPT_CODE;

-- 직급별 급여의 평균
-- GROUP BY 절을 사용 하면 GROUP 으로 묶을 컬럼만 조회가 가능하다
SELECT  DEPT_CODE, JOB_CODE, AVG(SALARY), COUNT(*), COUNT(BONUS)
FROM    EMP
GROUP BY DEPT_CODE, JOB_CODE;


SELECT      MAX(SUM(SALARY)), COUNT(SUM(SALARY))
FROM        EMP
GROUP BY    DEPT_CODE;


-- HAVING : 집계함수에 대한 조건
SELECT  DEPT_CODE, SUM(SALARY)
FROM    EMP
-- 집계함수에 대한 조건은 WHERE절에 올수 없다!!!!!!!!!!
-- WHERE절은 단일 행에 대한 조건문을 작성 하는 곳이다
--WHERE   SUM(SALARY) = (SELECT MAX(SUM(SALARY)) FROM EMP GROUP BY DEPT_CODE);
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY)) FROM EMP GROUP BY DEPT_CODE);
 
-- 6. 부서별 평균(소수점버림)급여가 가장 작은 부서의 부서코드와 부서명 평균급여를 조회
-- 전체 사원에 대한 평균 급여
SELECT  AVG(SALARY) FROM EMP;
-- 부서별 평균급여
SELECT  AVG(SALARY) 
FROM    EMP
GROUP BY DEPT_CODE;
-- 부서별 평균급여가 가장 작은 값
SELECT  FLOOR(MIN(AVG(SALARY)))
FROM    EMP
GROUP BY DEPT_CODE;

SELECT  DEPT_CODE, DEPT_TITLE, FLOOR(AVG(SALARY))
FROM    EMP, DEPT
WHERE   DEPT_CODE = DEPT_ID
GROUP BY DEPT_CODE, DEPT_TITLE
HAVING  FLOOR(AVG(SALARY)) = (
                                SELECT  FLOOR(MIN(AVG(SALARY)))
                                FROM    EMP
                                GROUP BY DEPT_CODE
                              );


-- 7. 전지연 사원이 속해있는 부서원들 조회 (단, 전지연 사원은 제외)
-- 사번, 사원명, 전화번호, 직급명, 부서명, 입사일(년-월-일) 
-- 전지연 사원이 속해있는 부서 조회 
SELECT DEPT_CODE FROM EMP WHERE EMP_NAME = '전지연';
SELECT JOB_NAME FROM JOB WHERE JOB_CODE = 'J1';
-- 오라클
SELECT  EMP_ID 사번, EMP_NAME 사원명, PHONE 전화번호
        -- 서브쿼리는 괄호로 묶어줍니다.
        -- SELECT절의 서브쿼리에서 메인쿼리에 사용된 테이블이 가진 컬럼을 조건으로 이용
        --, (SELECT JOB_NAME FROM JOB  WHERE JOB.JOB_CODE = EMP.JOB_CODE) 직급명
        --, (SELECT DEPT_TITLE FROM DEPT WHERE DEPT.DEPT_ID = EMP.DEPT_CODE) 부서명
        , DEPT_TITLE 부서명
        , JOB_NAME  직급명
        , TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') 입사일
FROM    EMP, JOB, DEPT
--WHERE   DEPT_CODE = 'D1';
WHERE   EMP.JOB_CODE = JOB.JOB_CODE
AND     DEPT_CODE = DEPT_ID
AND     DEPT_CODE = (SELECT DEPT_CODE FROM EMP WHERE EMP_NAME = '전지연')
AND     EMP_NAME != '전지연';

-- ANSI
SELECT  EMP_ID 사번, EMP_NAME 사원명, PHONE 전화번호
        -- 서브쿼리는 괄호로 묶어줍니다.
        -- SELECT절의 서브쿼리에서 메인쿼리에 사용된 테이블이 가진 컬럼을 조건으로 이용
        --, (SELECT JOB_NAME FROM JOB  WHERE JOB.JOB_CODE = EMP.JOB_CODE) 직급명
        --, (SELECT DEPT_TITLE FROM DEPT WHERE DEPT.DEPT_ID = EMP.DEPT_CODE) 부서명
        , DEPT_TITLE 부서명
        , JOB_NAME  직급명
        , TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') 입사일
FROM    EMP
--WHERE   DEPT_CODE = 'D1';
-- 나열된 테이블을 조건과 함께 JOIN문으로 만들어 주면 
JOIN    JOB USING (JOB_CODE)
JOIN    DEPT ON (DEPT_ID = DEPT_CODE)
WHERE   DEPT_CODE = (SELECT DEPT_CODE FROM EMP WHERE EMP_NAME = '전지연')
AND     EMP_NAME != '전지연';


/*
    2) 다중행 서브쿼리 : 서브쿼리의 조회 결과 값이 여러 행인 경우
    
    IN / NOT IN (서브쿼리)
        여러개의 결과값중 하나라도 일치하면  TRUE를 리턴
        -> WHERE절에서 조건을 만족 할경우 TRUE (결과집합에 포함)
    ANY : 여러개의 값들중 한개라도 만족 하면 TRUE
            IN과 다른점 : 비교연산자를 함께 사용 할수 있다
            EX) SALARY = ANY(....) : IN과 같은 결과
                SALARY != ANY(....): NOT IN과 같은 결과
                SALARY > ANY(10000000,2000000,3000000) : 최소값 보다 크면 TRUE
                SALARY < ANY(10000000,2000000,3000000) : 최대값 보다 작으면 TRUE
            
    ALL : 여러 개의 값들 모두와 비교하여 만족해야 TRUE
                SALARY > ALL(10000000,2000000,3000000) : 최대값 보다 크면 TRUE
                SALARY < ALL(10000000,2000000,3000000) : 최소값 보다 작으면 TRUE        
*/
-- 1) 각 부서별 최고 급여를 받는 직원의 이름, 직급 코드, 부서 코드, 급여 조회
-- 각 부서별 최고 급여를 조회
SELECT  DEPT_CODE, MAX(SALARY)
FROM    EMP
WHERE   DEPT_CODE IS NOT NULL
GROUP BY    DEPT_CODE;

SELECT  EMP_NAME, JOB_CODE, DEPT_CODE, SALARY
FROM    EMP
WHERE   (DEPT_CODE, SALARY) IN (SELECT  DEPT_CODE, MAX(SALARY)
                                FROM    EMP
                                WHERE   DEPT_CODE IS NOT NULL
                                GROUP BY    DEPT_CODE);

-- 2) 전 직원들에 대해 사번, 이름, 부서 코드, 구분(매니저/사원)
-- 매니져의 사번을 조회 - 중복을 제거
SELECT  DISTINCT MANAGER_ID
FROM    EMP
WHERE   MANAGER_ID IS NOT NULL
AND     MANAGER_ID = 200;

-- 매니져 결과집합
SELECT  EMP_ID 사번, EMP_NAME 이름, DEPT_CODE 부서코드, '매니저' 구분
FROM    EMP
WHERE   EMP_ID IN (SELECT  DISTINCT MANAGER_ID
                    FROM    EMP
                    WHERE   MANAGER_ID IS NOT NULL)

UNION
-- +
-- 사원 결과집합
SELECT  EMP_ID 사번, EMP_NAME 이름, DEPT_CODE 부서코드, '사원' 구분
FROM    EMP
WHERE   EMP_ID NOT IN (SELECT  DISTINCT MANAGER_ID
                    FROM    EMP
                    WHERE   MANAGER_ID IS NOT NULL)
-- 컬럼 이름에 별칭을 사용한 경우 컬럼명으로 접근이 불가능!!!!!
ORDER BY 사번;

SELECT '매니져' FROM DUAL
UNION ALL
SELECT '사원' FROM DUAL;

-- SELECT 절에서 서브쿼리를 이용하여 사원/매니져를 구분
-- EMP_ID가 매니저사번에 있다면 사번이 조회
-- 없으면 조회가 안됨
SELECT  DISTINCT MANAGER_ID 매니져의사번
FROM    EMP
WHERE   MANAGER_ID IS NOT NULL
AND     MANAGER_ID = 210--EMP_ID
;
SELECT  EMP_ID, 
        DECODE (    (SELECT  DISTINCT MANAGER_ID 매니져의사번
                    FROM    EMP M --테이블의 이름이 똑같으므로 별칭을 주어서 구분
                    WHERE   MANAGER_ID IS NOT NULL
                    -- 서브쿼리에서 사용되는 컬럼이 메인테이블을 참조하는경우, 테이블 이름을 명시 해야합니다.
                    AND     M.MANAGER_ID = EMP.EMP_ID) 
                , NULL, '사원', '매니져'
            ) 구분
FROM    EMP;

-- EMP_ID가 관리자로 몇변 사용되었는지 조회
SELECT COUNT(*) FROM EMP M WHERE M.MANAGER_ID = 200;

SELECT EMP_ID, (SELECT COUNT(*) FROM EMP M WHERE M.MANAGER_ID = EMP.EMP_ID) 횟수
        , CASE WHEN (SELECT COUNT(*) FROM EMP M WHERE M.MANAGER_ID = EMP.EMP_ID) > 0 
        THEN '매니저' ELSE '사원' END 구분
        
FROM EMP
ORDER BY 구분;

-- 3) 대리 직급임에도 과장 직급들의 최소 급여보다 많이 받는 
-- 직원의 사번, 이름, 직급명, 급여 조회
SELECT  EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM    EMP, JOB
WHERE   EMP.JOB_CODE = JOB.JOB_CODE
AND     JOB_NAME = '대리'
AND     SALARY > (SELECT  MIN(SALARY)
                    FROM    EMP, JOB
                    WHERE   EMP.JOB_CODE = JOB.JOB_CODE
                    AND     JOB_NAME = '과장');

SELECT  MIN(SALARY)
FROM    EMP, JOB
WHERE   EMP.JOB_CODE = JOB.JOB_CODE
AND     JOB_NAME = '과장';

SELECT  SALARY
FROM    EMP, JOB
WHERE   EMP.JOB_CODE = JOB.JOB_CODE
AND     JOB_NAME = '과장';


SELECT  EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM    EMP, JOB
WHERE   EMP.JOB_CODE = JOB.JOB_CODE
AND     JOB_NAME = '대리'
-- ANY > 최소값, ALL > 최대값
AND     SALARY > ANY(SELECT  SALARY
                    FROM    EMP
                    WHERE   JOB_CODE = (SELECT JOB_CODE FROM JOB WHERE JOB_NAME = '과장'));

-- 4) 과장 직급임에도 차장 직급의 최대 급여보다 더 많이 받는 
-- 직원들의 사번, 이름, 직급명, 급여 조회 
SELECT  EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM    EMP
JOIN    JOB USING (JOB_CODE)
WHERE   JOB_NAME='과장'
AND     SALARY > ALL (SELECT  SALARY
                        FROM    EMP
                        JOIN    JOB USING (JOB_CODE)
                        WHERE   JOB_NAME = '차장');



SELECT  SALARY
FROM    EMP
JOIN    JOB USING (JOB_CODE)
WHERE   JOB_NAME = '차장';





-- 쿼리의 실행순서에 의해 SELECT -> ORDER BY
SELECT *
FROM    (
            -- 2. 조건을 주기 위해서
            SELECT ROWNUM RN, EMP_NAME
            FROM (
                -- 1. 정렬후 번호를 붙일수 있도록
                  SELECT    EMP_ID, EMP_NAME
                    FROM    EMP
                ORDER BY  EMP_NAME)
         )
WHERE   RN BETWEEN 11 AND 20
;







