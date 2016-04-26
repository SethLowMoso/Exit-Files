select  CONCAT('Copy F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\ProfilePics\Large\',partyid,'.png ','D:\Exit\Schraffts\Photos\',RoleID,'.JPEG') 
from  rpt_MemberList ml
WHERE ml.BusinessUnitID = 205

SELECT CONCAT('Copy F:\MosoMrmAssetStorage\abb15b02-c131-4bc0-8c5f-a3950a565770\Agreements\',partyid,'\agreements\',ma.MemberAgreementID,'.pdf   ','D:\Exit\Schraffts\Agreements\',RoleID,'_',ma.MemberAgreementID,'.pdf') 
from  rpt_MemberList ml
INNER JOIN MemberAgreement ma ON ml.PartyRoleID = ma.PartyRoleId
WHERE ml.BusinessUnitID = 205

