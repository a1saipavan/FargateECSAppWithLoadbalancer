CREATE DATABASE "DBATEST"
WITH TABLESPACE ts_postgres
OWNER "postgres"
ENCODING 'UTF8'
LC_COLLATE = 'en_US.UTF-8'
LC_CTYPE = 'en_US.UTF-8'
TEMPLATE template0;


Create table member_table ( mem_id integer, member_name varchar(100) , mobile integer not null , constraint mem_id_cons unique(mem_id));

