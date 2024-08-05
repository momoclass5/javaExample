CREATE TABLE EMP_01(
    EMP_ID NUMBER                   -- ���
    , EMP_NAME VARCHAR2(30)         -- �����
    , DEPT_TITLE VARCHAR2(20)       -- �μ���
);

-- �������� : �����ȿ� �Ǵٸ� ������ ���Ǵ� ���
-- ���������� �̿��Ͽ� ������ ���
-- VALUESŰ���带 ������� �ʾƿ�!
INSERT INTO EMP_01 (
    -- DEPT_CODE : �μ����̺��� �⺻Ű
    SELECT  EMP_ID, EMP_NAME, DEPT_TITLE
    -- �������� ���̺��� ����� �� �ִ�
    FROM    EMP, DEPT
    WHERE   DEPT_CODE = DEPT_ID
);

-- DML ���� ������ COMMIT / ROLLBACK�� ���� �մϴ�
-- �������� �������, ���� �ɷ��� ���� ��⿡ ������ �ֽ��ϴ�
SELECT * FROM EMP_01;
SELECT * FROM DEPT;

SELECT  EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM    EMP;

SELECT * FROM EMP_OLD;
DROP TABLE EMP_OLD;

-- ���������� �̿��ؼ� ���̺��� ���� �ϴ� ���
-- ������ �����͸� �Բ� ���� �ϱ�
-- ������ ���� �ϱ� = �����Ͱ� ���� �����̺� = FALSE�� ������ �ָ� ������ ��������
-- AS Ű���� ���� �Ұ�
CREATE TABLE EMP_OLD
AS SELECT   EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM    EMP
    -- ���̺��� ������ ����
    WHERE   1=0;

CREATE TABLE EMP_NEW
AS SELECT   EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM    EMP
    -- ���̺��� ������ ����
    WHERE   1=0;

INSERT ALL
    -- ������ ��ġ�ϸ�
    WHEN HIRE_DATE < '2000/01/01' THEN
    -- �Է�
    INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
    
    WHEN HIRE_DATE >= '2000/01/01' THEN
    INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)

SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMP;

SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPT;

-- ������ ���� ������ ��� �࿡ ������ ��
UPDATE  DEPT_COPY
SET     DEPT_TITLE = '������ȹ��';

SELECT * FROM DEPT_COPY;
ROLLBACK;

UPDATE  DEPT_COPY
SET     DEPT_TITLE = '������ȹ��'
WHERE   DEPT_ID = 'D9';

-- ������ ������Ʈ
-- ���� ����� �޿��� ���ʽ����� ����� ����� �����ϰ� ����
SELECT EMP_NAME, SALARY, BONUS
FROM EMP
WHERE EMP_NAME IN ( '�����', '����');

UPDATE  EMP
        -- ���������� �̿��ؼ� ���� ����
        -- �������� �̿�� ��ȣ�� ���� �ݴϴ�.
SET     SALARY = (SELECT  SALARY
                    FROM    EMP
                   WHERE   EMP_NAME='�����')
        , BONUS = (SELECT  BONUS
                    FROM    EMP
                    WHERE   EMP_NAME='�����')
WHERE   EMP_NAME='����';

SELECT  BONUS
FROM    EMP
WHERE   EMP_NAME='�����';


-- ������ ���߿� ������Ʈ
-- ���ö, ������, ������, �ϵ����� �޿��� ���ʽ��� ����� ����� �����ϰ� ����
UPDATE  EMP
-- ���߿� - �������� �ѹ��� ó��
SET     (SALARY, BONUS) = (SELECT  SALARY, BONUS
                            FROM    EMP
                           WHERE   EMP_NAME='�����')
-- ������ - �������� ��ȸ �Ǿ���
WHERE   EMP_NAME IN ('���ö', '������', '������', '�ϵ���')
;
SELECT EMP_NAME, SALARY, BONUS
FROM EMP
WHERE   EMP_NAME IN ('���ö', '������', '������', '�ϵ���');

-- �ƽþ� ������ �ٹ��ϴ� ������ ���ʽ��� 0.3���� ����
--SELECT  *
UPDATE  EMP
SET     BONUS = 0.3
-- ���������� �̿��� ��ȸ ����
WHERE   EMP_ID IN (
                    SELECT  EMP_ID
                    FROM    EMP, DEPT D, LOCATION L
                    WHERE   EMP.DEPT_CODE = D.DEPT_ID
                    AND     D.LOCATION_ID = L.LOCAL_CODE
                    AND     LOCAL_NAME LIKE 'ASIA%');

COMMIT;

-- �ѹ����� ���ʽ��� 0���� ������Ʈ
UPDATE  EMP
SET     BONUS = 0
WHERE   EMP_ID IN (
    SELECT  EMP_ID 
    FROM    EMP, DEPT
    -- �÷��̸��� �ٸ���� ���̺��̸��� ������� �ʾƵ� ��
    WHERE   DEPT_CODE = DEPT_ID
    AND     DEPT_TITLE = '�ѹ���');


DELETE EMP WHERE EMP_NAME='�����';


COMMIT;


select * from tb_book order by b_no desc;

update      tb_book
set         title = ?, author = ?, price = ?
where       b_no = ?;








