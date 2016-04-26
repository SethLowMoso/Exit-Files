DECLARE @BUID INT = $(buid)

SELECT     MA.MemberAgreementId
                     , MA.Agreement AgreementName
                     , MA.AgreementClassificationName                
                     , MA.AgrementStatus
                     , MA.PartyRoleId
                     , ML.RoleID MemberID
                     , MA.FirstName
                     , MA.LastName
                     , MA.DivisionName
                     , MA.BUName
                     , MA.StartDate
                     , MA.EndDate
                     , MA.ObligationDate
                     , CanA.CancelDate
                     , CanA.CancelReason
                     , CanA.CancelStatus
                     , MA.AgreementTerm
                     , MA.BundleName
                     , MA.ClientAccountId
                     , MA.SalesPersonID
                     , MA.SalesFirstName
                     , MA.SalesLastName
                     , ma.NextInvoiceDate -- Next Invoice Date
                     , ma.AgreementRole  -- Primary or Add On
                     , ma.MemberAgreementGroupId -- Each Group has a Primary role
--into SilverCreek.dbo.Contracts              
FROM         rpt_MemberAgreementHeader MA
  left Join rpt_MemberList ML      On ML.PartyRoleID = ma.PartyRoleId
  left join rpt_CanceledAgreements CanA  on CanA.CancelledMemberAgreementId = MA.MemberAgreementId
                                            and CanA.StateId in (4,5)
 WHERE  ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)