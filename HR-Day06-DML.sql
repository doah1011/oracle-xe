/*

DML(데이터 조작어)
    DML 문은 다음과 같은 경우에 실행
    -테이블에 새 행 추가
    -테이블의 기존 행 수정
    -테이블에서 기존 행 제거

*/

/*
INSERT문
    각 열에 대한 값을 포함하는 새 행을 삽입

[기본형식]
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2 ...)
    VALUES (값1, 값2...);

    또는
    
    INSERT INTO 테이블명 (컬럼명1, 컬럼명2...) subquery;
*/

SELECT *FROM departments;

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relations', 100, 1700);

ROLLBACK; 
--행 삽입 취소 CTRLZ 느낌

COMMIT;
-- 서버에 저장, ROLLBACK 더 이상 실행되지 X

--null 값을 가진 행 삽입 (열생략)
INSERT INTO departments (department_id, department_name_
VALUES(290, 'Purchasing')
;
--NULL 키워드 지정
INSERT INTO departments
VALUES(300, 'Finance', NULL, NULL)
;
commit;

/*
INSERT 문을 subquery로 작성

CREATE TABLE sales_reps
AS (SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees WHERE 1=2)
    ;
*/
DESC sales_reps;

INSERT INTO sales_reps (id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

SELECT*FROM sales_reps;
commit;

/*
UPDATE문
    테이블의 기존 값을 수정
[기본형식]
    UPDATE 테이블명
    SET 컬럼명1 = 수정값,
        컬럼명2 = 수정값 ....
    WHERE 조건절

create table copy_emp
as SELECT*FROM employees WHERE 1=2;

INSERT INTO copy_emp
SELECT*FROM employees;
*/

UPDATE employees
SET department_id = 50
WHERE employee_id = 113
--WHERE 중요함 아니면 전체 데이터가 다 바뀔 수 있음
;

SELECT*FROM employees
WHERE employee_id = 113
;

UPDATE copy_emp
SET department_id = 110;

SELECT*FROM copy_emp;
commit;

--다른 테이블을 기반으로 행 갱신
UPDATE copy_emp
SET department_id = (SELECT department_id
                        FROM employees
                        WHERE employee_id = 100)
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 200)
;
SELECT*FROM copy_emp
WHERE department_id = (SELECT department_id
FROM employees
WHERE employee_id =100)
;

/*
DELETE문
    DELETE문을 사용하여 테이블에서 기존 행을 제거할 수 있음
*/
DELETE FROM departments
WHERE department_id = 300;

SELECT*FROM departments
WHERE department_id = 300;

ROLLBACK;
COMMIT;

DELETE FROM copy_emp;

ROLLBACK;

/*
TRUNCATE문 (사용xx)
    테이블은 빈 상태로, 테이블 구조는 그대로 남겨둔 채 테이블에서 모든 행을 제거함
    DML문이 아니라 DDL(데이터 정의어)문이므로 쉽게 언두할 수 없음
*/

TRUNCATE TABLE copy_emp;

SELECT*FROM copy_emp;

ROLLBACK;

/*
트랜잭션 (Transaction)
    데이터 처리의 한 단위
    오라클에서 발생하는 여러 개의 SQL 명령문들을 하나의 논리적인 작업 단위로 처리하는 것
    
    COMMIT: SQL문의 결과를 영구적으로 DB에 반영
    ROLLBACK: SQL문의 실행결과를 취소
    SAVEPOINT: 트랜잭션의 한지점에 표시하는 임시 저장점

*/

SELECT*FROM sales_reps;
DELETE FROM sales_reps;

desc sales_reps;

INSERT INTO sales_reps VALUES (1, '피카츄',300,0.1);
SAVEPOINT mypoint;
INSERT INTO sales_reps VALUES (2, '라이츄',400,0);
INSERT INTO sales_reps VALUES (3, '파이리',1000,0.3);
INSERT INTO sales_reps VALUES (4, '꼬부기',1200,0.2);

ROLLBACK TO mypoint;
COMMIT;

/*
SELECT 문의 FOR UPDATE 절
    EMPLOYEES 테이블에서 job_id가 SA_REP인 행을 잠급니다
*/
SELECT employee_id, salary, commission_pct, job_id
FROM employees
WHERE job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id
;








