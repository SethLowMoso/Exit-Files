/********************************************************************************************************************************************
Accounts Updated for BusinessUnitSpecific Logic.
********************************************************************************************************************************************/
DECLARE @BUID INT = $(buid)

SELECT     CA.AccountOwnerID
			, ML.RoleID OwnerMemberID
			, CA.OwnerFirstName
			, CA.OwnerLastName
			, CA.ClientAccountId
			, CA.AccountName

			, CA.CreditLimit
			, CA.MaxChargeLimit
			, CA.AcctActive BillAccountActive
			, PS.ClientAccountPaySourceId
			, FundingSourceTender = Case When PS.TenderTypeID is not null then TT.Name 
					Else 'Statement'
					End
			, PS.UseForRecurring
			, PS.UseForNonRecurring UseForPOS
			, PS.OnAccountFundingSource
			, PS.IsActive FundingSourceIsActive
			, CCT.Description CCType
			, CardNumber = Case When PS.ExpirationDate is not null then PS.ChargeAccountToken
			/*										(Select Distinct Value 
															from tokens
															Where PS.ChargeAccountToken = tokens.ChargeAccountToken)
			*/						Else null
										End					
			--, PS.ChargeAccountMask FundingSourceMask
			, cast(datepart(MM,PS.ExpirationDate)as varchar) CCExpMonth
			, cast(DATEPART(Year,PS.ExpirationDate) as varchar) as CCExpYear
			, PS.BillingAccountName FundingSourceName
			, PS.BillingStreet	FundingSourceStreet	
			, PS.BillingStreet2	FundingSourceStreet2
			, PS.BillingCity	FundingSourceCity
			, PS.BillingState	FundingSourceState
			, PS.BillingPostalCode	FundingSourcePostalCode
			, PS.BillingTelephone	FundingSourcePhone
			, PS.BillingEmail	FundingSourceEmail
			, PS.BankName
			, PS.ABARouting
			, PS.BankAccountType
			, BankAccountNumber = Case When PS.ABARouting is not null then PS.ChargeAccountToken
										Else null
										End					
			, PS.ChargeAccountToken
			, PS.Invalid FundingSourceInvalid
FROM        rpt_ClientAcctAndOwner AS CA
    LEFT OUTER JOIN ClientAccountPaySource AS PS 	ON PS.ClientAccountId = CA.ClientAccountId
    left join METAALIAS.FocusMeta.dbo.CreditCardType CCT 	on CCT.CreditCardTypeID = PS.CreditCardTypeId
	left join TenderType TT 	on TT.TenderTypeID = PS.TenderTypeID
	left join rpt_MemberList ML on ML.PartyRoleid = CA.AccountOwnerID
	LEFT JOIN ClientAccount c ON ca.ClientAccountId = c.ClientAccountId
	LEFT JOIN Schedule s ON s.ScheduleId = c.BillingScheduleID
where ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)