/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwf_s5_ar.sql
PURPOSE: Step 5 - Create scalar function to extract first name from full name
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ----------------------------------------------
1.0   08/06/2025 AR      Created dbo.ufn_GetFirstName scalar function
RUNTIME:
N/A
NOTES:
This function extracts the first name from a full name string by returning characters up to the first space.
***********************************************************************************
*******************************/

DROP FUNCTION IF EXISTS dbo.ufn_GetFirstName;
GO

CREATE FUNCTION dbo.ufn_GetFirstName (@FullName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN LEFT(@FullName, CHARINDEX(' ', @FullName + ' ') - 1);
END;
GO
