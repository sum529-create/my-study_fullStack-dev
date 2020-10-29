-- DUAL 테이블
-- DUMMY 칼럼에 'X'값만 가지고 있는 테이블
-- 오라클의 SELECT 문은 반드시 FROM절이 필요하므로 FROM DUAL을 통해서 테이블이 필요없는 쿼리를 완성한다.

-- *** 문자열 ***
-- 1. 대소문자 변환 함수
SELECT UPPER('apple') FROM DUAL;   -- APPLE(모두 대문자)
SELECT LOWER('APPLE') FROM DUAL;   -- APPLE(모두 소문자)
SELECT INITCAP('APPLE') FROM DUAL; -- APPLE(첫글자만 대문자, 나머지는 소문자)

SELECT LAST_NAME FROM EMPLOYEES;

-- 2. 길이 구하기(글자수), 크기 구하기(바이트 수)
SELECT LENGTH('APPLE')FROM DUAL;    -- 5 (글자수)
SELECT LENGTH('사과') FROM DUAL;     -- 2 (글자수)
SELECT LENGTHB('APPLE') FROM DUAL;   -- 5 (바이트수)        -- 영문은 1바이트
SELECT LENGTHB('사과') FROM DUAL;     -- 4 OR 6 (바이트 수) -- 한글은 인코딩에 따라 다르다. (MS949 = CP949 : 2바이트, UTF-8 : 3바이트)

-- 3. 문자열 연결하기
-- 1) 연산자 : ||
-- 2) 함수 : CONCAT(인수1, 인수2)  (CONCATENATE)  -- CONCAT함수의 인수는 2개만 가능함
SELECT CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS FULL_NAME FROM EMPLOYEES;

-- 4. 문자열 분리하기
-- 시작위치는 1부터 시작한다.
-- 마이너스 위치를 지원한다.
-- A P P L E
-- 1 2 3 4 5
-- 5 4 3 2 1 
-- SUBSTR(문자열, 시작위치) : 시작위치부터 끝까지 분리하기
-- SUBSTR(문자열, 시작위치, 글자수) : 시작위치부터 끝까지 글자수만큼 분리하기
SELECT SUBSTR('010-1234-5678', 1, 3) FROM DUAL;   -- 010 (1번째 글자부터 3글자)
SELECT SUBSTR('010-1234-5678', -4) FROM DUAL;   -- 5678 (뒤 4글자)

-- *** 숫자 ***
-- 1.


-- ***  ***
-- 1. 