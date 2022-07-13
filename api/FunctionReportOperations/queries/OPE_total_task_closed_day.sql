---------------TOTAL TASK CLOSED DAY
SELECT
COUNT(PD.ID) AS "Total Task Closed Today"
FROM [dbo].[Policy_Diary] AS PD
WHERE PD.Active = 0
AND CAST(PD.ClosedDate AS DATE) = CAST(GETDATE() AS DATE);