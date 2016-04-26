DECLARE @BUID INT = $(buid)

select ml.RoleID MemberID
		, ml.businessunitid,MC.*
from ReportingMemberCharacteristics MC
left join rpt_MemberList ml	on ml.PartyID = MC.PartyId  
WHERE ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)