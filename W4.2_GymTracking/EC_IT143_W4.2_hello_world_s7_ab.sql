-- EC_IT143_W4.2_gymtracking_s7_ab.sql
CREATE PROCEDURE sp_load_gymtracking_workout_avg_calories
AS
BEGIN
    TRUNCATE TABLE tbl_gymtracking_workout_avg_calories;
    INSERT INTO tbl_gymtracking_workout_avg_calories
    SELECT * FROM vw_gymtracking_workout_avg_calories;
END;
