/*
    <숫자 관련 함수>
    
    1) ABS
        - ABS(NUBER)
        - 절대값을 구하는 함수
*/
SELECT ABS(10.9), ABS(-10.9) FROM DUAL;

/*
    2) MOD
        - MOD(NUMBER, NUMBER)
        - 두 수를 나눈 나머지를 반환해 주는 함수 (자바의 % 연산과 동일하다.)
*/
SELECT MOD(10, 3) FROM DUAL;
SELECT MOD(10.9, 3) FROM DUAL;

/*
    3) ROUND
        - ROUND(NUMBER[, 위치])
        - 위치를 지정하여 반올림해주는 함수
        - 위치 : 기본값 0(.), 양수(소수점 기준으로 오른쪽)와 음수(소수점 기준으로 왼쪽)로 입력가능
*/
-- 반올림(버림) - 위치를 지정하지 않으면 정수로 반환
SELECT ROUND(123.456) FROM DUAL;
-- 반올림(올림) - 위치를 지정하지 않으면 정수로 반환
SELECT ROUND(123.556) FROM DUAL;
-- 반올림 하여 위치만큼 보여줌
-- 양수인 경우 소수점의 지정한 위치 다음에 있는 자리를 반올림
SELECT ROUND(123.456,2) FROM DUAL;
-- 음수인 경우 양수부의 지정한 위치에서 반올림
SELECT ROUND(123.456,-2) FROM DUAL;
-- 천단위 반올림
SELECT ROUND(123456, -3) FROM DUAL;

/*
    4) CEIL
        - CEIL(NUMBER)
        - 소수점 기준으로 올림해주는 함수
*/
SELECT CEIL(123.456) FROM DUAL;

/*
    5) FLOOR
        - FLOOR(NUMBER)
        - 소수점 기준으로 버림하는 함수
*/
-- 올림, 버림 함수의 경우 매개변수는 하나만 입력이 가능하다
-- ORA-00909: 인수의 개수가 부적합합니다
SELECT FLOOR(123.456, 2) FROM DUAL;

/*
    6) TRUNC
        - TRUNC(NUMBER[, 위치])
        - 위치를 지정하여 버림이 가능한 함수
        - 위치 : 기본값 0(.), 양수(소수점 기준으로 오른쪽)와 음수(소수점 기준으로 왼쪽)로 입력가능
*/
-- 원단위절삭
SELECT TRUNC(123.456, -1) FROM DUAL;





/*
    <날짜 관련 함수>
    
    1) SYSDATE
        시스템의 현재 날짜와 시간을 반환한다.
*/
SELECT SYSDATE FROM DUAL;

/* 
    2) MONTHS_BETWEEN
        [표현법]
            MONTHS_BETWEEN(DATE1, DATE2)
            
        - 입력받은 두 날짜 사이의 개월 수를 반환한다.
        - 결과값은 NUMBER 타입이다.
*/
SELECT MONTHS_BETWEEN(SYSDATE, SYSDATE) FROM DUAL;
-- 문자타입을 넣어도 자동 형변환 되어 계산 됨
SELECT MONTHS_BETWEEN(SYSDATE, '2024/03/01') FROM DUAL;
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('2021/03/01')))||'개월' FROM DUAL;
SELECT TO_DATE('2021/03/01') FROM DUAL;

-- EMP 테이블에서 직원명, 입사일, 근무개월수
SELECT EMP_NAME, HIRE_DATE, FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "근무개월수"
FROM    EMP;

/*
    3) ADD_MONTHS
        [표현법]
            ADD_MONTHS(DATE, NUMBER)
            
        - 특정 날짜에 입력받는 숫자만큼의 개월 수를 더한 날짜를 리턴한다.
        - 결과값은 DATE 타입이다.
*/
SELECT ADD_MONTHS(SYSDATE, 2) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 8) FROM DUAL;
SELECT ADD_MONTHS('2020/12/31', 2) FROM DUAL;

/*
    4) NEXT_DAY
        [표현법]
            NEXT_DAY(DATE, 요일(문자|숫자))
        
        - 특정 날짜에서 구하려는 요일의 가장 가까운 날짜를 리턴한다.
        - 결과값은 DATE 타입이다.
*/
SELECT SYSDATE, NEXT_DAY(SYSDATE, '목요일') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금') FROM DUAL;
-- 1: 일요일.....7:토요일
SELECT SYSDATE, NEXT_DAY(SYSDATE, 6) FROM DUAL;
-- 지정한 요일이 부적합 합니다
-- 지정된 언어
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL;

-- 현재 사용중인 언어 확인 하는 방법
SELECT value
FROM nls_session_parameters
WHERE parameter = 'NLS_LANGUAGE';

