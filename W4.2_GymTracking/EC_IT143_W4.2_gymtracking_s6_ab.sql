TRUNCATE TABLE tbl_gymtracking_daily_count;

INSERT INTO tbl_gymtracking_daily_count
SELECT * FROM vw_gymtracking_daily_count;
