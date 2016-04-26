DECLARE @BUID INT = $(buid)

SELECT TOP(9223372036854775807) I.ItemId
, I.Name as ItemName
, I.Description
, I.UPC
, I.ItemTypeID
, CASE I.ItemTypeID WHEN 1 THEN 'Product'
		WHEN 2 THEN 'Access'
		WHEN 3 THEN 'Service' 
		ELSE NULL END as ItemType
, I.GLCodePOS
, I.FirstAvailableDate
, I.EndDate
, I.Inactive
, pc.Name as CategoryName
, sc.Name as SubCategoryName
, EII.EntityId as BusinessUnitId
, BU.Name as BUName
, BU.DivisionId
, EII.CurrentCount
, EII.ReorderCount
, EII.MinOnHand
, EII.MaxOnHand
, LASTORDER.VendorPartyRoleId
, VL.VendorName
FROM ITEM I
LEFT JOIN EntityInventoryItem EII on EII.ItemId = I.ItemID
-- Categories
LEFT JOIN ItemCategories ic on ic.ItemID = I.ItemId and ic.CategoryItemType = 1
LEFT JOIN ItemCategory pc on pc.ItemCategoryId = ic.ItemCategoryId and pc.ParentCategoryID is null
LEFT JOIN ItemCategory sc on sc.ItemCategoryID = ic.ItemCategoryID and sc.ParentCategoryID is not null
LEFT JOIN BusinessUnit BU on BU.BusinessUnitId = EII.EntityId
--LAST ORDER (to get most recent item Vendor)
LEFT JOIN (SELECT IR.ItemId
			, R.VendorPartyRoleId
			, R.SourceId
			FROM InventoryReceivedItem IR
			JOIN InventoryReceived R on R.InventoryReceivedId = IR.InventoryReceivedId
			JOIN (Select MAX(InventoryReceivedItemId) as MaxIRII
					,  ItemId
					,  SourceId
					from InventoryReceivedItem 
					JOIN InventoryReceived on InventoryReceived.InventoryReceivedId = InventoryReceivedItem.InventoryReceivedId
					WHERE VendorPartyRoleId IS NOT NULL
					group by ItemId, SourceId) maxorder on maxorder.MaxIRII = IR.InventoryReceivedItemId
			) LASTORDER on LASTORDER.ItemId = i.ItemID and LASTORDER.SourceId = eii.EntityId
LEFT JOIN rpt_VendorList VL on VL.PartyRoleID = LASTORDER.VendorPartyRoleId
WHERE  bu.BusinessUnitID = IIF(@BUID IS NULL, bu.BusinessUnitID, @BUID)
--WHERE (BU.DivisionId = 1 OR 1 = -1)
--	and (EII.EntityId in (1)	OR '1' = '-1')
--	and (pc.ItemCategoryID in (-1) or -1 = -1)
--	and (sc.ItemCategoryID in (-1) or -1 = -1)
--	and (-1 = '-1' or I.ItemTypeID = -1)
--	and ((0 = 1) or (0 = 0 and I.Inactive = 0))