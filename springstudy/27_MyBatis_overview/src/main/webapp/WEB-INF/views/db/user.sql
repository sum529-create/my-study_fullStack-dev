DROP SEQUENCE USERS_SEQ;
CREATE SEQUENCE USERS_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

DROP TABLE USERS;
CREATE TABLE USERS
(
	NO NUMBER PRIMARY KEY,
	NAME VARCHAR2(50),
	PHONE VARCHAR2(50)
);

INSERT INTO USERS VALUES(USERS_SEQ.NEXTVAL, '이정숙', '010-1111-1111');
INSERT INTO USERS VALUES(USERS_SEQ.NEXTVAL, '이정희', '010-2222-2222');
INSERT INTO USERS VALUES(USERS_SEQ.NEXTVAL, '이정호', '010-3333-3333');