/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwt_s3_ar.sql  
PURPOSE: Step 3 - Trigger to update LastName column using ufn_GetLastName on ContactName update
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Created trigger to update LastName when ContactName changes
RUNTIME:
<Fill in after execution>
NOTES:
This trigger updates LastName column by calling dbo.ufn_GetLastName(ContactName) 
whenever ContactName is updated in dbo.t_w3_schools_customers.
Assumes LastName column exists in the table.
***********************************************************************************
*******************************/

CREATE OR ALTER TRIGGER trg_UpdateLastName
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET LastName = dbo.ufn_GetLastName(i.ContactName)
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID
    WHERE ISNULL(c.ContactName, '') <> ISNULL(i.ContactName, '');
END;
GO
