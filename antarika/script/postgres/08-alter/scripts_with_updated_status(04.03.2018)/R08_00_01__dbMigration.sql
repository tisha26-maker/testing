
--   01  AuditLog ---------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('AuditLog', 'AuditLog', current_timestamp, (select count(*) from absold.AuditLog));
-- Disable check constraint - actionType and actionSource
ALTER TABLE public.AuditLog DROP CONSTRAINT  ck_actiontype_auditlog;
ALTER TABLE public.AuditLog DROP CONSTRAINT  ck_actionsource_auditlog;

-- migrate data from public to absdata
INSERT INTO public.AuditLog SELECT * FROM absold.AuditLog;

-- Update actionType value I=Insert, E=Update, D =Delete and actionSource value U=User, S=System, A=Admin
UPDATE public.AuditLog SET actionType = CASE WHEN actionType = 'I' THEN 'Insert' WHEN actionType = 'E' THEN 'Update' WHEN actionType = 'D' THEN 'Delete' ELSE actionType END  WHERE   actionType IN ('I','E','D');

UPDATE public.AuditLog SET actionSource = CASE WHEN actionSource = 'U' THEN 'User' WHEN actionSource = 'S' THEN 'System' WHEN actionSource = 'A' THEN 'Admin'ELSE actionSource END  WHERE   actionSource IN ('U', 'S', 'A');


 -- Enable check constraint for actionType and actionSource
ALTER TABLE public.AuditLog ADD CONSTRAINT ck_actiontype_auditlog check (actionType = 'Insert' or actionType = 'Update' or actionType = 'Delete');
ALTER TABLE public.AuditLog ADD CONSTRAINT  ck_actionSource_AuditLog check (actionSource = 'User' or actionSource = 'System' or actionSource = 'Admin');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.AuditLog) where targetTable = 'AuditLog' and sourceTable = 'AuditLog';

--   02  Role ----------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Role', 'Role', current_timestamp, (select count(*) from absold.Role));
-- migrate data from public to absdata
INSERT INTO public.Role (oid, roleid, domain, roledescription, status, menujson, appmenujson, appreportjson, makerrole, checkerrole, approverrole, rejecterrole, activatorrole, deactivatorrole, blockerrole,unblockerrole,makeeditablerole, closerrole, rejectioncause, createdby, createdon, updatedby, updatedon) (SELECT roleid , roleid, domain, roledescription, status, menujson, appmenujson,appreportjson, makerrole, checkerrole, approverrole, rejecterrole,activatorrole, deactivatorrole, blockerrole, unblockerrole, makeeditablerole, closerrole, rejectioncause, createdby,createdon,updatedby, updatedon FROM absold.Role);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Role) where targetTable = 'Role' and sourceTable = 'Role';

--   03  TopMenu ---------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('TopMenu', 'TopMenu', current_timestamp, (select count(*) from absold.TopMenu));

-- migrate data from public to absdata
INSERT INTO public.topmenu(oid, topmenuresourceid, menudefaulttext, menusequence, createdby, createdon, updatedby, updatedon)(SELECT topmenuresourceid, topmenuresourceid,menudefaulttext,menusequence,createdby, createdon, updatedby, updatedon FROM absold.topmenu);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.TopMenu) where targetTable = 'TopMenu' and sourceTable = 'TopMenu';

--   04  LeftMenu --------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('LeftMenu', 'LeftMenu', current_timestamp, (select count(*) from absold.LeftMenu));

-- migrate data from public to absdata
INSERT INTO public.leftmenu (oid, leftMenuResourceId, topMenuOid, menuDefaultText,menuSequence,createdBy,createdOn,updatedBy,updatedOn)(SELECT leftMenuResourceId, leftMenuResourceId, topMenuid,menuDefaultText,menuSequence,createdBy,createdOn,updatedBy,updatedOn FROM absold.leftmenu);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.LeftMenu) where targetTable = 'LeftMenu' and sourceTable = 'LeftMenu';

--   05  LoginTrail -------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('LoginTrail', 'LoginTrail', current_timestamp, (select count(*) from absold.LoginTrail));

-- Disable check constraint ck_loginstatus_logintrail
ALTER TABLE public.LoginTrail DROP CONSTRAINT  ck_loginstatus_logintrail;

