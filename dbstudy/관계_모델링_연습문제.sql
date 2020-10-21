-- 삭제 (8개 테이블 순서 맞춰서 삭제하기)
DROP TABLE 제품;
DROP TABLE 주문;
DROP TABLE 배송;
DROP TABLE 택배업체;
DROP TABLE 창고;
DROP TABLE 제조사;
DROP TABLE 게시판;
DROP TABLE 회원;


CREATE TABLE 회원( 
    회원번호 NUMBER PRIMARY KEY,
    아이디 VARCHAR2(20) NOT NULL UNIQUE,
    비밀번호 VARCHAR2(20) NOT NULL,
    이름 VARCHAR2(20) NOT NULL,
    이메일 VARCHAR2(20) NOT NULL UNIQUE,
    핸드폰 VARCHAR2(15) UNIQUE,
    가입일 DATE NOT NULL
);

CREATE TABLE 게시판(
    게시글번호 NUMBER PRIMARY KEY,
    제목 VARCHAR2(1000) NOT NULL,
    내용 VARCHAR2(4000), -- VARCHAR2의 최대 크기는 4000
    조회수 NUMBER NOT NULL,
    작성자 VARCHAR2(20) REFERENCES 회원(아이디), -- 회원 테이블의 아이 칼럼을 참조하는 외래키
    작성일자 DATE NOT NULL
);
    
CREATE TABLE 제조사(
    사업자번호 CHAR(12) PRIMARY KEY,
    제조사명 VARCHAR2(20) NOT NULL,
    제조사연락처 CHAR(15) NOT NULL,
    대표이사 VARCHAR2(20)
);

CREATE TABLE 창고(
    창고코드 CHAR(10) PRIMARY KEY,
    창고이름 VARCHAR2(10) NOT NULL,
    창고위치 VARCHAR2(100) NOT NULL,
    사용유무 CHAR(1),
    창고연락처 CHAR(15)
);

CREATE TABLE 택배업체(
    택배업체사업자번호 CHAR(12) PRIMARY KEY,
    택배업체명 VARCHAR2(20) NOT NULL,
    택배업체연락처 CHAR(15) NOT NULL,
    택배업체주소 VARCHAR2(100) NOT NULL
);
    
    
CREATE TABLE 배송(
    배송번호 NUMBER PRIMARY KEY,
    배송업체 CHAR(20) REFERENCES 택배업체(택배업체사업자번호),
    배송금액 NUMBER NOT NULL,
    배송일자 DATE NOT NULL
);

CREATE TABLE 주문(
    주문번호 NUMBER PRIMARY KEY,
    주문회원 VARCHAR2(20) REFERENCES 회원(아이디),
    배송번호 NUMBER REFERENCES 배송(배송번호),
    결재방식 VARCHAR2(20) NOT NULL,
    주문일자 DATE NOT NULL
);

CREATE TABLE 제품(
    제품코드 CHAR(10) PRIMARY KEY,
    제품명 VARCHAR2(100) NOT NULL,
    주문번호 NUMBER REFERENCES 주문(주문번호),
    제조사 CHAR(12) REFERENCES 제조사(사업자번호),
    보관창고 CHAR(10) REFERENCES 창고(창고코드),
    카테고리 VARCHAR2(20) NOT NULL
);






















