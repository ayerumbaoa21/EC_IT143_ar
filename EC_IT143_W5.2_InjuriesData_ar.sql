/****************************************************************************************************
NAME: EC_IT143_W5.2_InjuriesData_ar.sql
PURPOSE: Answer 4 questions based on NBA Player Transactions using the InjuriesData table.

MODIFICATION LOG:
Ver     Date        Author           Description
-----   ----------  ---------------  ----------------------------------------------------------------
1.0     07/30/2025  Adriyan Rumbaoa  Final script for My Communities Project - NBA Transactions Data
****************************************************************************************************/

-- Q1: How many transactions happened per year?
-- A1: Counts total player acquisitions or releases per year.
-- Author: Adriyan Rumbaoa

SELECT YEAR(Date) AS TransactionYear, COUNT(*) AS TransactionsPerYear
FROM dbo.InjuriesData
GROUP BY YEAR(Date)
ORDER BY TransactionYear;


-- Q2: Which NBA team made the most total transactions?
-- A2: Shows which team was most active in acquiring or releasing players.
-- Author: Adriyan Rumbaoa

SELECT Team, COUNT(*) AS TotalTransactions
FROM dbo.InjuriesData
GROUP BY Team
ORDER BY TotalTransactions DESC;


-- Q3: How many players were acquired vs. relinquished?
-- A3: Compares total acquisitions and releases to show player movement trends.
-- Author: Joysunrose Capulac Saplaco

SELECT 
  SUM(CASE WHEN Acquired IS NOT NULL THEN 1 ELSE 0 END) AS TotalAcquired,
  SUM(CASE WHEN Relinquished IS NOT NULL THEN 1 ELSE 0 END) AS TotalRelinquished
FROM dbo.InjuriesData;


-- Q4: What are the most common notes or transaction descriptions?
-- A4: Helps identify recurring types of transactions or notes.
-- Author: Adriyan Rumbaoa

SELECT Notes, COUNT(*) AS Frequency
FROM dbo.InjuriesData
WHERE Notes IS NOT NULL AND Notes <> ''
GROUP BY Notes
ORDER BY Frequency DESC;
