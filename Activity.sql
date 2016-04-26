DECLARE @BUID INT = $(buid)

SELECT     ActivityTransactionID
			, ActivityID
			, ItemCode
			, Item
			, Action
			, ServiceProvider
			, IsAccountingCredit
			, Amount Value
			, MemberRoleID
			, MemberFirstName
			, MemberLastName
			, PurchaseDate
			, ActionDate
			, Comment
			, RedemptionType
			, ReinstatmentReason
			, ActionAtBussinessUnit
			, ActionAtWorkStationName
			, ActionByRoleID 
			, ActionByFirstName
			, ActionByLastName
--into SilverCreek.dbo.Activity
FROM         rpt_ActivityHistory
inner join  rpt_MemberList ML
					on ML.Roleid = MemberRoleid	
WHERE     (Action <> 'Acquire')
AND  ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)