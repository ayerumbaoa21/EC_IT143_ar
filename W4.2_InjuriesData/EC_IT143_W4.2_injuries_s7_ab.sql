-- Step 7: Turn it into a stored procedure
CREATE PROCEDURE sp_load_injuries_per_year
AS
BEGIN
    TRUNCATE TABLE tbl_injuries_per_year;

    INSERT INTO tbl_injuries_per_year
    SELECT * FROM vw_injuries_per_year;
END;
