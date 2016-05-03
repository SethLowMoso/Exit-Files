select  CONCAT('Copy F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\ProfilePics\Large\',partyid,'.png ','D:\Exit\Schraffts\Photos\',RoleID,'.JPEG') 
from  rpt_MemberList ml
WHERE ml.BusinessUnitID = 205



SELECT CONCAT('Copy F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\'
				,partyid
				,'\2\'
				,'"#'
				,ma.MemberAgreementID
				,' - '
				, a.Name
				, ' - '
				, CONVERT(VARCHAR(10), ma.StartDate, 110) 
				,'"\'
				,ma.MemberAgreementID
				,'.pdf'
				,'        '
				,'D:\Exit\Schraffts\Agreements\'
				,RoleID
				,'_'
				,ma.MemberAgreementID
				,'.pdf') 
from  rpt_MemberList ml
INNER JOIN dbo.MemberAgreement ma ON ml.PartyRoleID = ma.PartyRoleId
INNER JOIN dbo.Agreement a ON a.AgreementID = ma.AgreementID
WHERE ml.BusinessUnitID = 205
	AND MemberAgreementID = 3417632


SELECT  CONVERT(VARCHAR(10), ma.StartDate, 110)
FROM memberAgreement  ma
WHERE memberAgreementId = 3417632


--SELECT CONCAT('Copy "F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\Agreements\'
--		, ma.MemberAgreementID
--		, '.pdf'
--		, '   '
--		,'D:\Exit\Schraffts\Agreements\'
--		,PartyID
--		,'_'
--		,ma.MemberAgreementID
--		,'.pdf'
--		)
--from  rpt_MemberList ml
--INNER JOIN dbo.MemberAgreement ma ON ml.PartyRoleID = ma.PartyRoleId
--INNER JOIN dbo.Agreement a ON a.AgreementID = ma.AgreementID
--WHERE ml.BusinessUnitID = 205


F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\1049296\2\"#3347422 - Passport Corporate Conversion - 02-05-2016"\3347422.pdf.
F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\1049311\2\"#3347423 - Core Corporate Conversion - 02-05-2016"\3347423.pdf
F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\1049398\2\"#3347424 - Core Corporate Conversion - 02-05-2016"\3347424.pdf
F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\1049483\2\"#3347426 - Core Corporate Conversion - 02-05-2016"\3347426.pdf

F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\1858629\2\"#3417632 - Managed Club Schraffts - 02-05-2016"\3417632.pdf


Copy "F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\1858629\2\"#3417632 - Managed Club Schraffts - 08-07-2015"\3417632.pdf


F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\1858629\2\"#3417632 - Managed Club Schraffts - 07-08-2015"\3417632.pdf

Copy "F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\DocManagementStore\1858629\2\"#3417632 - Managed Club Schraffts - 07-08-2015"\3417632.pdf"        D:\Exit\Schraffts\Agreements\8257488_3417632.pdf