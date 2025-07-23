-- EC_IT143_W4.2_gymtracking_s3_ab.sql
-- Step 3: What is the average number of calories burned per workout type?

SELECT [Workout_Type], 
       COUNT(*) AS session_count,
       AVG([Calories_Burned]) AS avg_calories_burned
FROM dbo.GymTracking
GROUP BY [Workout_Type];
