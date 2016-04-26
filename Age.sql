
/*
SELECT DISTINCT
ML.RoleID,
BU.DivisionName,
BU.BUName,
ML.FirstName,
ML.LastName,
AR.ClientAccountId,

SUM(AR.AgingCurrent) as CurrentBal,
SUM(AR.Aging30) as Bal1to30,
SUM(AR.Aging60) as Bal31to60,
SUM(AR.Aging90) as Bal61to90,
SUM(AR.Aging120) as Bal91to120,
SUM(AR.AgingOver120) as Bal121Plus,
SUM(AR.TotalDue) as TotalDue,
SUM(AR.AcctCredit) as CreditDue
into SilverCreek.dbo.Age
FROM dbo.ARAging(DATEADD(DAY, 1, GETDATE()),NULL,NULL,NULL) AR
JOIN rpt_MemberList ml on AR.PartyId = ml.PartyId
JOIN rpt_BusinessUnitAndDiv bu on AR.BusinessUnitId = bu.BusinessUnitID
LEFT JOIN MemberAgreement MH ON AR.MemberAgreementId = MH.MemberAgreementId
JOIN ClientAccount ca on AR.ClientAccountId = ca.ClientAccountId
where ml.Businessunitid=24

GROUP BY 
ML.RoleID,
BU.DivisionName,
BU.BUName,
ML.FirstName,
ML.LastName,
AR.ClientAccountId
*/
/*
IF OBJECT_ID('tempdb..#out') IS NOT NULL
DROP TABLE #out
CREATE TABLE #out
 (
 AgedDate datetime,
  BusinessUnitId int,
  ClientAccountId int,
  PartyID int,
  MemberAgreementId int,
  PartyRoleID int,
  AgingCurrent DECIMAL(15,3),
  Aging30 DECIMAL(15,3),
  Aging60 DECIMAL(15,3),
  Aging90 DECIMAL(15,3),
  Aging120 DECIMAL(15,3),
  AgingOver120 DECIMAL(15,3),
  CheckInPastDue Decimal(15,3),
  TotalDue DECIMAL(15,3),
  TotalPastDue DECIMAL(15,3),
  AcctCredit DECIMAL(15,3)
 );


 declare @date datetime
 set @date=getdate()
insert into #out
exec ARAging_SP @date, NULL, NULL

SELECT        pr.RoleID, pr.businessunitid,#out.PartyRoleID, sum(isnull(AgingCurrent,0))AgingCurrent, 
sum(isnull(Aging30,0))Aging30, sum(isnull(Aging60,0))Aging60 , sum(isnull(Aging90,0)) Aging90, 
sum(isnull(Aging120,0)) Aging120, sum(isnull(AgingOver120,0))AgingOver120, sum(isnull(TotalDue,0))TotalDue, 
                         sum(isnull(TotalPastDue,0))TotalPastDue,sum( isnull(AcctCredit,0))AcctCredit
						 --into SilverCreek.dbo.Age 
FROM           #out
inner join PartyRole Pr on #out.PartyRoleID=pr.PartyRoleID
--where pr.businessunitid=24
group by pr.RoleID,#out.PartyRoleID,pr.businessunitid
*/

DECLARE @BUID INT = $(buid)

SELECT        pr.RoleID, 
			pr.businessunitid,
			CachedArAging.PartyRoleID, 
			sum(isnull(AgingCurrent,0))AgingCurrent, 
			sum(isnull(Aging30,0))Aging30, 
			sum(isnull(Aging60,0))Aging60 , 
			sum(isnull(Aging90,0)) Aging90, 
			sum(isnull(Aging120,0)) Aging120, 
			sum(isnull(AgingOver120,0))AgingOver120, 
			sum(isnull(TotalDue,0))TotalDue, 
            sum(isnull(TotalPastDue,0))TotalPastDue,
			sum( isnull(AcctCredit,0))AcctCredit
						 --into SilverCreek.dbo.Age 
FROM           CachedArAging
inner join PartyRole Pr on CachedArAging.PartyRoleID=pr.PartyRoleID
WHERE 1=1
AND  pr.BusinessUnitID = IIF(@BUID IS NULL, pr.BusinessUnitID, @BUID)
group by pr.RoleID,CachedArAging.PartyRoleID,pr.businessunitid