-- migrate data from public to absdata
INSERT INTO public.LoginTrail (oid, loginid, roleid, signintime, signouttime, machineip, loginstatus)(SELECT oid, loginid, roleid, signindate, signoutdate, machineip, loginstatus FROM absold.LoginTrail);

-- Enable check constraint for ck_loginstatus_logintrail
ALTER TABLE public.LoginTrail ADD CONSTRAINT ck_loginstatus_logintrail check (loginstatus = 'OK' or loginstatus = 'Logout' or loginstatus = 'Failed'or loginstatus = 'ALREADY_ID_BLOCK' or loginstatus ='BLOCK_ID' or loginstatus = 'UNBLOCK_IP' or loginstatus = 'BLOCK_IP' or loginstatus = 'ALREADY_IP_BLOCK');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.LoginTrail) where targetTable = 'LoginTrail' and sourceTable = 'LoginTrail';

--   06  Login --------------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Login', 'Login', current_timestamp, (select count(*) from absold.Login));
-- Disable check constraint

ALTER TABLE public.Login DROP CONSTRAINT  ck_status_login;
ALTER TABLE public.Login DROP CONSTRAINT  ck_resetRequired_login;


-- migrate data from public to absdata
INSERT INTO public.login (oid, loginid, password, email, mobileno, bankoid, branchoid, status, resetrequired, rolejson, blocktime, blockstatus, rejectioncause, username, designation, supervisorname,userphotopath, madeby, makerrole, approvedby, approverrole, approvedon, activatedby, activatorrole, activatedon, deactivatedby, deactivatorrole, deactivatedon, blockedby, blockerrole,blockedon, makeeditableby, makeeditablerole, rejectedby, rejectorrole, rejectedon, closedby, closerrole, closedon, createdby, createdon, updatedby, updatedon)(SELECT loginid, loginid, password,email, mobileno, bankid, branchid,status,resetrequired, rolejson, blocktime, blockstatus, rejectioncause, username, designation, supervisorname, userphotopath, madeby, makerrole, approvedby, approverrole, null, activateby, activatorrole, null, deactivatedby, deactivatorrole, null, blockedby, blockerrole, null, makeeditableby, makeeditablerole, rejectedby,rejectorrole, null, closedby, closerrole, null, createdby, createdon, updatedby, updatedon FROM absold.login);

UPDATE public.Login SET status = CASE WHEN status = 'BM' THEN 'BankMade'WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive'WHEN status = 'C' THEN 'Canceled' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable'ELSE status END  WHERE   status IN ('A', 'I','BM', 'BA','IE', 'BR', 'C');

UPDATE public.Login SET resetRequired = CASE WHEN resetRequired = 'Y' THEN 'Yes' WHEN resetRequired = 'N' THEN 'No'ELSE resetRequired END  WHERE   resetRequired IN ('Y', 'N');

-- Enable check constraint

ALTER TABLE public.Login ADD CONSTRAINT ck_status_login check (status = 'InEditable' or status = 'BankRejected' or status = 'Active' or status = 'Inactive' or status = 'BankMade' or status = 'BankApproved'or status ='Canceled');

ALTER TABLE public.Login ADD CONSTRAINT ck_resetRequired_login check (resetRequired = 'Yes' or resetRequired = 'No');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Login) where targetTable = 'Login' and sourceTable = 'Login';


--   07  GlMasterData --------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('GlMasterData', 'GlMasterData', current_timestamp, (select count(*) from absold.GlMasterData));

-- Disable check constraint - status
ALTER TABLE public.GlMasterData DROP CONSTRAINT  ck_status_GlMasterData;

-- migrate data from public to absdata
INSERT INTO public.GlMasterData (oid, glid, gltype, description, mnemonic, glno, status, rejectioncause, createdby, createdon, updatedby, updatedon) (SELECT glid as oid , glid, gltype, description, mnemonic, glno, status, rejectioncause, createdby, createdon, updatedby, updatedon FROM absold.GlMasterData);

-- Update status value Y=Yes, N=No
UPDATE public.GlMasterData SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved'WHEN status = 'A' THEN 'Active'WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR'  THEN 'BankRejected'WHEN status = 'IE' THEN 'InEditable'ELSE status END  WHERE   status IN ('A', 'I','BM', 'BA','IE', 'BR');

