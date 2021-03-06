DECLARE @BUID INT = $(buid)

SELECT        Inv.TxInvoiceID						
                           , Inv.RoleID						
                           , Inv.MemberFirstName						
                           , Inv.MemberLastName						
                           , TD.TxTransactionID						
                           , TD.TargetDate						
                           , TD.DetailType						
                           , TD.Quantity						
                           , TD.ItemCode						
                           , TD.LineDescription						
                           , TD.UnitPrice						
                           , TD.Amount						
                           , TD.Tax						
                           , TD.Discount						
                           , TD.Comments					
						
                           , TD.IsAccountingCredit						
                           , TD.BundleName						
                           , TD.TargetBUName						
                           , TD.MemberAgreementID						
						   --,Inv.BusinessUnitId
						
into #Transactions                     						
FROM            rpt_TransactionDetail AS TD 
INNER JOIN TxInvoice i ON i.TxInvoiceID = td.TxInvoiceID
LEFT OUTER JOIN		rpt_InvoiceHeaderInfo AS Inv ON Inv.TxInvoiceID = TD.TxInvoiceID 
WHERE td.TargetBusinessUnitID = IIF(@BUID IS NULL, td.TargetBusinessUnitID, @BUID)


select * from #Transactions