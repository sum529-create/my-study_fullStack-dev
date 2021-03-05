-- DROP SEQUENCE
DROP SEQUENCE STOCK_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE ORDERS_SEQ;
DROP SEQUENCE PRODUCT_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE ROLE_SEQ;
DROP SEQUENCE ARTIST_SEQ;
DROP SEQUENCE MEMBER_SEQ;


-- CREATE SEQUENCE
CREATE SEQUENCE STOCK_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

CREATE SEQUENCE REVIEW_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

CREATE SEQUENCE CART_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

CREATE SEQUENCE ORDERS_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE PRODUCT_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

CREATE SEQUENCE FAQ_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE ROLE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE ARTIST_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;


DROP VIEW A_VIEW;
DROP TABLE REVIEW;
DROP TABLE CART;
DROP TABLE ORDERS;
DROP TABLE NOTICE;
DROP TABLE STOCK;
DROP TABLE PRODUCT;
DROP TABLE ARTIST;
DROP TABLE FAQ;
DROP TABLE ROLE;
DROP TABLE MEMBER;



CREATE TABLE MEMBER
(
	MNO NUMBER PRIMARY KEY,
	MSNO VARCHAR2(10),
	MNAME VARCHAR2(50) NOT NULL,
	MEMAIL VARCHAR2(100) NOT NULL UNIQUE,
	MPW	VARCHAR2(50) NOT NULL,
	MGENDER	VARCHAR2(10),
	MPNO VARCHAR2(50),
	MADDR VARCHAR2(100),
	MLASTADDR VARCHAR2(100),
	MPHONE	VARCHAR2(50),
	MPFILENAME VARCHAR2(300),
	MPAYMENT VARCHAR2(50),
	MPOINT	NUMBER,
	MGRADE	VARCHAR2(10),
	MREGDATE DATE
);
CREATE TABLE ARTIST
( 
	ANO NUMBER PRIMARY KEY, 
	MNO NUMBER REFERENCES MEMBER(MNO),  
 	ANAME VARCHAR2(50), 
	ACOMMENT VARCHAR2(200), 
 	AIMAGE VARCHAR2(100),
    BIMAGE VARCHAR2(100)
);
CREATE TABLE ROLE
(
	RNO NUMBER PRIMARY KEY,
	MEMAIL VARCHAR2(100) REFERENCES MEMBER (MEMAIL),
	ROLE VARCHAR2(30) NOT NULL
);
CREATE TABLE FAQ
(
	FNO NUMBER PRIMARY KEY,
	FTITLE VARCHAR2(300),
	FCONTENT VARCHAR2(4000) NOT NULL,
	FWRITER VARCHAR2(50),
	FREGDATE DATE
);
CREATE TABLE PRODUCT
(
	PNO NUMBER PRIMARY KEY,
	PNAME VARCHAR2(200) NOT NULL,
	PIMAGE VARCHAR2(100),
	PLISTPRICE NUMBER NOT NULL,
	PPRICE NUMBER NOT NULL,
	PCATEGORY VARCHAR2(100),
	PTAG VARCHAR2(500),
	PDISRATE NUMBER,
	PDESC CLOB,
	PASDESC VARCHAR2(2000),
	PDETAIL VARCHAR2(2000),
	ANO NUMBER REFERENCES ARTIST (ANO),
	PREGDATE DATE
);
CREATE TABLE NOTICE
(
	NNO NUMBER PRIMARY KEY,
	NTITLE VARCHAR2(300) NOT NULL,
	NCONTENT VARCHAR2(4000),
	NWRITER VARCHAR2(50),
	NFILENAME VARCHAR2(100),
	NREGDATE DATE
);
CREATE TABLE STOCK
(
	SNO NUMBER PRIMARY KEY, 
	PNO NUMBER REFERENCES PRODUCT (PNO), 
	OTITLE VARCHAR2(100),
	OCONTENT VARCHAR2(100),
	OADDPRICE NUMBER, 
	STOCK NUMBER
);
CREATE TABLE CART
(
	CNO NUMBER PRIMARY KEY, 
	MNO NUMBER REFERENCES MEMBER (MNO), 
	PNO NUMBER REFERENCES PRODUCT (PNO), 
	SNO NUMBER REFERENCES STOCK (SNO),
	CAMOUNT NUMBER, 
	COPTION VARCHAR2(100)
);
CREATE TABLE ORDERS
(
	ONO NUMBER PRIMARY KEY, 
	MNO NUMBER REFERENCES MEMBER (MNO), 
	PNO NUMBER REFERENCES PRODUCT (PNO), 
	OAMOUNT NUMBER NOT NULL, 
	ODATE DATE, 
	OADDR VARCHAR2(100) NOT NULL, 
	OPHONE VARCHAR2(20) NOT NULL, 
	OPAYMENT VARCHAR2(10), 
	ONOTE VARCHAR2(100), 
	OOPTION VARCHAR2(100)  
);
CREATE TABLE REVIEW
(
	RNO NUMBER PRIMARY KEY,
	PNO NUMBER REFERENCES PRODUCT (PNO),
    ONO NUMBER REFERENCES ORDERS (ONO),
	MNO NUMBER REFERENCES MEMBER (MNO),
	RTITLE VARCHAR2(100) NOT NULL,
	RCONTENT VARCHAR2(4000),
	RFILENAME VARCHAR2(100),
	RRATING NUMBER,
	RREGDATE DATE
);
CREATE OR REPLACE VIEW A_VIEW AS
SELECT ROWNUM RN, E.*
    FROM(SELECT D.*, C
        FROM(SELECT A.ANO, COUNT(*) C
            FROM (SELECT T.ANO, P.PNO
                FROM ARTIST T, PRODUCT P
                WHERE T.ANO = P.ANO          
            ) A, ORDERS O
            WHERE A.PNO = O.PNO
            GROUP BY A.ANO) B, ARTIST D
        WHERE B.ANO = D.ANO
        ORDER BY C DESC) E;


        
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, '2000-05-04', '사용자1', 'user1@classick.com', 
		'AAaa1234!', '여', '13536','경기 성남시 분당구 판교역로14번길 15', '101동 101호', '010-0000-0001', 
		'user1.png', '무통장입금', 1000, '곰손', SYSDATE);

INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, '1994-07-16', '사용자2', 'user2@classick.com', 
		'AAaa1234!', '남', '63050','제주특별자치도 제주시 애월읍 가문동남길 21', '102동 102호', '010-0000-0002', 
		'user2.png', '카드 결제', 520, '은손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, '1991-11-06', '사용자3', 'user3@classick.com', 
		'AAaa1234!', '여', '13591','경기 성남시 분당구 분당로 43', '103동 103호', '010-0000-0003', 
		NULL, '가상 계좌', 6540, '금손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, '1984-06-27', '사용자4', 'user4@classick.com', 
		'AAaa1234!', '남', '06313','서울 강남구 논현로 6', '104동 104호', '010-0000-0004', 
		NULL, '휴대폰 결제', 0, '아기손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, '1969-01-08', '사용자5', 'user5@classick.com', 
		'AAaa1234!', '여', '38303','경북 청도군 각북면 삼평1길 30', '105동 105호', '010-0000-0005', 
		'user3.png', '무통장입금', 130, '아기손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, '1978-12-24', '사용자6', 'user6@classick.com', 
		'AAaa1234!', '남', '03721','서울 서대문구 봉원사길 6', '106동 106호', '010-0000-0006', 
		'user4.png', '카드 결제', 1000, '은손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, NULL, '사용자7', 'user7@classick.com', 
		'AAaa1234!', '여', NULL, NULL, NULL, '010-0000-0007', 
		NULL, NULL, 0, '아기손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, NULL, '사용자8', 'user8@classick.com', 
		'AAaa1234!', '남', NULL, NULL, NULL, '010-0000-0008', 
		'user5.png', NULL, 0, '아기손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, '1996-08-27', '사용자9', 'user9@classick.com', 
		'AAaa1234!', '남', '23036', '인천 강화군 강화읍 갑룡길 3-13', '109동 109호', '010-0000-0009', 
		'user6.png', '카드 결제', 50, '곰손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, '1959-10-01', '사용자10', 'user10@classick.com', 
		'AAaa1234!', '여', '47500', '부산 연제구 경기장로 7-46', '110동 110호', '010-0000-0010', 
		'user7.png', '무통장입금', 110, '아기손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, NULL, '사용자11', 'user11@classick.com', 
		'AAaa1234!', '남', '12665', '경기 여주시 점동면 가래울길 13-1', '112동 112호', '010-0000-0012', 
		NULL, '카드 결제', 560, '은손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, NULL, '사용자12', 'user12@classick.com', 
		'AAaa1234!', '여', NULL, NULL, NULL, '010-0000-0012', 
		'user8.png', NULL, 0, '아기손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, NULL, '사용자13', 'user13@classick.com', 
		'AAaa1234!', '남', NULL, NULL, NULL, '010-0000-0013', 
		NULL, NULL, 0, '아기손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, NULL, '사용자14', 'user14@classick.com', 
		'AAaa1234!', '남', NULL, NULL, NULL, '010-0000-0014', 
		NULL, NULL, 0, '아기손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL, NULL, '사용자15', 'user15@classick.com', 
		'AAaa1234!', '여', NULL, NULL, NULL, '010-0000-0015', 
		'user1.png', NULL, 0, '아기손', SYSDATE);

		
-- 관리자 
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1997-03-07', '관리자1', 'admin1@classick.com', 
		'AAaa1234!', '남', NULL, NULL, NULL, '010-0001-0000', 
		NULL, NULL, 1000, '금손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1991-10-11', '관리자2', 'admin2@classick.com', 
		'AAaa1234!', '여', '14128', '경기 안양시 동안구 경수대로 426', '1002동102호', '010-0002-0000', 
		'user3.png', '카드 결제', 600, '은손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1988-09-10', '관리자3', 'admin3@classick.com', 
		'AAaa1234!', '남', NULL, NULL, NULL, '010-0003-0000', 
		'user4.png', '무통장 입금', 10, '아기손', SYSDATE);
		
		
-- 판매자		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1990-06-26', '판매자1', 'artist1@classick.com', 
		'AAaa1234!', '여', '07695', '서울 강서구 우현로 1', '201동 201호', '010-0000-1000', 
		'user1.png', '카드 결제', 780, '은손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1973-02-05', '판매자2', 'artist2@classick.com', 
		'AAaa1234!', '남', '10939', '경기 파주시 조리읍 전나무길 14', '202동 202호', '010-0000-2000', 
		'user2.png', '가상 계좌', 1500, '금손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1986-09-21', '판매자3', 'artist3@classick.com', 
		'AAaa1234!', '남', '50116', '경남 거창군 가북면 가북로 271-24', '203동 203호', '010-0000-3000', 
		'user3.png', '카드 결제', 190, '곰손', SYSDATE);	
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1978-11-20', '판매자4', 'artist4@classick.com', 
		'AAaa1234!', '여', NULL, NULL, NULL, '010-0000-4000', 
		'user4.png', '가상 계좌', 2800, '금손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1999-09-04', '판매자5', 'artist5@classick.com', 
		'AAaa1234!', '남', '25627', '강원 강릉시 강동면 강동초교길 7', '205동 205호', '010-0000-5000', 
		'user5.png', '카드 결제', 1500, '금손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'2002-11-06', '판매자6', 'artist6@classick.com', 
		'AAaa1234!', '남', '14102', '경기 안양시 동안구 관평로 78-2', '206동 206호', '010-0000-6000', 
		'user6.png', NULL, 830, '아기손', SYSDATE);	
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'2000-05-17', '판매자7', 'artist7@classick.com', 
		'AAaa1234!', '여', '06791', '서울 서초구 논현로 7', '207동 207호', '010-0000-7000', 
		'user7.png', '휴대폰 결제', 780, '은손', SYSDATE);
		
