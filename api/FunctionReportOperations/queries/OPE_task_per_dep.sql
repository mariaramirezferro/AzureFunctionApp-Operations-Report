---------------TOTAL TASKS PER DEPARMENT
SELECT
TY.Type AS Deparment,
COUNT(PD.ID) AS "Today's Tasks"
FROM [dbo].[Policy_Diary] AS PD
LEFT JOIN [dbo].[Policy_Details] DE
ON PD.ReportID = DE.ReportID
LEFT JOIN (
SELECT DC.ID,
DC.Code,
DT.Type
FROM [dbo].[Lookup_DiaryCodes] DC
LEFT JOIN [dbo].[Lookup_DiaryCodeTypes] DT
ON DC.DiaryCodeTypeId = DT.ID
) AS TY
ON PD.Code = TY.Code
WHERE PD.Active = 1
AND DE.StatusID <> 15
AND CAST(PD.dueDate AS DATE) = CAST(GETDATE() AS DATE)
GROUP BY
TY.Type
ORDER BY COUNT(PD.ID) DESC;