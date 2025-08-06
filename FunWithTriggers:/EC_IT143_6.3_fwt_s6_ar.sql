/*
***********************************************************************************
NAME: EC_IT143_6.3_fwt_s6_ar.sql  
PURPOSE: Step 6 - Define the question for tracking historical changes using an audit table
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Defined audit tracking question using INSERTED and DELETED rows
RUNTIME:
N/A
NOTES:
This script poses the question for the next phase of trigger development: 
tracking historical changes using an audit table. This involves storing both 
INSERTED and DELETED rows to capture data before and after modifications.
***********************************************************************************
*/

-- Question: How can I track changes in an audit table for historical changes?
-- Should I create an audit table with INSERTED and DELETED rows?