INSERT INTO 
		MEMBER (MNO, MSNO, MNAME, MEMAIL, MPW, MGENDER, MPNO, MADDR, MLASTADDR, MPHONE, MPFILENAME, MPAYMENT, MPOINT, MGRADE, MREGDATE)
		VALUES(MEMBER_SEQ.NEXTVAL,'1975-11-17', '판매자8', 'artist8@classick.com', 
		'AAaa1234!', '남', NULL, NULL, NULL, '010-0000-8000', 
		NULL, '가상 계좌', 0, '아기손', SYSDATE);


		
-- ***** ROLE ***** -- 	
-- 회원분류(ROLE) : {'ADMIN', 'ARTIST', 'USER'}
-- 회원이메일(MEMAIL) 
	--> 회원(USER) : {user1@classick.com ~ user15@classick.com}
	--> 관리자(ADMIN) : {admin1@classick.com ~ admin3@classick.com}
	--> 판매자(ARTIST) : {artist1@classick.com ~ artist3@classick.com}
	
-- 회원(USER)		
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user1@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user2@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user3@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user4@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user5@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user6@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user7@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user8@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user9@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user10@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user11@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user12@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user13@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user14@classick.com', 'USER');	
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'user15@classick.com', 'USER');	

-- 관리자(ADMIN)
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'admin1@classick.com', 'ADMIN');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'admin2@classick.com', 'ADMIN');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'admin3@classick.com', 'ADMIN');
		
-- 판매자(ARTIST)
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'artist1@classick.com', 'ARTIST');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'artist2@classick.com', 'ARTIST');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'artist3@classick.com', 'ARTIST');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'artist4@classick.com', 'ARTIST');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'artist5@classick.com', 'ARTIST');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'artist6@classick.com', 'ARTIST');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'artist7@classick.com', 'ARTIST');
INSERT INTO 
		ROLE (RNO, MEMAIL, ROLE) 
		VALUES (ROLE_SEQ.NEXTVAL, 'artist8@classick.com', 'ARTIST');

	


		
-- **** ARTIST(8)**** --
-- 회원번호(MNO) : 19 ~ 26
-- <카테고리 별 aName>
--> 음료(커피, 차 등) : 1(aNo) - 19(mNo) - 규린이네 수제과일청
--> 디저트 : 2(aNo) - 20(mNo) - 다앤하(danha)
--> 디저트 : 3aNo) - 21(mNo) - 디디얌
--> 농축 수산물 : 4(aNo) - 22(mNo) - 빙고씨푸드마스터셰프이슬
--> 수제 반찬 : 5(aNo) - 23(mNo) - 3대를 이어온 농장반찬김치
--> 수제 반찬 : 6(aNo) - 24(mNo) - 가율 박민 셰프
--> 그 외 수제 먹거리: 7(aNo) - 25(mNo) - 한길로
--> 전통주 : 8(aNo) - 26(mNo) - 술샘 SULSEAM

-- 음료(커피, 차 등)	
INSERT INTO ARTIST VALUES(ARTIST_SEQ.NEXTVAL, 19, '규린이네 수제과일청', '두아이를 키우는 엄마의 정직한마음으로 아이와 어른 모두 믿고 먹을수 있는 건강한 먹거리를 만드는 규린이네 수제과일청입니다♡.', 'artist1.jpg', 'artistBanner1.jpg');

-- 디저트
INSERT INTO ARTIST VALUES(ARTIST_SEQ.NEXTVAL, 20, '다앤하(danha)', '[정직한 베이킹공방] 칙피 & 수제디저트 작가❤️버튼을 눌러주신후 매달 할인쿠폰과 이벤트알림을 받아보세요🌝👍🏻', 'artist2.jpg', 'artistBanner2.jpg');
INSERT INTO ARTIST VALUES(ARTIST_SEQ.NEXTVAL, 21, '디디얌', '디디얌 베이커리&디저트', 'artist3.png', 'artistBanner3.jpg');

-- 농축 수산물
INSERT INTO ARTIST VALUES(ARTIST_SEQ.NEXTVAL, 22, '빙고씨푸드마스터셰프이슬', '강화도의 바람, 산 그리고 바다가 좋아 귀어하여 수산물 전문 요리를 연구하고 있는 바다인 셰프 이슬 입니다.', 'artist4.jpg', 'artistBanner4.jpg');

-- 수제 반찬
INSERT INTO ARTIST VALUES(ARTIST_SEQ.NEXTVAL, 23, '3대를이어온농장반찬김치', '건강한 토양에서 안전한 식재료생산 정직한 농장!!', 'artist5.jpg', 'artistBanner5.jpg');
INSERT INTO ARTIST VALUES(ARTIST_SEQ.NEXTVAL, 24, '가율 박민 셰프', '❤2020 핸드메이드 어워드 수제반찬 최우수상❤ 요리에 대한 오랜 애정으로 걸어온 셰프의 길. 이제 가율에서 정성을 담은 셰프의 한 끼를 만나보세요', 'artist6.jpg', 'artistBanner6.jpg');

-- 그 외 수제 먹거리
INSERT INTO ARTIST VALUES(ARTIST_SEQ.NEXTVAL, 25, '한길로', '🎉🎉아이디어스 2020 HANDMADE AWARD🎉🎉 🎉🎉"건강식품부문" 최우수작가상🎉🎉', 'artist7.jpg', 'artistBanner7.jpg');

-- 전통주
INSERT INTO ARTIST VALUES(ARTIST_SEQ.NEXTVAL, 26, '술샘 SULSEAM', '新나는 술, 信나는 샘 새로운 술, 믿을 수 있는 술을 만드는 곳 전통주양조장 술샘입니다!', 'artist8.jpg', 'artistBanner8.jpg');



INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '구매후기는 어떻게 남기나요?', '[주의사항]
1. 작품을 구입한 분만 구매후기를 남길 수 있습니다. 구매후기 작성 후, 환불을 할 경우 구매후기는 삭제됩니다.
2. 작가님이 배송완료를 한 시점부터 구매후기 작성 버튼이 표시 됩니다.
3. 남겨진 구매후기는 1번만 수정할 수 있습니다.
4. 삭제한 구매후기는 다시 작성할 수 없습니다.
5. 개인결제창을 통해 결제하실 경우 후기 작성이 불가능합니다.


구매후기는 2가지 경로를 이용하실 수 있습니다.


1) 나의 구매후기에서 후기 남기기

1. 하단 탭메뉴에서 "내 정보" 페이지 진입 후, "나의 구매후기" 선택

2. 구매후기 쓰기 > 후기를 남기기 원하는 작품에서 "구매후기 작성하기" 선택

3. 별점 평가와 후기내용, + 버튼을 눌러 사진을 첨부할 수 있습니다. SNS에 후기를 공유할 수도 있어요!

2) 주문배송에서 후기 남기기

1. 하단 탭메뉴에서 "내 정보" 페이지 진입 후, "주문배송" 선택

2. 작가 배송 완료된 작품 중에서 후기를 작성할 작품 작품 선택하기

3. 구매후기 작성하기 클릭

4. 별점 평가와 후기내용, + 버튼을 눌러 사진을 첨부할 수 있습니다. SNS에 후기를 공유할 수도 있어요!

[주의]
1. 삭제한 후기는 복구되지 않습니다. 삭제한 후기는 아이디어스에서도 복구가 불가능해요.
2. 후기는 1번만 수정이 가능해요.', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '푸시 알림 설정은 이렇게 하면 돼요.', '❑ 하단 탭 메뉴에서 "내 정보"를 선택한 후, 아래의 경로로 진입하시면 상세하게 알림을 켜고 끌 수 있습니다.

1. 설정(톱니바퀴) 아이콘을 눌러주세요.

2. 알림설정 메뉴를 눌러주세요.

1) 메시지
작가님과 주고 받는 메시지를 알림으로 받을 수 있습니다. 꺼 놓을 경우 제작과 관련된 중요한 연락을 받지 못할 수도 있어요!

2) 파격할인 / 쿠폰 / 이벤트
기간 한정 할인, 선착순 할인, 주말 할인 등 할인&이벤트 소식을 알려드립니다. 꺼놓으면 아마 크게 후회하실 지도 몰라요. 

3) 좋아하는(♥)작가의 할인
내가 하트를 준 작가님의 작품이 할인할 경우 푸시 알림으로 잽싸게 알려드립니다.

4) 좋아하는(♥)작가의 스토리
내가 하트를 준 작가님이 새로운 스토리를 작성할 경우 알려드립니다. 스토리의 댓글로 작가님과 이야기 해 보세요~

5) 좋아하는(♥)작가의 새 작품
내가 하트를 준 작가님이 따끈따끈한 신상을 등록할 경우 알려드립니다.

6) 즐겨찾는(★) 작품의 할인
작가님과 상관없이 별표를 한 작품 중 할인하는 것이 있을 경우 푸시 알림으로 잽싸게 알려드립니다.', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '무통장 입금 주문시 참고해 주세요', '❑ 무통장 주문시 각 주문건마다 고유의 1회용 계좌번호가 생성됩니다.

※ 1. 입금 마감기한이 지나면 계좌번호가 없어집니다.

※ 2. 주문 금액과 1원이라도 차이가 나면 입금이 되지 않습니다.

※ 3. 주문자와 입금자가 틀려도 계좌번호와 금액만 정확하면 입금완료처리가 자동으로 됩니다.

※ 4. 일부 입금방식에 따라 예금주명이 "주식회사 백패커"가 아닌 ‘세틀뱅크’ 또는 "나이스정보통신"으로 조회될 수 있습니다. 이러한 경우에도 입금 처리 시 정상적으로 주문 완료됩니다.

※ 5. ATM 기기에서는 무통장 방식으로 입금이 되지 않습니다. 인터넷/폰 뱅킹을 이용하거나 은행에 방문시는 창구를 통해 입금해 주세요.

❑ 입금 마감기한
※ 주문한 다음날 저녁 10시 까지
어제 주문시 오늘 저녁 10시까지
오늘 주문시 내일 저녁 10시까지

❑ 계좌번호 확인 방법
사이드메뉴 → 주문 배송에서 입금할 은행과 계좌번호, 금액을 확인할 수 있습니다.', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '결제 카드 변경은 이렇게 하면 돼요.', '❑ 결제 카드 변경은 이렇게 하면 돼요.

1단계 : 하단 내 정보 탭을 열어, 설정 아이콘을 눌러주세요.

2단계 : 신용카드 관리를 눌러 주세요.

3단계 :  신용카드 등록하기를 누른 후, 바꾸려는 카드정보를 입력해주세요.

4단계 : 사용하실 카드를 선택하세요.', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '취소 / 환불은 어떻게 하나요?', '❑ 하단 탭 메뉴에서 "내 정보"페이지 진입 후, "주문배송" 선택

❑ 취소 작품 선택

❑ 구매 후 배송 전일 경우
주문한 작품 선택 후 "구매취소" 버튼 선택

❑ 배송이 완료된 이후
주문한 작품 선택 후 "환불신청" 또는 "교환신청" 버튼 선택

※ [매너] 주문 접수 시, 곧바로 제작에 들어갈 수 있으므로 주문 후 일정 시간이 지난 후에는 반드시! 판매 작가님과 상의를 먼저 하시고 취소요청을 해주세요.
- 단순변심에 의한 교환/환불일 경우에는 배송비를 부담하셔야 합니다.

※ 전자상거래 등에서의 소비자 보호에 관한 법률에 의거하여 수령 후 7일 이내에 반품을 요청할 수 있습니다.

※ 배송 후 7일 까지 "교환신청" "환불신청" 버튼이 표시 됩니다. 이후의 건에 대해서는 판매 작가님과 협의를 부탁드려요. 협의가 완료되었다면, 작가님께서 아이디어스에 직접 취소 요청을 해주시니 걱정하지마세요.

※ 단, 주문제작일 경우 동법 시행령 제21조(청약철회등의 제한)에 의하여 환불에 제한을 받을 수 있습니다. 이 경우 판매 작가님과 협의를 부탁드려요.

