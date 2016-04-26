DECLARE @BUID INT = $(buid)

SELECT   distinct  SPn.SuspensionId
			, SPn.DivisionName
			, SPn.BUName
			, SPn.SuspensionReason
			, SPn.EffectsName
			, SPn.StatusName
			, SPn.BeginTime
			, SPn.EndTime
			, SPn.Comments
			, SPn.SuspensionType
			, SPn.TargetEntityTypeName SuspensionTarget
			, SPn.MemberAgreementId
			, MA.Agreement AgreementName
			, ML.RoleID MemberID
			, MA.FirstName
			, MA.LastName
--into SilverCreek.dbo.Suspensions
FROM         rpt_Suspensions Spn
			Left join rpt_MemberAgreementHeader MA
					on MA.MemberAgreementId = SPn.MemberAgreementId
			left join rpt_MemberList ML
					on ML.PartyRoleID = MA.PartyRoleId	
WHERE ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)
