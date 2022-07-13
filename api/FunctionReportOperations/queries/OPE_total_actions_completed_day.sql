---------------------Actions Day
SELECT
COUNT(*) As 'Actions completed today'
FROM
[dbo].[Policy_History] PH
LEFT JOIN [dbo].[Lookup_ClaimStatus] CS
ON PH.StatusID = CS.ID
WHERE CAST(PH.ActionedDate AS DATE) = CAST(GETDATE() AS DATE);