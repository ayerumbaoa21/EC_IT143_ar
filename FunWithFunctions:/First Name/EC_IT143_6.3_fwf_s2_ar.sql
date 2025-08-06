/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwf_s2_ar.sql
PURPOSE: Step 2 - Plan for extracting first name from ContactName column using LEFT() and CHARINDEX()
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ----------------------------------------------
1.0   08/06/2025 AR      Initial version - documented plan for first name extraction
RUNTIME:
N/A
NOTES:
This script outlines the plan to extract the first name by getting characters 
from the start of the string up to the first space.
***********************************************************************************
*******************************/

-- Plan: Use the LEFT() and CHARINDEX() functions.
-- LEFT() will get characters from the start of the string.
-- CHARINDEX(' ', ContactName) finds the first space = where first name ends.
-- Test this logic in the next step using a query.
