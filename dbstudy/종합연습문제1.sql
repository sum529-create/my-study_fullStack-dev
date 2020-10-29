-- 사용자 테이블
-- 칼럼 : 사용자번호, 아이디, 이름, 태어난년도, 주소, 연락처1, 연락처2, 가입일
-- 기본키: 사용자번호
-- NOT NULL : 아이디
-- UNIQUE : 아이디

-- 구매 테이블
-- 칼럼 : 구매번호, 아이디, 제품명, 제품카테고리, 제품가격, 구매개수
-- 기본키 : 구매번호
-- NOTNULL : 없음
-- UNIQUE : 없음
-- 외래키 : 아이디 (사용자 테이블의 아이디 칼럼을 참조하는 키)
DROP TABLE BUYS;
DROP TABLE USERS;

CREATE TABLE USERS(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL UNIQUE,
    USER_NAME VARCHAR2(20),
    USER_YEAR NUMBER(4),
    USER_ADDR VARCHAR2(100),
    USER_MOBILE1 VARCHAR2(3),
    USER_MOBILE2 VARCHAR2(8),
    USER_REGDATE DATE
);

CREATE TABLE BUYS(
    BUY_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) REFERENCES USERS(USER_ID),
    PROD_NAME VARCHAR2(20),
    PROD_CATEGORY VARCHAR2(20),
    PROD_PRICE NUMBER,
    BUY_AMOUNT NUMBER
);

-- USERS 테이블에 레코드(행, ROW) 삽입하기
INSERT INTO USERS VALUES(1, 'YJS', '유재석', 1972, '서울', '010', '11111111', '08/08/08');
INSERT INTO USERS VALUES(2, 'KHD', '강호동', 1970, '경북', '011', '22222222', '07/07/07');
INSERT INTO USERS VALUES(3, 'KKJ', '김국진', 1965, '서울', '019', '33333333', '09/09/09');
INSERT INTO USERS VALUES(4, 'KYM', '김용만', 1967, '서울', '010', '44444444', '15/05/05');
INSERT INTO USERS VALUES(5, 'KJD', '김제동', 1974, '경남', NULL, NULL, '13/03/03');
INSERT INTO USERS VALUES(6, 'NHS', '남희석', 1971, '충남', '016', '55555555', '14/04/04');
INSERT INTO USERS VALUES(7, 'SDY', '신동엽', 1971, '경기', NULL, NULL, '08/10/10');
INSERT INTO USERS VALUES(8, 'LHJ', '이휘재', 1972, '경기', '011', '66666666', '06/04/04');
INSERT INTO USERS VALUES(9, 'LKK', '이경규', 1960, '경남', '018', '77777777', '04/12/12');
INSERT INTO USERS VALUES(10, 'PSH', '박수홍', 1970, '서울', '010', '88888888', '12/05/05');

-- BUYS 테이블에 레코드(행, ROW) 삽입하기
INSERT INTO BUYS VALUES(1001, 'KHD', '운동화', NULL, 30, 2);
INSERT INTO BUYS VALUES(1002, 'KHD', '노트북', '전자', 1000, 1);
INSERT INTO BUYS VALUES(1003, 'KYM', '모니터', '전자', 200, 1);
INSERT INTO BUYS VALUES(1004, 'PSH', '모니터', '전자', 200, 5);
INSERT INTO BUYS VALUES(1005, 'KHD', '청바지', '의류', 50, 3);
INSERT INTO BUYS VALUES(1006, 'PSH', '메모리', '전자', 80, 10);
INSERT INTO BUYS VALUES(1007, 'KJD', '책', '서적', 15, 5);
INSERT INTO BUYS VALUES(1008, 'LHJ', '책', '서적', 15, 2);
INSERT INTO BUYS VALUES(1009, 'LHJ', '청바지', '의류', 50, 1);
INSERT INTO BUYS VALUES(1010, 'PSH', '운동화', NULL, 30, 2);

SELECT * FROM USERS;
SELECT * FROM BUYS;

-- 구매 테이블에서 제품명이 '운동화'인 구매 내역의 제품카테고리를 '신발'로 수정하시오.
UPDATE BUYS SET PROD_CATEGORY = '신발' WHERE PROD_NAME = '운동화';

-- 사용자 테이블에서 사용자번호가 5인 사용자를 삭제하시오.
-- 사용자번호가 5인 사용자의 구매 내역을 먼저 삭제한 뒤 진행한다.
DELETE FROM BUYS B WHERE B.USER_ID IN (SELECT U.USER_ID FROM USERS U WHERE U.USER_NO = 5);
DELETE FROM USERS WHERE USER_NO = 5;

