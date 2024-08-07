/*
    <함수>
        컬럼값을 읽어서 계산 결과를 반환한다.
          - 단일행 함수 : N개의 값을 읽어서 N개의 결과를 리턴한다. (매 행 함수 실행 -> 결과 반환)
          - 그룹 함수   : N개의 값을 읽어서 1개의 결과를 리턴한다. (하나의 그룹별로 함수 실행 -> 결과 반환)
        SELECT 절에 단일행 함수와 그룹 함수를 함께 사용하지 못한다. (결과 행의 개수가 다르기 때문에)
        함수를 기술할 수 있는 위치는 SELECT, WHERE, ORDER BY, GROUP BY, HAVING 절에 기술할 수 있다.
        (FROM절에는 테이블이름이 기술되므로 사용 할 수 없다)
*/
-- 단일행 함수
/*
    <문자관련 함수>
    1) LENGTH : 글자수를 반환
       LENGTHB : 글자의 바이트수를 반환
       한글은 한글자당 3BYTE(지정된 문자셋에 따라 다를수 있음)
       영어, 숫자, 특수문자 1BYTE     
*/

select  length('오라클'), lengthb('오라클')
FROM    dual;

select sysdate 
from dual;

/*
    DUAL 테이블
    - SYS 사용자가 소유하는 테이블
    - SYS 사용자가 소유하지만 모든 사용자가 접근 할 수 있다
    - 하나의 행, 하나의 컬럼을 가지고 있는 더미 테이블이다
    - 사용자가 함수를 계산하거나 오늘 날자를 출력할때 임시로 사용되는 테이블
*/

/*
    2) INSTR
        - INSTR(컬럼|'문자값', '문자'[, POSITION[, OCCURRENCE]])
        - 지정한 위치부터 지정된 숫자 번째로 나타나는 문자의 시작 위치를 반환한다.

        position :  양수 - 앞에서 부터
                    음수 - 뒤에서 부터
*/
-- 첫번째 나오는 B의 위치를 반환
select instr('AABAACAABBAA', 'B') from dual;        
-- 두번째 나오는 B의 위치를 반환
select instr('AABAACAABBAA', 'B', 1, 2) from dual;  
-- 세번째 나오는 B의 위치를 반환
select instr('AABAACAABBAA', 'B', 1, 3) from dual;  
-- 뒤에서 부터 첫번째로 나오는 나오는 B 위치(위치는 앞에서부터 넘버링)를 반환
select instr('AABAACAABBAA', 'B', -1) from dual;  
select instr('AABAACAABBAA', 'B', -1, 3) from dual;  
-- 문자열이 없는 경우 0 을 반환
select instr('AABAACAABBAA', 'K', -1) from dual;  

-- 주민등록번호의 '-' 위치 '621235-1985634'
-- 이메일의 @의 위치 'sun_di@or.kr'
select email, instr(email, '@') , emp_no, instr(emp_no, '-') from emp;

/*
    3) SUBSTR
        - SUBSTR(컬럼|'문자값', POSITION[, LENGTH])
        - 문자데이터에서 지정한 위치부터 지정한 개수만큼의 문자열을 추출해서 반환한다.
*/
-- SUBSTR(컬럼명, 시작위치, 글자수)
select substr('show me the money', 7) 
from dual;
select substr('show me the money', 5, 2)
from dual;
select substr('show me the money', -9, 3)
from dual;
-- 0 또는 1을 넣으면 첫번째 문자 부터 가지고 나옴 
select substr('쇼우 미 더 머니', 1, 2)
from dual;

-- 사원테이블의 이메일 컬럼에서 이메일 아이디와 도메인 추출을 추출 해보세요
-- sun_di@or.kr   ->  아이디@도메인
-- 1) INSTR함수를 이용해서 @의 위치를 확인
-- 2) SUBSTR함수를 이용해서 문자열을 추출(시작위치, 문자의 갯수)
select  email, instr(email,'@'), instr(email,'@')-1
from    emp;
-- 어디서 부터(시작위치), 몇개
-- 처음부터 @의 위치까지
select  substr(email, 1, instr(email,'@'))
-- @는 빼고 id만 출력
, substr(email, 1, instr(email,'@') - 1) 아이디
, substr(email, instr(email,'@') + 1) 도메인
FROM    emp;