ALTER SESSION SET NLS_LANGUAGE = AMERICAN; -- 언어 변경
ALTER SESSION SET NLS_LANGUAGE = KOREAN; -- 언어 변경

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

/*
    5) LAST_DAY
        [표현법]
            LAST_DAY(DATE|CHAR)
        
        - 해당 월의 마지막 날짜를 반환한다.
        - 결과값은 DATE 타입이다.   
*/
-- 말일을 반환
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY('2024-12-01') FROM DUAL;

-- 입사월의 마지막 날자를 조회
SELECT HIRE_DATE 입사일, LAST_DAY(HIRE_DATE) 입사월의말일, LAST_DAY(HIRE_DATE)-HIRE_DATE 근무일
FROM EMP;

/*
    6) EXTRACT
        [표현법]
            EXTRACT(YEAR|MONTH|DAY FROM DATE);
            
        - 특정 날짜에서 연도, 월, 일 정보를 추출해서 반환한다.
          YEAR : 연도만 추출
          MONTH : 월만 추출
          DAY :  일만 추출
        - 결과값은 NUMBER 타입이다.
*/
SELECT  EXTRACT(YEAR FROM SYSDATE) 년
        , EXTRACT(MONTH FROM SYSDATE) 월
        , EXTRACT(DAY FROM SYSDATE) 일
        , TO_CHAR(SYSDATE, 'YYYY') 년
        , TO_CHAR(SYSDATE, 'MM') 월
        , TO_CHAR(SYSDATE, 'DD') 일
FROM    DUAL;

/*
    <형변환 함수>
    
    1) TO_CHAR
        [표현법]
            TO_CHAR(날짜|숫자[, 포멧])
        
        - 날짜 또는 숫자 타입의 데이터를 문자 타입으로 변환해서 반환한다.
        - 결과값은 CHARACTER 타입이다.
*/
-- 숫자 -> 문자
SELECT 1234, TO_CHAR(1234) FROM DUAL;
-- 6칸(9의 갯수 만큼)의 공간을 확보, 왼쪽 정렬, 빈칸 공백으로 채워줌
-- 9와 0은 형식을 지정하는 형식문자로 사용되는데 9는 자릿수만 지정하는 반면 0은 빈자리에 출력됨
SELECT TO_CHAR(1234, '999999') FROM DUAL; -- 9는 출력이 안됨
SELECT TO_CHAR(1234, '000000') FROM DUAL; -- 0은 출력이됨
-- 3자 콤마
SELECT TO_CHAR(1234, '999,999') FROM DUAL;
-- 숫자의 길이보다 지정한 형식이 짧으면 ###으로 출력
SELECT TO_CHAR(1200000, '999,999') FROM DUAL;
SELECT TO_CHAR(1200000, '999,999,999') FROM DUAL;
-- 현재 설정된 나라의 화폐단위
SELECT TO_CHAR(1200000, 'L999,999,999') FROM DUAL;

-- 날자 -> 문자
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE) FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
-- 시간만 출력(HH24:MI:SS - 24시간으로 시간을 출력)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;
-- DY : 수, DAY : 수요일
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD(DAY)') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YEAR') FROM DUAL;

-- 일에 대한 포맷
SELECT TO_CHAR(SYSDATE, 'DDD') -- 1년을 기준으로 몇일째 
        , TO_CHAR(SYSDATE, 'DD') -- 1달을 기준으로 몇일째
        , TO_CHAR(SYSDATE, 'D') -- 1주를 기준으로 몇일째
FROM DUAL;

-- 년월일을 직접 입력
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일"') FROM DUAL;

-- EMP 테이블에서 직원명, 입사일 조회
-- 입사일이 내림차순 정렬
-- 단, 입사일은 포멧을 지정해서 조회한다.(2021-09-28(화))
SELECT  TO_CHAR(hire_date, 'YYYY-MM-DD(DY)')
FROM    EMP
ORDER BY 1 DESC;

/*
    2) TO_DATE
        [표현법]
            TO_DATE(숫자|문자[, 포멧])
        
        - 숫자 또는 문자형 데이터를 날짜 타입으로 변환해서 반환한다.
        - 결과값은 DATE 타입이다.
*/
-- 숫자 -> 날자
SELECT TO_DATE(20240807) FROM DUAL;
SELECT TO_DATE(20240807102423) FROM DUAL;

-- 문자 -> 날자
SELECT TO_DATE('20240807') FROM DUAL;
SELECT TO_DATE('2024-08-07') FROM DUAL;
SELECT TO_DATE('2024/08/07 102930') FROM DUAL;
SELECT TO_DATE('07082024', 'DDMMYYYY') FROM DUAL;