-- Enable check constraint for status
ALTER TABLE public.GlMasterData ADD CONSTRAINT ck_status_GlMasterData check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.GlMasterData) where targetTable = 'GlMasterData' and sourceTable = 'GlMasterData';

--   08  TagDictionary --------------------------------------------------------------------------
--  Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('TagDictionary', 'TagDictionary', current_timestamp, (select count(*) from absold.TagDictionary));

-- Disable check constraint - status
ALTER TABLE public.TagDictionary DROP CONSTRAINT  ck_status_TagDictionary;

-- migrate data from public to absdata
INSERT INTO public.TagDictionary (oid, tagdictionaryid, tagname, description, rejectioncause, status, createdby, createdon, updatedby, updatedon)(SELECT taglibid as oid, taglibid, name, description,rejectioncause, status, createdby, createdon, updatedby, updatedon FROM absold.TagDictionary);

-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive, BR=BankRejected, IE=Ineditable
UPDATE public.TagDictionary  SET status = CASE WHEN status = 'BM' THEN 'BankMade'WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('A', 'I','BM', 'BA','IE', 'BR');


-- Enable check constraint for status
ALTER TABLE public.TagDictionary ADD CONSTRAINT ck_status_TagDictionary check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.TagDictionary) where targetTable = 'TagDictionary' and sourceTable = 'TagDictionary';

--   09  TagLink --------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('TagLink', 'TagLink', current_timestamp, (select count(*) from absold.TagLink));
-- migrate data from public to absdata
INSERT INTO public.TagLink (oid, taglinkid, entityid, entitycode, tagliboid, createdby, createdon, updatedby, updatedon)(SELECT taglinkid as oid, taglinkid, entityid, entitycode, taglibid, createdby, createdon, updatedby, updatedon FROM absold.TagLink);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.TagLink) where targetTable = 'TagLink' and sourceTable = 'TagLink';

--   10  TagLinkDraft ----------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('TagLinkDraft', 'TagLinkDraft', current_timestamp, (select count(*) from absold.TagLinkDraft));
-- migrate data from public to absdata
INSERT INTO public.TagLinkDraft (oid, taglinkid, entityid, entitycode, tagliboid, createdby, createdon, updatedby, updatedon) (SELECT taglinkid as oid, taglinkid, entityid, entitycode, taglibid, createdby, createdon, updatedby, updatedon FROM absold.TagLinkDraft);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.TagLinkDraft) where targetTable = 'TagLinkDraft' and sourceTable = 'TagLinkDraft';

--   11  Product ---------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Product', 'Product', current_timestamp, (select count(*) from absold.Product));

-- Disable check constraint ck_producttype_product, ck_status_product
ALTER TABLE public.product DROP CONSTRAINT ck_producttype_product;
ALTER TABLE public.product DROP CONSTRAINT ck_status_product;

-- migrate data from public to absdata
INSERT INTO public.product (oid, productid, productname, producttype, productdefinition, status, rejectioncause,makerid, checkerid, approverid, createdby, createdon, updatedby, updatedon) (SELECT productid, productid, productname, producttype, productdefinition, status, rejectioncause, makerid, checkerid, approverid, createdby, createdon, updatedby, updatedon FROM absold.product);

-- Update status value A=Active, C= Closed I= Inactive
UPDATE public.product  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'C' THEN 'Closed' WHEN status = 'I' THEN 'Inactive' ELSE status END  WHERE   status IN ('A', 'C', 'I');

-- Update productType
UPDATE public.product SET productType = CASE WHEN productType = '1001' THEN 'CURRENT'WHEN productType = '6001' THEN 'SAVINGS' WHEN productType = '6002' THEN 'SAVINGS'ELSE 'SCHEME' END  WHERE   productType IN ('TA');

-- update product json - 6602, 6603, 6604, 6605
UPDATE public.product SET productdefinition = '{"canOpen":"Yes","canDoTransaction":"Yes","canEnrollExistingAccount":"Yes","schemeDefinitionType":"TABLE","termInYear":[5],"monthlyPayment":[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],"oneTimePayment":null,"maturityAmount":[[69846,139692,209538,279384,349230,419076,488922,558768,628615,698460]],"isMonthlyPaymentMultiplier":false,"isOneTimePaymentMultiplier":false,"monthlyBenefitAfterMaturity":null,"monthlyBenefitAfterMaturityTerm":0,"IsMonthlyBenefitAfterMaturityMultiplier":false,"accountOpeningEligableDateRange":"1-15"}' WHERE "oid"='6602';

