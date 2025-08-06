/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwl_s4_ar.sql
PURPOSE: Step 4 - Research and test solution to extract the last name
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.1   08/06/2025 AR      Fixed RIGHT() error by checking for missing spaces
RUNTIME:
<Fill in after execution>
NOTES:
Handles cases where ContactName contains only one word (no space).
***********************************************************************************
*******************************/

SELECT ContactName,
       CASE 
           WHEN CHARINDEX(' ', ContactName) > 0 
           THEN LTRIM(RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)))
           ELSE ContactName
       END AS LastName
FROM dbo.t_w3_schools_customers;
