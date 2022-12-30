
SELECT*FROM dictionary;

SELECT* FROM all_tables;

--스키마에 생성된 해당 테이블
SELECT table_name, tablespace_name
FROM user_tables;

--시퀀스 정보
SELECT sequence_name, min_value, max_value,
        increment_by
FROM all_sequences;

--로그인 할 수 있는 유저
SELECT username, account_status
FROM dba_users
WHERE account_status = 'OPEN';

--인덱스 정보를 볼 수 있는 뷰
DESC dba_indexes;

SELECT sql_text, executions
FROM v$sql
WHERE cpu_time >20000;

SELECT*FROM v$session
WHERE 1=1

AND logon_time > SYSDATE - 1;

SELECT sid, ctime FROM v$lock
WHERE block >0;



