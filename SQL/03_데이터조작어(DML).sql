/*
    <DML(Data Manipulation Language)>
        데이터 조작 언어로 테이블에 값을 
        삽입(INSERT)하거나, 수정(UPDATE), 삭제(DELETE)하는 구문이다.
        
    <INSERT>
        테이블에 새로운 행을 추가하는 구문이다.

-- 테이블 삭제
DROP TABLE 테이블이름; 
*/

-- 테이블 복사
CREATE TABLE EMP_01 AS SELECT * FROM EMP;
SELECT * FROM EMP_01;

-- 테이블의 구조 복사 - 데이터는 복사하지 않음                             
CREATE TABLE EMP_02 AS SELECT * FROM EMP WHERE 1<0;
SELECT * FROM EMP_02;

-- 테이블의 구조 복사2 - 원하는 컬럼만 복사
CREATE TABLE EMP_03 AS SELECT EMP_ID, EMP_NAME FROM EMP WHERE 1<0;
SELECT * FROM EMP_03;

-- 테이블 생성
-- 서브쿼리를 이용해서 테이블을 생성시 AS 키워드가 이용됨
CREATE TABLE EMP_COPY(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30),
    DEPT_TITLE VARCHAR2(35)
);
SELECT * FROM EMP_COPY;
DELETE FROM EMP_COPY;
INSERT INTO EMP_COPY (
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM    EMP, DEPT
    WHERE   DEPT_CODE = DEPT_ID
);
--DML문장은 실행후 커밋이나 롤백을 해줘야 함
COMMIT;

-- 테이블 삭제
DROP TABLE EMP_01;
DROP TABLE EMP_02;
DROP TABLE EMP_03;
DROP TABLE EMP_COPY;

-- EMP_INFO : 테이블이름
-- 사원번호, 사원명, 직급명, 부서명
-- 구조만들기
CREATE TABLE EMP_INFO AS (
    SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE
    FROM    EMP
    JOIN    DEPT ON (DEPT_CODE = DEPT_ID)
    JOIN    JOB USING (JOB_CODE)
    -- 데이터 없이 구조만 복사 하기 위해 FALSE 조건을 줍니다
    WHERE   1=2
);

SELECT * FROM EMP_INFO;  

-- 테이블의 구조를 확인
DESC EMP_INFO;

/*
    <INSERT>
        테이블에 새로운 행을 추가하는 구문이다.

        1) INSERT INTO 테이블명 VALUES(값, 값, 값, ..., 값);
            테이블에 모든 컬럼에 값을 INSERT 하고자 할 때 사용한다.
            컬럼 순번을 지켜서 VALUES에 값을 나열해야 한다.
        2) INSERT INTO 테이블명(컬럼명, 컬럼명, ..., 컬럼명) VALUES(값, 값, ..., 값);
            테이블에 내가 선택한 컬럼에 대한 값만 INSERT 하고자 할 때 사용한다.
            선택이 안된 컬럼들은 기본적으로 NULL 값이 들어간다. (NOT NULL 제약조건이 걸려있는 컬럼은 반드시 선택해서 값을 제시해야 한다.)
            단, 기본값(DEFAULT)이 지정되어 있으면 NULL이 아닌 기본값이 들어간다.    
        3) INSERT INTO 테이블명 (서브쿼리); (백업테이블 생성시 이용, 사용자정보가 수정될 경우 HISTORY테이블에 데이터 추가)
            VALUES를 대신해서 서브 쿼리로 조회한 결과값을 통채로 INSERT 한다.(즉, 여러행을 INSERT 시킬 수 있다.)
            서브 쿼리의 결과값이 INSERT 문에 지정된 컬럼의 개수와 데이터 타입이 같아야 한다.
            
            INSERT INTO 테이블명 (서브쿼리);

*/
-- 모든 컬럼에 값을 입력
INSERT INTO EMP_INFO VALUES ('100', '홍길순', '사장', '총무부');
-- 특정 컬럼에 값을 입력
INSERT INTO EMP_INFO (EMP_ID, EMP_NAME) VALUES ('200', '홍길동');

SELECT * FROM EMP_INFO;

-- 서브쿼리를 이용하는 방법
INSERT INTO EMP_INFO (
    SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE
    FROM    EMP
    JOIN    DEPT ON (DEPT_CODE = DEPT_ID)
    JOIN    JOB USING (JOB_CODE)
);

SELECT * FROM EMP_INFO;
    -- 데이터 없이 구조만 복사 하기 위해 FALSE 조건을 줍니다
    --WHERE   1=2

