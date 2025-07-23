-- Step 3: Create ad hoc query to get number of injuries per year
SELECT injury_year, COUNT(injury_id) AS injuries_per_year
FROM InjuriesData
GROUP BY injury_year;
