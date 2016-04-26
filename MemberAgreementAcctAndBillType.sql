DECLARE @BUID INT = $(buid)
select a.* 
--into SilverCreek.dbo.MemberAgreementAcctAndBillType
from dbo.rpt_MemberAgreementAcctAndBillType a
inner join rpt_MemberList ml on ml.PartyRoleID=a.PartyRoleId
WHERE ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)