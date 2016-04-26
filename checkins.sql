DECLARE @BUID INT = $(buid)

SELECT      ci.BusinessUnit
			, ci.Workstation
			, ci.PartyId
			, ci.MemberID
			, ci.MemberFirstName
			, ci.MemberLastName
			, ci.CardId
			, ci.CheckInDateTime
			, ci.MemberStatus
			, ci.MethodOfIdentification
			, ci.AccessAllowed
--into SilverCreek.dbo.Checkins
Into #checkins
FROM         rpt_MemberCheckIns AS CI
WHERE
	 CI.BusinessUnitID = IIF(@BUID IS NULL, CI.BusinessUnitID, @BUID)

select * from #checkins