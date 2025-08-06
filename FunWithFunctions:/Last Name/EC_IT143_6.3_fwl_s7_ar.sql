/*
***********************************************************************************
******************************
NAME: EC_IT143_6.3_fwl_s7_ar.sql  
PURPOSE: Step 7 - Modify scalar function to handle single-word names by returning full name if no space
MODIFICATION LOG:
Ver   Date       Author  Description
----- ---------- ------- ---------------------------------------------------------
1.0   08/06/2025 AR      Updated ufn_GetLastName to return full name if no space
RUNTIME:
<Fill in after execution>
NOTES:
Returns last name if full name has space, else returns full name.
***********************************************************************************
*******************************/

ALTER FUNCTION dbo.ufn_GetLastName (@FullName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN 
        CASE 
            WHEN CHARINDEX(' ', @FullName) > 0 
            THEN LTRIM(RIGHT(@FullName, LEN(@FullName) - CHARINDEX(' ', @FullName)))
            ELSE @FullName  -- Return whole name if no space (single word)
        END;
END;
GO
