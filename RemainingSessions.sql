DECLARE @BUID INT = 205

SELECT     
	AL.RoleID MemberID, 
	AL.FirstName, 
	AL.LastName, 
	AL.ActivityId,
	AL.Item,
	rpt_ItemBasic.Category,
	rpt_ItemBasic.SubCategory,
	AL.UnitsAcquired, 
	AL.UnitsConsumed, 
	AL.ItemCode, 
	AL.AvailableStatus, 
	AL.TxTransactionId,
	AL.PurchaseDate,
	TD.Amount PurchaseAmount,
	Td.BundleName,
	td.MemberAgreementID,
	MA.Agreement,
	MA.AgreementClassificationName,
	Division.Name AS Division,
	AL.PurchaseBUName	
	--into SilverCreek.dbo.RemaingingSessions
FROM         
	rpt_ActivityList AL
		JOIN BusinessUnit 
			ON AL.PurchaseBUID = BusinessUnit.BusinessUnitId
		JOIN Division 
			ON BusinessUnit.DivisionID = Division.DivisionID
		JOIN rpt_ItemBasic 
			ON AL.ItemCode = rpt_ItemBasic.ItemCode
		join rpt_TransactionDetail TD
			on 	TD.TxTransactionID = AL.TxTransactionId
		join rpt_MemberAgreementHeader MA
			on MA.MemberAgreementId = TD.MemberAgreementID	
       join 	rpt_MemberList ML on ML.RoleID=AL.RoleID
  where ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)


ORDER BY LastName, FirstName