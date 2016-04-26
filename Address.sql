DECLARE @BUID INT = $(buid)

SELECT    distinct   Postal.PartyID
			, ML.RoleID MemberID
			, ML.FirstName
			, ML.LastName
			, Postal.PostalContactMechanismTypeName PostalType
			, Postal.AddressData1
			, Postal.AddressData2
			, Postal.AddressData3
			, Postal.CityCounty
			, Postal.StateProvince
			, Postal.PostalCode
			, Postal.Country,
			postal.ValidFrom CreatedDate
--into SilverCreek.dbo.Address

FROM         rpt_CurrentPartyPostalAddress Postal
				inner join rpt_MemberList ML
						on ML.PartyID = Postal.PartyID

Where 		(Postal.AddressData1 is not null or Postal.AddressData1 <> '')
	and 	(Postal.CityCounty is not null or Postal.CityCounty <> '')
	and		(Postal.PostalCode is not null or Postal.PostalCode <> '')
	AND  ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)
