/****************************************************************************************************
NAME: EC_IT143_W5.2_GymTracking_ar.sql
PURPOSE: Answer 4 questions about Gym Member Exercise Tracking

MODIFICATION LOG:
Ver     Date        Author           Description
-----   ----------  ---------------  ----------------------------------------------------------------
1.0     07/30/2025  Adriyan Rumbaoa  Created final script for My Communities Project - GymTracking
****************************************************************************************************/

-- Q1: Number of members exercising grouped by Workout Frequency (days per week)
-- Since no date or member ID, this counts total records per workout frequency.
-- Author: Adriyan Rumbaoa

SELECT Workout_Frequency_days_week, COUNT(*) AS MemberCount
FROM dbo.GymTracking
GROUP BY Workout_Frequency_days_week
ORDER BY Workout_Frequency_days_week;

-- Q2: Average calories burned per workout type
-- Author: Adriyan Rumbaoa

SELECT Workout_Type, 
       COUNT(*) AS SessionCount,
       AVG(Calories_Burned) AS AvgCaloriesBurned
FROM dbo.GymTracking
GROUP BY Workout_Type;

-- Q3: Workout type with highest average calories burned
-- Author: Adriyan Rumbaoa

SELECT TOP 1 Workout_Type, 
       AVG(Calories_Burned) AS AvgCaloriesBurned
FROM dbo.GymTracking
GROUP BY Workout_Type
ORDER BY AvgCaloriesBurned DESC;

-- Q4: What is the average BMI by experience level?
-- A4: Analyzes how BMI varies across different levels of workout experience.
-- Author: Joysunrose Capulac Saplaco

SELECT Experience_Level, 
       COUNT(*) AS MemberCount,
       AVG(BMI) AS AvgBMI
FROM dbo.GymTracking
GROUP BY Experience_Level
ORDER BY Experience_Level;

