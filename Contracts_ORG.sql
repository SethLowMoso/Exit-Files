
DECLARE @BUID INT = $(buid)

SELECT     MA.MemberAgreementId
                     , MA.Agreement AgreementName
                     , MA.AgreementClassificationName                
                     , MA.AgrementStatus
                     , MA.PartyRoleId
                     , ML.RoleID MemberID
                     , ML.OrganizationName
                     --, ML.LastName
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
             
FROM         rpt_MemberAgreementHeader MA
                           inner Join rpt_OrganizationList ML
                                         On ML.PartyRoleID = ma.PartyRoleId
                           left join rpt_CanceledAgreements CanA
                                         on CanA.CancelledMemberAgreementId = MA.MemberAgreementId
                                            and CanA.StateId in (4,5)
WHERE 
  ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)

											order by 1




