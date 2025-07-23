-- Step 4: Create view for injuries per year
CREATE VIEW vw_injuries_per_year AS
SELECT injury_year, COUNT(injury_id) AS injuries_per_year
FROM InjuriesData
GROUP BY injury_year;