※ 결제수단에 따라 결제취소/환불 되는 시점이 조금씩 다릅니다.

1. 신용카드
결제취소 문자가 발송되기까지 시간이 조금 소요됩니다.
이용하시는 카드사에 따라 3영업일 ~ 7영업일 정도 기다려주세요.
 
2. 계좌이체
3일 이내(주말/공휴일 제외)에 환불 금액이 입금 완료됩니다.
 
3. 휴대폰결제
매일 23시에 자동으로 취소됩니다. 결제달과 취소달이 다른 경우에는 휴대폰결제 시스템 상 취소되지 않고, 등록해주신 계좌로 입금처리 됩니다.(매달 9일, 말일)', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '엇?! 장바구니에 담아놓은 작품들이 사라졌어요.', 'Q. 내가 장바구니에 담아 놓은 작품들이 보이지 않아요.

1. 장바구니 보관할 수 있는 개수가 초과한 경우
장바구니에 담은 작품이 50개가 넘어가는 경우, 오랫동안 담아져있는 작품 순으로 장바구니에서 제외됩니다. 단, 이렇게 제외된 작품은 즐겨찾는 작품으로 추가되어 있으니 언제든지 확인 가능합니다.

2. 작품이 삭제된 경우
판매 작가님이 작품을 삭제하여 더 이상 구매하실 수 없는 경우, 장바구니에서 제외됩니다.

이 외의 궁금한 점은 언제든지 문의 주세요. 감사합니다.', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '쿠폰이 사라졌어요!', '1. 결제 중에 쿠폰이 사라졌어요!
결제 실패 또는 취소로 인해 쿠폰이 사라졌다면 유효기간 내 쿠폰은 10분 이내로 쿠폰함에 자동 복구됩니다.
"아이디어스 앱 > 왼쪽메뉴 > 쿠폰함"에서 확인하실 수 있으니 참고 부탁드려요.

2. 쿠폰을 사용하여 결제한 주문을 취소했어요!
쿠폰의 사용기한 이내라면 쿠폰이 복구되어 다시 사용하실 수 있어요.
취소 완료 후 10분 이내로 복구되어 "아이디어스앱 > 왼쪽메뉴 > 쿠폰함"에서 확인하실 수 있습니다.
단, 취소 후 최종 결제 금액이 쿠폰 사용 기준 금액 이상이라면 쿠폰이 적용되기 때문에 복구되지 않습니다.
주문내역 전체가 취소된 경우와 취소 후 최종결제 금액이 쿠폰 사용 기준 금액 이하의 경우에만 복구되는 점 참고부탁드려요.
 
※ 3만원 이상 구매 시 2천원 할인 쿠폰 사용의 예 
 
1. A 작가님 작품 5만원 결제 후 전체 취소 
→ 취소완료 후 쿠폰함으로 복구
 
2. A 작가님 작품 2만원 + B 작가님 작품 3만원 = 총 5만원 결제 후 A작가님 작품 2만원 취소
→ 최종결제금액 3만원으로 쿠폰 적용되어 복구되지 않음
 
3. A 작가님 작품 2만원 + B 작가님 작품 3만원 = 총 5만원 결제 후 B작가님 작품 3만원 취소
→ 최종결제금액 2만원으로 쿠폰 사용이 불가하므로 쿠폰 사용 기한 이내라면 취소완료 후 쿠폰함으로 복구
 
3. 중복으로 사용이 가능한가요?
아이디어스에서 자체 발급한 쿠폰의 중복 사용은 불가하오나 작가님께서 발급해주신 쿠폰과의 중복 사용은 가능해요.


4. 쿠폰은 어떻게 적용할 수 있나요?
작가님께서 발행하신 쿠폰은 장바구니 단계에서 적용 가능하고,
아이디어스에서 발행한 쿠폰은 결제 단계에서 적용 가능합니다.', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '입금하려는데 없는 계좌번호라고 나와요!', '1. ATM기에서는 무통장 방식으로 입금이 되지 않습니다. 인터넷/폰 뱅킹을 이용하거나 은행에 방문시는 창구를 통해 입금해 주세요.

2. 은행 전산망 점검시간에는 입금이 되지 않을 수 있습니다. (보통 저녁 11시 30분 ~ 다음날 새벽 1시경)

3. 토스 앱 이용시, 문자를 자동으로 복사해서 붙여넣을 경우 인식이 잘 되지 않는 경우가 있습니다. 복사해서 붙여넣기가 아닌 수동으로 금액, 계좌번호를 입력하면 입금이 가능합니다. 그러나 최근 토스 앱이 불안정한 경우가 있기 때문에 가급적 은행 앱 이용을 권합니다.

4. 페이코 앱을 통한 계좌이체시 입금이 불가능합니다. 인터넷/폰 뱅킹을 이용해 주세요.', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '결제 / 현금 영수증 조회 및 출력 방법', '❑ 신용카드 결제 시 영수증 확인

1. 나이스페이 사이트 https://www.nicepay.co.kr/home/main.do 으로 접속 (꼭 PC로만 접속해야함, 모바일에서는 영수증 발급 불가)

2. 화면 아래의 "결제고객" 에서 "거래내역조회" 선택

3. 결제수단선택 후 항목을 입력하면 영수증 조회 및 출력이 가능합니다.

※ 카드 간편 결제로 결제하신 경우 카드종류선택에서 "ISP를 제외한 모든 카드"를 선택하여 조회해 주세요.

❑ 휴대폰 결제 시 영수증 확인

1. 포털사이트에서 "mcash" 검색 후 접속 또는 http://www.mcash.co.kr 으로 접속

2. 오른쪽의 "결제내역조회" 버튼 선택

3. 항목을 입력하면 영수증 조회 및 출력이 가능합니다.

❑ 현금 영수증 확인 및 출력

1.국세청 홈택스 www.hometax.go.kr 로 접속

2. 국세청 홈택스 페이지 하단의 "현금영수증 사용내역 조회" 선택
※ 원활한 국세청 이용을 위하여 인터넷 익스플로러(IE) 7이상의 브라우저 사용을 권장합니다.

3. 본인확인을 위해 로그인 (공인인증서 로그인)

4. 현금영수증 사용내역 조회
현금영수증 발행 신청 시 사용한 휴대폰 번호, 카드번호 등의 마지막 4자리 숫자만 보여지며 최근 18개월 거래내역만 조회 가능합니다.
전일 거래 내역(24시간 기준)은 전산 처리 과정 상 조회되지 않을 수 있습니다.

❑ 네이버 페이

1. 네이버페이로 결제하는 계좌이체 주문은 결제시 자동으로 현금영수증이 신청됩니다.
현금영수증 발급여부는 네이버페이 https://pay.naver.com 또는 위의 국세청 홈택스에서 확인하실 수 있습니다.

2. 네이버페이로 결제한 주문의 결제 영수증 조회 및 발급은 네이버 페이 https://pay.naver.com 에 접속하여 본인만 확인 및 발급이 가능합니다.

추가 문의나 불편한 점은 언제든지 카카오톡채널 "아이디어스"로 문의주세요. 감사합니다.', '관리자', SYSDATE);

INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '적립금이 확인되지 않아요!', '회원등급별 적립금
- 아기손 0.5%
- 곰손 1.0%
- 은손 1.5%
- 금손 2.0%

결제수단별 적립금
- 현재는 간편하게 카드 결제만 0.5% 적립됩니다.
- 복잡하게 카드 결제, 네이버페이, 계좌이체, 휴대폰 결제는 적립되지 않으니 결제수단을 꼭~! 확인해주세요.

VIP클럽은 무조건 1.0% 추가!



2. 적립금이 적립되지 않았어요!

적립금은 주문 일자가 아닌 주문하신 작품의 운송장 번호가 입력된 시점으로부터 정확히 7일이 후에 적립됩니다.

아이디어스 앱 > 오른쪽 하단 내정보 > 적립금을 선택하면 주문하신 작품 각 각의 적립 예정 금액을 확인하실 수 있습니다.
주문하신 일자에 회색 글씨로 적립 예정 금액이 표시되며, 적립이 완료되면 하늘색 글씨로 적립된 금액이 표시됩니다.
적립이 완료된 이후로도 "간편결제 적립예정", 회색 글씨의 적립 예정 금액은 사라지지 않으니, 참고 부탁 드려요.

[참고 예시]
작품명 : 나뭇잎 새싹 칠보 은목걸이
구매일자 : 18-12-10
운송장 번호 입력 일시 : 2018-12-13 19:01:00
적립일시 : 2018-12-20 19:01:00 

