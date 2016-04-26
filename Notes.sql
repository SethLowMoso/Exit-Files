DECLARE @BUID INT = $(buid)

select	ml.RoleID MainMemberID, MC.* 
--into SilverCreek.dbo.Notes
from Rpt_membernotes MC	left join rpt_MemberList ml
				on ml.PartyID = MC.PartyId
WHERE ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)