/*
    <INSERT ALL>
    하나의 쿼리를 이용하여 두개 이상 테이블에 INSERT
    INSERT ALL을 이용 하여 여러개 테이블에 한번에 데이터를 삽입
    
    [표현법]
    1) INSERT ALL
       INTO 테이블명1[(컬럼, 컬럼, ...)] VALUES(값, 값, ...)
       INTO 테이블명2[(컬럼, 컬럼, 컬럼, ...)] VALUES(값, 값, 값, ...)
       서브 쿼리;
*/
-- EMP테이블의 구조를 복사하여 테이블을 생성
-- EMP_DEPT : EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
-- EMP_MANAGER : EMP_ID, EMP_NAME, MANAGER_ID
CREATE TABLE EMP_DEPT AS (
    SELECT  EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
    FROM    EMP
    WHERE   1=2
);
CREATE TABLE EMP_MANAGER AS (
    SELECT EMP_ID, EMP_NAME, MANAGER_ID
    FROM EMP
    WHERE 1=2
);
-- 하나의 INSERT문장으로 여러개 테이블에 데이터를 삽입
INSERT ALL 
INTO EMP_DEPT VALUES (A, B, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES (A, B, MANAGER_ID)
    -- 별칭을 사용 할 경우, 컬럼명대신 별칭을 이용합니다!
    SELECT EMP_ID A, EMP_NAME B, MANAGER_ID, DEPT_CODE, HIRE_DATE
    FROM EMP
;
SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;
/*
2) INSERT ALL
   WHEN 조건1 THEN 
       INTO 테이블명1[(컬럼, 컬럼, ...)] VALUES(값, 값, ...)
   WHEN 조건2 THEN     
       INTO 테이블명2[(컬럼, 컬럼, ...)] VALUES(값, 값, ...)
   서브 쿼리;
*/
-- EMP 테이블의 입사일 기준으로 
-- 컬럼 : EMP_ID, EMP_NAME, HIRE_DATE, SALARY
-- 2000년 1월 1일 이전에 입사한 사원의 정보는 EMP_OLD 테이블에 삽입하고
-- 2000년 1월 1일 이후에 입사한 사원의 정보는 EMP_NEW 테이블에 삽입한다.

-- 1. 테이블 구조 복사
CREATE TABLE EMP_OLD AS (
    SELECT  EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM    EMP
    WHERE   1=2
);
CREATE TABLE EMP_NEW AS (
    SELECT  EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM    EMP
    WHERE   1=2
);

INSERT ALL
    -- 조건에 일치하는 데이터를 삽입
    WHEN HIRE_DATE < '2000-01-01' THEN
    INTO EMP_OLD VALUES (EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
    
    WHEN HIRE_DATE >= '2000-01-01' THEN
    INTO EMP_NEW VALUES (EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
    
    -- 서브쿼리에 조회된 데이터를 테이블에 삽입
    SELECT  EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM    EMP
;
SELECT * FROM EMP_NEW;
SELECT * FROM EMP_OLD;

/*
    <UPDATE>
        테이블에 기록된 데이터를 수정하는 구문이다.
         
        [표현법]
            UPDATE 테이블명
            SET 컬럼명 = 변경하려는 값,
                컬럼명 = 변경하려는 값,
                ...
            [WHERE 조건];
            
    - SET 절에서 여러 개의 컬럼을 콤마(,)로 나열해서 값을 동시에 변경할 수 있다.
    - WHERE 절을 생략하면 모든 행의 데이터가 변경된다.
*/
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPT;
-- DEPT_COPY 테이블에서 DEPT_ID가 'D9'인 부서명을 '전략기획팀'으로 수정
SELECT * FROM DEPT_COPY;

UPDATE  DEPT_COPY
SET     DEPT_TITLE = '전략기획팀'
WHERE   DEPT_ID = 'D9';
COMMIT;

-- EMP 테이블에서 노옹철 사원의 급여를 3500000원으로 변경
SELECT * FROM EMP;
UPDATE  EMP
SET     SALARY = 3500000
--SELECT * FROM EMP
WHERE   EMP_NAME = '노옹철';

-- 모든 사원의 급여를 기존 급여에서 
-- 10프로 인상한 급액(기존 급여 * 1.1)으로 변경
SELECT SALARY, SALARY * 1.1 FROM EMP;

UPDATE  EMP
SET     SALARY = SALARY * 1.1;

SELECT * FROM EMP;
COMMIT;

-- 방명수 사원의 급여와 보너스를 
-- 유재식 사원과 동일하게 변경 (3740000, 0.2)
SELECT SALARY, BONUS
FROM EMP
WHERE   EMP_NAME = '유재식'
OR     EMP_NAME = '방명수';

--SELECT SALARY, BONUS FROM EMP
-- 1) 단일행 서브쿼리를 각각의 컬럼에 적용
UPDATE  EMP
SET     SALARY = (SELECT SALARY FROM EMP WHERE EMP_NAME = '유재식')
        , BONUS = (SELECT BONUS FROM EMP WHERE EMP_NAME = '유재식')
WHERE   EMP_NAME = '방명수';

-- 2) 다중열 서브쿼리를 사용하여 한번에 적용
UPDATE EMP
SET     (SALARY, BONUS) = 
                        (SELECT SALARY, BONUS
                        FROM EMP
                        WHERE   EMP_NAME = '유재식')
--WHERE   EMP_NAME = '방명수';
WHERE DEPT_CODE = 'D1';

SELECT * FROM EMP WHERE DEPT_CODE = 'D1';

-- EMP 테이블에서 아시아 지역에 근무하는 직원들의 
-- 보너스를 0.3으로 변경
-- 1) 아시아 지역에 근무하는 사원들 조회
SELECT  EMP_ID   
FROM    EMP
LEFT JOIN    DEPT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN    LOCATION ON (LOCATION_ID = LOCAL_CODE)
-- ASIA로 시작하는
WHERE LOCAL_NAME LIKE 'ASIA%';

