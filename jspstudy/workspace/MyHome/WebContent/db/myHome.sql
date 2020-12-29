-- 시퀀스
DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE MEMBER_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCYCLE NOCACHE;
DROP SEQUENCE GUEST_SEQ;
CREATE SEQUENCE GUEST_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCYCLE NOCACHE;
DROP SEQUENCE BBS_SEQ;
CREATE SEQUENCE BBS_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCYCLE NOCACHE;
DROP SEQUENCE REPLY_SEQ;
CREATE SEQUENCE REPLY_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 999999 NOCYCLE NOCACHE;

-- 테이블
DROP TABLE MEMBER;
CREATE TABLE MEMBER
(
	MNO NUMBER PRIMARY KEY,
	MID VARCHAR2(30) NOT NULL UNIQUE,
	MPW VARCHAR2(30) NOT NULL,
	MNAME VARCHAR2(30),
	MEMAIL VARCHAR2(50) NOT NULL UNIQUE,
	MPHONE VARCHAR2(20),
	MADDRESS VARCHAR2(100),
	MREGDATE DATE
);

DROP TABLE GUEST;
CREATE TABLE GUEST
(
	GNO NUMBER PRIMARY KEY,
	GWRITER VARCHAR2(100) NOT NULL,
	GTITLE VARCHAR2(1000) NOT NULL,
	GCONTENT VARCHAR2(4000),
	GPW VARCHAR2(20) NOT NULL,
	GFILENAME VARCHAR2(300),
	GPOSTDATE DATE
);

DROP TABLE REPLY;
DROP TABLE BBS;

CREATE TABLE BBS
(
	BBS_NO NUMBER PRIMARY KEY,
	BBS_WRITER VARCHAR2(100) NOT NULL,
	BBS_TITLE VARCHAR2(1000) NOT NULL,
	BBS_CONTENT VARCHAR2(4000),
	BBS_PW VARCHAR2(20) NOT NULL,
	BBS_HIT NUMBER,
	BBS_IP VARCHAR2(20),
	BBS_DATE DATE
);

INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '가길동', '질문입니다1', '이게뭔가요1?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '나길동', '질문입니다2', '이게뭔가요2?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '다길동', '질문입니다3', '이게뭔가요3?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '라길동', '질문입니다4', '이게뭔가요4?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '마길동', '질문입니다5', '이게뭔가요5?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '바길동', '질문입니다6', '이게뭔가요6?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '사길동', '질문입니다7', '이게뭔가요7?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '아길동', '질문입니다8', '이게뭔가요8?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '자길동', '질문입니다9', '이게뭔가요9?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '차길동', '질문입니다10', '이게뭔가요10?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '카길동', '질문입니다11', '이게뭔가요11?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '타길동', '질문입니다12', '이게뭔가요12?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '파길동', '질문입니다13', '이게뭔가요13?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '하길동', '질문입니다14', '이게뭔가요14?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '고길동', '질문입니다15', '이게뭔가요15?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '노길동', '질문입니다16', '이게뭔가요16?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '도길동', '질문입니다17', '이게뭔가요17?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '로길동', '질문입니다18', '이게뭔가요18?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '모길동', '질문입니다19', '이게뭔가요19?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '보길동', '질문입니다20', '이게뭔가요20?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '소길동', '질문입니다21', '이게뭔가요21?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '오길동', '질문입니다22', '이게뭔가요22?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '자길동', '질문입니다23', '이게뭔가요23?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '차길동', '질문입니다24', '이게뭔가요24?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '코길동', '질문입니다25', '이게뭔가요25?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '토길동', '질문입니다26', '이게뭔가요26?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '포길동', '질문입니다27', '이게뭔가요27?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '호길동', '질문입니다28', '이게뭔가요28?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '코코', '질문입니다29', '이게뭔가요29?', '1111', 0, '127.0.0.1', SYSDATE);
INSERT INTO BBS VALUES(BBS_SEQ.NEXTVAL, '슘', '질문입니다30', '이게뭔가요30?', '1111', 0, '127.0.0.1', SYSDATE);


CREATE TABLE REPLY
(
	RNO NUMBER PRIMARY KEY,
	RWRITER VARCHAR2(100) NOT NULL,
	RCONTENT VARCHAR2(4000),
	RPW VARCHAR2(20) NOT NULL,
	RIP VARCHAR2(20),
	RDATE DATE,
	BBS_NO NUMBER REFERENCES BBS(BBS_NO)
);
-- reply는 댓글용으로 몇번째 페이지에 있는 댓글인지 알기위해서 bbs의 숫자를 참조해야한다.

INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 'admin', '1111', '관리자', 'admin@myhome.com', '010-0000-0000', 'seoul', SYSDATE);

SELECT * FROM MEMBER;


