
--   01  AuditLog

-- Disable check constraint - actionType and actionSource
ALTER TABLE absnew.AuditLog DROP CONSTRAINT  ck_actiontype_auditlog;
ALTER TABLE absnew.AuditLog DROP CONSTRAINT  ck_actionsource_auditlog;

-- migrate data from public to absnew
INSERT INTO absnew.AuditLog SELECT * FROM absold.AuditLog;

-- Update actionType value I=Insert, E=Update, D =Delete and actionSource value U=User, S=System, A=Admin
UPDATE absnew.AuditLog SET actionType = CASE WHEN actionType = 'I' THEN 'Insert' WHEN actionType = 'E' THEN 'Update' WHEN actionType = 'D' THEN 'Delete' ELSE actionType END  WHERE   actionType IN ('I','E','D');

UPDATE absnew.AuditLog SET actionSource = CASE WHEN actionSource = 'U' THEN 'User' WHEN actionSource = 'S' THEN 'System' WHEN actionSource = 'A' THEN 'Admin'ELSE actionSource END  WHERE   actionSource IN ('U', 'S', 'A');


 -- Enable check constraint for actionType and actionSource
ALTER TABLE absnew.AuditLog ADD CONSTRAINT ck_actiontype_auditlog check (actionType = 'Insert' or actionType = 'Update' or actionType = 'Delete');
ALTER TABLE absnew.AuditLog ADD CONSTRAINT  ck_actionSource_AuditLog check (actionSource = 'User' or actionSource = 'System' or actionSource = 'Admin');


--   02  Role

-- migrate data from public to absnew
INSERT INTO absnew.Role (oid, roleid, domain, roledescription, status, menujson, appmenujson, appreportjson, makerrole, checkerrole, approverrole, rejecterrole, activatorrole, deactivatorrole, blockerrole,unblockerrole,makeeditablerole, closerrole, rejectioncause, createdby, createdon, updatedby, updatedon) (SELECT roleid , roleid, domain, roledescription, status, menujson, appmenujson,appreportjson, makerrole, checkerrole, approverrole, rejecterrole,activatorrole, deactivatorrole, blockerrole, unblockerrole, makeeditablerole, closerrole, rejectioncause, createdby,createdon,updatedby, updatedon FROM absold.Role);


--   03  TopMenu

-- migrate data from public to absnew
INSERT INTO absnew.topmenu(oid, topmenuresourceid, menudefaulttext, menusequence, createdby, createdon, updatedby, updatedon)(SELECT topmenuresourceid, topmenuresourceid,menudefaulttext,menusequence,createdby, createdon, updatedby, updatedon FROM absold.topmenu);



--   04  LeftMenu

-- migrate data from public to absnew
INSERT INTO absnew.leftmenu (oid, leftMenuResourceId, topMenuOid, menuDefaultText,menuSequence,createdBy,createdOn,updatedBy,updatedOn)(SELECT leftMenuResourceId, leftMenuResourceId, topMenuid,menuDefaultText,menuSequence,createdBy,createdOn,updatedBy,updatedOn FROM absold.leftmenu);

--   05  LoginTrail

-- Disable check constraint ck_loginstatus_logintrail
ALTER TABLE absnew.LoginTrail DROP CONSTRAINT  ck_loginstatus_logintrail;

-- migrate data from public to absnew
INSERT INTO absnew.LoginTrail (oid, loginid, roleid, signintime, signouttime, machineip, loginstatus)(SELECT oid, loginid, roleid, signindate, signoutdate, machineip, loginstatus FROM absold.LoginTrail);

-- Enable check constraint for ck_loginstatus_logintrail
ALTER TABLE absnew.LoginTrail ADD CONSTRAINT ck_loginstatus_logintrail check (loginstatus = 'OK' or loginstatus = 'Logout' or loginstatus = 'Failed'or loginstatus = 'ALREADY_ID_BLOCK' or loginstatus ='BLOCK_ID' or loginstatus = 'UNBLOCK_IP' or loginstatus = 'BLOCK_IP' or loginstatus = 'ALREADY_IP_BLOCK');

--   06  Login

-- Disable check constraint

ALTER TABLE absnew.Login DROP CONSTRAINT  ck_status_login;
ALTER TABLE absnew.Login DROP CONSTRAINT  ck_resetRequired_login;


