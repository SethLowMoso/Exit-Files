DECLARE @BUID INT = $(buid);


select ml.RoleID MemberID, ml.businessunitid,MC.* 
 
from ReportingOrganizationCharacteristics MC 
inner join rpt_OrganizationList ml	on ml.PartyID = MC.PartyId
WHERE ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)





