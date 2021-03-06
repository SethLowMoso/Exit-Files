DECLARE @BUID INT = $(buid)

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [WorkRoleID]
      ,[WorkRole]
      ,[WRDescription]
      ,[WRLevel]
      ,[WRLevelName]
      ,[EmployeeID]
      ,[EmpFirstName]
      ,[EmpLastName]
      ,wr.[PartyID]
  FROM [dbo].[rpt_EmployeesByWorkRole] wr
  INNER JOIN PartyRole ml ON wr.PartyID = ml.PartyID
  WHERE ml.BusinessUnitID = IIF(@BUID IS NULL, ml.BusinessUnitID, @BUID)