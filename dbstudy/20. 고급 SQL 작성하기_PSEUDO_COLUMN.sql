-- 시퀀스와 테이블
DROP TABLE BOARD;
DROP SEQUENCE BOARD_SEQ;

CREATE TABLE BOARD(
  BOARD_NO NUMBER PRIMARY KEY,
  BOARD_TITLE VARCHAR2(2000) NOT NULL,
  BOARD_CONTENT VARCHAR2(4000)
);

CREATE SEQUENCE BOARD_SEQ
INCREMENT BY 1 -- 1씩 증가한다./
START WITH 1    -- 번호는 1부터 시작한다.
NOMAXVALUE      -- 최대번호는 없다.
NOMINVALUE      -- 최소번호는 없다.
NOCYCLE         -- 번호는 순환되지 않는다.
NOCACHE;        -- CACHE를 사용하지 않는다.

INSERT INTO BOARD VALUES (BOARD_SEQ.NEXTVAL, '공지사항', '오늘 재평가가 있습니다.');
INSERT INTO BOARD VALUES (BOARD_SEQ.NEXTVAL, '알림', '내일은 본평가가 있습니다.');
INSERT INTO BOARD VALUES (BOARD_SEQ.NEXTVAL, '안녕하세요', '잘부탁드립니다.');
INSERT INTO BOARD VALUES (BOARD_SEQ.NEXTVAL, '등업해주세요(냉무)', 'NULL');
INSERT INTO BOARD VALUES (BOARD_SEQ.NEXTVAL, '알려주세요', '지금이 몇 시인가요?');

-- ROWNUM
-- 1이 포함된 숫자는 조회가 가능하다.
-- 실제 칼럼으로 바꿔서 원하는 값이나 범위를 사용할 수 있다.

SELECT * FROM BOARD WHERE ROWNUM = 1;                                                    -- 가능하다.
SELECT * FROM BOARD WHERE ROWNUM = 2;   -- ROWNUM은 1을 포함한 범위만 조회 가능함            -- 불가능하다.
SELECT * FROM BOARD WHERE ROWNUM < 3;   -- 이건 가능. ROWNUM을 별명을 주어 사용하는 일이 많다. -- 가능하다.
SELECT * FROM BOARD WHERE ROWNUM > 1;                                                    -- 불가능하다.

-- 1. 게시글의 제목을 가나다 역순으로 정렬하고 첫 번째 게시글을 조회하시오.

-- 1) 정상적으로 처리 되지 못함
SELECT * FROM BOARD WHERE ROWNUM = 1 ORDER BY BOARD_TITLE;  -- ORDER BY절은 항상 마지막에 처리된다. 먼저 정렬하고 싶으면 SUB QUERY를 활용한다.

-- 2) 정상적으로 처리하는 방법
SELECT * FROM (SELECT * FROM BOARD ORDER BY BOARD_TITLE DESC)  WHERE ROWNUM = 1;


-- 2. 게시글의 제목을 가나다 역순으로 정렬하고 두 번째 게시글을 조회하시오.
SELECT * FROM 
    (SELECT ROWNUM AS RN, BOARD_NO, BOARD_TITLE, BOARD_CONTENT FROM 
    (SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT FROM BOARD ORDER BY BOARD_TITLE DESC))  
    WHERE RN = 2;
-- 이외의 범위를 사용하고 싶으면 ROWNUM에 별명을 주고 사용한다.
-- ROWNUM 별명은 FROM절 SELECT에서 사용한다. FROM절이 우선순위기 때문에
-- SEQUENCE가 웹에서 PAGE NUM기능으로 사용될 수 있다. 행번호를 끊어서 조회할 시 사용한다. -> JAVA에서 FOR문
