---------------TOTAL TASK CLOSED LAST HOUR
SELECT
COUNT(PD.ID) AS "Total Task Closed Last Hour"
FROM [dbo].[Policy_Diary] AS PD
WHERE PD.Active = 0
AND PD.ClosedDate > DATEADD(HOUR, -1, GETDATE());