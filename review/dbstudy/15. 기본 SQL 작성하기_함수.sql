-- DUAL 테이블
-- DUMMY 칼럼에 'X'값만 가지고 있는 테이블
-- 오라클의 SELECT 문은 반드시 FROM절이 필요하므로 FROM DUAL을 통해서 테이블이 필요없는 쿼리를 완성한다.

-- *** 문자열 ***
-- 1. 대소문자 변환 함수 UPPER | LOWER | INITCAP
SELECT UPPER('apple') FROM DUAL;   -- APPLE(모두 대문자)
SELECT LOWER('APPLE') FROM DUAL;   -- APPLE(모두 소문자)
SELECT INITCAP('APPLE') FROM DUAL; -- APPLE(첫글자만 대문자, 나머지는 소문자)


-- 2. 길이 구하기(글자수), 크기 구하기(바이트 수) LENGTH | LENGTHB
SELECT LENGTH('APPLE')FROM DUAL;    -- 5 (글자수)
SELECT LENGTH('사과') FROM DUAL;     -- 2 (글자수)
SELECT LENGTHB('APPLE') FROM DUAL;   -- 5 (바이트수)        -- 영문은 1바이트
SELECT LENGTHB('사과') FROM DUAL;     -- 4 OR 6 (바이트 수) -- 한글은 인코딩에 따라 다르다. (MS949 = CP949 : 2바이트, UTF-8 : 3바이트)

-- 3. 문자열 연결하기 CONCAT, ||
-- 1) 연산자 : ||
-- 2) 함수 : CONCAT(인수1, 인수2)  (CONCATENATE)  -- CONCAT함수의 인수는 2개만 가능함
SELECT CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS FULL_NAME FROM EMPLOYEES;

-- 4. 문자열 분리하기 SUBSTR
-- 시작위치는 1부터 시작한다.
-- 마이너스 위치를 지원한다.
-- A P P L E
-- 1 2 3 4 5
-- 5 4 3 2 1 
-- SUBSTR(문자열, 시작위치) : 시작위치부터 끝까지 분리하기
-- SUBSTR(문자열, 시작위치, 글자수) : 시작위치부터 끝까지 글자수만큼 분리하기
SELECT SUBSTR('010-1234-5678', 1, 3) FROM DUAL;   -- 010 (1번째 글자부터 3글자)
SELECT SUBSTR('010-1234-5678', -4) FROM DUAL;   -- 5678 (뒤 4글자)

-- 5. 특정 문자열 위치 변환하기 INSTR
-- 1) INSTR(검색대상, 찾을문자열)
-- 2) INSTR(검색대상, 찾을문자열, 시작위치, N번째)
SELECT INSTR('SQLSESSION', 'S') FROM DUAL;  -- 1 ('S'가 나타난 첫 번째 위치)
SELECT INSTR('SQLSESSION', 'A') FROM DUAL;  -- 0 (찾고자하는 값이 없을 경우 0을 반환)
-- S    Q   L   S   S   E   S   I   O   N
-- 1    2   3   4   5   6   7   8   9   10
SELECT INSTR('SQLSESSION', 'S', 1, 2) FROM DUAL;    -- 4 (1번째 위치부터 검색하고, 2번째 'S'를 찾아 위치를 반환)
SELECT INSTR('SQLSESSION', 'S', 1, 3) FROM DUAL;    -- 6
SELECT INSTR('SQLSESSION', 'S', 1, 4) FROM DUAL;    -- 7

-- 6. 채우기 LPAD | RPAD
-- 1) LPAD(채우기대상, 길이, 채울문자) : 채우기대상의 전체 길이가 지정된 폭만큼 왼쪽이 채울문자로 채워짐
-- 2) RPAD(채우기대상, 길이, 채울문자) : 채우기대상의 전체 길이가 지정된 폭만큼 오른쪽이 채울문자로 채워짐
SELECT LPAD('APPLE', 10 , '*') FROM DUAL;
SELECT RPAD('APPLE', 10 , '*') FROM DUAL;

