DECLARE @BUID INT 
set @BUID = $(buid)

select * from businessunit bu
WHERE
	 bu.BusinessUnitID = IIF(@BUID IS NULL, bu.BusinessUnitID, @BUID)