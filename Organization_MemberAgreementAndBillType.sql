DECLARE @BUID INT = $(buid);

select a.* 

from dbo.rpt_MemberAgreementAcctAndBillType a
inner join rpt_OrganizationList ml on ml.PartyRoleID=a.PartyRoleId
WHERE ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)
