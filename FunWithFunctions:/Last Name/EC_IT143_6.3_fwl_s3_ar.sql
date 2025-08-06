/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwl_s3_ar.sql
PURPOSE: Step 3 - Ad hoc SQL query to extract the last name from ContactName
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Fixed RIGHT() error by handling single-word names
RUNTIME:
<Fill in after execution>
NOTES:
This version safely checks if a space exists before applying RIGHT().
***********************************************************************************
*******************************/

SELECT ContactName,
       CASE 
           WHEN CHARINDEX(' ', ContactName) > 0
           THEN LTRIM(RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)))
           ELSE NULL -- No last name if no space
       END AS LastName
FROM dbo.t_w3_schools_customers;

