---------------------Top 10 actions completed
SELECT
A.[Name],
A.[Actions completed]
FROM
(
SELECT
ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS row_num,
SUBSTRING(UP.Email,0,CHARINDEX('@',UP.Email)) AS "Name",
COUNT(*) as 'Actions completed'
FROM
[dbo].[Policy_History] PH
LEFT JOIN [dbo].[UserProfile] UP
ON PH.ActionedBy = UP.UserId
WHERE CAST(PH.ActionedDate AS DATE) = CAST(GETDATE() AS DATE)
GROUP BY UP.Email
) AS A
WHERE A.row_num <= 10;