--Create environment default role and grant to SYSADMIN
USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS "{{ENVIRONMENT}}_SYSADMIN";
GRANT ROLE "{{ENVIRONMENT}}_SYSADMIN" TO ROLE SYSADMIN;

--Grant privileges to default role
USE ROLE SYSADMIN;
GRANT CREATE DATABASE ON ACCOUNT TO ROLE "{{ENVIRONMENT}}_SYSADMIN";
GRANT CREATE WAREHOUSE ON ACCOUNT TO ROLE "{{ENVIRONMENT}}_SYSADMIN";

-- BEGIN
--   LET count := {{CONDITION}};
--   IF (count = 0)  THEN
--     USE ROLE USERADMIN;
--     CREATE ROLE IF NOT EXISTS "{{ENVIRONMENT}}_AZURE_FR";   
--   END IF;
-- END; 