-- 7. 좌우 불필요한 문자 제거하기 TRIM | LTRIM | RTRIM
-- 1) LTRIM(대상, 제거할 문자열) : 왼쪽에서 제거할 문자열을 제거, 제거할 문자열 생각하면 공백
-- 2) RTRIM(대상, 제거할 문자열) : 오른쪽에서 제거할 문자열을 제거, 제거할 문자열 생각하면 공백
-- 3) TRIM(대상, 제거할 문자열)  : 양쪽에서 제거할 문자열을 제거, 제거할 문자열 생각하면 공백
SELECT LENGTH(LTRIM('  APPLE')) FROM DUAL;  -- 5 (공백 제거하면 APPLE만 남은, APPLE의 글자수는 5)
SELECT LENGTH(RTRIM('APPLE  ')) FROM DUAL;  -- 5
SELECT LENGTH(TRIM('  APPLE  ')) FROM DUAL;

-- 문제1. 아이디 찾기 결과 만들기
-- admin : ad********
-- myid : my********
-- yourid : yo********
SELECT RPAD(SUBSTR(LAST_NAME, 1, 2), 10, '*') FROM EMPLOYEES;

-- 문제2. 성과 이름 분리하기
-- james dean
-- 홍 길동
-- 1) 성 (james, 홍) 출력하기
SELECT SUBSTR('james dean', 1, INSTR('james dean', ' ')-1), SUBSTR('홍길동', 1, 1) FROM DUAL;

-- 2) 이름 (dean, 길동) 출력하기
SELECT SUBSTR('james dean', INSTR('james dean', ' ')+1), SUBSTR('홍길동', -2) FROM DUAL;

-- *** 숫자 ***
-- 1. 반올림 ROUND
SELECT ROUND(123.4567, 2) FROM DUAL;    -- 123.46 (소수 2자리로 반올림)
SELECT ROUND(123.4567, 1) FROM DUAL;    -- 123.5 (소수 1자리로 반올림)
SELECT ROUND(123.4567) FROM DUAL;       -- 123 (정수로 반올림)
SELECT ROUND(123.4567, -1) FROM DUAL;    -- 120 (1의 자리에서 반올림)
SELECT ROUND(123.4567, -2) FROM DUAL;    -- 100 (10의 자리에서 반올림)

-- 2. 절사 (자르기) TRUNC
SELECT TRUNC(123.4567, 2) FROM DUAL;    -- 123.45 (소수 2자리로 지움)
SELECT TRUNC(123.4567, 1) FROM DUAL;    -- 123.4  (소수 1자리로 지움)
SELECT TRUNC(123.4567) FROM DUAL;       -- 123    (정수로 지움)
SELECT TRUNC(123.4567, -1) FROM DUAL;    -- 120    (일의 자리에서 지움)
SELECT TRUNC(123.4567, -2) FROM DUAL;    -- 100    (십의 자리에서 지움)

-- 3. 올림 CEIL
-- 123.4567 -> (*100) -> 12345.67 -> (CEIL) -> 12346 -> (1/100) --> 123.46
-- 123.4567 -> (*10) -> 1234.567 -> (CEIL) -> 1235 -> (1/10) --> 123.5
SELECT CEIL(123.4567 * 100) / 100 FROM DUAL; -- 123.46 (소수 2자리로 올림)
SELECT CEIL(123.4567 * 10) / 10 FROM DUAL; -- 123.5 (소수 1자리로 올림)
SELECT CEIL(123.4567*1) FROM DUAL;
SELECT CEIL(123.4567*0.1)*10 FROM DUAL;
SELECT CEIL(123.4567*0.01)*100 FROM DUAL;

-- 4. 내림 FLOOR
-- FLOOR 함수는 CEIL함수와 마찬가지로 처리한다.
SELECT FLOOR(123.4567 * 100) / 100 FROM DUAL;       -- 123.45 (소수 2자리로 내림)
SELECT FLOOR(123.4567 * 10) / 10 FROM DUAL;         -- 123.4 (소수 1자리로 내림)
SELECT FLOOR(123.4567) FROM DUAL;                   -- 123.4 (정수로 내림)
SELECT FLOOR(123.4567 / 10) * 10 FROM DUAL;         -- 120 (일의 자리에서 내림)
SELECT FLOOR(123.4567 / 100) * 100 FROM DUAL;       -- 100 (십의 자리에서 내림)