-- 사용자 아이디별 구매횟수를 조회하시오.
-- 아이디 : 구매횟수
SELECT USER_ID AS 아이디, COUNT(*) AS 구매횟수 FROM BUYS GROUP BY USER_ID;

-- 어떤 고객이 어떤 제품을 구매했는지 조회하시오.
-- 이력이 없는 고객도 함께 조회하시오. (user테이블의  모든 데이터를 포함하고, BUYS테이블의 일치하는 데이터만 포함하는 외부 조인)
-- 고객명  구매제품
-- 강호동  청바지
--      ...

-- 내부 조인
SELECT U.USER_NAME AS 고객명, B.PROD_NAME AS 구매제품 FROM BUYS B, USERS U WHERE B.USER_ID = U.USER_ID;

-- 외부조인 -- 왼쪽 외부조인
SELECT U.USER_NAME AS 고객명, B.PROD_NAME AS 구매제품 FROM USERS U, BUYS B WHERE U.USER_ID = B.USER_ID(+);
SELECT U.USER_NAME AS 고객명, B.PROD_NAME AS 구매제품 FROM USERS U LEFT OUTER JOIN BUYS B ON U.USER_ID = B.USER_ID;

-- 제품을 구매한 이력이 있는 고객아이디, 고객명과 총 구매횟수를 조회하시오.
SELECT U.USER_ID AS 고객아이디 ,U.USER_NAME AS 고객명, COUNT(*) AS 구매횟수 FROM USERS U, BUYS B WHERE U.USER_ID = B.USER_ID GROUP BY U.USER_NAME, U.USER_ID;

-- 제품을 구매한 이력이 있는 고객명과 총 구매액을 조회하시오.
SELECT U.USER_NAME AS 고객명, SUM(B.PROD_PRICE * B.BUY_AMOUNT) AS 구매액 FROM USERS U, BUYS B WHERE U.USER_ID = B.USER_ID GROUP BY U.USER_NAME;

-- 구매 이력과 상관없이 고객별 구매횟수를 조회하시오.
SELECT U.USER_ID AS 고객아이디, U.USER_NAME AS 고객명, COUNT(PROD_NAME) AS 구매횟수 FROM USERS U, BUYS B WHERE U.USER_ID = B.USER_ID GROUP BY U.USER_ID, U.USER_NAME;

-- 구매 이력이 없으면 구매횟수는 0으로 조회하시오.
SELECT U.USER_ID AS 고객아이디, U.USER_NAME AS 고객명, COUNT(PROD_NAME) AS 구매횟수 FROM USERS U, BUYS B WHERE U.USER_ID = B.USER_ID(+) GROUP BY U.USER_ID, U.USER_NAME;

-- 구매 이력에 상관없이 고객별 총 구매액을 조회하시오.
-- 구매 이력이 없으면 총 구매액을 0으로 조회하시오.
SELECT U.USER_NAME AS 고객명, NVL(SUM(B.PROD_PRICE * B.BUY_AMOUNT),0) AS 구매액 FROM USERS U , BUYS B WHERE U.USER_ID = B.USER_ID(+) GROUP BY U.USER_NAME;

-- 카테고리가 '전자'인 제품을 구매한 고객명과 총 구매액을 조회하시오.
SELECT U.USER_NAME AS 고객명, SUM(B.PROD_PRICE * B.BUY_AMOUNT) AS 총구매액 FROM USERS U, BUYS B WHERE U.USER_ID = B.USER_ID AND B.PROD_CATEGORY = '전자' GROUP BY U.USER_NAME;

-- 구매횟수가 2회 이상인 고객명과 구매횟수를 조회하시오.
SELECT U.USER_NAME AS 고객명, COUNT(PROD_NAME) AS 구매횟수 FROM USERS U, BUYS B WHERE U.USER_ID = B.USER_ID GROUP BY U.USER_NAME HAVING (COUNT(*)>= 2) ;

-- USERS 테이블과 BUYS 테이블 각각의 종속 관계를 확인하고
-- 정규화 하시오.
-- BUYS테이블을 BUYS테이블과 RPODUCT 테이블로 분리한다.

CREATE TABLE PRODUCT(
    PROD_CODE NUMBER PRIMARY KEY,
    PROD_NAME VARCHAR2(20) UNIQUE,
    PROD_CATEGORY VARCHAR2(20),
    PROD_PRICE NUMBER
);

CREATE TABLE BUYS(
    BUY_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) REFERENCES USERS(USER_ID),
    PROD_NAME VARCHAR2(20) REFERENCES PRODUCT(PROD_NAME),
    BUY_AMOUNT NUMBER
);







