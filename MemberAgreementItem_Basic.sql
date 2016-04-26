/*******************************************************************************
Basic Member Agreement Key Item Pricing
*******************************************************************************/
DECLARE @BUID INT = $(buid)


SELECT p.RoleID AS CustomerID
		, pv.[First Name]
		, pv.[Last Name]
		, m.MemberAgreementID
		, sm.Name AS AgreementStatus
		, a.Name AS AgreementName
		, b.Name AS BundleName
		, i.Name AS ItemName
		, mi.Price AS MemberAgreementItem_Price
FROM MemberAgreement m
INNER JOIN MemberAgreementItem mi ON mi.MemberAgreementID = m.MemberAgreementID
INNER JOIN Agreement a ON a.AgreementID = m.AgreementID
INNER JOIN bundle b ON b.BundleID = mi.BundleID 
lEFT JOIN BundleItem bi ON bi.BundleID = b.BundleID
LEFT JOIN BundlePrice bp ON bp.BundleItemID = bi.BundleItemID
LEFT JOIN Item i ON i.ItemId = bi.ItemId 
LEFT JOIN PartyRole p ON p.PartyRoleID = m.PartyRoleID
LEFT JOIN PartyPropertiesReportingView pv ON pv.PartyID = p.PartyID
LEFT JOIN StatusMap sm ON m.Status = sm.StatusID AND sm.StatusMapType = 5
WHERE 1=1
--	AND m.MemberAgreementId= 11782
	AND mi.IsKeyitem = 1
	AND bi.KeyItem = 1
	AND m.BusinessUnitID = IIF(@BUID IS NULL, m.BusinessUnitID, @BUID)



