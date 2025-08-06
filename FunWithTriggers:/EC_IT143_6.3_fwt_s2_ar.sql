/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwt_s2_ar.sql  
PURPOSE: Step 2 - Create trigger to update LastModifiedDate and LastModifiedBy on update
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Created AFTER UPDATE trigger to maintain audit columns
RUNTIME:
<Fill in after execution>
NOTES:
This trigger sets LastModifiedDate to current timestamp and LastModifiedBy to SYSTEM_USER.
Assumes columns LastModifiedDate (DATETIME) and LastModifiedBy (NVARCHAR) exist in the table.
***********************************************************************************
*******************************/

CREATE OR ALTER TRIGGER trg_UpdateCustomerAudit
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET 
        LastModifiedDate = GETDATE(),
        LastModifiedBy = SYSTEM_USER
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID;
END;
GO