18-12-20, 적립 완료 이후에도 "간편결제 적립예정" 회색으로 표시한 금액은 사라지지 않으나 정상 적립 완료되었습니다.', '관리자', SYSDATE);
INSERT INTO FAQ VALUES (FAQ_SEQ.NEXTVAL, '선물하기 이용 가이드 (FAQ)', '- 선물 주문을 취소하고 싶은데 어떻게 해야 하나요?
 
  "MY정보 > 보낸 선물함" 에서 해당 주문을 선택 한 후, 취소 신청을 하실 수 있습니다. 
  "배송주소 입력대기" 상태라면 즉시 취소가 가능하나, "배송주소 입력완료" or "발송 완료" 상태라면 신청 후, 작가님과의 협의가 필요합니다.


- 선물은 누구에게나 보낼 수 있나요?

 핸드폰번호만 알면 누구에게나 보낼 수 있습니다.  
 받는 사람이 아이디어스 회원이 아니라면 회원가입 후, 선물 확인 및 배송주소를 입력하실 수 있습니다. 
 (단, 도서 산간 지역 배송 불가) 
 

- 선물 받는 사람이 아이디어스 회원이 아니어도 선물을 받을 수 있나요?

 선물 주문이 완료되면 입력된 핸드폰으로 선물 도착 알림 정보를 보내드립니다. 
 이때 받는 사람이 아이디어스 회원이 아니라면 회원가입 후, 선물 확인 및 배송주소를 입력하실 수 있습니다.


- 배송주소 입력 후, 주문한 사람이 주소를 확인할 수 있나요?

 선물 받는 사람이 입력한 배송주소는 선물 주문자가 확인할 수 없습니다. 
 작가님이 선물을 발송하더라도 "발송 정보 조회"도 선물 수신자만 확인하실 수 있습니다.

- 받은 선물함에 선물이 보이지 않아요.

 선물이 도착했다는 메시지를 수신했으나, 받은선물함에 선물이 보이지 않는다면 아래의 경우에 해당합니다.

 구매자 요청에 의한 취소 처리 / 유효기간 만료 / 판매 작가님에 의해 판매중단 처리된 선물

- 유효기간이 만료되면 어떻게 되나요?

 유효기간이 만료되면 선물 받는 사람의 `받은선물함`에서는 삭제되어 더이상 노출되지 않습니다.
 이때 주문한 사람은 7일간 "배송주소 직접입력"메뉴를 통해 배송주소를 입력할 수 있으며, 선물 주문 후 총 14일동안
 배송주소가 입력되지 않은 선물은 자동 취소됩니다.

- 선물하기 주문 후에 선물 받는 사람 정보를 변경할 수 있나요?

 선물 주문 후, 받는사람 정보는 변경할 수 없습니다. 필요 시, 주문취소 후 다시 결제하시기 바랍니다.

- 받은 선물의 취소/환불/교환은 어떻게 진행할 수 있나요?

 선물 받는 사람은 취소/환불/교환을 진행하실 수 없습니다. 원하실 경우, 선물 보낸 사람을 통해 진행하시기 바랍니다.', '관리자', SYSDATE);




-- **** PRODUCT **** --
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '커피', 'coffee.png&', 1000, 1000, '음료(커피,차 등)', '#커피', 0, '향이 깊고 맛이 무거운 커피입니다.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '애플사이다', 'applecider.jpg&', 10000, 10000, '음료(커피,차 등)', '#음료', 0, '알코올이 포함되어 있습니다. 상큼한 저알코올 음료입니다.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '히비스커스 파인애플 식초', 'bineger.jpg&', 10000, 10000, '음료(커피,차 등)', '#식초', 0, '건강에 좋은 식초입니다.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '얼그레이', 'blacktea.png&', 2000, 2000, '음료(커피,차 등)', '#홍차', 0, '국내산 얼그레이 홍차입니다.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '콜드브루', 'coldbrew.jpg&', 3000, 3000, '음료(커피,차 등)', '#커피', 0, '48시간의 정성. 콜드브루입니다.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '꽃을 넣은 허브티', 'flowertea.jpg&', 1000, 1000, '음료(커피,차 등)', '#꽃차', 0, '꽃의 향긋함과 허브의 만남.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '식혜', 'sickhae.png&', 5000, 5000, '음료(커피,차 등)', '#음료', 0, '국내산 쌀로 만든 식혜입니다.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '딸기청', 'strawberrycube.png&', 10000, 10000, '음료(커피,차 등)', '#청', 0, '그냥 먹어도 맛있는 과일들로 만든 청! 더 달고 맛있습니다.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '딸기우유', 'strawberrymilk.jpg&', 20000, 20000, '음료(커피,차 등)', '#음료', 0, '딸기를 넣어 더 상큼하고 달콤한 우유!.', NULL, NULL, 1, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '맛있는 아메리카노', 'coffee2.png&', 3000, 3000, '음료(커피,차 등)', '#커피', 0, '차갑게 먹을 때 다크 초콜릿의 풍미가 강해지는 원두를 사용한 커피입니다.', NULL, NULL, 1, SYSDATE);


INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '브라우니', 'brownie.jpg&', 5000, 5000, '디저트,베이커리,떡', '#디저트', 0, '씹는 순간 느껴지는 행복감. 깊고 절도있는 초콜릿의 맛을 느껴보세요.', NULL, NULL, 2, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '초코쿠키', 'chococookie.jpg&', 4000, 4000, '디저트,베이커리,떡', '#디저트', 0, '씹는 순간 느껴지는 행복감. 깊고 절도있는 초콜릿의 맛을 느껴보세요.', NULL, NULL, 2, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '쇼콜라', 'chocolate.jpg&', 10000, 10000, '디저트,베이커리,떡', '#디저트', 0, '씹는 순간 느껴지는 행복감. 깊고 절도있는 초콜릿의 맛을 느껴보세요.', NULL, NULL, 2, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '에그타르트', 'eggtart.jpg&', 1000, 1000, '디저트,베이커리,떡', '#디저트', 0, '홍콩에서도 못느껴본 그 맛. 한국 에그타르트의 새로운 지표', NULL, NULL, 2, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '레몬케이크', 'lemoncake.jpg&', 10000, 10000, '디저트,베이커리,떡', '#디저트', 0, '레몬케이크 때문에 살인사건이 일어났다구요? 레몬케이크살인사건', NULL, NULL, 2, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '뚱카롱', 'macaron.jpg&', 3000, 3000, '디저트,베이커리,떡', '#디저트', 0, '프랑스인은 모르는 한국의 맛.', NULL, NULL, 2, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '작고 귀여운 마들렌', 'madeleine.jpg&', 1000, 1000, '디저트,베이커리,떡', '#디저트', 0, '레몬 마들렌, 바닐라 마들렌, 초코 마들렌, 녹차 마들렌, 12가지 맛을 즐길 수 있는 마들렌 세트입니다.', NULL, NULL, 3, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '밀크초콜렛', 'milkchocolate.jpg&', 1000, 1000, '디저트,베이커리,떡', '#디저트', 0, '씹는 순간 느껴지는 행복감. 깊고 절도있는 초콜릿의 맛을 느껴보세요.', NULL, NULL, 3, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '진짜 감자빵', 'potatoebread.jpg&', 1000, 1000, '디저트,베이커리,떡', '#디저트', 0, '진짜 감자로 만든 빵 드셔본 적 있으십니까?', NULL, NULL, 3, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '호두과자', 'walnutbread.png&', 10000, 10000, '디저트,베이커리,떡', '#디저트', 0, '휴게소에서 사먹는 것보단 집에서 에어프라이어에 돌려먹는게 맛있습니다.', NULL, NULL, 3, SYSDATE);

INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '사과', 'apple.png&', 1000, 1000, '농축수산물', '#과일', 0, '태양을 닮은 듯 윤이 나고, 설탕을 핥는 듯한 과즙이 흐르는 대박사과.', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '유럽 채소', 'freshvegetable.jpg&', 1000, 1000, '농축수산물', '#채소', 0, '유럽에서 직접 수입해온 채소입니다.', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '목장우유', 'milk.png&', 1000, 1000, '농축수산물', '#유제품', 0, '지방을 덜 제거해 버터의 풍미가 느껴지는 우유입니다.', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '감자', 'potatoe.jpg&', 100, 100, '농축수산물', '#채소', 0, '감자빵이 아니다! 진짜 감자다!', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '연어', 'salmon.png&', 20000, 20000, '농축수산물', '#수산물', 0, '기름진 제철 연어입니다.', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '조개', 'shell.jpg&', 15000, 15000, '농축수산물', '#수산물', 0, '캠핑갈 때 필수품! 연탄불에 구워먹으면 더욱 맛있습니다.', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '스테이크', 'steak.jpg&', 10000, 10000, '농축수산물', '#소', 0, '대박 음식점에 납품되는 바로 그 소고기. 품격있는 맛을 집에서도 느껴보세요.', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '호밤고구마', 'sweetpotatoe.jpg&', 1000, 1000, '농축수산물', '#채소', 0, '이것은 밤고구마인가 호박고구마인가 그것은 바로 호밤고구마', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '토마토', 'tomatoe.jpg&', 1000, 1000, '농축수산물', '#채소', 0, '이탈리아의 정열을 가득 담은 붉은 토마토입니다.', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '요거트', 'yogurt.jpg&', 1000, 1000, '농축수산물', '#유제품', 0, '시리얼을 넣어먹어도, 과일을 넣어도, 꿀을 넣어도 맛있는 요거트.', NULL, NULL, 4, SYSDATE);
INSERT INTO PRODUCT(PNO, PNAME, PIMAGE, PLISTPRICE, PPRICE, PCATEGORY, PTAG, PDISRATE, PDESC, PASDESC,PDETAIL, ANO, PREGDATE)
VALUES(PRODUCT_SEQ.NEXTVAL, '사과', 'apple.png&', 1000, 1000, '농축수산물', '#과일', 0, '태양을 닮은 듯 윤이 나고, 설탕을 핥는 듯한 과즙이 흐르는 대박사과. ', NULL, NULL, 4, SYSDATE);



-- 수제 반찬
INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '🔵농부 의성마늘쫑🔵 (마늘은 의성)입맛살아요', 'handmade-sideDishes1.jpg&', 8900, 5900, '수제반찬', '#장아찌', 10, '🔴마늘쫑은 의성!🔴🔴의성부자농장 마늘쫑🔴'||chr(13)||chr(10)||'
왜!? 마늘쫑은 의성인지 드셔보시면 느끼실거에요

▶▶▶의성부자농장 3가지 약속◀◀◀

🔵맛있는 의성부자농장 100% 수제 농부 마늘쫑 장아찌🔵
(공장에서 찍어내는 장아찌 아닙니다)
🔵농장 직거래를 통한 부담없는 국민가격🔵
(아이디어스 최저가! 저희 농장 이윤을 일부러 줄입니다)
🔵식재료를 직접 재배하는 건강한 믿음 장아찌🔵
(식재료 안전한 직접재배!)
(식자재 부족시에만 친한농장들 일부 재료 수매)', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"4","배송비":"4000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 5, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '🔵 삭힌 깻잎김치 🔵 (이건 진짜에요)농장 직거래', 'handmade-sideDishes2.jpg&', 9900, 7900, '수제반찬', '#김장김치', 10, '🔷깻잎에 양념만 바른거 아니에요🔷
🔹️저희농장에서 직접 삭힌 깻잎김치🔹️
🔷드셔보시면 다릅니다🔷

▶▶▶의성부자농장 3가지 약속◀◀◀
🔵맛있는 의성부자농장 100% 수제 농부 김치🔵
(공장에서 찍어내는 김치 아닙니다)
(김치는 맛있어야 합니다)
🔵농장 직거래를 통한 부담없는 국민가격🔵
(아이디어스 최저가! 저희 농장 이윤을 일부러 줄입니다)
(가격부담없이 드셔주세요)
🔵식재료를 직접 재배하는 건강한 믿음 김치🔵
(식재료 안전한 직접재배!)
(식자재 부족시에만 친한농장들 일부 재료 수매)', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"4","배송비":"4000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 5, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '🔴농부가 만드는 시골 (봄동+청방) 짜박 김치🔴', 'handmade-sideDishes3.jpg&', 14900, 10900, '수제반찬', '#봄동김치', 10, '🔴농부가 만드는 시골 (봄동+청방) 짜박 김치🔴
국물이 자박자박하다고 해서
짜박이 김치라고 부르지요~

▶▶▶의성부자농장 3가지 약속◀◀◀
🔵맛있는 의성부자농장 100% 수제 농부 김치/반찬🔵
(공장에서 찍어내는 김치/반찬 아닙니다)
(김치와 반찬은 맛있어야 합니다)
🔵농장 직거래를 통한 부담없는 국민가격🔵
(아이디어스 최저가! 저희 농장 이윤을 일부러 줄입니다)
(가격부담없이 드셔주세요)
🔵식재료를 직접 재배하는 건강한 믿음 김치/반찬🔵
(식재료 안전한 직접재배!)
(식자재 부족시에만 친한농장들 일부재료 수매)', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"4","배송비":"4000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 5, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '🔵농부손맛 총각김치 1kg(통)-(라면하고 찰떡궁합)', 'handmade-sideDishes4.jpg&', 13900, 10900, '수제반찬', '#알타리무총각무', 10, '🔴총각김치 없이 라면드실꺼예요?🔴
발송 당일 바로담아서 보내드립니다~^^
하루이틀 상온숙성후 드시면 밥반찬에도 라면에도 필수인 김치
▶▶▶의성부자농장 3가지 약속◀◀◀
🔵맛있는 의성부자농장 100% 수제 농부 김치/반찬🔵
(공장에서 찍어내는 김치/반찬 아닙니다)
(김치와 반찬은 맛있어야 합니다)
🔵농장 직거래를 통한 부담없는 국민가격🔵
(아이디어스 최저가! 저희 농장 이윤을 일부러 줄입니다)
(가격부담없이 드셔주세요)
🔵식재료를 직접 재배하는 건강한 믿음 김치/반찬🔵
(식재료 안전한 직접재배!)
(식자재 부족시에만 친한농장들 일부재료 수매)', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"3","배송비":"4000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 5, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '🔵특수부위🔵 명태껍질 조림(콜라겐의 여왕)농장직거래', 'handmade-sideDishes5.jpg&', 11900, 8900, '수제반찬', '#명태껍질', 10, 
'▶▶▶의성부자농장 3가지 약속◀◀◀
🔵맛있는 의성부자농장 100% 수제 김치,반찬류🔵
(공장에서 찍어내는 반찬이 아닙니다)
(반찬은 맛있어야 합니다)
🔵농장 직거래를 통한 부담없는 국민가격🔵
(아이디어스 최저가! 저희 농장 이윤을 일부러 줄입니다)
(가격부담없이 드셔주세요)
🔵식재료를 직접 재배하는 건강한 믿음 장아찌🔵
(식재료 안전한 직접재배!)
(식자재 부족시에만 친한농장들 일부 재료 수매)', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"3","배송비":"4000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 5, SYSDATE);


INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '💖면역력 강화💖아삭아삭 마늘장아찌', 'handmade-sideDishes6.jpg&', 8400, 4900, '수제반찬', '#마늘쫑', 10, 
'💖면역력 강화! 마늘 반찬💖
아삭아삭 마늘 장아찌+마늘쫑
👍장시간 숙성시켜 마늘의 매운맛은no!!