UPDATE public.product SET productdefinition = '{"canOpen":"Yes","canDoTransaction":"Yes","canEnrollExistingAccount":"Yes","schemeDefinitionType":"TABLE","termInYear":[10],"monthlyPayment":[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],"oneTimePayment":null,"maturityAmount":[[172084,344168,516252,688336,860420,1032504,1204588,1376672,1548756,1720840]],"isMonthlyPaymentMultiplier":false,"isOneTimePaymentMultiplier":false,"monthlyBenefitAfterMaturity":null,"monthlyBenefitAfterMaturityTerm":0,"IsMonthlyBenefitAfterMaturityMultiplier":false,"accountOpeningEligableDateRange":"1-15"}' WHERE "oid"='6603';

UPDATE public.product SET productdefinition = '{"canOpen":"Yes","canDoTransaction":"Yes","canEnrollExistingAccount":"Yes","schemeDefinitionType":"TABLE","termInYear":[5],"monthlyPayment":[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],"oneTimePayment":null,"maturityAmount":[[69846,139692,209538,279384,349230,419076,488922,558768,628615,698460]],"isMonthlyPaymentMultiplier":false,"isOneTimePaymentMultiplier":false,"monthlyBenefitAfterMaturity":null,"monthlyBenefitAfterMaturityTerm":0,"IsMonthlyBenefitAfterMaturityMultiplier":false,"accountOpeningEligableDateRange":"1-10"}'WHERE "oid"='6604';

UPDATE public.product SET productdefinition = '{"canOpen":"Yes","canDoTransaction":"Yes","canEnrollExistingAccount":"Yes","schemeDefinitionType":"TABLE","termInYear":[10],"monthlyPayment":[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],"oneTimePayment":null,"maturityAmount":[[172084,344168,516252,688336,860420,1032504,1204588,1376672,1548756,1720840]],"isMonthlyPaymentMultiplier":false,"isOneTimePaymentMultiplier":false,"monthlyBenefitAfterMaturity":null,"monthlyBenefitAfterMaturityTerm":0,"IsMonthlyBenefitAfterMaturityMultiplier":false,"accountOpeningEligableDateRange":"1-10"}' WHERE "oid"='6605';

-- Enable check constraint ck_producttype_product, ck_status_product
ALTER TABLE public.product ADD CONSTRAINT ck_status_product check (status = 'Active' or status = 'Inactive' or status = 'Closed');
ALTER TABLE public.product ADD CONSTRAINT ck_producttype_product check (producttype = 'SCHEME' or producttype = 'TIME' or producttype = 'SAVINGS' or producttype = 'CURRENT');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Product) where targetTable = 'Product' and sourceTable = 'Product';

-- 12 MetaProperty -----------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('MetaProperty', 'MetaProperty', current_timestamp, (select count(*) from absold.MetaProperty));
-- migrate data from public to absdata
INSERT INTO public.MetaProperty (oid, propertyid, valuejson, description, createdby, createdon, updatedby, updatedon) (SELECT propertyid as oid, propertyid, valuejson, description, createdby, createdon, updatedby, updatedon FROM absold.MetaProperty);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.MetaProperty) where targetTable = 'MetaProperty' and sourceTable = 'MetaProperty';

-- 13 DdlMetaData -------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('DdlMetaData', 'DdlMetaData', current_timestamp, (select count(*) from absold.DdlMetaData));
-- Disable check constraint - status
ALTER TABLE public.DdlMetaData DROP CONSTRAINT  ck_status_DdlMetaData;

-- migrate data from public to absdata
INSERT INTO public.DdlMetaData (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon, updatedby, updatedon)(SELECT ddlmetadataid as oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon, updatedby, updatedon FROM absold.DdlMetaData);

-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive, BR=BankRejected, IE=Ineditable
UPDATE public.DdlMetaData SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active'WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('A', 'I','BM', 'BA','IE', 'BR');

