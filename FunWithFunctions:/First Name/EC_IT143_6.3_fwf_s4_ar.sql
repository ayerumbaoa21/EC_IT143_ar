/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwf_s4_ar.sql
PURPOSE: Step 4 - Research and test first name extraction logic from ContactName
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ----------------------------------------------
1.0   08/06/2025 AR      Verified extraction logic with Stack Overflow reference
RUNTIME:
N/A
NOTES:
This script confirms the extraction logic by referencing Stack Overflow and testing the query.
***********************************************************************************
*******************************/

-- Verified on Stack Overflow:
-- https://stackoverflow.com/questions/8131508/sql-server-extract-first-name-from-full-name

SELECT ContactName,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;