-- migrate data from public to absnew
INSERT INTO absnew.login (oid, loginid, password, email, mobileno, bankoid, branchoid, status, resetrequired, rolejson, blocktime, blockstatus, rejectioncause, username, designation, supervisorname,userphotopath, madeby, makerrole, approvedby, approverrole, approvedon, activatedby, activatorrole, activatedon, deactivatedby, deactivatorrole, deactivatedon, blockedby, blockerrole,blockedon, makeeditableby, makeeditablerole, rejectedby, rejectorrole, rejectedon, closedby, closerrole, closedon, createdby, createdon, updatedby, updatedon)(SELECT loginid, loginid, password,email, mobileno, bankid, branchid,status,resetrequired, rolejson, blocktime, blockstatus, rejectioncause, username, designation, supervisorname, userphotopath, madeby, makerrole, approvedby, approverrole, null, activateby, activatorrole, null, deactivatedby, deactivatorrole, null, blockedby, blockerrole, null, makeeditableby, makeeditablerole, rejectedby,rejectorrole, null, closedby, closerrole, null, createdby, createdon, updatedby, updatedon FROM absold.login);

UPDATE absnew.Login SET status = CASE WHEN status = 'BM' THEN 'BankMade'WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive'WHEN status = 'C' THEN 'Canceled' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable'ELSE status END  WHERE   status IN ('A', 'I','BM', 'BA','IE', 'BR', 'C');

UPDATE absnew.Login SET resetRequired = CASE WHEN resetRequired = 'Y' THEN 'Yes' WHEN resetRequired = 'N' THEN 'No'ELSE resetRequired END  WHERE   resetRequired IN ('Y', 'N');


-- Enable check constraint

ALTER TABLE absnew.Login ADD CONSTRAINT ck_status_login check (status = 'InEditable' or status = 'BankRejected' or status = 'Active' or status = 'Inactive' or status = 'BankMade' or status = 'BankApproved'or status ='Canceled');

ALTER TABLE absnew.Login ADD CONSTRAINT ck_resetRequired_login check (resetRequired = 'Yes' or resetRequired = 'No');


--   07  GlMasterData

-- Disable check constraint - status
ALTER TABLE absnew.GlMasterData DROP CONSTRAINT  ck_status_GlMasterData;

-- migrate data from public to absnew
INSERT INTO absnew.GlMasterData (oid, glid, gltype, description, mnemonic, glno, status, rejectioncause, createdby, createdon, updatedby, updatedon) (SELECT glid as oid , glid, gltype, description, mnemonic, glno, status, rejectioncause, createdby, createdon, updatedby, updatedon FROM absold.GlMasterData);

-- Update status value Y=Yes, N=No
UPDATE absnew.GlMasterData SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved'WHEN status = 'A' THEN 'Active'WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR'  THEN 'BankRejected'WHEN status = 'IE' THEN 'InEditable'ELSE status END  WHERE   status IN ('A', 'I','BM', 'BA','IE', 'BR');

-- Enable check constraint for status
ALTER TABLE absnew.GlMasterData ADD CONSTRAINT ck_status_GlMasterData check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');

--   08  TagDictionary

-- Disable check constraint - status
ALTER TABLE absnew.TagDictionary DROP CONSTRAINT  ck_status_TagDictionary;

-- migrate data from public to absnew
INSERT INTO absnew.TagDictionary (oid, tagdictionaryid, tagname, description, rejectioncause, status, createdby, createdon, updatedby, updatedon)(SELECT taglibid as oid, taglibid, name, description,rejectioncause, status, createdby, createdon, updatedby, updatedon FROM absold.TagDictionary);

-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive, BR=BankRejected, IE=Ineditable
UPDATE absnew.TagDictionary  SET status = CASE WHEN status = 'BM' THEN 'BankMade'WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('A', 'I','BM', 'BA','IE', 'BR');


-- Enable check constraint for status
ALTER TABLE absnew.TagDictionary ADD CONSTRAINT ck_status_TagDictionary check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');

--   09  TagLink

-- migrate data from public to absnew
INSERT INTO absnew.TagLink (oid, taglinkid, entityid, entitycode, tagliboid, createdby, createdon, updatedby, updatedon)(SELECT taglinkid as oid, taglinkid, entityid, entitycode, taglibid, createdby, createdon, updatedby, updatedon FROM absold.TagLink);