-- Enable check constraint for status
ALTER TABLE public.DdlMetaData ADD CONSTRAINT ck_status_DdlMetaData check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.DdlMetaData) where targetTable = 'DdlMetaData' and sourceTable = 'DdlMetaData';

-- 14 GeoData --------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('GeoData', 'GeoData', current_timestamp, (select count(*) from absold.GeoData));

-- migrate data from public to absdata
INSERT INTO public.GeoData (oid, bbscode, divisioncode, districtcode, upazillacode, unioncode, divisionname, districtname, upazillaname, unionname, municipalityname, divisionname_bn, districtname_bn, upazillaname_bn, municipalityname_bn, version, createdby, createdon, updatedby, updatedon) (SELECT oid, bbscode, divisioncode, districtcode, upazillacode, unioncode, divisionname, districtname, upazillaname, unionname, municipalityname, divisionname_bn, districtname_bn, upazillaname_bn, municipalityname_bn, version, createdby, createdon, updatedby, updatedon FROM absold.GeoData);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.GeoData) where targetTable = 'GeoData' and sourceTable = 'GeoData';

-- 15 Bank -------------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Bank', 'Bank', current_timestamp, (select count(*) from absold.Bank));
-- Disable check constraint - status
ALTER TABLE public.Bank DROP CONSTRAINT  ck_status_bank;

-- migrate data from public to absdata
INSERT INTO public.Bank (oid, bankid, bankname, status, createdby, createdon, updatedby, updatedon) (SELECT bankid as oid, bankid, bankname, status, createdby, createdon, updatedby, updatedon FROM absold.Bank);

-- Update actionType value G=Generated, S=Submitted
UPDATE public.Bank  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'BR' THEN  'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('A', 'I', 'BM', 'BA', 'BR', 'IE');

-- Enable check constraint for status
ALTER TABLE public.Bank ADD CONSTRAINT ck_status_bank check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Bank) where targetTable = 'Bank' and sourceTable = 'Bank';

-- 16 Branch ------------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Branch', 'Branch', current_timestamp, (select count(*) from absold.Branch));

-- Disable check constraint - status
ALTER TABLE public.Branch DROP CONSTRAINT  ck_status_branch;

-- migrate data from public to absdata
INSERT INTO public.Branch (oid, branchid, bankoid, branchname, mnemonic, address, telephoneno, telephoneno2, email, nameofmanager, telephonenoofmanager, geolocationlat, geolocationlong, accountnoforchargemodel, status, rejectioncause, createdby, createdon, updatedby, updatedon) (SELECT branchid, branchid, bankid, branchname, mnemonic, address, telephoneno, telephoneno2, email, nameofmanager, telephonenoofmanager, geolocationlat, geolocationlong, accountnoforchargemodel, status, rejectioncause, createdby, createdon, updatedby, updatedon FROM absold.Branch);


-- Update actionType value G=Generated, S=Submitted
UPDATE public.Branch  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('A', 'I', 'BM', 'BA', 'BR', 'IE');

-- Enable check constraint for status
ALTER TABLE public.Branch ADD CONSTRAINT ck_status_branch check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'BankRejected' or status = 'InEditable');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Branch) where targetTable = 'Branch' and sourceTable = 'Branch';

-- 17 Calendar ----------------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Calendar', 'Calendar', current_timestamp, (select count(*) from absold.Calendar));
-- Disable check constraint - status
ALTER TABLE public.Calendar DROP CONSTRAINT  ck_status_calendar;

-- migrate data from public to absdata
INSERT INTO public.Calendar (oid, calendarid, calendaryear, calendarname, description, calendarjson, status, createdby, createdon, updatedby, updatedon) (SELECT calendarid as oid, calendarid, calendaryear, name, description, calendarjson, status, createdby, createdon, updatedby, updatedon FROM absold.Calendar);

-- Update actionType value G=Generated, S=Submitted
UPDATE public.Calendar SET status = CASE WHEN status = 'G' THEN 'Generated' WHEN status = 'S' THEN 'Submitted' ELSE status END  WHERE   status IN ('S', 'G');

-- Enable check constraint for status
ALTER TABLE public.Calendar ADD CONSTRAINT ck_status_calendar check (status = 'Submitted' or status = 'Generated');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Calendar) where targetTable = 'Calendar' and sourceTable = 'Calendar';

