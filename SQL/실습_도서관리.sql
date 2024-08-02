-- 기존 테이블 삭제
DROP TABLE TB_BOOK;
DROP TABLE TB_MEMBER;
DROP TABLE TB_PUB;
DROP TABLE TB_RENT;


-- 도서관리 프로그램을 만들기 위한 테이블 만들기 
-- 제약조건 추가및 COMMENT 추가

-- 1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUB) 
--  1) 컬럼 : P_NO(출판사 번호 - P00001) -- 기본 키
--           PUB_NAME(출판사명) -- NOT NULL
--           PHONE(출판사 전화번호)
--           DELYN(삭제 여부)     -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(등록일)  -- 기본값으로 SYSDATE, NOT NULL
CREATE TABLE TB_PUB(
    P_NO            CHAR(6)         PRIMARY KEY
    , PUB_NAME      VARCHAR2(20)    NOT NULL
    , PHONE         VARCHAR2(20)    
    , DELYN         CHAR(1)         DEFAULT 'N' CHECK (DELYN IN ('Y', 'N'))
    , REGDATE       DATE            DEFAULT SYSDATE
);

--  2) 3개 정도의 샘플 데이터 추가하기
INSERT INTO TB_PUB VALUES ('P00001', '문학동네', '02-222-3333', DEFAULT, DEFAULT);
INSERT INTO TB_PUB (P_NO, PUB_NAME) VALUES ('P00002', '한빛미디어');
INSERT INTO TB_PUB (P_NO, PUB_NAME, PHONE) VALUES ('P00003', '길벗', '031-222-3333');

SELECT * FROM TB_PUB;

--  3) 커멘트 달기
-- 테이블에 커멘트 추가
COMMENT ON TABLE TB_PUB IS '출판사';
-- 컬럼에 커멘트 추가
COMMENT ON COLUMN TB_PUB.P_NO IS '출판사 번호';
COMMENT ON COLUMN TB_PUB.PUB_NAME IS '출판사 이름';
COMMENT ON COLUMN TB_PUB.PHONE IS '출판사 전화번호';
COMMENT ON COLUMN TB_PUB.DELYN IS '삭제여부';
COMMENT ON COLUMN TB_PUB.REGDATE IS '등록일';

-- 2. 도서들에 대한 데이터를 담기 위한 도서 테이블 (TB_BOOK)
--  1) 컬럼 : B_NO (도서번호 - B00001) -- 기본 키
--           TITLE (도서명)        -- NOT NULL
--           AUTHOR(저자명)        -- NOT NULL
--           PRICE(가격)
--           P_NO(출판사 번호)     -- 외래 키(TB_PUB 테이블을 참조)
--           RENTYN(대여여부)      -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           DELYN(삭제 여부)      -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(등록일)       -- 기본값으로 SYSDATE, NOT NULL
DROP TABLE TB_BOOK;
CREATE TABLE TB_BOOK(
    B_NO        CHAR(6)         PRIMARY KEY
    , TITLE     VARCHAR2(100)   NOT NULL
    , AUTHOR    VARCHAR2(20)    NOT NULL
    , PRICE     NUMBER
    -- 외래키제약조건(자식 데이터가 있으면 삭제 불가)
    -- ON DELETE CASCADE 옵션 : 부모테이블의 데이터가 삭제 될 때 자식테이블의 데이터도 함께 삭제
    -- ON DELETE SET NULL 옵션 : 부모테이블의 데이터가 삭제 될 때 자식 테이블의 데이터는 NULL로 업데이트 
    , P_NO      CHAR(6)         REFERENCES TB_PUB(P_NO)    ON DELETE CASCADE
    , RENTYN    CHAR(1)         DEFAULT 'N' CHECK (RENTYN IN ('Y', 'N'))
    , DELYN     CHAR(1)         DEFAULT 'N' CHECK (DELYN IN ('Y', 'N'))
    , REGDATE   DATE            DEFAULT SYSDATE
);

--  2) 5개 정도의 샘플 데이터 추가하기
--  FK제약조건 위배시 데이터 입력 제한
--  외래키제약조건에 걸린 컬럼에는 NULL또는 부모가 가진 데이터만 입력이 가능하다!!!!!
INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO) VALUES('B00001', '오늘도맑음', '박서현', 'P00002');
INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO) VALUES('B00002', '오라클과 SQL', '홍형경', 'P00002');
INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO) VALUES('B00003', '스프링부트3', '신선영', 'P00002');
INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO) VALUES('B00004', '이것이자바다', '신용권', 'P00003');
INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO) VALUES('B00005', '단단한말', '김종원', 'P00003');

