create user ANTON
  identified by "1234"
  default tablespace USERS
  temporary tablespace TEMP
  profile DEFAULT;
grant dba to LIBRARYDB;
grant unlimited tablespace to LIBRARYDB;

/*от Миши*/
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
create user ANTON identified by 1234;

grant create session to ANTON;
grant create table to ANTON;
grant create procedure to ANTON;
grant create trigger to ANTON;
grant create view to ANTON;
grant create sequence to ANTON;
grant alter any table to ANTON;
grant alter any procedure to ANTON;
grant alter any trigger to ANTON;
grant alter profile to ANTON;
grant delete any table to ANTON;
grant drop any table to ANTON;
grant drop any procedure to ANTON;
grant drop any trigger to ANTON;
grant drop any view to ANTON;
grant drop profile to ANTON;

-- дополненние прав


grant select on sys.v_$session to ANTON;
grant select on sys.v_$sesstat to ANTON;
grant select on sys.v_$statname to ANTON;
grant SELECT ANY DICTIONARY to ANTON;

GRANT UNLIMITED TABLESPACE TO ANTON;