👍면역력을 올려주는 아삭한 통마늘

👍첨가물 없이 만든 건강한 매콤 상큼 특제 양념
아삭아삭하고 매콤 상큼한 마늘과
골라먹는 재미가 쏠쏠한 마늘쫑

마늘의 매운맛을 없애기 위해
물엿에 마늘을 재웠습니다~
조금 쭈글쭈글한 마늘이 있을 수 있는 점
참고 부탁드립니다~', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"1","배송비":"3500","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 6, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '💖선물세트💖깜짝할인🎁순살게장 선물세트🎁', 'handmade-sideDishes7.jpg&', 34000, 15000, '수제반찬', '#양념게장', 10, 
'💖세트상품 이벤트💖
순살간장게장(150g)+순살양념게장(150g)
순살간장게장(250g)+순살양념게장(250g)
순살간장게장(250g)+순살양념게장(250g)+선물포장
(❗맛변경은 되지 않습니다)
(❗150g은 선물포장이 되지않습니다)

💖감사한 분들께 선물하세요💖
맛있는 순살게장+고급스러운 라벨과 포장+
안전한 보냉백에 아이스 팩+부직포 가방

✔자극적인 조미료 뺴고 건강한 순살!
✔신선하고 큰 꽃게를 직거래로 받아 항상 싱싱하게!
✔꽃게육수를 사용해 5배!! 진한 꽃게의 맛', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"2","배송비":"3500","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 6, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '✨인기상품✨고칼슘 젓갈! 🐟저염 갈치속젓🐟', 'handmade-sideDishes8.jpg&', 14000, 8500, '수제반찬', '#갈치속젓', 10, 
'바다의 제왕! 고칼슘 젓갈!
🐟저염 갈치속젓🐟
갈치속젓은 갈치의 내장을 천일염으로
삭혀 만드는 젓갈로 특히 내장, 뱃살에
칼슘이 많아 영양만점 식품이에요~👍
셰프가 만들어 더욱 특별하고 갈치 특유의
비린맛을 제거해 부담없이 즐겨 먹기 좋아요!🍚❤
또한 멸치에 들어간 알라닌은 면역계를 증강시키는
효능이 있어 어른신들 선물로도 좋습니다😘👍
👨‍🍳어떠한 첨가물도 없는 건강함~
👨‍🍳신안천일염으로 더욱 더 풍부한 감칠맛~
👨‍🍳어디에도 어울리는 매력만점 젓갈!', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"1","배송비":"3500","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 6, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '✨대박할인✨양념꼬막무침+비빔면', 'handmade-sideDishes9.jpg&', 13000, 11900, '수제반찬', '#꼬막장', 10, 
'❤️❤️밥반찬이나 안주로도 최고❤️❤️

꼬막 더 맛있게 먹는 방법
✔따끈따끈한 밥에 꼬막장과
참기름, 계란 반숙, 김가루 올려 쓱쓱 비벼먹기!

✔꼬막장에 참기름을 조금~넣고
소면이나 쫄면과 함께 비벼주시면 완벽한 술안주!

👍귀찮은건 다 해드려요~껍질 없는 꼬막
👍믿고 먹을 수 있는 건강한 셰프의 특제 양념장!
👍밥에 참기름 넣고 비벼만 줘도 꼬막맛집 인정~

✨✨중독적인 맛 2가지✨✨
✔기본 양념(어린아이들도 먹을 수 있는 맵기)
✔매콤한 불꼬막(불닭 맵기 정도보다 살짝 아래)', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"1","배송비":"3500","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 6, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '💕새해선물💕젓갈맛집👍낙지젓', 'handmade-sideDishes10.jpg&', 10000, 6900, '수제반찬', '#낙지젓', 10, 
'인기가 너무 많아요~ ✨젓갈반찬 낙지젓✨
오동통하고 탱글한 식감의 낙지를 한입크기로 염지했어요~

짜거나 달거나 자극적인 젓갈 NO~
좋은 재료로 건강하게 만들었어요💖

✔1달간의 저온 숙성 양념장으로 감칠맛 업!
✔매일 먹어도 질리지 않는 데일리반찬 낙지젓갈
✔없던 입맛도 살리는 중독적인 맛

그냥 따뜻한 밥이랑 먹어도~
볶음밥 비빔밥으로 해먹어도~
참기름을 살짝 넣어 밥이랑 먹어도~

✨너무 맛있어요✨
구매하신 분들 모두 100% 재구매🥰
나쁜 후기가 없는 대표젓갈!', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"1","배송비":"3500","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 6, SYSDATE);


-- 그 외 수제 먹거리

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '비상상비약♥진한생강청', 'extra-food1.png&', 25000, 18500, '그 외 수제먹거리', '#건강간식', 10, 
'국산생강을 저온 발효숙성하여
생강 본연의 맛과 향을 그대로 담은 생강청!

지금 이 계절~
집집마다 한병씩은 꼭 있는 비상 상비약!

환절기, 감기기운있을때, 몸이 으슬으슬할때
생강청 한잔이면 뚝~~!!!

발효숙성생강청은

✔국산봉동생강으로 물한방울 넣지 않고
생강을 착즙하여 만든 고농축생강청 입니다.
✔착즙한 생강의 전분을 제거하여
차로, 라떼로 드실때 훨씬 더 부드럽습니다.
✔저온으로 숙성하여 더~ 깊은맛을 느끼실수 있습니다.
✔착즙하여 만든 생강청으로 소량만 넣어도 생강본연의 맛을 진하게 느끼실수 있습니다.', '{"제작배송방법":"주문 후 제작에 들아가는 제품입니다.","교환환불내용":"주문 전 판매 작가님과 연락하여 확인해주세요.","제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '대추도라지정과 모듬선물세트', 'extra-food2.png&', 58000, 58000, '그 외 수제먹거리', '#도라지정과', 10, 
'건강한 선물
대추도라지정과와 도라지양갱,
모듬견과강정까지 한번에 담은 선물세트!
푸짐한 양으로 넉넉한 선물하세요 :)
대추도라지정과는 100%자연건조로 건조해요.
건조기로 말린 도라지정과랑은 비교불가X
쫀득함이 다르답니다~
3일간 끓이고 식히고를 반복한뒤,
잘 당침된 도라지를 7일동안 자연으로 건조합니다.
모듬견과강정은,
특A급 견과류를 갓구워 만들어요~
호두, 피칸, 땅콩, 해바라기씨, 호박씨를
한번에 넣어 만든 모듬견과강정입니다!','{"제작배송기간":"2","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '찐득한❤️대추도라지진액', 'extra-food3.png&', 25000, 10000, '그 외 수제먹거리', '#도라지', 10, 
'도라지와 대추를 정성껏 달여 만든
엑기스만 담은 대추도라지진액청 !!

도라지와 대추, 조청을 3일간 정성껏 달여 나온 진액으로,

물한방울 넣지 넣지 않고
오직 도라지,대추,조청만 넣어 만든 진액청 입니다.

물을 넣지 않고 달이기 때문에 아주 소량만 나오는
귀한 진액 이여요~~!!

정성이 들어간 아주 귀한 음식입니다.

물엿이나 설탕, 색소, 방부제는 일절들어가지 않습니다!!
도라지와 대추 조청을 오랜시간 달였기 때문에
찐득한 깊은맛을 느끼실수 있어요.

첫맛은 조청과 대추의 달콤함을
끝맛은 도라지의 씁쓸함을 느끼실수 있어요.

쓴맛이 많이 나지 않아요.
아이들도 맛있다며 잘 먹는답니다. ^^"','{"제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '촉촉한 견과오란다', 'extra-food4.png&', 8000, 6400, '그 외 수제먹거리', '#수제강정', 10, 
'촉촉하고 부드러운 오란다~~
견과류가 콕콕! 건강한 오란다~

여기 오란다~~ 있어요!
쌀조청으로 만든 건강한 오란다!

설탕X 물엿X

조청으로 만들어 부드러워요:)

건강한 단맛으로 멈출수 없는 맛!!!

견과류까지 콕콕~ 토핑이 있어 더 맛있어요~
심심한맛을 견과류가 살려준답니다.

견과류도 다~ 전처리하여 사용하기 때문에 훨씬 고소해요!
부드럽지만 이에 붙지않아 더 좋은 오란다~

어린아이부터 할머니 할아버지까지~~
모두 좋아하는 오란다~!

딱딱하지 않아 누구나 드실수 있습니다