-- DML문장을 실행후 COMMIT/ROLLBACK
COMMIT;
SELECT * FROM TB_BOOK;

-- 부모테이블 데이터 삭제시 참조하고 있는 자식테이블의 데이터도 함께 제거
-- 자식테이블에서 사용중이므로 삭제가 불가능 = 기본값
DELETE TB_PUB WHERE P_NO='P00001';

COMMENT ON TABLE TB_BOOK IS '도서';
COMMENT ON COLUMN TB_BOOK.B_NO IS '도서번호';
COMMENT ON COLUMN TB_BOOK.TITLE IS '도서명';
COMMENT ON COLUMN TB_BOOK.AUTHOR IS '작가';
COMMENT ON COLUMN TB_BOOK.P_NO IS '출판사 번호';
COMMENT ON COLUMN TB_BOOK.DELYN IS '삭제여부';
COMMENT ON COLUMN TB_BOOK.RENTYN IS '대여여부 Y:대여중 N:대여가능';
COMMENT ON COLUMN TB_BOOK.REGDATE IS '등록일자';


-- 3. 회원에 대한 데이터를 담기 위한 회원 테이블 (TB_MEMBER)
--  1) 컬럼 : M_NO(회원번호 - M00001) -- 기본 키
--           ID(아이디)   -- 중복 금지
--           PW(비밀번호) -- NOT NULL
--           NAME(회원명) -- NOT NULL
--           GENDER(성별)        -- 'M' 또는 'F'로 입력되도록 제한
--           ADDR(주소)       
--           PHONE(연락처)       
--           DELYN(탈퇴 여부)     -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(가입일)  -- 기본값으로 SYSDATE, NOT NULL

--  2) 3개 정도의 샘플 데이터 추가하기


-- 4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여 목록 테이블(TB_RENT)
--  1) 컬럼 : R_NO(대여번호 R00001) -- 기본 키
--           M_NO(대여 회원번호 M00001) -- 외래 키(TB_MEMBER와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           B_NO(대여 도서번호 B00001) -- 외래 키(TB_BOOK와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           RENT_DATE(대여일) -- 기본값 SYSDATE
--           RETURN_DATE(반납일)


-- 아이디가 M00001번인 사람이 B00003번책을 대여


-- 렌트번호, 회원번호, 도서번호
-- 첫글자가 B로 시작하는 5자리 숫자
-- B0001, 2, 3
SELECT 'B'||LPAD(SEQ_BOOK_NO.NEXTVAL, 5, '0')
FROM DUAL;

-- 시퀀스 생성 
-- NEXTVAL : 1씩 증가하는값을 반환
CREATE SEQUENCE SEQ_BOOK_NO;

-- INSERT INTO TB_RENT VALUES('B'||LPAD(SEQ_BOOK_NO.NEXTVAL, 5, '0'), M001, B001, DEFAULT);
INSERT INTO TB_RENT VALUES(4, 1, 3, DEFAULT);
INSERT INTO TB_RENT VALUES(5, 1, 5, DEFAULT);

-- 아이디가 2번인 사람이 1번책을 대여
INSERT INTO TB_RENT VALUES(2, 2, 1, DEFAULT);
-- 아이디가 3번인 사람이 1번책을 대여
INSERT INTO TB_RENT VALUES(3, 3, 1, DEFAULT);

-- 5. 1번 도서를 대여한 회원의 이름, 아이디, 대여일, 반납 예정일(대여일 + 7일)을 조회하시오.
SELECT  MEMBER_NAME 이름, MEMBER_ID 아이디, ENROLL_DATE 대여일, ENROLL_DATE+7 반납예정일
FROM    TB_MEMBER M, TB_RENT R
WHERE   M.MEMBER_NO = R.RENT_MEM_NO
AND     R.RENT_BOOK_NO = 1;
SELECT * FROM    TB_MEMBER;
UPDATE TB_MEMBER SET MEMBER_NAME = '홍길순' WHERE MEMBER_ID = 'USER03';
UPDATE TB_MEMBER SET MEMBER_NAME = '김길동' WHERE MEMBER_ID = 'USER02';

-- 대여 이력
-- 6. 회원번호가 1번인 회원이 대여한 도서들의 도서명, 출판사명, 대여일, 반납예정일(대여일 + 7일)을 조회하시오.
SELECT  BK_TITLE, RENT_DATE, RENT_DATE+7 , PUB_NAME
FROM    TB_BOOK, TB_RENT, TB_PUBLISHER
WHERE   BK_NO = RENT_BOOK_NO
AND     BK_PUB_NO = PUB_NO
AND     RENT_MEM_NO = 1;

SELECT * FROM TB_RENT;





SELECT * FROM EMP;