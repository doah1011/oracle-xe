/*
SQL (Structured Query Language) - 구조적 질의 언어
    관계형 데이터베스 시스템 (DBMS)에서 자료를 관리 및 처리하기 위해 설계된 언어
  
 SELECT 문
    데이터베이스에서 정보 검색
*/
-- 모든 열 선택* 
--from 테이블명
SELECT *
FROM departments;

-- 특정 열 선택해서 불러오기
SELECT department_id,location_id
FROM deparments;

/*
산술식
    산술 연산자를 사용하여 숫자/날짜 데이터 표현식 작성
    +
    -
    *
    /
*/

-- 산술 연산자 사용
SELECT LAST_NAME, SALARY, SALARY+300
FROM employees;

/*
연산자 우선순위
    곱하기 나누기는 더하기 빼기보다 먼저 수행
*/
SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

/*
산술식의 Null값 (정의되지 X)
    null 값을 포함하는 산술식은 null로 계산
*/
SELECT last_name, 12*salary*commission_pct
FROM employees;

/*
열 alias 정의 - 별명
    열 머리글의 이름을 바꿈
    계산에서 유용함
    열 이름 바로 뒤에 나옴 (열 이름과 alias 사이에 선택사항인 AS 키워드가 올 수도 있음)
    공백이나 특수 문자를 포함하거나 대소문자를 구분하는 경우 큰 따옴표가 필요
*/
SELECT last_name AS name, commission_pct commm, salary*10 as 급여10배
FROM employees;

SELECT last_name "Name", salary*12 "Annual Salary"
FROM employees;

/*
연결 연산자
    열이나 문자열은 다른열에 연결
    두 개의 세로선(||) 으로 나타냄
    결과 열로 문자 표현식을 작성
*/

SELECT last_name||job_id AS "Employees", last_name, job_id
FROM employees;

/*
리터럴 문자열
    리터럴은 SELECT 문에 포함된 문자, 숫자, 또는 날짜
    날짜 및 문자 리터럴 값은 작은 따옴표로 묶어야 함
    각 문자열은 반환되는 각 행에 한 번 출력됨
*/
--연결해주는 역할
SELECT last_name|| 'is a' || job_id AS "Employee Details"
FROM employees;

/*
대체 인용(q) 연산자
    자신의 따옴표 구분자를 지정
    구분자의 임의로 선택
    가독성 및 사용성 증가
*/
SELECT department_name || q'[Department's Manager ID: ]' || manager_id
AS "Department and Manager"
FROM departments;

/*
중복행
    기본적으로 query 결과에는 중복 행을 포함한 모든행이 표시됨
DISTINCT
    결과에서 중복행 제거
*/
--중복행
SELECT department_id
FROM employees;

--중복제거, 대표값을 하나씩 뽑아옴
SELECT DISTINCT department_id
FROM employees;

/*
테이블 구조표시
    DESCRIBE 명령을 사용하여 테이블 구조 표시
    테이블의 Schema 표시됨 (Column열 이름, Null?, data type 표시)
    Number (6글자까지)
    Varchar 문자열 (글자 수 제한)
    (8,2)=실수 8자리 소수 2자리를 의미
    DATE = DD-MON-YEAR 형식 기본
*/
DESCRIBE employees;



