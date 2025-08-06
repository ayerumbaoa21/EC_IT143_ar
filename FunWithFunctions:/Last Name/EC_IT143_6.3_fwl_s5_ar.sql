/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwl_s5_ar.sql  
PURPOSE: Step 5 - Create scalar function to extract last name from full name
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Created function ufn_GetLastName to return last name
RUNTIME:
<Fill in after execution>
NOTES:
This scalar function extracts the last name from a full name.
If there is no space in the name, it returns an empty string.
***********************************************************************************
*******************************/

ALTER FUNCTION dbo.ufn_GetLastName (@FullName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @SpaceIndex INT = CHARINDEX(' ', @FullName + ' ');

    RETURN LTRIM(
        CASE 
            WHEN @SpaceIndex = 0 THEN ''
            WHEN LEN(@FullName) > @SpaceIndex THEN RIGHT(@FullName, LEN(@FullName) - @SpaceIndex)
            ELSE ''
        END
    );
END;
GO

