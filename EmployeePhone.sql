DECLARE @BUID INT = $(buid)

SELECT    distinct  Phone.PartyID
			, ML.RoleID MemberID
			, ML.FirstName
			, ML.LastName
			, Phone.PhoneContactMechanismTypeName PhoneType
			, Phone.PhoneCountryCode
			, Phone.PhoneNumber
			, 'US' as PhoneCountry
			, Phone.TextMessageOK,
			phone.createddate

FROM         phonecontactmechanism Phone
				inner join rpt_EmployeeList ML
						on ML.PartyID = Phone.PartyID
						where phone.validthru is null
						AND  ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)