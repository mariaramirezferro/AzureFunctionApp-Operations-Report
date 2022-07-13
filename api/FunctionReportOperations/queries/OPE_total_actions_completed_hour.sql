---------------------Actions Hour
SELECT
COUNT(*) As 'Actions completed in the last hour'
FROM
[dbo].[Policy_History] PH
LEFT JOIN [dbo].[Lookup_ClaimStatus] CS
ON PH.StatusID = CS.ID
WHERE PH.ActionedDate > DATEADD(HOUR, -1, GETDATE());