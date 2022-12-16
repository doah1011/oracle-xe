/*
SQL (Structured Query Language) - ������ ���� ���
    ������ �����ͺ��� �ý��� (DBMS)���� �ڷḦ ���� �� ó���ϱ� ���� ����� ���
  
 SELECT ��
    �����ͺ��̽����� ���� �˻�
*/
-- ��� �� ����* 
--from ���̺��
SELECT *
FROM departments;

-- Ư�� �� �����ؼ� �ҷ�����
SELECT department_id,location_id
FROM deparments;

/*
�����
    ��� �����ڸ� ����Ͽ� ����/��¥ ������ ǥ���� �ۼ�
    +
    -
    *
    /
*/

-- ��� ������ ���
SELECT LAST_NAME, SALARY, SALARY+300
FROM employees;

/*
������ �켱����
    ���ϱ� ������� ���ϱ� ���⺸�� ���� ����
*/
SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

/*
������� Null�� (���ǵ��� X)
    null ���� �����ϴ� ������� null�� ���
*/
SELECT last_name, 12*salary*commission_pct
FROM employees;

/*
�� alias ���� - ����
    �� �Ӹ����� �̸��� �ٲ�
    ��꿡�� ������
    �� �̸� �ٷ� �ڿ� ���� (�� �̸��� alias ���̿� ���û����� AS Ű���尡 �� ���� ����)
    �����̳� Ư�� ���ڸ� �����ϰų� ��ҹ��ڸ� �����ϴ� ��� ū ����ǥ�� �ʿ�
*/
SELECT last_name AS name, commission_pct commm, salary*10 as �޿�10��
FROM employees;

SELECT last_name "Name", salary*12 "Annual Salary"
FROM employees;

/*
���� ������
    ���̳� ���ڿ��� �ٸ����� ����
    �� ���� ���μ�(||) ���� ��Ÿ��
    ��� ���� ���� ǥ������ �ۼ�
*/

SELECT last_name||job_id AS "Employees", last_name, job_id
FROM employees;

/*
���ͷ� ���ڿ�
    ���ͷ��� SELECT ���� ���Ե� ����, ����, �Ǵ� ��¥
    ��¥ �� ���� ���ͷ� ���� ���� ����ǥ�� ����� ��
    �� ���ڿ��� ��ȯ�Ǵ� �� �࿡ �� �� ��µ�
*/
--�������ִ� ����
SELECT last_name|| 'is a' || job_id AS "Employee Details"
FROM employees;

/*
��ü �ο�(q) ������
    �ڽ��� ����ǥ �����ڸ� ����
    �������� ���Ƿ� ����
    ������ �� ��뼺 ����
*/
SELECT department_name || q'[Department's Manager ID: ]' || manager_id
AS "Department and Manager"
FROM departments;

/*
�ߺ���
    �⺻������ query ������� �ߺ� ���� ������ ������� ǥ�õ�
DISTINCT
    ������� �ߺ��� ����
*/
--�ߺ���
SELECT department_id
FROM employees;

--�ߺ�����, ��ǥ���� �ϳ��� �̾ƿ�
SELECT DISTINCT department_id
FROM employees;

/*
���̺� ����ǥ��
    DESCRIBE ����� ����Ͽ� ���̺� ���� ǥ��
    ���̺��� Schema ǥ�õ� (Column�� �̸�, Null?, data type ǥ��)
    Number (6���ڱ���)
    Varchar ���ڿ� (���� �� ����)
    (8,2)=�Ǽ� 8�ڸ� �Ҽ� 2�ڸ��� �ǹ�
    DATE = DD-MON-YEAR ���� �⺻
*/
DESCRIBE employees;