--	18	CalendarDetails ----------------------------------------------------------------------
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('CalendarDetails', 'CalendarDetails', current_timestamp, (select count(*) from absold.CalendarDetails));

-- Disable check constraint - status
ALTER TABLE public.CalendarDetails DROP CONSTRAINT  ck_status_CalendarDetails;

-- migrate data from public to absdata
INSERT INTO public.CalendarDetails (oid, calendardetailid, calendaroid, calendaryear, effectivedate, dayname, description, status, daynum, monthnum, starthour, startminute, endhour, endminute, createdby, createdon, updatedby, updatedon) (SELECT calendardetailid as oid, calendardetailid, calendarid, calendaryear, effectivedate, name, description, status, daynum :: integer, monthnum :: integer, starthour :: integer, startminute :: integer, endhour :: integer, endminute :: integer, createdby, createdon, updatedby, updatedon FROM absold.CalendarDetails);

-- Update status value WE=Weekend, HD=Holiday, WD=WorkingDay
UPDATE public.CalendarDetails  SET status = CASE WHEN status = 'WE' THEN 'Weekend' WHEN status = 'HD' THEN 'Holiday' WHEN status = 'WD' THEN 'WorkingDay' ELSE status END  WHERE   status IN ('WE', 'HD', 'WD');

-- Enable check constraint for statust
ALTER TABLE public.CalendarDetails ADD CONSTRAINT ck_status_CalendarDetails check (status = 'Weekend' or status = 'Holiday' or status = 'WorkingDay');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.CalendarDetails) where targetTable = 'CalendarDetails' and sourceTable = 'CalendarDetails';

--	19	SegmentDef -----------------------------------------------------------------------------
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('SegmentDef', 'SegmentDef', current_timestamp, (select count(*) from absold.SegmentDef));

-- Disable check constraint - isApplicable
ALTER TABLE public.SegmentDef DROP CONSTRAINT  ck_isApplicable_SegmentDef;

-- migrate data from public to absdata
INSERT INTO public.SegmentDef (oid, segmentid, mnemonic, description, isapplicable, codelength, orderincode, createdby, createdon, updatedby, updatedon) (SELECT segmentid as oid, segmentid, mnemonic, description, isapplicable, codelength, orderincode, createdby, createdon, updatedby, updatedon FROM absold.SegmentDef);

-- Update actionType value Y=Yes, N=No
UPDATE public.SegmentDef SET isapplicable = CASE WHEN isapplicable = 'Y' THEN 'Yes' WHEN isapplicable = 'N' THEN 'No'ELSE isapplicable END  WHERE   isapplicable IN ('Y', 'N');

-- Enable check constraint for isApplicable
ALTER TABLE public.SegmentDef ADD CONSTRAINT ck_isApplicable_SegmentDef check (isApplicable = 'Yes' or isApplicable = 'No');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.SegmentDef) where targetTable = 'SegmentDef' and sourceTable = 'SegmentDef';

--	20	SegmentItem -------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('SegmentItem', 'SegmentItem', current_timestamp, (select count(*) from absold.SegmentItem));
-- Disable check constraint - isApplicable
ALTER TABLE public.SegmentItem DROP CONSTRAINT  ck_isApplicable_SegmentItem;

-- migrate data from public to absdata
INSERT INTO public.SegmentItem (oid, segmentdefoid, itemid, mnemonic, description, isapplicable, createdby, createdon, updatedby, updatedon) (SELECT oid, segmentid, itemid, mnemonic, description, isapplicable, createdby, createdon, updatedby, updatedon FROM absold.SegmentItem);

-- Update isApplicable value Y=Yes, N=No
UPDATE public.SegmentItem  SET isapplicable = CASE WHEN isapplicable = 'Y' THEN 'Yes' WHEN isapplicable = 'N' THEN 'No' ELSE isapplicable END  WHERE   isapplicable IN ('Y', 'N');

-- Enable check constraint for isApplicable
ALTER TABLE public.SegmentItem ADD CONSTRAINT ck_isApplicable_SegmentItem check (isApplicable = 'Yes' or isApplicable = 'No');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.SegmentItem) where targetTable = 'SegmentItem' and sourceTable = 'SegmentItem';















