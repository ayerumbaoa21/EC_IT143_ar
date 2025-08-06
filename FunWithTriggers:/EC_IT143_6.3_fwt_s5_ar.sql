/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwt_s5_ar.sql  
PURPOSE: Step 5 - Trigger to maintain LastName column on INSERT or UPDATE of ContactName
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Created trigger to update LastName on both insert and update
RUNTIME:
<Fill in after execution>
NOTES:
This trigger ensures the LastName column is correctly set whenever ContactName
is inserted or updated in dbo.t_w3_schools_customers.
Assumes LastName column exists in the table.
***********************************************************************************
*******************************/

CREATE OR ALTER TRIGGER trg_MaintainLastName
ON dbo.t_w3_schools_customers
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET LastName = dbo.ufn_GetLastName(i.ContactName)
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID
    WHERE 
        -- Only update when ContactName is new or changed
        ISNULL(c.ContactName, '') <> ISNULL(i.ContactName, '');
END;
GO
