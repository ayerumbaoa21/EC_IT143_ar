/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwt_s4_ar.sql  
PURPOSE: Step 4 - Trigger to set LastName column using ufn_GetLastName on ContactName insert
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Created trigger to populate LastName when a new record is inserted
RUNTIME:
<Fill in after execution>
NOTES:
This trigger sets LastName column by calling dbo.ufn_GetLastName(ContactName) 
whenever a new record is inserted in dbo.t_w3_schools_customers.
Assumes LastName column exists in the table.
***********************************************************************************
*******************************/

CREATE OR ALTER TRIGGER trg_InsertLastName
ON dbo.t_w3_schools_customers
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET LastName = dbo.ufn_GetLastName(i.ContactName)
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID;
END;
GO
