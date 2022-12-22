/*
그룹 함수
    그룹 함수는 행 집합 연산을 수행하여 그룹별로 하나의 결과를 산출
    
    AVG(): n의 평균값. null 값은 무시
    COUNT() : 행 개수 null이 아닌 값은 무시
    MAX() : 최대값. null 값은 무시
    MIN() : 최소값. null 값은 무시
    STDDEV() : 표준편차. null 값은 무시
    SUM() : 합계값. null 값은 무시
    VARIANCE(): 분산. null 값은 무시
*/

SELECT AVG(salary), MAX(salary),
    MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;

SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;

SELECT COUNT(1)
FROM employees;

--COUNT (DISTINCT expr)는 expr의 null이 아닌 구분 값의 수를 반환함
SELECT COUNT(DISTINCT department_id)
FROM employees;

--NVL 함수는 강제로 그룹 함수에 null값이 포함되도록 합니다.
SELECT AVG(NVL(commission_pct, 0))
FROM employees;

/*
GROUP BY 절 사용
    테이블의 행을 그룹으로 나눌 수 있음
*/
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

--여러 열에서 GROUP BY절 사용
SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id
;

/*
HAVING 절
    HAVING 절을 사용할 경우 ORACLE 서버는 다음과 같이 그룹을 제한합니다 (그룹에 대한 조건절)
    1. 행이 그룹화됨
    2. 그룹 함수 적용
    3. HAVING 절과 일치하는 그룹 표시
*/
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000
;

SELECT job_id, SUM(salary) PAYROLL
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY SUM(salary)
;

--그룹 함수 중첩
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;