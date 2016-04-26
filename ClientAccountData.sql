DECLARE @BUID INT = $(buid)

SELECT p.RoleID AS MemberID
		, pv.[First Name]
		, pv.[Last Name]
		, c.ClientAccountId
		, c.Name AS ClientAccount
		, s.Name AS BillingSchedule
		, c.MaxChargeLimit
		, CASE
			WHEN (cp.IsActive = 1 AND c.IsActive = 1) THEN 'True'
			ELSE 'False'
			END AS IsActive
FROM ClientAccount c
INNER JOIN Schedule s ON s.ScheduleId = c.BillingscheduleID
INNER JOIN ClientAccountParty cp ON cp.ClientAccountId = c.ClientAccountId
LEFT JOIN PartyPropertiesReportingView pv ON pv.PartyID = cp.PartyId
LEFT JOIN PartyRole p ON p.PartyId = cp.PartyId
WHERE
  p.BusinessUnitID = IIF(@BUID IS NULL, p.BusinessUnitID, @BUID)