-- EMP 테이블에서 1998년 1월 1일 이후에 입사한 사원의 사번, 이름, 입사일 조회
SELECT  EMP_ID, EMP_NAME, HIRE_DATE
FROM    EMP
-- 문자인 경우 자동 형변환, 숫자인 경우 오류가 발생
--WHERE   HIRE_DATE > '19980101'
--WHERE   HIRE_DATE > TO_DATE('19980101')
WHERE   HIRE_DATE BETWEEN '19980101' AND '2000-01-01'
ORDER BY HIRE_DATE;

/*
    3) TO_NUMBER
        [표현법]
            TO_NUMBER('문자값'[, 포멧])
        
        - 문자 타입의 데이터를 숫자 타입의 데이터로 변환해서 반환한다.
        - 결과값은 NUMBER 타입이다.
*/
SELECT '123456', TO_NUMBER('123456') FROM DUAL;
SELECT '1234'+'567' FROM DUAL;
-- 숫자 형태의 문자들만 자동 형변환 된다!!
-- 문자가 입력된 경우 오류 발생
SELECT '1234'+'567A' FROM DUAL;
-- 세자리 컴마를 숫자로 변경
SELECT TO_NUMBER('123,456,789', '999,999,999') FROM DUAL;


/*
    <NULL 처리 함수>
    
    1) NVL
        [표현법]
            NVL(컬럼, 컬럼값이 NULL일 경우 반환할 값)
        
        - NULL로 되어있는 컬럼의 값을 인자로 지정한 값으로 변경하여 반환한다.

    2) NVL2
        [표현법]
            NVL2(컬럼, 변경할 값 1, 변경할 값 2)
            
        - 컬럼 값이 NULL이 아니면 변경할 값 1, 컬럼 값이 NULL이면 변경할 값 2로 변경하여 반환한다.  
    
    3) NULLIF
        [표현법]
            NULLIF(비교대상 1, 비교대상 2)
            
        - 두 개의 값이 동일하면 NULL 반환, 두 개의 값이 동일하지 않으면 비교대상 1을 반환한다.
*/

-- NULL은 연산에서 제외 되므로 0으로 치환
SELECT NVL(BONUS, '0') FROM EMP;
-- 보너스를 0.1로 동결 
SELECT BONUS 보너스, NVL2(BONUS, 0.1, 0) 동결된보너스 FROM EMP;

-- 두 값이 같으면 NULL반환
SELECT NULLIF('123', '123') FROM DUAL;
-- 두 값이 같지 않으면 첫번째 값을 반환
SELECT NULLIF('123', '456') FROM DUAL;

/*
    <선택함수>
        여러 가지 경우에 선택을 할 수 있는 기능을 제공하는 함수이다.
    
    1) DECODE
        [표현법]
            DECODE(컬럼|계산식, 조건값 1, 결과값 1, 조건값 2, 결과값 2, ..., 결과값)
        
        - 비교하고자 하는 값이 조건값과 일치할 경우 그에 해당하는 결과값을 반환해 주는 함수이다.
*/
SELECT  DECODE (SUBSTR(EMP_NO, 8,1),1,'남',2,'여',3,'남',4,'여','잘못된 주민번호 입니다.' ) 성별
FROM    EMP;

-- EMPLOYEE 테이블에서 사원명, 직급 코드, 기존 급여, 인상된 급여를 조회
-- 직급 코드가 J7인 사원은 급여를 10% 인상(SALARY * 1.1) 
-- 직급 코드가 J6인 사원은 급여를 15% 인상(SALARY * 1.15) 
-- 직급 코드가 J5인 사원은 급여를 20% 인상(SALARY * 1.2) 
-- 이 외의 직급은 사원은 급여를 5%만 인상 (SALARY * 1.05)
SELECT  EMP_NAME, JOB_CODE, SALARY,
        DECODE (JOB_CODE, 'J7', SALARY*1.1,
                            'J6', SALARY*1.15,
                            'J5', SALARY*1.2,
                            SALARY*1.05) 인상된급여
FROM    EMP;

/*
    2) CASE
        [표현법]
            CASE WHEN 조건식 1 THEN 결과값 1
                 WHEN 조건식 2 THEN 결과값 2
                 ...
                 ELSE 결과값 N
            END
*/
SELECT CASE WHEN SUBSTR(EMP_NO, 8, 1) = 1 THEN '남자'
            WHEN SUBSTR(EMP_NO, 8, 1) = 2 THEN '여자'
            ELSE '주민번호 확인요망' -- 생략가능
        END -- 생략불가능
FROM    DUAL;

-- 사원의 급여가 5000000 이상이면 고수익, 3000000이상이면 일반, 나머지는 ''
SELECT  CASE WHEN SALARY >= 5000000 THEN '고수익'
            WHEN SALARY >= 3000000 THEN '일반'
            --ELSE ' '
        END
FROM    EMP;




