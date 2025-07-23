-- Step 5.2: Add primary key to the new table
ALTER TABLE tbl_injuries_per_year
ADD CONSTRAINT pk_injury_year PRIMARY KEY (injury_year);
