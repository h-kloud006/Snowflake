--Create environment default role and grant to SYSADMIN
USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS "{{ENVIRONMENT}}_SYSADMIN";
GRANT ROLE "{{ENVIRONMENT}}_SYSADMIN" TO ROLE SYSADMIN;

--Grant privileges to default role
USE ROLE SYSADMIN;
GRANT CREATE DATABASE ON ACCOUNT TO ROLE "{{ENVIRONMENT}}_SYSADMIN";
GRANT CREATE WAREHOUSE ON ACCOUNT TO ROLE "{{ENVIRONMENT}}_SYSADMIN";

--Create "OUTBOUND" database 
USE ROLE "{{ENVIRONMENT}}_SYSADMIN";
CREATE DATABASE IF NOT EXISTS "{{ENVIRONMENT}}_OUTBOUND_DB";
ALTER DATABASE "{{ENVIRONMENT}}_OUTBOUND_DB" SET DATA_RETENTION_TIME_IN_DAYS = 8;