-- 사원 테이블의 주민등록 번호의 뒷번호 1번째 자리까지 추출
-- 621235-1985634 -> 621235-1******
select  emp_no
        , substr(emp_no, instr(emp_no, '-') + 1, 1)
        , substr(emp_no, instr(emp_no, '-') + 1, 1)||'******'
        , substr(emp_no, 1, instr(emp_no,'-')+1)||'******'
FROM    emp
where substr(emp_no, instr(emp_no, '-') + 1, 1) = 2;

-- 사원테이블에서 여자사원의 모든컬럼을 조회 하세요
select *
from emp
--where substr(emp_no, instr(emp_no, '-') + 1, 1) in (2, 4);
where SUBSTR(EMP_NO, 8, 1) in (2,4);

-- 부서테이블에서 부서코드가 D1, D2, D3인 부서만 조회 하세요
select dept_id, instr('D1|D2|D3', dept_id)
from dept
/*WHERE DEPT_ID = 'D1'
or DEPT_ID = 'D2'
or DEPT_ID = 'D3';
*/
-- where DEPT_ID not in ('D1', 'D2', 'D3');
where instr('D1|D2|D3', dept_id) > 0;

/*
    4) LPAD/RPAD
    - LPAD/RPAD(값, 길이[,'덧붙이려고 하는 문자'])
    - 제시된 값에 임의의 문자를 왼쪽 또는 오른쪽에 
        붙여 최종 N길이 만큼 문자열을 반환 한다.
    - 문자를 통일감있게 표시하고자 할때 사용
*/
-- 20만큼의 길이중 email은 오른쪽으로 정렬하고 공백을 왼쪽으로 채운다
-- 왼쪽을 공백으로 채워줌
select  email, lpad(email, 20)
FROM    emp;
-- 오른쪽을 공백으로 채워줌
select  email, rpad(email, 20)
FROM    emp;
-- 길이가 짧으면 지정된 자릿수만큼만 출력
-- 공백, 지정한문자로 빈공간을 채워줍니다.
select  email, lpad(email, 20, '*'), rpad(email, 20, '$'), rpad(email, 2)
FROM    emp;

-- 사원테이블에서 주민등록번호의 뒤1자리까지 추출하고 오른쪽에 *문자를 채워서 출력
SELECT  RPAD( SUBSTR(EMP_NO, 1, instr(EMP_NO, '-') + 1) , 14, '*')
        , RPAD( SUBSTR(EMP_NO, 1, 8) , 14, '*')
FROM    emp;

/*
    5) LOWER / UPPER / INITCAP
    - LOWER|UPPER|INITCAP (컬럼|'문자값')
     LOWER : 모두 소문자로 변경
     UPPER : 모두 대문자로 변경
     INITCAP : 단어 앞 글자마다 대문자로 변경
*/
SELECT  LOWER('ABCD'), UPPER('abcd'), INITCAP('abcd abcd')
FROM    dual;

/*
    6) CONCAT
    - CONCAT(컬럼|'문자열', 컬럼|'문자열')   ==   ||
    - 문자데이터 두개를 전달 받아서 하나로 합친후 결과를 반환
*/
-- 인수는 2개만 넣어줄 수 있다 
-- ======> 3개 이상 넣을경우 인수의 갯수가 부적합합니다 오류 발생
SELECT  CONCAT(CONCAT('hello', 'world'), ' wow!')
FROM    dual;
/*
    7) REPLACE : 치환, 바꾸기
    - REPLACE(컬럼|'문자값', 변경하려는 문자, 변경하고자 하는 문자)
    - 컬럼, 문자값에서 변경하고자 하는 문자를 변경하려는 문자로 변경하여 반환
*/
SELECT  replace('서울시 강남구 역삼동', '역삼동', '삼성동')
FROM    dual;

select * from emp;
-- 'sun_di@or.kr' 이메일 주소의 or.kr을 gmail.com 으로 변경하여 조회 해봅시다
-- 사원명, 이메일주소, 변경된 이메일주소
-- 함수를 이용한다고 해서 데이터가 변하는것은 아니다!!!!
-- 결과집합(조회결과)의 데이터만 변경되서 보여진다!!!!!
-- 쿼리는 대소문자를 구분하지 않지만 데이터는 구분한다!!!!!
SELECT  EMP_NAME, EMAIL, REPLACE(EMAIL, 'or.kr', 'gmail.com')
FROM    EMP;