-- 절사와 내림의 차이는 음수에서 발생한다.
-- 절사는 그대로 자르고, 내림은 작은 수로 바꾼다.
SELECT TRUNC(-1.5) FROM DUAL;   -- -1 (.5를 잘라 버림)
SELECT FLOOR(-1.5) FROM DUAL;   -- -2 (-1.5보다 작은 정수로 변환)

-- 5. 집계 함수
-- 1) SUM(칼럼) : 칼럼의 합계, SUM(칼럼1, 칼럼2)과 같은 방식은 지원되지 않는다. SUM(칼럼1) + SUM(칼럼2)와 같이 처리한다.
-- 2) AVG(칼럼) : 칼럼의 평균
-- 3) MAX(칼럼) : 칼럼의 최대값
-- 4) MIN(칼럼) : 칼럼의 최소값
-- 5) COUNT(칼럼) : 칼럼의 데이터 개수 (NULL 제외)
--    COUNT(*) : 레코드(행, ROW)의 갯수


-- *** 날짜 ***
-- 1. 현재 날짜 반환
SELECT SYSDATE FROM DUAL;

-- 2. 날짜는 숫자처럼 연산이 가능하다.
-- 1일 : 1
-- 12시간 : 0.5
SELECT SYSDATE + 2 FROM DUAL;       -- 2일 후
SELECT SYSDATE + 0.5 FROM DUAL;     -- 12시간 후

-- 3. 개월 연산은 함수로 처리한다.
SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;    -- 3개월 후
SELECT ADD_MONTHS(SYSDATE, -3) FROM DUAL;   -- 3개월 전

-- 4. 개월 수 차이
SELECT MONTHS_BETWEEN(SYSDATE, SYSDATE - 180) FROM DUAL;


-- *** 타입 변환 ***
-- 1. 문자열 변환 : TO_CHAR
SELECT TO_CHAR(123) FROM DUAL;  -- '123' (문자열 형식의 123)
SELECT TO_CHAR(123, '999999') FROM DUAL;    -- '   123' (9 하나당 공백 하나)
SELECT TO_CHAR(123, '000000') FROM DUAL;    -- '000123' (0 하나당 0 하나)
SELECT TO_CHAR(123, '99') FROM DUAL;        -- '###' 잘못된 값 (값보다 9가 부족하면 오류)
SELECT TO_CHAR(1234, '9,999') FROM DUAL;    -- '1,234'
SELECT TO_CHAR(1234, '9.999.99') FROM DUAL; -- '1,234.00'
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD DAY HH:MI:SS') FROM DUAL;

-- 2. 숫자로 변환
SELECT TO_NUMBER('100') FROM DUAL;  -- 100 (숫자 100)

-- 참고. 숫자와 문자열의 비교
-- 100 = '100'
-- 자동으로 숫자로 변환해서 비교를 진행한다.
-- 100 = TO_NUMBER('100')로 변환된 뒤에 비교한다.


-- 3. 날짜로 변환
SELECT TO_DATE('20/10/05', 'YY/MM/DD') FROM DUAL;   -- 2020년 10월 05일
SELECT TO_DATE('20/10/05', 'YY/DD/MM') FROM DUAL;   -- 2020년 05월 10일
SELECT TO_DATE('140825', 'YYMMDD') FROM DUAL;       -- 2014년 08월 25일
SELECT TO_DATE('14-08-25', 'YY-MM-DD') FROM DUAL;   -- 2014년 08월 25일

SELECT TO_DATE(SYSDATE, 'YYYY-MM-DD') FROM DUAL;   -- 20/10/30    날짜를 'YYYY-MM-DD'과 같은 형식으로 바꾸는 용도가 아니다.
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;   -- 2020-10-30  날짜의 형식을 변경해서 표시하는 함수는 TO_CHAR 함수이다.

-- 올해 며칠이 지났는가?
-- 오늘 -- 2020년 01월 01일
SELECT SYSDATE - '20/01/01' FROM DUAL;      -- 날짜 - 문자열은 연산이 안 된다.
SELECT SYSDATE - TO_DATE('20/01/01', 'YY/MM/DD') FROM DUAL;

/*
날짜를 문자열로 저장하는 예시
CREATE TABLE ORDERS(
    ORDER_DATE VARCHAR2(30)
);

INSERT INTO ORDERS VALUES (TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
SELELCT ORDER_DATE FROM ORDERS;
*/