간식으로 완전 ★추천★','{"제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '과육이 씹히는,달달한 오렌지청', 'extra-food5.png&', 15000, 10000, '그 외 수제먹거리', '#수제청', 10, 
'♥고농축 과일청이라
일반 슬라이스 청보다 과일의 비율이 높아
풍부한 과일향과 진한 맛을 느낄 수 있답니다.

♥식용구연산을 사용하지 않고,
직접 만든 황금비율의 레몬청으로 맛을 살려줘요.

♥특별한 비법으로 병입시 분리를 최소화 했어요~!

♥기존의 과일청보다 소량으로도 과일청맛을 UP 시켜줘요~!!

♥길쭉한 병으로 숟가락 NONO!

쪼로록 따르기만하면 OK~~!!
깔끔하게 과일청을 즐길수 있어요~~

🚫드실 때 꼭 흔들어서 잘섞은후 따라주세요.','{"제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '뇌팔청춘,꿀마늘', 'extra-food6.png&', 30000, 14000, '그 외 수제먹거리', '#마늘꿀', 10, 
'★Only 마늘과 벌꿀만 들어갑니다!!★

꿀마늘 맛은?
거부감 없는 맛이예요!

저는 처음 딱 먹어보고 든 생각은,
마늘빵의 그 마늘스프레드 맛!! 이였어요.

마늘을 쪄서 만들었기 때문에 전혀 매운맛이 없답니다.

포슬포슬한 맛과 벌꿀맛이 어우려져 달콤해요:)

부모님, 조부모님께 선물하면 무지 좋을것 같아요.
주위에 뇌,혈관건강 고민하시는 분께도 추천드립니다!

🚫반드시 냉장보관 해주세요 !!
🚫매일 한스푼만 드세요. 일주일만 꾸준히 드셔도 몸에 효과를 볼수 있다고 합니다','{"제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '자몽이듬뿍🍊자몽청', 'extra-food7.png&', 15000, 10000, '그 외 수제먹거리', '#자몽소주', 10, 
'보는것도 이쁘고, 맛도좋은~!!
자몽이 듬뿍~들어간 자몽청!

자몽 특유의 쓴맛을 제거하여 더 맛있어요:)

알알이 자몽의 맛을 느낄수 있어요~~

한길로의 고농축 과일청이 더 특별한 이유!!

♥식용구연산을 사용하지 않고,
직접 만든 황금비율의 레몬청으로 맛을 살려줘요
♥특별한 비법으로 병입시 분리를 최소화 했어요~!
♥기존의 과일청보다 소량으로도 과일청맛을 UP 시켜줘요~!!
♥길쭉한 병으로 숟가락 NONO!

쪼로록 따르기만하면 OK~~!!
깔끔하게 과일청을 즐길수 있어요~~','{"제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '🚫초특가할인🚫🍯토종벌꿀듬뿍~꿀모과청💕', 'extra-food8.png&', 18000, 6000, '그 외 수제먹거리', '#건강청', 5, 
'모과의 계절이 왔어요 ~~!!!

청도 햇 모과로 만든 모과청~~

향이 좋은 모과에 토종벌꿀을 듬뿍~ 넣은 꿀모과청 !!

모과가 꿀에 절여지도록 토종벌꿀을 듬뿍 넣어 만든 청입니다 ~^^

향긋한 모과향에 벌꿀향까지~~ 향만 맡아도 따뜻해지는 기분이예요.

못생긴과일 모과, 딱딱해서 작업하기도 힘들지만,
작업하기 힘든게 원래 맛도 더 좋아요~ㅎㅎ

이계절, 꼭 드셔야 합니다~~^^

따뜻한 모과차 한잔이면 몸이 한결 낳아지실거예요~

🚫드실 때 꼭 흔들어서 잘섞은후 따라주세요.
🚫침이나, 물이 들어가지 않게 해주세요.','{"제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '베리총집합🍓베리청', 'extra-food9.png&', 20000, 11500, '그 외 수제먹거리', '#과일청', 10, 
'베리베리~ 다모여라!!
베리들의 총집합~!! 베리청!!
블루베리, 라즈베리, 블랙베리, 스트로베리까지~~!!

모두 한곳에 담은 베리청 입니다!

한길로의 고농축 과일청이 더 특별한 이유!!

♥식용구연산을 사용하지 않고,
직접 만든 황금비율의 레몬청으로 맛을 살려줘요.
♥특별한 비법으로 병입시 분리를 최소화 했어요~!
♥기존의 과일청보다 소량으로도 과일청맛을 UP 시켜줘요~!!
♥길쭉한 병으로 숟가락 NONO!

쪼로록 따르기만하면 OK~~!!

깔끔하게 과일청을 즐길수 있어요~~','{"제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '2+1🌱🍋달콤향긋한수정과‼️', 'extra-food10.png&', 7000, 6000, '그 외 수제먹거리', '#전통음료', 10, 
'소화가 안되고 더부룩할때 ,
느끼한 음식을 많이 먹었을때~

시원~~한 수정과 한잔 드시면 불편한 속을 달래주어요.

마트에 파는 수정과 드시고 밍밍해서 실망한적 많으시죠?

한길로 수정과는 집에서 정성껏 끓인 엄마가 해주신 그 수정과~
그맛 이예요~~!! 정말 추천합니다 ~^^

수정과에 고명으로 잣,대추,곶감을 곁들이면
손님맞이 음료로 정말 좋습니다 ~~^^

◆1병 - 500ml◆
◆방부제가 일절 들어가 있지 않습니다◆
◆꼭 냉장보관하시거나 장기 보관시 냉동보관해주세요◆','{"제작배송기간":"1","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"70000"}', NULL, 7, SYSDATE);




-- 전통주

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '[3월8일순차출고예약]술취한원숭이🍶4개입', 'traditional-liquor1.jpg&', 28000, 28000, '전통주', '#막걸리', 10, 
'💝두병선물포장 옵션선택 가능합니다💝
*단병은 선물패키지 및 소박스가 준비되어있지 않습니다*

특색있는 이색주
주원료인 홍국쌀은

쌀에 붉은색을 띠는 곰팡이를
고체로 발효한 뒤
쌀을 발효시켜 만드는 쌀입니다.

이 술이 띄고 있는
장미빛의 붉은색은
술취한 원숭이만의 트레이드마크로써

합성감미료뿐 아니라
색소조차 들어가지 않은
무첨가 막걸리입니다.','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '✨청와대만찬주✨[방송출연할인]감사 375ml', 'traditional-liquor2.jpg&', 15000, 14250, '전통주', '#약주', 10, 
'💝두병선물포장 옵션선택 가능합니다💝

*단병은 선물패키지 및 소박스가 준비되어있지 않습니다*

2018년 문재인대통령의 만찬주 건배주로서
청와대에도 들어간 그 술!

깔끔한 우리의 맑은 술
인생에서 가장 값진 선물은 인연입니다.

그 소중한 인연에 감사하는 마음으로
맵쌀로 정성들여 빚은 우리의 맑은 술로써

끈적거리지 않는 깔끔함으로
감사의 마음을 전해보세요.','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '[신제품할인]꿀리큐르 꿀샘16', 'traditional-liquor3.jpg&', 15000, 14250, '전통주', '#명절선물', 10, 
'🍯국내산 천연꿀 리큐르 꿀샘16🍯

국내산 천연꿀이 첨가된 꿀리큐르(소주)가 출시되었습니다!

16도 술이라는 사실이 믿기지 않을 정도로 부드럽고,
달콤한 벌꿀향이 일품👍

꿀이 들어갔다고 해서 과하게 달지 않아요!

적당한 단맛과 알콜의 밸런스가 매우 좋은 꿀샘16입니다.

알코올도수는 16도 일반 소주와 비슷하지만 알코올 향 대신 벌꿀의 은은한 향을 느낄 수 있으며
목넘김이 매우 부드러워요! 남녀노소 즐길 수 있는 우리술 입니다:)

또한, 생강을 침출해 넣어 끝에 살짝 오는 깔끔함이 술의 단조로움을 없애 더욱 매력적으로 다가옵니다🥰','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '[베스트셀러]오미자리큐르 술샘16🍒', 'traditional-liquor4.jpg&', 10000, 10000, '전통주', '#홈술', 10, 
'술샘16은 국내산오미자100%를 침출하여
과실의 맛과 향을 살린 술입니다

오미자 특유의 5가지 (신맛,단맛,쓴맛,매운맛,짠맛) 신비한
맛을 느낄 수 있습니다🤩

한모금 마셨을때 입안에 가득 퍼지는 오미자의
향과 맛이 일품입니다

오미자를 그대로 입안에 머금은 듯한 착각을 불러일으킬
정도로 오미자의 순수한 맛을 증류주에 담았습니다🤲

술샘16의 오미자는 국내산100%를 고집합니다

중국산의 3배가량 비싸지만
술샘은 원재료에 대한 확고한 원칙과 신념을 우선 합니다

❣️술샘16을 사이다 혹은 탄산수와 섞어 오미자 칵테일로 즐겨보세요 무더운 여름 지친 여러분
의 몸과 마음을 시원하게 다독여 줄 거에요❣️','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '✨대통령상수상 증류주✨미르40🍶', 'traditional-liquor5.jpg&', 23000, 21800, '전통주', '#증류주', 10, 
'술샘의 미르시리즈는
전통 증류방식소주입니다🙌

오로지
쌀,물,누룩으로만 빚은 고급주이구요

쌀은
엄선된 경기미안을 사용하여
최상의 품질을 자랑합니다.

상압증류로
진한 곡향이 예술인 미르시리즈,
중국산의 3배가량 비싸지만

이젠 다양하게
언더락으로,또 칵테일로도 즐겨보세요!','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '전통증류소주🍶 미르25🍶', 'traditional-liquor6.jpg&', 23000, 21800, '전통주', '#증류주', 10, 
'❤️미르40 대통령상 수상❤️

술샘의 미르시리즈는
전통 증류방식소주입니다🙌

오로지
쌀,물,누룩으로만 빚은 고급주이구요

쌀은
엄선된 경기미안을 사용하여
최상의 품질을 자랑합니다.

상압증류로
진한 곡향이 예술인 미르시리즈,
중국산의 3배가량 비싸지만

이젠 다양하게
언더락으로,또 칵테일로도 즐겨보세요!','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '은은한 생강술 술샘19🍶', 'traditional-liquor7.jpg&', 23000, 21800, '전통주', '#증류주', 10, 
'❤️술샘은 당일배송 원칙으로하여 오전 10시이전 주문시 당일발송 드리도록 하고있습니다(재고문제 있을 수 있으니 정확한 배송을 알고 싶으시면 메세지 주세요!)'||chr(13)||chr(10)||'

영업일 기준 보통 ‘다음날’ 도착하니 참고해주세요!❤️
은은한 생강향과 강황의 예쁜 노란빛이 조화로운 술샘19출시
리큐르 19%💛

술샘19은 생강과 강황을 침출하여
생강의 맛과 향을 살린 술입니다

은은하고 살짝 알싸한 생강향과 예쁜 노란빛이 특징입니다🤩

생강의 너무 강하지도 약하지도 않은 향을 조화롭게 증류주에 담았습니다🤲

술샘은 원재료에 대한 확고한 원칙과 신념을 우선 합니다

❣️술샘19를 사이다 혹은 진저에일과 섞어 칵테일로 즐겨보세요

무더운 여름 지친 여러분의 몸과 마음을 시원하게 다독여 줄 거에요❣️','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '❣️신제품❣️미르미니어쳐 선물세트', 'traditional-liquor8.jpg&', 30000, 30000, '전통주', '#부모님선물', 10, 
'전통주업계의 최고 권위있는대회인
‘2018우리술품평회’에서

술샘의 미르40이
최고상인
✨대통령상✨을 수상하여

올해 최고의 술임을 인정받았습니다👏🏻

미르25/40/54
술샘의 미르시리즈는
전통 증류방식소주입니다🙌

오로지
쌀,물,누룩으로만 빚은 고급주이구요,

쌀은
엄선된 경기미안을 사용하여
최상의 품질을 자랑합니다.

상압증류로
진한 곡향이 예술인 미르시리즈,
이젠 다양하게
언더락으로,또 칵테일로도 즐겨보세요!','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '✨전통증류소주✨미르54', 'traditional-liquor9.jpg&', 40000, 40000, '전통주', '#전통주', 10, 
'전통주업계의 최고 권위있는대회인

‘2018우리술품평회’에서
술샘의 미르40이

최고상인
✨대통령상✨을 수상하여
올해 최고의 술임을 인정받았습니다👏🏻

미르25/40/54
술샘의 미르시리즈는
전통 증류방식소주입니다🙌

오로지
쌀,물,누룩으로만 빚은 고급주이구요,

쌀은
엄선된 경기미안을 사용하여
최상의 품질을 자랑합니다.

상압증류로
진한 곡향이 예술인 미르시리즈

이젠 다양하게
언더락으로,또 칵테일로도 즐겨보세요!','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL, '오색과일발효식초🍒', 'traditional-liquor10.jpg&', 50000, 50000, '전통주', '#부모님선물', 10, 
'🍒오색식초🍒

머루,오디,오미자,매실,복분자로 구성된 오색식초는 옹기속에서 백일을 정성으로 식초를 만든후, 저온에서 이백일 이상 숙성시킨 전통발효식초입니다.

정성으로 만든 우리식초, 소중한 분께 성물 어떠새요?

✅믿을 수 있는 체크포인트✅
국내산 재료와 농촌진흥청의 특별한 발효기술이 결합해 만들어진 천연발효식초!

엄선된 초산균으로 2차발효법을통해 발효시켜
향과 초산생성율이 월등히 높습니다.

국내산 머루,오미자,매실,복분자,오디만을 100%사용하여 옹기에서 장기간숙성!

아미노산과 유기산이 풍부합니다

각종요리에 일반식초와 동일하게 사용하시거나
물과 꿀을섞어 음용하시면 발효식초에 월등히 많이 들어있는 영양성분이 건강에 도움을 줍니다.','{"제작배송기간":"60일 이내","배송비":"3000","도서산간비용":"3000","교환환불정책":"조건확인","무료배송":"50000"}', NULL, 7, SYSDATE);

/***** STOCK *****/
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 1, '구성선택','브라질(+300원)',300,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 1, '구성선택','콜롬비아(+300원)',300,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 1, '구성선택','캔디펀트 블랜드(+1,300원)',1300,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 1, '선물포장','1병용 박스(쇼핑백 제외) x1개(+1,000원)',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 1, '선물포장','1병용 박스(쇼핑백 제외) x2개(+2,000원)',2000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 2, '옵션선택','1병추가★(+2,000원)',2000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 2, '옵션선택','1병추가★(+4,000원)',4000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 3, '용량','500ml',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 3, '용량','1,000ml',6000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 3, '포장','1개들이용',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 3, '포장','2개들이용',1500,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '밀크티베이스','얼그레이 대용량',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '우유추가','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '우유추가','소화가잘되는우유 190ml',900,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '우유추가','소화가잘되는 우유 190mlx9',8100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '타피오카펄추가','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '타피오카펄추가','타피오카펄x10',15500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '타피오카펄추가','타피오카펄x20',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '선물포장추가','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '선물포장추가','선물포장(+1,000원)',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '보틀추가','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 4, '보틀추가','밀크티전용보틀(+1,000원)',1000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '1리터커피 종류','컴백할인-블랙 디카페인 안심블랜드(+9,000원)',9000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '1리터커피 종류','컴백할인-바닐라 디카페인(달콤커피) (+14,000원)',14000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '1리터1병더(할인)','안함(1병만 구매)',0,0);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '1리터1병더(할인)','브라질 세라도(+11,000원)',11000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '1리터1병더(할인)','캔디펀트 블랜드(16,000원)',16000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '선물포장','안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '선물포장','1리터 선물박스 x 1개(+1,000원)',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '선물포장','1리터 선물박스 x 2개(+2,000원)',2000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '소용량 커피 추가','추가안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '소용량 커피 추가','브라질 세라도 260ml(+3,700원)',3700,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 5, '소용량 커피 추가','콜롬비아 수프리모 260ml(+4,000원)',4000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 6, '용량선택','티백 7g(10티백)',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 6, '용량선택','병 12g(+4,100원)',4100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 6, '포장상자선택','포장상자 추가(+1,000원)',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 6, '포장상자선택','포장안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 6, '포장리본선택','포장리본(+500원)',500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 6, '포장리본선택','포장리본안함',0,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 7, '옵션1','900ml(+3,000원)',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 7, '옵션1','350ml',0,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 8, '용량선택','바른딸기500g',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 8, '용량선택','바른딸기1kg(+9,000원)',9000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 8, '생딸기큐브 추가','큐브+100g(+1,500원)',1500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 8, '생딸기큐브 추가','큐브+200g(+3,000원)',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 8, '베이스청 추가','베이스청 300ml(+3,000원)',3000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 9, '최소 주문수량 3개','★아이스팩 3개추가★',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 9, '최소 주문수량 3개','생딸기우유 350ml',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 9, '최소 주문수량 3개','생딸기우유 500ml(+1,500원)',1500,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 10, '용량','100g',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 10, '용량','200g',2000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 10, '용량','300g',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 10, '분쇄도','홀빈(분쇄안함)',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 10, '분쇄도','핸드드립',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 10, '분쇄도','커피메이커',2000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 10, '분쇄도','프레스기',3000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 11, '옵션선택1','블랜드500',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 11, '옵션선택1','브라질500(+100)',100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 11, '옵션선택1','수프리모500(+300)',300,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 11, '선물상자','추가안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 11, '선물상자','1구상자x3개입(+1,500원)',1500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 11, '선물상자','3구상자x1개입(+1,500원)',1500,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 12, '브라우니 한판','브라우니 반-판!(8조각)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 12, '브라우니 한판','브라우니 한-판!(16조각)',10000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 13, '옵션1','르뱅초코쿠키',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 13, '옵션1','르뱅초코쿠키8개(상자포함) (+22,000원)',22000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 14, '용기 추가선택','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 14, '용기 추가선택','유리병',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 14, '용기 추가선택','지퍼백',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 14, '스티커 추가','합격 스티커(+100원)',100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 14, '스티커 추가','감사 스티커(+100원)',100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 14, '선물비닐/쇼핑백','선물비닐(+100원)',100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 14, '선물비닐/쇼핑백','1병 전용 쇼핑백(+500원)',500,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 15, '포장','기본',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 15, '포장','5구 선물포장(+7,000원)',7000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 15, '포장','10구 선물포장(+14,500원)',14500,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 16, '아이싱선택','아이싱 기본(충분해요)1개',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 16, '아이싱선택','아이싱 듬뿍(아주 달아요)1개',7000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 16, '아이싱선택','아이싱기본6개 선물포장(+14,500원)',14500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 16, '케이크토퍼+초','안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 16, '케이크토퍼+초','생일토퍼+초5(+2,000원)',2000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 17, '맛선택','3개 랜덤마카롱(+3,700원)',3700,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 17, '맛선택','6개 랜덤마카롱(+9,100원)',9100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 17, '맛선택','12개 랜덤마카롱(+19,900원)',19900,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 17, '포장법선택','기본낱개포장',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 17, '포장법선택','3구 상자(+500원)',500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 17, '포장법선택','6구 상자(+700원)',700,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 18, '맛선택','일곱가지미니쌀마들렌15+3개',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 18, '맛선택','흑임자 미니쌀마들렌15+3개',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 18, '맛선택','초코 미니쌀마들렌15+3개',3000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 19, '생초콜릿','하트밀크',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 19, '포장선택','기본파우치',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 19, '포장선택','리본쇼핑백+더스트백(+1,500원)',1500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 19, '포장선택','리본핑크상자(1상자최대5봉지담음)(+3,000원)',3000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 20, '수량','고구마빵5+감자빵5(상자)(+19,800원)',19800,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 20, '수량','고구마6개(봉투포장)(+11,000원)',11000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 20, '수량','감자6개(봉투포장)(+11,000원)',11000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 20, '포장','박스포장',2000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 20, '포장','보자기포장',5000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 21, '갯수선택','호두과자 20개입(+5,000원)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 21, '갯수선택','호두과자 40개입(+10,000원)',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 21, '갯수선택','호두과자 60개입(+15,000원)',15000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 21, '갯수선택','호두과자 80개입(+20,000원)',20000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 21, '갯수선택','호두과자 100개입(+25,000원)',25000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 22, '원두선택','콜롬비아 후일라 수프리모(+2,500원)',2500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 22, '원두선택','에티오피아 시다모G4(2,500원)',2500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 22, '분쇄도','핸드드립/커피메이커용',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 22, '분쇄도','더치/콜드브루용',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 22, '커피용품','칼리타여과지-백색(1~2인) 1000매(+3,400원)',3400,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 23, '[구성]kg선택','3kg 17-20과',7000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 23, '[구성]kg선택','5kg 29-32과(+9,100원)',9100,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 24, '모듬유럽채소','모듬유럽채소 400g',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 24, '모듬유럽채소','모듬유럽채소 1kg(+5,000원)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 24, '모듬유럽채소','모듬유럽채소 2kg(+10,000원)',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 24, '콜라비','콜라비500-750g(+1,500원)',1500,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 25, '휴대용 부직포백','기본 아이스팩 포장',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 25, '휴대용 부직포백','휴대용부직포주머니(+1,000원)',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 25, '휴대용 부직포백','휴대용부직포주머니+미니아이스팩(+3,000원)',3000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 26, '맛선택','햇감자(담백짭쪼름)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 26, '맛선택','자색감자(담백달달함)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 26, '감자세트','햇감자4개+자색감자4개(+16,500원)',16500,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 27, '숙성생연어','200g(1개)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 27, '숙성생연어','200g(2개)(+10,000원)',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 27, '숙성생연어','200g(3개)(+20,000원)',20000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 27, '양파,무순','1개(+2,000원)',2000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 27, '양파,무순','2개(+4,000원)',4000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 27, '양파,무순','3개(+6,000원)',6000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 28, 'kg선택','3kg(+5,000원)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 28, 'kg선택','5kg(+10,000원)',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 28, 'kg선택','7kg(+15,000원)',15000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 29, '옵션','이유식150g(+9,000원)',9000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 29, '옵션','이유식300g(+18,000원)',18000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 29, '옵션','구이용150g(+9,000원)',9000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 29, '옵션','구이용300g(+18,000원)',18000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 30, '꿀고구마 무게선택','미니사이즈3kg(+5,000원)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 30, '꿀고구마 무게선택','미니사이즈5kg(+10,000원)',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 30, '꿀고구마 무게선택','요구르트사이즈3kg(+5,000원)',5000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 31, '토마토크기/무게','2.5kg_소과',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 31, '토마토크기/무게','5kg_소과',12000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 31, '토마토크기/무게','2.5kg_중과',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 31, '토마토크기/무게','5kg_중과',12000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 32, '사이즈/냉매추가','150ml(미니병)',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 32, '사이즈/냉매추가','500ml(중간병)',6000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 32, '사이즈/냉매추가','1000ml(큰병)',9000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 34, '마늘쫑 장아찌 용량','마늘쫑 장아찌 300g',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 34, '마늘쫑 장아찌 용량','마늘쫑 장아찌 대용량 1kg(+12,000원)',12000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 35, '배송안내','주문 후 발송까지 5~7일 소요됩니다.',0,0);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 36, '배송안내','주문 후 발송까지 5~7일 소요됩니다.',0,0);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 37, '배송안내','주문 후 발송까지 5~7일 소요됩니다.',0,0);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 38, '배송안내','주문 후 발송까지 5~7일 소요됩니다.',0,0);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 39, '용량선택','300g',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 39, '용량선택','500g(+3,000원)',3000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 40, '선물포장','순살게장 150g 세트',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 40, '선물포장','순살게장 250g 세트(+10,000원)',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 40, '선물포장','순살게장 250g 세트+선물포장(+13,000원)',13000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 41, '용량선택','240g',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 41, '용량선택','500g(+10,000원)',10000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 42, '중량선택','양념꼬막무침 200g',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 42, '중량선택','양념꼬막무침 400g(+7,500원)',7500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 42, '중량선택','불꼬막무침 400g(+7,500원)',7500,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 42, '꼬막 비빔면 추가','생소면+비빔소스+참기름(+3,000원)',3000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 42, '꼬막 비빔면 추가','선택안함',0,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 43, '중량선택','150g',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 43, '중량선택','250g(+4,000원)',4000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 44, '선물포장','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 44, '선물포장','1구-1개(+1,000원)',1000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 45, '실크겹보자기선택','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 45, '실크겹보자기선택','겹보자기&노리개(+10,000원)',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 45, '배송확인','2/15일부터 순차발송됩니다.',0,0);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 46, '선물포장','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 46, '선물포장','1구(+1,000원)',1000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 47, 'NULL','NULL',0,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 48, '선물상자','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 48, '선물상자','1구(+1,000원)',1000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 49, '수량선택','1개',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 49, '수량선택','2개(+10,000원)',10000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 49, '선물상자','1구-1개(+1,000원)',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 49, '선물상자','1구-2개(+2,000원)',2000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 50, '선물포장','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 50, '선물포장','1구-1개(+1,000원)',1000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 51, 'NULL','NULL',0,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 52, '선물포장','선택안함',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 52, '선물포장','1구(+1,000원)',0,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 53, '상품선택','1병',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 53, '상품선택','2+1=3병(+5,400원)',5400,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 54, '구성','1.술취한원숭이4병',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 54, '구성','2.술취한원숭이선물포장2세트(총4병)(+6,000원)',6000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 54, '술샘전용잔(아코록)','추가없음',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 54, '술샘전용잔(아코록)','2개(+14,000원)',14000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 54, '술샘전용잔(아코록)','4개(+26,000원)',26000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 55, '옵션선택','1.감사1병',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 55, '옵션선택','2.감사두병선물세트(375*2)(+18,000원)',18000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 55, '옵션선택','3.감사+감사블루 선물세트(+15,000원)',15000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 56, '꿀샘16','꿀샘16 375ml 1병(소박스x)',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 56, '꿀샘16','꿀샘16 375ml 1병(소박스o)(+1,000원)',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 56, '꿀샘16','꿀샘16 두병선물세트(375*2)(+17,000원)',17000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 57, '수량','술샘16 1병(소박스x 단병)',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 57, '수량','술샘16 1병(소박스추가)(+1,000원)',1000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 57, '수량','술샘16 두병선물세트(375mlx2)(+12,000원)',12000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 57, '수량','술샘16/19선물세트(375mlx2)(+13,000원)',13000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 57, '수량','술샘16/꿀샘16선물세트(375*2)(+17,000원)',17000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 58, '수량선택','1.미르40',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 58, '수량선택','2.미르40선물세트(미르40*2)(+26,000원)',26000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 58, '전용잔','미르전용잔1개(+5,000원)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 58, '전용잔','미르전용잔2개(+10,000원)',10000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 59, '수량선택','1.미르25',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 59, '수량선택','2.미르25선물박스포장(미르25*2)(+21,000원)',21000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 59, '수량선택','3.미르(25+40)혼합선물포장(+26,000원)',26000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 59, '전용잔','미르전용잔1개(+5,000개)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 59, '전용잔','미르전용잔2개(+10,000원)',10000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 60, '미르 미니어쳐 세트','미르 3종 미니어쳐 선물세트 1set',0,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 60, '미르 전용잔','미르전용잔1개(+5,000원)',5000,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 60, '미르 전용잔','미르전용잔2개(+10,000원)',10000,100);

INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 61, '스티커 추가','합격 스티커(+100원)',100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 61, '스티커 추가','감사 스티커(+100원)',100,100);
INSERT INTO STOCK(SNO, PNO, OTITLE, OCONTENT, OADDPRICE, STOCK) VALUES (STOCK_SEQ.NEXTVAL, 61, '선물비닐/쇼핑백','선물비닐(+100원)',100,100);


-- order
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 1, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 2, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 3, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 4, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 5, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 6, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 7, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 8, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 9, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 10, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 11, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 12, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 13, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 14, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 15, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 16, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 17, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 18, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 19, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 20, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 21, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 22, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 23, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 24, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 25, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 26, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 27, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 28, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 29, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 30, 1, SYSDATE, '서울', '010-0000-0000', '카드', NULL, NULL );

INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 31, 1, SYSDATE, '서울', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 32, 1, SYSDATE, '경기', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 33, 1, SYSDATE, '인천', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 34, 1, SYSDATE, '경북', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 35, 1, SYSDATE, '경남', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 36, 1, SYSDATE, '전남', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 37, 1, SYSDATE, '전북', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 38, 1, SYSDATE, '대구', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 39, 1, SYSDATE, '서울', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 40, 1, SYSDATE, '울산', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 41, 1, SYSDATE, '부산', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 42, 1, SYSDATE, '광주', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 43, 1, SYSDATE, '인천', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 44, 1, SYSDATE, '경기', '010-0000-0001', '가상', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 45, 1, SYSDATE, '강원', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 46, 1, SYSDATE, '제주', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 47, 1, SYSDATE, '세종', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 48, 1, SYSDATE, '안양', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 49, 1, SYSDATE, '안산', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 50, 1, SYSDATE, '전남', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 51, 1, SYSDATE, '경북', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 52, 1, SYSDATE, '경남', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 53, 1, SYSDATE, '전북', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 54, 1, SYSDATE, '충남', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 55, 1, SYSDATE, '충북', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 56, 1, SYSDATE, '충북', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 57, 1, SYSDATE, '충남', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 58, 1, SYSDATE, '제주', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 59, 1, SYSDATE, '경기', '010-0000-0001', '카드', NULL, NULL );
INSERT INTO ORDERS
VALUES(ORDERS_SEQ.NEXTVAL, 1, 60, 1, SYSDATE, '서울', '010-0000-0001', '카드', NULL, NULL );