-- 2) 서브쿼리를 이용해 업데이트
UPDATE EMP
SET BONUS = 0.3
WHERE   EMP_ID IN (
    SELECT  EMP_ID   
    FROM    EMP
    LEFT JOIN    DEPT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN    LOCATION ON (LOCATION_ID = LOCAL_CODE)
    -- ASIA로 시작하는
    WHERE LOCAL_NAME LIKE 'ASIA%'
);

/*
    <DELETE>
        테이블에 기록 된 데이터를 삭제하는 구문이다. (행 단위로 삭제한다.)
        
        [표현법]
            DELETE [FROM] 테이블명
            [WHERE 조건식];
            
        - WHERE 절을 제시하지 않으면 전체 행이 삭제된다.
*/
-- 하이유 사원의 데이터 지우기
--SELECT * 
DELETE 
FROM EMP WHERE EMP_NAME = '하이유';

-- EMP_NEW 테이블에 공유를 추가 해봅시다
DESC EMP_NEW;
-- 300, 공유, '2024-05-10'(SYSDATE), 5000000
INSERT INTO EMP_NEW VALUES ('300', '공유', '2024-05-10', 5000000);
-- 301, 공휴, NULL, NULL
INSERT INTO EMP_NEW (EMP_ID, EMP_NAME) VALUES ('300', '공유');
COMMIT;
SELECT * FROM EMP_NEW ORDER BY EMP_ID DESC;

/*
    <MERGE>
        구조가 같은 두개의 테이블을 하나의 테이블로 합치는 기능
        두 테이블에서 지정하는 조건의 값이 존재하면 UPDATE
                                       존재하지 않으면 INSERT
*/

-- 입사일 기준으로 데이터를 분리
SELECT * FROM EMP_NEW; -- 17건
SELECT * FROM EMP_OLD; -- 9건
-- EMP_OLD INSERT '201', '송종기', SYSDATE, 6600000
INSERT INTO EMP_OLD VALUES ('201', '송종기', SYSDATE, 6600000);

-- EMP_OLD -> EMP_NEW로 합치기
MERGE INTO EMP_NEW
USING EMP_OLD ON (EMP_NEW.EMP_ID = EMP_OLD.EMP_ID)
-- 조건이 일치하면 실행
WHEN MATCHED THEN
    UPDATE SET 
        EMP_NEW.HIRE_DATE = EMP_OLD.HIRE_DATE
        , EMP_NEW.SALARY = EMP_OLD.SALARY
-- 조건이 불일치 하면 실행 (일치하는 사원이 존재 하지 않는 경우)
-- OLD 테이블에는 있고, NEW 테이블에는 없는 경우
WHEN NOT MATCHED THEN
    INSERT VALUES (EMP_OLD.EMP_ID, EMP_OLD.EMP_NAME, EMP_OLD.HIRE_DATE, EMP_OLD.SALARY);



