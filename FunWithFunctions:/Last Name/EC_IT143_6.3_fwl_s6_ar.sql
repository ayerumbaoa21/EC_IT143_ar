/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwl_s6_ar.sql  
PURPOSE: Step 6 - Compare results of UDF vs ad hoc SQL for extracting LastName
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Side-by-side comparison of UDF and ad hoc logic
RUNTIME:
<Fill in after execution>
NOTES:
Expect all rows to match between the two methods.
***********************************************************************************
*******************************/

SELECT 
    ContactName,
    dbo.ufn_GetLastName(ContactName) AS LastName_UDF,
    CASE 
        WHEN CHARINDEX(' ', ContactName) > 0 THEN 
            LTRIM(RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName)))
        ELSE 
            '' 
    END AS LastName_AdHoc
FROM dbo.t_w3_schools_customers;