-- review
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 1, 1, 1, '최고의 커피.', '커피 너무 맛있어요!.', 'review_coffee.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 2, 2, 1, '캠핑필수품', '시원하고 목넘김이 좋아요. 친구들이랑 캠핑 가서 잘마셨습니다.', 'applecider.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 3, 3, 1, '몸이 가벼워졌어요', '이 식초를 매일 마셨더니 몸이 가벼워졌어요.', 'bineger.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 4, 4, 1, '고급 브랜드 못지 않은.', '국내산 홍차 중에선 이게 제일인거 같아요.', 'blacktea.png', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 5, 5, 1, '향기로운 커피', '포근한 커피향이 집안에 퍼져요!', 'coldbrew.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 6, 6, 1, '꽃차', '보기에도 좋고 맛은 훌륭하며 향은 취할 정도다.', 'flowertea.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 7, 7, 1, '식혜', '이렇게 뒷맛 안텁텁한 식헤는 처음이었어요.', 'sickhae.png', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 8, 8, 1, '딸기청', '한 숟가락 우유에 타 먹으면 아침이 든든해요.', 'strawberrycube.png', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 9, 9, 1, '딸기우유', '아침에 마시기 좋아요.', 'strawberrymilk.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 10, 10, 1, '커피', '이 집 커피가 제일 맛있어서 벌써 세번이나 주문했네요.', 'coffee2.png', 5, SYSDATE);
INSERT INTO REVIEW 
VALUES(REVIEW_SEQ.NEXTVAL, 11, 11, 1, '브라우니', '우리 집 앞 브라우니 가게와 견줄만한 곳은 이곳밖에 없다.', 'brownie.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 12, 12, 1, '초코쿠키', '이렇게 초콜릿을 크케 박아도 남는게 있나요?', 'chococookie.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 13, 13, 1, '쇼콜라', '꾸덕 찐득 입 안 가득 행복감', 'chocolate.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 14, 14, 1, '에그타르트', '제가 홍콩에 여행 가서 먹어봤던 에그타르트보다 농후해요.', 'eggtart.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 15, 15, 1, '레몬케이크', '커피 없이 케이크 하나 다 먹어보긴 처음이에요.', 'lemoncake.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 16, 16, 1, '뚱카롱', '프랑스인도 모르는 맛 ㅋㅋ', 'macaron.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 17, 17, 1, '마들렌', '한입 크기에 먹기 좋아서 커피 한 잔 마셨는데 다 먹어버렸어요.', 'madeleine.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 18, 18, 1, '별로에요.', '평범한 밀크초콜릿이네요', 'milkchocolate.jpg', 3, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 19, 19, 1, '감자빵', '감자빵이 뭔가 했더니 진짜 감자맛이 나네요? 신기하다.', 'potatoebread.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 20, 20, 1, '호두과자', '추억의 맛이 담기는 휴게소 호두과자만큼 맛있다.', 'walnutbread.png', 4, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 21, 21, 1, '사과', '세상에 뭔 사과가 제 머리만해요?', 'apple.png', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 22, 22, 1, '그런데', '유럽산을 가져오는데 어떻게 국내산보다 신선해요?', 'freshvegetable.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 23, 23, 1, '우유', '우유에서 버터향이 나요! 금방 질려요!', 'milk.png', 4, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 24, 24, 1, '감자빵', '감자빵을 만든 감자가 여기 감자인가요?', 'potatoe.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 25, 25, 1, '연어', '곰은 오늘도 나한테 연어를 뺏겼다.', 'salmon.png', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 26, 26, 1, '스테이크', '양념되어서 온 스테이크 치고 맛있는걸 먹어본 적이 없다.', 'steak.jpg', 3, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 27, 27, 1, '고구마', '리뷰 하나 고구마 한 입. 기분 좋아져서 점수 좋게 드립니다.', 'sweetpotatoe.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 28, 28, 1, '토마토', '이탈리안 토마토를 사용한 것보다 스프가 맛있게 되었다면 믿어지십니까?', 'tomatoe.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 29, 29, 1, '요거트', '달지 않고 맛있는 요거트입니다.', 'yogurt.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 30, 30, 1, '제목', '내용', 'apple.png', 5, SYSDATE);

INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 31, 31, 1, '이거 진짜 좋네요~', '자주 구매 해 먹는 반찬이에요', 'review31.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 32, 32, 1, '맛이야 말해 뭐합니까', '슴슴한 간에 봄동 단맛이 어우러지니 너무 맛있네요. 반찬통에 옮겨담다가 밥 한그릇 펄 뻔 했어요 ㅎㅎ ', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 33, 33, 1, '넘 맛있어요', '가족들도 맛있다고 잘 먹네요. 빨리 먹고 재구매 갑니다 ㅎㅎ', 'review33.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 34, 34, 1, '또 시켜먹을래요', '넘 맛있어요. 어젯밤 받아서 두끼식사 반찬하고 저녁 술안주로 동나가네요. 최고최고!', 'review34.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 35, 35, 1, '매콤달콤 맛있네요', '부드러우면서도 쫄깃하고 매콤하게 맛있어요~', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 36, 36, 1, '마늘 맛있어요', '너무 맛있네요. 짜지도 않고...', 'review36.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 37, 37, 1, '다먹구 다시 구매예정입니다.', '굿굿!', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 38, 38, 1, '맛있습니당', '자주 이용할래요~', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 39, 39, 1, '감사합니다~ 잘 먹었습니다~', '식사 할때 반찬으로 꺼내서먹을때마다 정말 맛있다는 말이 절로 나온다. 정말 맛있어요`', 'review39.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 40, 40, 1, '양념도 낙지도 맛있어요', '밥되기전에 접시에 덜어놓은거 다 먹었네요~^^', 'review40.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 41, 41, 1, '맛이 궁금해서 구매했습니다~', '겨울에 어울리는 맛입니다. 포장이 이뻐요', 'review41.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 42, 42, 1, '최고의 명절선물이였어요~^^', '선물하고 저도 먹으려고 주문했는데 클래식 제품중에서 정말 고급지고 최고인것 같아요~!!', 'review42.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 43, 43, 1, '시댁이랑 친정에 선물하려고 샀어요', '저도 한통 먹엇는데 달달하니 찐하고 맛있네요~', 'review43.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 44, 44, 1, '아주 맛있네요', '자주 손이가서 큰일입니다. 또 사야될 듯', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 45, 45, 1, '청 너무 맛있게 먹어서 친구에게도 선물했어요~', '친구가 선물 고맙다며 사진 찍어 보내줬는데 보니까 포장비가 아깝지 않습니다.', 'review45.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 46, 46, 1, '선물용으로 샀어요', ' 받는분이 너무 좋아하시네요', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 47, 47, 1, '왜 이제 만난거죠~ㅠ', '맛도 좋은데 푸짐한 서비스에 감동이였어요', 'review47.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 48, 48, 1, '자주 사먹어야겠어요', '제가 먹으려샀는데 아이도 잘먹었어요', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 49, 49, 1, '맛집인정', '동생들이 맛있다고 해요~^^ 감사합니다.', 'review49.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 50, 50, 1, '다른 작가분 소개로 먹게 되었는데', '정말 맛잇어요 ㅎㅎㅎ', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 51, 51, 1, '도수에 비해 맛이 정말 깔끔하네요!', '해물탕이랑 곁들여서 먹었는데 정말 잘 어울리더라구요~', 'review51.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 52, 52, 1, '그냥 존맛탱입니다..', '진짜 비온 뒤 숲의 향이에요.. 먹을수록 깔끔하고 짱입니다ㅠ', 'review52.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 53, 53, 1, '향과 맛이 더 선명해서 맛있어요!', '설 선물로 구매했는데 저도 맛보려고 두 병 구매해서 잘 마셨습니다!', 'review53.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 54, 54, 1, '아빠 선물로 구입했는데', '제가 거의 다 먹은 것 같아용ㅋㅋㅋ', 'review54.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 55, 55, 1, '향이 아주 좋아요~', '도수가 높지만 그렇게 강하지 않고 부드러워요', 'review55.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 56, 56, 1, '꼼꼼한 포장에 잘받았어요^^', '평도 좋고해서 맛 기대해 봅니당...', 'review56.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 57, 57, 1, '와~~ 정말 맛있어요~~', '일반 소주보다 훨씬 깔끔하고 살짝 달고 장난아닙이다. 정말 재구매 각입니다! ^^', 'review57.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 58, 58, 1, '선물용으로 두번째 구매입니다~^^', '가끔은 맛있게 도수높은 술이 생각날때가 있지요 특히 요즘같은 겨울엔요~^^', 'review58.jpg', 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 59, 59, 1, '꼼꼼하게 포장되어 왓어요', '꼼꼼한 포장에 좋은상품 정말 감사드립니다!', NULL, 5, SYSDATE);
INSERT INTO REVIEW
VALUES(REVIEW_SEQ.NEXTVAL, 60, 60, 1, '주문하자 마자 바로 도착해서 깜짝 놀랐어요', '지인분들께 선물할꺼라 고민 많이 하다가 주문했는데 좋은 선물 보내게 되어 감사하네요', 'review60.jpg', 5, SYSDATE);
