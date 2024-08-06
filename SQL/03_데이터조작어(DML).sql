CREATE TABLE EMP_01(
    EMP_ID NUMBER                   -- 사번
    , EMP_NAME VARCHAR2(30)         -- 사원명
    , DEPT_TITLE VARCHAR2(20)       -- 부서명
);

-- 서브쿼리 : 쿼리안에 또다른 쿼리가 사용되는 경우
-- 서브쿼리를 이용하여 삽입할 경우
-- VALUES키워드를 사용하지 않아요!
INSERT INTO EMP_01 (
    -- DEPT_CODE : 부서테이블의 기본키
    SELECT  EMP_ID, EMP_NAME, DEPT_TITLE
    -- 여러개의 테이블이 기술될 수 있다
    FROM    EMP, DEPT
    WHERE   DEPT_CODE = DEPT_ID
);

-- DML 문장 실행후 COMMIT / ROLLBACK을 실행 합니다
-- 실행하지 않은경우, 락이 걸려서 무한 대기에 빠질수 있습니다
SELECT * FROM EMP_01;
SELECT * FROM DEPT;

SELECT  EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM    EMP;

SELECT * FROM EMP_OLD;
DROP TABLE EMP_OLD;

-- 서브쿼리를 이용해서 테이블을 복사 하는 방법
-- 구조와 데이터를 함께 생성 하기
-- 구조만 생성 하기 = 데이터가 없는 빈테이블 = FALSE인 조건을 주면 구조만 생성가능
-- AS 키워드 생략 불가
CREATE TABLE EMP_OLD
AS SELECT   EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM    EMP
    -- 테이블의 구조만 복사
    WHERE   1=0;

CREATE TABLE EMP_NEW
AS SELECT   EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM    EMP
    -- 테이블의 구조만 복사
    WHERE   1=0;

INSERT ALL
    -- 조건이 일치하면
    WHEN HIRE_DATE < '2000/01/01' THEN
    -- 입력
    INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
    
    WHEN HIRE_DATE >= '2000/01/01' THEN
    INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)

SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMP;

SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPT;

-- 조건을 주지 않으면 모든 행에 적용이 됨
UPDATE  DEPT_COPY
SET     DEPT_TITLE = '전략기획팀';

SELECT * FROM DEPT_COPY;
ROLLBACK;

UPDATE  DEPT_COPY
SET     DEPT_TITLE = '전략기획팀'
WHERE   DEPT_ID = 'D9';

-- 단일행 업데이트
-- 방명수 사원의 급여와 보너스율을 유재식 사원과 동일하게 변경
SELECT EMP_NAME, SALARY, BONUS
FROM EMP
WHERE EMP_NAME IN ( '유재식', '방명수');

UPDATE  EMP
        -- 서브쿼리를 이용해서 값을 지정
        -- 서브쿼리 이용시 괄호로 묶어 줍니다.
SET     SALARY = (SELECT  SALARY
                    FROM    EMP
                   WHERE   EMP_NAME='유재식')
        , BONUS = (SELECT  BONUS
                    FROM    EMP
                    WHERE   EMP_NAME='유재식')
WHERE   EMP_NAME='방명수';

SELECT  BONUS
FROM    EMP
WHERE   EMP_NAME='유재식';


-- 다중행 다중열 업데이트
-- 노옹철, 전형돈, 정중하, 하동운의 급여와 보너스를 유재식 사원과 동일하게 변경
UPDATE  EMP
-- 다중열 - 여러행을 한번에 처리
SET     (SALARY, BONUS) = (SELECT  SALARY, BONUS
                            FROM    EMP
                           WHERE   EMP_NAME='유재식')
-- 다중행 - 여러줄이 조회 되어짐
WHERE   EMP_NAME IN ('노옹철', '전형돈', '정중하', '하동운')
;
SELECT EMP_NAME, SALARY, BONUS
FROM EMP
WHERE   EMP_NAME IN ('노옹철', '전형돈', '정중하', '하동운');

-- 아시아 지역에 근무하는 직원의 보너스를 0.3으로 변경
--SELECT  *
UPDATE  EMP
SET     BONUS = 0.3
-- 서브쿼리를 이용한 조회 조건
WHERE   EMP_ID IN (
                    SELECT  EMP_ID
                    FROM    EMP, DEPT D, LOCATION L
                    WHERE   EMP.DEPT_CODE = D.DEPT_ID
                    AND     D.LOCATION_ID = L.LOCAL_CODE
                    AND     LOCAL_NAME LIKE 'ASIA%');

COMMIT;

-- 총무부의 보너스를 0으로 업데이트
UPDATE  EMP
SET     BONUS = 0
WHERE   EMP_ID IN (
    SELECT  EMP_ID 
    FROM    EMP, DEPT
    -- 컬럼이름이 다른경우 테이블이름을 명시하지 않아도 됨
    WHERE   DEPT_CODE = DEPT_ID
    AND     DEPT_TITLE = '총무부');


DELETE EMP WHERE EMP_NAME='유재식';


COMMIT;


select * from tb_book order by b_no desc;

update      tb_book
set         title = ?, author = ?, price = ?
where       b_no = ?;








