DECLARE @BUID INT = $(buid)

SELECT  Distinct   CA.CancellationId
			, CA.CancelReason
			, CA.RefundMethod
			, CA.Comments
			, CA.CancelStatus
			, CA.CancelledMemberAgreementId
			, MA.Agreement
			, MA.BUName AgreementBUName
			, CA.RoleID MemberID
			, CA.FirstName
			, CA.LastName
			, CA.ClientAccountPaySourceId
			, CA.CancelDate
			, CA.CancelledEntity Canceling
			, CA.MemberAgreementId
			, CA.CanAtBusinessUnit
			, CA.CanByEmployeeID
			, CA.CanByEmployeeFirstName
			, CA.CanByEmployeeLastName
			, CA.RefundAmount
			, CA.TaxRefund
--into SilverCreek.dbo.Cancellations
FROM         rpt_CanceledAgreements CA
				join rpt_MemberAgreementHeader MA
					on MA.MemberAgreementId = CA.MemberAgreementId
					left Join rpt_MemberList ML on  ML.RoleID=CA.RoleID
WHERE 
  ma.BusinessUnitID = IIF(@BUID IS NULL, ma.BusinessUnitID, @BUID)
					
				
	

					