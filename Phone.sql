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
--into SilverCreek.dbo.Phone

FROM         phonecontactmechanism Phone
				inner join rpt_MemberList ML
						on ML.PartyID = Phone.PartyID
						where phone.validthru is null
						and ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)