--   10  TagLinkDraft

-- migrate data from public to absnew
INSERT INTO absnew.TagLinkDraft (oid, taglinkid, entityid, entitycode, tagliboid, createdby, createdon, updatedby, updatedon) (SELECT taglinkid as oid, taglinkid, entityid, entitycode, taglibid, createdby, createdon, updatedby, updatedon FROM absold.TagLinkDraft);


--   11  Product

-- Disable check constraint ck_producttype_product, ck_status_product
ALTER TABLE absnew.product DROP CONSTRAINT ck_producttype_product;
ALTER TABLE absnew.product DROP CONSTRAINT ck_status_product;

-- migrate data from public to absnew
INSERT INTO absnew.product (oid, productid, productname, producttype, productdefinition, status, rejectioncause,makerid, checkerid, approverid, createdby, createdon, updatedby, updatedon) (SELECT productid, productid, productname, producttype, productdefinition, status, rejectioncause, makerid, checkerid, approverid, createdby, createdon, updatedby, updatedon FROM absold.product);

-- Update status value A=Active, C= Closed I= Inactive
UPDATE absnew.product  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'C' THEN 'Closed' WHEN status = 'I' THEN 'Inactive' ELSE status END  WHERE   status IN ('A', 'C', 'I');

-- Update productType
UPDATE absnew.product SET productType = CASE WHEN productType = '1001' THEN 'CURRENT'WHEN productType = '6001' THEN 'SAVINGS' WHEN productType = '6002' THEN 'SAVINGS'ELSE 'SCHEME' END  WHERE   productType IN ('TA');

-- update product json - 6602, 6603, 6604, 6605
UPDATE absnew.product SET productdefinition = '{"canOpen":"Yes","canDoTransaction":"Yes","canEnrollExistingAccount":"Yes","schemeDefinitionType":"TABLE","termInYear":[5],"monthlyPayment":[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],"oneTimePayment":null,"maturityAmount":[[69846,139692,209538,279384,349230,419076,488922,558768,628615,698460]],"isMonthlyPaymentMultiplier":false,"isOneTimePaymentMultiplier":false,"monthlyBenefitAfterMaturity":null,"monthlyBenefitAfterMaturityTerm":0,"IsMonthlyBenefitAfterMaturityMultiplier":false,"accountOpeningEligableDateRange":"1-15"}' WHERE "oid"='6602';

UPDATE absnew.product SET productdefinition = '{"canOpen":"Yes","canDoTransaction":"Yes","canEnrollExistingAccount":"Yes","schemeDefinitionType":"TABLE","termInYear":[10],"monthlyPayment":[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],"oneTimePayment":null,"maturityAmount":[[172084,344168,516252,688336,860420,1032504,1204588,1376672,1548756,1720840]],"isMonthlyPaymentMultiplier":false,"isOneTimePaymentMultiplier":false,"monthlyBenefitAfterMaturity":null,"monthlyBenefitAfterMaturityTerm":0,"IsMonthlyBenefitAfterMaturityMultiplier":false,"accountOpeningEligableDateRange":"1-15"}' WHERE "oid"='6603';

UPDATE absnew.product SET productdefinition = '{"canOpen":"Yes","canDoTransaction":"Yes","canEnrollExistingAccount":"Yes","schemeDefinitionType":"TABLE","termInYear":[5],"monthlyPayment":[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],"oneTimePayment":null,"maturityAmount":[[69846,139692,209538,279384,349230,419076,488922,558768,628615,698460]],"isMonthlyPaymentMultiplier":false,"isOneTimePaymentMultiplier":false,"monthlyBenefitAfterMaturity":null,"monthlyBenefitAfterMaturityTerm":0,"IsMonthlyBenefitAfterMaturityMultiplier":false,"accountOpeningEligableDateRange":"1-10"}'WHERE "oid"='6604';

UPDATE absnew.product SET productdefinition = '{"canOpen":"Yes","canDoTransaction":"Yes","canEnrollExistingAccount":"Yes","schemeDefinitionType":"TABLE","termInYear":[10],"monthlyPayment":[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],"oneTimePayment":null,"maturityAmount":[[172084,344168,516252,688336,860420,1032504,1204588,1376672,1548756,1720840]],"isMonthlyPaymentMultiplier":false,"isOneTimePaymentMultiplier":false,"monthlyBenefitAfterMaturity":null,"monthlyBenefitAfterMaturityTerm":0,"IsMonthlyBenefitAfterMaturityMultiplier":false,"accountOpeningEligableDateRange":"1-10"}' WHERE "oid"='6605';

