-- Step 6: Truncate and reload the table from the view
TRUNCATE TABLE tbl_injuries_per_year;

INSERT INTO tbl_injuries_per_year
SELECT * FROM vw_injuries_per_year;
