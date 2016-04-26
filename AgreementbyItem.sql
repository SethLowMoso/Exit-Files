--DROP TABLE #AgreementbyItem
DECLARE @BUID INT = $(buid)


select 
		mar.memberAgreementID
		, Agreement.Name Agreement
		, Maid.Bundle
		, Maid.Item
		, mar.MemberAgreementInvoiceRequestId
		, mar.TxInvoiceID
		, mairi.MemberAgreementInvoiceRequestItemId
		, mar.BillDate InvoiceDate
		, coalesce(i.PaymentDueDate,mapr.duedate) PaymentDate
		--, mpr2.DueDate AS SecondPayDate
		--, t.TargetDate AS PaymentMadeDate
		, IIF(t.TargetDate IS NULL, n.PaymentmadeDate, t.TargetDate) AS PaymentMadeDate
		, maipr.Quantity
		, maipr.Price
		, maipr.BillCount
		, mapr.ProcessType
		, mapyri.MemberAgreementPaymentRequestId
		
		, mapyri.MemberAgreementPaymentRequestItemId
		, mapyri.TxTransactionId
		, caps.TenderTypeID,
		(case
				When caps.TenderTypeID is not null then 
					(Select Name from TenderType where TenderType.TenderTypeID = caps.TenderTypeID)
				else 'Statement'
			end			
		) as TenderType,

		CreditCardType.Description CreditCardType,
		caps.ExpirationDate CardExpDate,
		Case when caps.BankAccountType = 1 then 'Checking'
			 when caps.BankAccountType = 2 then 'Savings'
			 Else null
		End as BankAcctType
		, caps.ChargeAccountMask Mask
		, caps.ChargeAccountToken
		, caps.ClientAccountPaySourceId
		,DurationInUnit
		,Units
		--, mapr.*
		--, t.*
--into #Agreementbyitem
--,mairi.* 
--, maipr.*
from MemberAgreementInvoiceRequestItem mairi
left join MemberAgreementInvoiceRequest Mar on mar.MemberAgreementInvoiceRequestId = mairi.MemberAgreementInvoiceRequestId 
left join MemberAgreementItemPerpetual maipr on mairi.MemberAgreementItemPerpetualId = maipr.MemberAgreementItemPerpetualId
left join rpt_MemberAgreementItemsDetails Maid on maid.MemberAgreementItemID = mairi.MemberAgreementItemId
left join MemberAgreementPaymentRequestItem mapyri on mairi.MemberAgreementInvoiceRequestItemId = mapyri.MemberAgreementInvoiceRequestItemId
left join MemberAgreementItemPerpetualPaySource maipp on mapyri.MemberAgreementItemPerpetualPaySourceId = maipp.MemberAgreementItemPerpetualPaySourceId
left join ClientAccountPaySource caps on maipp.ClientAccountPaySourceId = caps.ClientAccountPaySourceId
left join [METAALIAS].FocusMeta.dbo.CreditCardType as CreditCardType on caps.CreditCardTypeId = CreditCardType.CreditCardTypeID 
left join MemberAgreementPaymentRequest mapr on mapr.MemberAgreementPaymentRequestId = mapyri.MemberAgreementPaymentRequestId
--LEFT JOIN MemberAgreementPaymentRequest mpr2 ON mpr2.MemberAgreementInvoiceRequestID = mar.MemberAgreementInvoiceRequestId
left join MemberAgreement MA on Ma.MemberAgreementId = mar.MemberAgreementId
left join Agreement on Agreement.AgreementId = ma.AgreementId
LEFT JOIN TxInvoice i (NOLOCK) ON i.TxInvoiceId = mar.TxInvoiceId
LEFT JOIN TxPayment t ON t.TxPaymentId = mapr.TxPaymentId 
OUTER APPLY (
				SELECT TxInvoiceID
						, p.TargetDate AS PaymentmadeDate
						, MAX(e.TxPaymentEFTID) AS MAX_ID
				FROM TxTransaction tx  (NOLOCK)
				INNER JOIN TxPaymentEFT e (NOLOCK) ON e.TxPaymentID = tx.ItemId
				LEFT JOIN TxPayment p (NOLOCK) ON p.TxPaymentId = tx.ItemId  AND e.TxPaymentId = p.TxPaymentId
				WHERE 1=1
					AND tx.TxInvoiceId = mar.TxInvoiceId
					AND tx.IsAccountingCredit = 1
					AND e.ResponseCode LIKE 'A%'
				GROUP BY TxInvoiceId, p.TargetDate
			) n
--where mar.MemberAgreementId = 143018
where   1=1
	AND mar.memberAgreementID is not null
	AND  MA.BusinessUnitID = IIF(@BUID IS NULL, MA.BusinessUnitID, @BUID)
	and isnull( mar.ProcessType,0) <>1

	--AND mapr.[DueDate] IS NULL
	--AND ma.MemberAgreementId = 8597
	--AND mar.TxInvoiceID = 71557

order by mar.memberAgreementID, mar.MemberAgreementInvoiceRequestId, mairi.MemberAgreementInvoiceRequestItemId


--SELECT *
--FROM MemberAgreementPaymentRequest 
--WHERE MemberAgreementInvoiceRequestID = 294748

--SELECT t.*,e.*
--FROM TxTransaction t (NOLOCK)
--INNER JOIN TxPaymentEFT e (NOLOCK) ON e.TxPaymentID = t.ItemID
--WHERE t.TxInvoiceID = 71557
--	AND t.IsAccountingCredit = 1
--	AND e.ResponseCode LIKE 'A%'
--select * from #Agreementbyitem