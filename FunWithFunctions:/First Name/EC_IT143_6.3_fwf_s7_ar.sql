/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwf_s7_ar.sql
PURPOSE: Step 7 - Verify no discrepancies between UDF and ad hoc first name extraction
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ----------------------------------------------
1.0   08/06/2025 AR      Validating that UDF and ad hoc extraction return identical results (expect 0 rows)
RUNTIME:
N/A
NOTES:
This query checks if there are any ContactName values where the user-defined function's output differs from the direct query logic.
***********************************************************************************
*******************************/

WITH cte AS (
    SELECT ContactName
    FROM dbo.t_w3_schools_customers
    WHERE dbo.ufn_GetFirstName(ContactName) != LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1)
)
SELECT * FROM cte;  -- Expect 0 rows

