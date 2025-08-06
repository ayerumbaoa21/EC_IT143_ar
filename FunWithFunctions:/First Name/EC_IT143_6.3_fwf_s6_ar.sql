/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwf_s6_ar.sql
PURPOSE: Step 6 - Compare UDF first name extraction with ad hoc query results
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ----------------------------------------------
1.0   08/06/2025 AR      Comparing dbo.ufn_GetFirstName function output to ad hoc LEFT/CHARINDEX extraction
RUNTIME:
N/A
NOTES:
This script runs a query to compare first name extraction via the user-defined function against the direct query logic.
***********************************************************************************
*******************************/

SELECT ContactName,
       dbo.ufn_GetFirstName(ContactName) AS FirstName_UDF,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName_AdHoc
FROM dbo.t_w3_schools_customers;
