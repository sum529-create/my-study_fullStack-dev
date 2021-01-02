-- 26. 연봉(salary) 총액과 연봉(salary) 평균을 조회한다.
SELECT SUM(SALARY), AVG(SALARY) FROM EMPLOYEES;

-- 27. 최대연봉(salary)과 최소연봉의 차이를 조회한다.
SELECT MAX(SALARY)-MIN(SALARY) FROM EMPLOYEES;

-- 28. 직업(job_id) 이 ST_CLERK 인 사원들의 전체 수를 조회한다.
SELECT COUNT(*) FROM EMPLOYEES WHERE JOB_ID = 'ST_CLERK';

-- 29. 매니저(manager_id)로 근무하는 사원들의 전체 수를 조회한다.
SELECT COUNT(DISTINCT MANAGER_ID) FROM EMPLOYEES;

-- 30. 회사 내에 총 몇 개의 부서가 있는지 조회한다.
SELECT COUNT(DISTINCT DEPARTMENT_ID) FROM EMPLOYEES;

-- 그룹화 연습

-- << departments 테이블 >>

-- 31. 같은 지역(location_id) 끼리 모아서 조회한다.
SELECT LOCATION_ID FROM DEPARTMENTS GROUP BY LOCATION_ID;

-- 32. 같은 지역(location_id) 끼리 모아서 각 지역(location_id) 마다 총 몇 개의 부서가 있는지 개수를 함께 조회한다.
SELECT COUNT(LOCATION_ID) FROM DEPARTMENTS GROUP BY LOCATION_ID;

-- 33. 같은 지역(location_id) 끼리 모아서 해당 지역(location_id) 에 어떤 부서(department_name) 가 있는지 조회한다.
SELECT LOCATION_ID, DEPARTMENT_NAME FROM DEPARTMENTS GROUP BY LOCATION_ID, DEPARTMENT_NAME;

-- << employees 테이블 >>

-- 34. 각 부서(department_id)별로 그룹화하여 department_id 와 부서별 사원의 수를 출력한다.
SELECT DEPARTMENT_ID, COUNT(*) AS 사원수 FROM EMPLOYEES WHERE DEPARTMENT_ID IS NOT NULL GROUP BY DEPARTMENT_ID;

-- 35. 부서(department_id)별로 집계하여 department_id 와 급여평균을 department_id 순으로 오름차순 정렬해서 출력한다.
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID ASC;

-- 36. 동일한 직업(job_id)을 가진 사원들의 job_id 와 인원수와 급여평균을 급여평균의 오름차순 정렬하여 출력한다.
SELECT JOB_ID, COUNT(*) AS 사원수 , AVG(SALARY) AS 급여평균 FROM EMPLOYEES GROUP BY JOB_ID, SALARY ORDER BY AVG(SALARY) ASC;

-- 37. 직업(job_id)이 SH_CLERK 인 직원들의 인원수와 최대급여 및 최소급여를 출력한다.
SELECT COUNT(*) AS 인원수, MAX(SALARY), MIN(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'SH_CLERK' GROUP BY JOB_ID;

-- 38. 근무중인 사원수가 5명 이상인 부서의 department_id 와 해당 부서의 사원수를 department_id 의 오름차순으로 정렬하여 출력한다.
SELECT DEPARTMENT_ID, COUNT(*) AS 사원수 FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(*) >= 5 ORDER BY DEPARTMENT_ID ASC;

-- 39. 평균급여가 10000 이상인 부서의 department_id 와 급여평균을 출력한다.
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING AVG(SALARY) >= 10000;

-- 40. 부서(department_id)마다 같은 직업(job_id)을 가진 사원수를 department_id 순으로 정렬하여 출력한다.
-- 단, department_id 가 없는 사원은 출력하지 않는다.
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) AS 사원수 FROM EMPLOYEES GROUP BY DEPARTMENT_ID, JOB_ID HAVING DEPARTMENT_ID IS NOT NULL ORDER BY DEPARTMENT_ID;


