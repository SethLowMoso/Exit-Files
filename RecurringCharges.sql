DECLARE @BUID INT = $(buid)


SELECT   Roleid,  mai.MemberAgreementItemId
			,mai.MemberAgreementId
			,mai.BundleGroupId
			,mai.BundleId
			,Bundle.Name as Bundle
			,Item.ItemID as Item_Id
			,Item.ItemRecordID as ItemCode
			,Item.Name as Item
			,mai.IsKeyItem
			,mai.Quantity
			,mai.DownPaymentAmount 			
			,mai.Price 
			,mai.PriceIdType 
			,(Case
				When mai.PriceIdType = 0 then 'Invalid'
				When mai.PriceIdType = 1 then 'Item Price'
				When mai.PriceIdType = 2 then 'Bundle Price'
				When mai.PriceIdType = 3 then 'Installment Item Terms'
				When mai.PriceIdType = 4 then 'Perpetual Item Terms'
				When mai.PriceIdType = 5 then 'Explicitly Assigned' 
			End) as PriceType
			,mai.PriceId
			,ITL.Name as PriceOption

            ,mai.DurationValue 
            ,mai.DurationType 
            ,(Case
				When mai.DurationType = 1 then 'Minute'
				When mai.DurationType = 2 then 'Hour'
				When mai.DurationType = 3 then 'Day'
				When mai.DurationType = 4 then 'Week'
				When mai.DurationType = 5 then 'Month'
				When mai.DurationType = 6 then 'Year'
				When mai.DurationType = 7 then 'Unlimited'
			End) as DurationInUnit	
            ,mai.Units
			,mai.ItemId 
			,mai.ItemIdType              
            ,mai.ItemTypeId
            ,ItemType.Name as ItemType,
			maip.Price,maip.BillCount,maip.Sequence
FROM         MemberAgreementItem mai 
			left outer join 	Bundle on mai.BundleId = Bundle.BundleId 
			left outer join	Item on item.itemid = 
				(case
					When mai.ItemIdType = 1 then (select item.ItemId from Item where mai.ItemId = Item.ItemID)
					When mai.ItemIdType = 2 then (select BundleItem.ItemId from BundleItem where BundleItem.BundleItemId = mai.ItemId)
					When mai.ItemIdType = 3 then (SELECT     BundleItem.ItemId
													FROM     ItemTerms INNER JOIN
															  ItemTermsLocation ON ItemTerms.ItemTermsId = ItemTermsLocation.ItemTermsId inner join
															  BundleItem on BundleItem.BundleItemId = ItemTerms.ItemId and ItemTerms.ItemIdType = 2 
													WHERE     (ItemTermsLocation.ItemTermsLocationId = mai.ItemId))
					End) 
			left outer join[METAALIAS].FocusMeta.dbo.ItemType on ItemType.ItemTypeID = mai.ItemTypeId		
			Left outer Join ItemTermsLocation ITL on ITL.ItemTermsLocationId = mai.PriceId and mai.PriceIdType in (3,4)
			left join MemberAgreementItemPerpetual MAIP on MAIP.MemberAgreementItemId=mai.MemberAgreementItemId
			left join memberagreement ma on ma.MemberAgreementId=mai.MemberAgreementId
			left join PartyRole PR on pr.PartyRoleID=ma.PartyRoleId
WHERE (ma.BusinessUnitID = IIF(@BUID IS NULL, ma.BusinessUnitID, @BUID)) 
		OR 
	(pr.BusinessUnitID = IIF(@BUID IS NULL, pr.BusinessUnitID, @BUID))
			