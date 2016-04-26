DECLARE @BUID INT = $(buid)

 SELECT DISTINCT   
    UserAccount.UserAccountId  
    ,UserAccount.ServiceOnly  
    ,case when UserAccount.ServiceOnly= 1 then UserAccount.Username  
      else Null  
     End as ServiceName  ,
     UserAccount.UserName  
    ,PartyRole.PartyRoleID  
    ,Employee.PartyID   
    ,'Employee' AS PartyRoleTypeName   
    ,PartyRole.RoleID   
    ,( SELECT TOP (1) _pp.Value  
     FROM PartyProperties _pp  
     WHERE _pp.PartyID = PartyRole.PartyID  
      AND _pp.Name = 'First Name'  
     ORDER BY _pp.ValueCreatedDate_UTC DESC  
    ) 'FirstName'  
      
    ,( SELECT TOP (1) _pp.Value  
     FROM PartyProperties _pp  
     WHERE _pp.PartyID = PartyRole.PartyID  
      AND _pp.Name = 'Last Name'  
     ORDER BY _pp.ValueCreatedDate_UTC DESC  
    ) 'LastName'  
    ,PartyRole.StatusID AS StatusId  
    ,PartyRole.BusinessUnitID   
    ,BusinessUnit.Name AS BUName   
  
 FROM         Party Employee   
     INNER JOIN   PartyRole ON Employee.PartyID = PartyRole.PartyID   
     INNER JOIN PartyRoleType PRT ON PartyRole.PartyRoleTypeID = PRT.PartyRoleTypeID  
     left JOIN   BusinessUnit ON PartyRole.BusinessUnitID = BusinessUnit.BusinessUnitId   
     left join UserAccount on UserAccount.PartyID = Employee.PartyID  
  
   WHERE  
    PRT.Name = 'Employee'  
	AND  partyrole.BusinessUnitID = IIF(@BUID IS NULL, partyrole.BusinessUnitID, @BUID)
  
    
  