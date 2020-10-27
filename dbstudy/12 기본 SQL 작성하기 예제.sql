DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;


CREATE TABLE DEPARTMENT(
    DEPT_NO NUMBER PRIMARY KEY,             -- PRIMARY KEY는 UNIQUE와 같이 사용 불가
    DEPT_NAME VARCHAR2(15) NOT NULL,
    LOCATION VARCHAR2(15) NOT NULL
);

CREATE TABLE EMPLOYEE(
    EMP_NO NUMBER DEFAULT 1001 PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    DEPART NUMBER REFERENCES DEPARTMENT(DEPT_NO),
    POSITION VARCHAR2(20),
    GENDER CHAR(2),
    HIRE_DATE DATE,
    SALARY NUMBER
);

/*
    DB에서 날짜로 인식되는 리터럴(표현법: -, /)
    1. 20/10/22
    2. 2020/10/22
    3. 20-10-22
    4. 2020-10-22
*/

INSERT INTO DEPARTMENT VALUES(1, '영업부', '대구');
INSERT INTO DEPARTMENT VALUES(2, '인사부', '서울');
INSERT INTO DEPARTMENT VALUES(3, '총무부', '대구');
INSERT INTO DEPARTMENT VALUES(4, '기획부', '서울');

COMMIT;

INSERT INTO EMPLOYEE VALUES(1001, '구창민', 1, '과장', 'M', '95-05-01', 5000000);
INSERT INTO EMPLOYEE VALUES(1002, '김민서', 1, '사원', 'M', '17-09-01', 2500000);
INSERT INTO EMPLOYEE VALUES(1003, '이은영', 2, '부장', 'F', '90-09-01', 5500000);
INSERT INTO EMPLOYEE VALUES(1004, '한성일', 2, '과장', 'M', '93-04-01', 5000000);

COMMIT;

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;

-- SELECT NAME, DEPT_NAME FROM EMPLOYEE, DEPARTMENT WHERE DEPARTMENT.DEPT_NO = EMPLOYEE.DEPART;

UPDATE DEPARTMENT SET LOCATION = '세종' WHERE DEPT_NO = 4; -- DEPT_NO는 기본키이다. 기본키는 빠른 검색을 위해 설정하는 '인덱스'가 자동 저장된다.

UPDATE EMPLOYEE SET SALARY = SALARY + 300000 WHERE EMP_NO = 1002;

-- DELETE FROM DEPARTMENT WHERE DEPT_NO = 1; 참조된 값이 있어 불가
dELETE FROM DEPARTMENT WHERE DEPT_NO = 3;


CREATE VIEW 과장들 AS
SELECT * FROM EMPLOYEE WHERE POSITION = '과장';

SELECT * FROM 과장들;

DROP VIEW 과장들;

-- 신규사원을 입력할 수 있도록
-- 기존 EMPLOYEE의 명단을 빼고, 구조는 동일한 테이블을 만듬

CREATE TABLE 신규사원 AS
SELECT * FROM EMPLOYEE WHERE 1 = 2;

SELECT * FROM 신규사원;
