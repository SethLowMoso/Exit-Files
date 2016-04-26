DECLARE @BUID INT = $(buid)

SELECT   distinct   email.PartyID
			, ML.RoleID MemberID
			, ML.FirstName
			, ML.LastName
			, email.EmailContactMechanismTypeName EmailType
			, email.EmailOptOut
			, email.EmailAddress,
			email.CreatedDate


FROM         rpt_CurrentPartyEmail Email
				inner join rpt_EmployeeList ML
						on ML.PartyID = Email.PartyID

where 		email.EmailAddress <>'' 
AND  ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)



