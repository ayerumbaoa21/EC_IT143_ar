/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwl_s2_ar.sql
PURPOSE: Step 2 - Plan for extracting last name from ContactName column
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ----------------------------------------------
1.0   08/06/2025 AR      Documented plan to extract last name using string functions
RUNTIME:
N/A
NOTES:
This plan outlines how to extract the last name from ContactName using RIGHT(), LEN(), 
and CHARINDEX() to grab the portion of the string after the first space.
***********************************************************************************
*******************************/

-- Plan: Use RIGHT() and CHARINDEX() to grab text after the first space.
-- Alternative: Use LEN() to find the total length and subtract position of the first space.
-- Example approach: 
--     LEN(ContactName) - CHARINDEX(' ', ContactName + ' ') = number of characters to extract from the right
--     Then use RIGHT(ContactName, that number)
-- We'll test this logic in the next step using an ad hoc query.