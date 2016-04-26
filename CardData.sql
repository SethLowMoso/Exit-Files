DECLARE @BUID INT = $(buid)

SELECT     ML.RoleID,ML.Partyid,  a.CardID, a.DateAssigned, case when a.Status = 1 then 'Active'
		when a.Status = 2 then 'Cancelled'
		when a.Status = 3 then 'Lost'
		when a.Status = 4 then 'Stolen'
	else 'Unknown'
   End as 'CardStatus',a.LastStatusChanged, a.LastUsed
--into SilverCreek.dbo.CardData
FROM         PartyCard a INNER JOIN
                      rpt_MemberList ML ON a.PartyRoleID = ML.PartyRoleID
WHERE  ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)
