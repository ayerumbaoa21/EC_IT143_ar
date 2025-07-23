-- EC_IT143_W4.2_gymtracking_s4_ab.sql
CREATE VIEW vw_gymtracking_workout_avg_calories AS
SELECT [Workout_Type], 
       COUNT(*) AS session_count,
       AVG([Calories_Burned]) AS avg_calories_burned
FROM dbo.GymTracking
GROUP BY [Workout_Type];
