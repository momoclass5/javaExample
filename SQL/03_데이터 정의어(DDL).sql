/*
    <DDL(Data Definition Language)>
        (쿼리를 실행하는 순간 반영됨)
        데이터 정의 언어로 오라클에서 제공하는 
        객체를 만들고(CREATE), 변경하고(ALTER), 삭제하는(DROP) 등
        
        실제 데이터 값이 아닌 데이터의 구조 자체를 정의하는 언어로 
        DB 관리자, 설계자가 주로 사용한다.

        * 오라클에서의 객체 : 테이블, 뷰, 시퀀스, 인덱스, 트리거, 프로시져, 함수, 사용자 등등
        
    <CREATE>
        데이터베이스의 객체를 생성하는 구문이다.
    
    <TABLE(테이블)>
        테이블은 행과 열로 구성되는 가장 기본적인 데이터베이스 객체로 
        데이터베이스 내에서 모든 데이터는 테이블에 저장된다.
        
    <테이블 생성>
        [표현법]
            CREATE TABLE 테이블명 (
                컬럼명 자료형(크기) [DEFAULT 기본값] [제약조건],
                컬럼명 자료형(크기) [DEFAULT 기본값] [제약조건],
                ...
            );
*/
-- MEMBER 테이블 생성
CREATE TABLE MEMBER(
    ID VARCHAR2(20)
    , PW VARCHAR2(20)
    , NAME VARCHAR2(20)
    , REGDATE  DATE 
    , DELYN CHAR(1)
);

-- DML문장(INSERT, UPDATE, DELETE)은 커밋(저장)/롤백(취소) 작업이 필요하다
INSERT INTO MEMBER VALUES ('ID1', '1234', '홍길동', SYSDATE, 'N');
COMMIT;
-- 
SELECT * FROM MEMBER;
-- 테이블 삭제
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    ID VARCHAR2(20)
    , PW VARCHAR2(20)
    , NAME VARCHAR2(20)
    , REGDATE  DATE DEFAULT SYSDATE -- 기본값
    , DELYN CHAR(1)
);

-- 모든 컬럼에 값을 입력할때 - 컬럼명을 명시 하지 않음
-- NULL을 입력 하면 NULL이 입력됨
INSERT INTO MEMBER VALUES ('ID1', '1234', '홍길동', NULL, 'N');
INSERT INTO MEMBER VALUES ('ID1', '1234', '홍길동', DEFAULT, 'N');

-- 입력할 컬럼을 지정 - 테이블 이름뒤에 입력할 컬럼명을 명시
INSERT INTO MEMBER (ID) VALUES ('ID2');

-- 테이블에 추가한 테이터를 실제 데이터베이스에 반영 한다.
-- (메모리 버퍼에 임시 저장된 데이터를 실제 테이블에 반영)
COMMIT;
SELECT * FROM MEMBER;

-- 테이블의 구조를 확인
DESC MEMBER;

/*
    <컬럼에 주석 달기>
        [표현법]
            COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용';
*/
COMMENT ON TABLE MEMBER IS '멤버';
COMMENT ON COLUMN MEMBER.ID IS '아이디';
COMMENT ON COLUMN MEMBER.PW IS '비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '이름';
COMMENT ON COLUMN MEMBER.REGDATE IS '등록일';
COMMENT ON COLUMN MEMBER.DELYN IS '삭제여부';

/*
    데이터 딕셔너리(데이터 사전)
    사용자가 객체를 생성하거나 객체를 변경하는 등의 작업을 할 때 
    데이터베이스에 의해서 자동으로 갱신되는 테이블이다.

    DBA_XXX : 관리자만 접근 가능한 객체등의 정보조회
    USER_XXX : 계정이 소유한 객체등에 관한 정보 조회
    ALL_XXX : 계정소유 또는 권한을 부여받은 객체등에 관한 정보 조회

    데이터에 관한 데이터가 저장되어 있어 메타 데이터 라고도 한다
*/
SELECT * FROM USER_TABLES;

