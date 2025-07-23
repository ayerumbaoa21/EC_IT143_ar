-- EC_IT143_W4.2_hello_world_s7_ab.sql
CREATE PROCEDURE sp_load_hello_world_result
AS
BEGIN
    TRUNCATE TABLE tbl_hello_world_result;
    INSERT INTO tbl_hello_world_result
    SELECT * FROM vw_hello_world_result;
END;