-- Enable check constraint ck_producttype_product, ck_status_product
ALTER TABLE absnew.product ADD CONSTRAINT ck_status_product check (status = 'Active' or status = 'Inactive' or status = 'Closed');
ALTER TABLE absnew.product ADD CONSTRAINT ck_producttype_product check (producttype = 'SCHEME' or producttype = 'TIME' or producttype = 'SAVINGS' or producttype = 'CURRENT');

--	12	MetaProperty

-- migrate data from public to absnew
INSERT INTO absnew.MetaProperty (oid, propertyid, valuejson, description, createdby, createdon, updatedby, updatedon) (SELECT propertyid as oid, propertyid, valuejson, description, createdby, createdon, updatedby, updatedon FROM absold.MetaProperty);


--	13	DdlMetaData
-- Disable check constraint - status
ALTER TABLE absnew.DdlMetaData DROP CONSTRAINT  ck_status_DdlMetaData;

-- migrate data from public to absnew
INSERT INTO absnew.DdlMetaData (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon, updatedby, updatedon)(SELECT ddlmetadataid as oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon, updatedby, updatedon FROM absold.DdlMetaData);

-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive, BR=BankRejected, IE=Ineditable
UPDATE absnew.DdlMetaData SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active'WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('A', 'I','BM', 'BA','IE', 'BR');

-- Enable check constraint for status
ALTER TABLE absnew.DdlMetaData ADD CONSTRAINT ck_status_DdlMetaData check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');

--	14	GeoData

-- migrate data from public to absnew
INSERT INTO absnew.GeoData (oid, bbscode, divisioncode, districtcode, upazillacode, unioncode, divisionname, districtname, upazillaname, unionname, municipalityname, divisionname_bn, districtname_bn, upazillaname_bn, municipalityname_bn, version, createdby, createdon, updatedby, updatedon) (SELECT oid, bbscode, divisioncode, districtcode, upazillacode, unioncode, divisionname, districtname, upazillaname, unionname, municipalityname, divisionname_bn, districtname_bn, upazillaname_bn, municipalityname_bn, version, createdby, createdon, updatedby, updatedon FROM absold.GeoData);


--	15	Bank

-- Disable check constraint - status
ALTER TABLE absnew.Bank DROP CONSTRAINT  ck_status_bank;

-- migrate data from public to absnew
INSERT INTO absnew.Bank (oid, bankid, bankname, status, createdby, createdon, updatedby, updatedon) (SELECT bankid as oid, bankid, bankname, status, createdby, createdon, updatedby, updatedon FROM absold.Bank);

-- Update actionType value G=Generated, S=Submitted
UPDATE absnew.Bank  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'BR' THEN  'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('A', 'I', 'BM', 'BA', 'BR', 'IE');

-- Enable check constraint for status
ALTER TABLE absnew.Bank ADD CONSTRAINT ck_status_bank check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');

--	16	Branch

-- Disable check constraint - status
ALTER TABLE absnew.Branch DROP CONSTRAINT  ck_status_branch;

-- migrate data from public to absnew
INSERT INTO absnew.Branch (oid, branchid, bankoid, branchname, mnemonic, address, telephoneno, telephoneno2, email, nameofmanager, telephonenoofmanager, geolocationlat, geolocationlong, accountnoforchargemodel, status, rejectioncause, createdby, createdon, updatedby, updatedon) (SELECT branchid, branchid, bankid, branchname, mnemonic, address, telephoneno, telephoneno2, email, nameofmanager, telephonenoofmanager, geolocationlat, geolocationlong, accountnoforchargemodel, status, rejectioncause, createdby, createdon, updatedby, updatedon FROM absold.Branch);


-- Update actionType value G=Generated, S=Submitted
UPDATE absnew.Branch  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('A', 'I', 'BM', 'BA', 'BR', 'IE');

-- Enable check constraint for status
ALTER TABLE absnew.Branch ADD CONSTRAINT ck_status_branch check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');

--	17	Calendar

-- Disable check constraint - status
ALTER TABLE absnew.Calendar DROP CONSTRAINT  ck_status_calendar;