/*
    <제약 조건(CONSTRAINT)>
        사용자가 원하는 조건의 데이터만 유지하기 위해서 테이블 작성 시 
        각 컬럼에 대해 저장될 값에 대한 제약조건을 설정할 수 있다.
        제약 조건은 데이터 무결성 보장을 목적으로 한다. 
        (데이터의 정확성과 일관성을 유지시키는 것)
        
        * 종류 : NOT NULL   : 비워둘수 없음
                UNIQUE      : 중복될 수 없어
                CHECK       : 값을 제한(ex)Y, N만 입력 가능)
                PRIMARY KEY : 기본키 - NOT NULL + UNIQUE
                FOREIGN KEY : 외래키
        
        [표현법]
            1) 컬럼 레벨
                CRATE TABLE 테이블명 (
                    컬럼명 자료형(크기) [CONSTRAINT 제약조건명] 제약조건,
                    ...
                );

                제약조건명은 생략이 가능하며 생략할 경우 
                SYS_C일려번호 형태로 이름이 지정 된다
            
            2) 테이블 레벨
                CRATE TABLE 테이블명 (
                    컬럼명 자료형(크기),
                    ...,
                    [CONSTRAINT 제약조건명] 제약조건(컬럼명)
                );
*/
SELECT * FROM USER_CONSTRAINTS;

/*
    <NOT NULL 제약조건>
        해당 컬럼에 반드시 값이 있어야만 하는 경우 사용한다.
        삽입/수정 시 NULL 값을 허용하지 않도록 제한한다.
*/
DROP TABLE MEMBER;
-- 컬럼레벨방식
CREATE TABLE MEMBER(
    ID VARCHAR2(20) CONSTRAINT PK_MEMBER_ID PRIMARY KEY -- 기본키 제약조건(NOT NULL + UNIQUE)
    , PW VARCHAR2(20) CONSTRAINT NN_MEMBER_PW NOT NULL
    , NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL
    , REGDATE  DATE DEFAULT SYSDATE -- 기본값
    , DELYN CHAR(1)
);

-- 테이블레벨방식
CREATE TABLE MEMBER(
    ID VARCHAR2(20) NOT NULL
    , PW VARCHAR2(20) CONSTRAINT NN_MEMBER_PW NOT NULL
    , NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL
    , REGDATE  DATE DEFAULT SYSDATE -- 기본값
    , DELYN CHAR(1)
    , CONSTRAINT PK_MEMBER_ID UNIQUE(ID)
);
DESC MEMBER;
-- NOT NULL 제약조건에 의해 ID, PW, NAME 컬럼에
-- 값이 입력되지 않은경우 오류 발생
INSERT INTO MEMBER (ID) VALUES ('ID1');
-- 아이디를 중복해서 입력 할경우 오류 발생
INSERT INTO MEMBER (ID, PW, NAME) VALUES ('ID1', 'PW', '홍홍홍');
SELECT * FROM MEMBER;


/*  <UNIQUE 제약조건>
        컬럼의 입력 값에 중복 값을 제한하는 제약조건이다.
        데이터를 삽입/수정 시 기존에 있는 데이터 값 중에 중복되는 값이 있을 경우 삽입/수정되지 않는다.
        제약조건 지정 방식으로 컬럼 레벨, 테이블 레벨 방식 모두 사용 가능하다.
*/

/*
    <CHECK 제약조건>
        컬럼에 기록되는 값에 조건을 설정하고 조건을 만족하는 값만 기록할 수 있다.
        비교 값은 리터럴만 사용 가능하다.(변하는 값이나 함수 사용하지 못한다.)
        
        [표현법]
            CHECK(비교연산자)
                CHECK(컬럼 [NOT] IN(값, 값, ...))
                CHECK(컬럼 = 값)
                CHECK(컬럼 BETWEEN 값 AND 값)
                CHECK(컬럼 LIKE '_문자' OR 컬럼 LIKE '문자%')
                ...
*/
DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    ID VARCHAR2(20) NOT NULL
    , PW VARCHAR2(20) CONSTRAINT NN_MEMBER_PW NOT NULL
    , NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL
    , REGDATE  DATE DEFAULT SYSDATE -- 기본값
    , DELYN CHAR(1) CONSTRAINT CHECK_MEMBER_DELYN CHECK(DELYN IN ('Y', 'N'))
    , GENDER CHAR(1) CHECK(GENDER IN ('M', 'F'))
    , AGE NUMBER CHECK(AGE > 0)
    , CONSTRAINT PK_MEMBER_ID UNIQUE(ID)
);