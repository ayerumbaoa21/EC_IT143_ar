/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwf_s3_ar.sql
PURPOSE: Step 3 - Ad Hoc Query to extract first name from ContactName column
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ----------------------------------------------
1.0   08/06/2025 AR      Initial version - test extracting first name using LEFT and CHARINDEX
RUNTIME:
N/A
NOTES:
This query tests the logic for extracting the first name from ContactName by using LEFT() and CHARINDEX().
***********************************************************************************
*******************************/

SELECT ContactName,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;