-- migrate data from public to absnew
INSERT INTO absnew.Calendar (oid, calendarid, calendaryear, calendarname, description, calendarjson, status, createdby, createdon, updatedby, updatedon) (SELECT calendarid as oid, calendarid, calendaryear, name, description, calendarjson, status, createdby, createdon, updatedby, updatedon FROM absold.Calendar);

-- Update actionType value G=Generated, S=Submitted
UPDATE absnew.Calendar SET status = CASE WHEN status = 'G' THEN 'Generated' WHEN status = 'S' THEN 'Submitted' ELSE status END  WHERE   status IN ('S', 'G');

-- Enable check constraint for status
ALTER TABLE absnew.Calendar ADD CONSTRAINT ck_status_calendar check (status = 'Submitted' or status = 'Generated');


--	18	CalendarDetails

-- Disable check constraint - status
ALTER TABLE absnew.CalendarDetails DROP CONSTRAINT  ck_status_CalendarDetails;

-- migrate data from public to absnew
INSERT INTO absnew.CalendarDetails (oid, calendardetailid, calendaroid, calendaryear, effectivedate, dayname, description, status, daynum, monthnum, starthour, startminute, endhour, endminute, createdby, createdon, updatedby, updatedon) (SELECT calendardetailid as oid, calendardetailid, calendarid, calendaryear, effectivedate, name, description, status, daynum :: integer, monthnum :: integer, starthour :: integer, startminute :: integer, endhour :: integer, endminute :: integer, createdby, createdon, updatedby, updatedon FROM absold.CalendarDetails);

-- Update status value WE=Weekend, HD=Holiday, WD=WorkingDay
UPDATE absnew.CalendarDetails  SET status = CASE WHEN status = 'WE' THEN 'Weekend' WHEN status = 'HD' THEN 'Holiday' WHEN status = 'WD' THEN 'WorkingDay' ELSE status END  WHERE   status IN ('WE', 'HD', 'WD');

-- Enable check constraint for statust
ALTER TABLE absnew.CalendarDetails ADD CONSTRAINT ck_status_CalendarDetails check (status = 'Weekend' or status = 'Holiday' or status = 'WorkingDay');


--	19	SegmentDef

-- Disable check constraint - isApplicable
ALTER TABLE absnew.SegmentDef DROP CONSTRAINT  ck_isApplicable_SegmentDef;

-- migrate data from public to absnew
INSERT INTO absnew.SegmentDef (oid, segmentid, mnemonic, description, isapplicable, codelength, orderincode, createdby, createdon, updatedby, updatedon) (SELECT segmentid as oid, segmentid, mnemonic, description, isapplicable, codelength, orderincode, createdby, createdon, updatedby, updatedon FROM absold.SegmentDef);

-- Update actionType value Y=Yes, N=No
UPDATE absnew.SegmentDef SET isapplicable = CASE WHEN isapplicable = 'Y' THEN 'Yes' WHEN isapplicable = 'N' THEN 'No'ELSE isapplicable END  WHERE   isapplicable IN ('Y', 'N');

-- Enable check constraint for isApplicable
ALTER TABLE absnew.SegmentDef ADD CONSTRAINT ck_isApplicable_SegmentDef check (isApplicable = 'Yes' or isApplicable = 'No');

--	20	SegmentItem

-- Disable check constraint - isApplicable
ALTER TABLE absnew.SegmentItem DROP CONSTRAINT  ck_isApplicable_SegmentItem;

-- migrate data from public to absnew
INSERT INTO absnew.SegmentItem (oid, segmentdefoid, itemid, mnemonic, description, isapplicable, createdby, createdon, updatedby, updatedon) (SELECT oid, segmentid, itemid, mnemonic, description, isapplicable, createdby, createdon, updatedby, updatedon FROM absold.SegmentItem);

-- Update isApplicable value Y=Yes, N=No
UPDATE absnew.SegmentItem  SET isapplicable = CASE WHEN isapplicable = 'Y' THEN 'Yes' WHEN isapplicable = 'N' THEN 'No' ELSE isapplicable END  WHERE   isapplicable IN ('Y', 'N');

-- Enable check constraint for isApplicable
ALTER TABLE absnew.SegmentItem ADD CONSTRAINT ck_isApplicable_SegmentItem check (isApplicable = 'Yes' or isApplicable = 'No');
