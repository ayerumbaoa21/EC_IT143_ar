SELECT exercise_date, COUNT(member_id) AS members_exercised
FROM GymTracking
GROUP BY exercise_date;
