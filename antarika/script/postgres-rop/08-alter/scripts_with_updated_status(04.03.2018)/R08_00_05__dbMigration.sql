--	59	Remittance
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Remittance', 'Remittance', current_timestamp, (select count(*) from absold.Remittance));
-- Disable check constraint for status
ALTER TABLE public.Remittance DROP CONSTRAINT ck_status_remittance;
ALTER TABLE public.Remittance DROP CONSTRAINT ck_photoidtype_remittance;
ALTER TABLE public.Remittance DROP CONSTRAINT fk_agentoid_remittance;

-- migrate data from public to absdata
INSERT INTO public.Remittance (oid, ifrid, pin, ttnumber, photoid, photoidtype, photoidfrontpath, photoidbackpath,
recipientname, recipientmobileno, recipientemail, recipientphotopath, sendername, sendercountry, applicationdate,
amount, actualamountinbdt, exhouseoid, branchexhouseoid, disbursedon, creditedaccount, debitedaccount, csbrequestid,
cbsreferenceno, traceid, makeeditableremarks, remarks, lockedby, lockedon, lockstatus, status, bankoid, branchoid,
agentoid, servicepointoid, serviceterminaloid, isapproverremarks, approverremarks, editedby, editedon,
dataupdatedby, dataupdatedon, updateactivityseconds, approvedby, approvedon, approvalactivityseconds, createdby, createdon)
(SELECT ifrid, ifrid, pin, ttnumber, photoid, photoidtype, photoidfrontpath, photoidbackpath, recipientname, recipientmobileno,
recipientemail,  recipientphotopath, sendername, sendercountry,  applicationdate, amount, actualamountinbdt,
exhouseid, null, disbursedon, creditedaccount, debitedaccount, csbrequestid, null, traceid, null, null, null, null, null, status,
bankid, branchid, agentid, servicepointid, null, null, null, updatedby, updatedon, null, null, null, null, null, null, createdby, createdon FROM absold.Remittance);


-- Update status value
UPDATE public.Remittance
SET status = CASE
WHEN status = 'BR' THEN 'BankRejected'
WHEN status = 'IE' THEN 'InEditable'
WHEN status = 'BM' THEN 'BankMade'
WHEN status = 'P' THEN 'Pending'
WHEN status = 'BA' THEN 'BankApproved'
WHEN status = 'C' THEN 'Cancel'
WHEN status = 'AS' THEN 'ApplicationSubmitted'
ELSE status END;

-- Update photoidtype value
UPDATE public.Remittance
SET photoidtype = CASE
WHEN photoidtype = 'BIRTH CERT' THEN 'BirthCertificate'
WHEN photoidtype = 'Passport No' THEN 'PassportNo'
WHEN photoidtype = 'PASSPORT' THEN 'PassportNo'
WHEN photoidtype = '4617580669' THEN 'DrivingLicense'
WHEN photoidtype = '8510388275884' THEN 'DrivingLicense'
WHEN photoidtype = 'NID' THEN 'NID'
ELSE photoidtype END;

-- Update agent oid
update public.Remittance r
set agentoid = (select oid from public.agent a where r.agentoid = a.loginid);

-- Enable check constraint for status
ALTER TABLE public.Remittance ADD CONSTRAINT ck_status_remittance check (status = 'ApplicationSubmitted' or status = 'DataUpdated'
or status = 'InEditable' or status = 'BankApproved' or status = 'ApplicationRejected' or status = 'BankMade' or status = 'Pending' or status = 'Disbursed'
or status = 'Close' or status = 'OK' or status = 'Failed' or status = 'Cancel' or status = 'BankRejected');

-- Enable check constraint for photoidtype
ALTER TABLE public.Remittance ADD CONSTRAINT ck_photoidtype_remittance check (photoidtype = 'NID' or photoidtype = 'PassportNo' or photoidtype = 'BirthCertificate' or photoidtype = 'DrivingLicense');

-- Enable fk constraint for agent oid
alter table public.remittance add constraint fk_agentoid_remittance foreign key (agentoid) references public.agent(oid);

-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Remittance) where targetTable = 'Remittance' and sourceTable = 'Remittance';


-- ===========================================================================================================================================================================================
-- Update bank oid 101 to 010
insert into public.bank
(oid, bankid, bankname, status, createdby, createdon, updatedby, updatedon)
values('010', '010', 'Agrani Bank Limited', 'Active', 'agentbanking', '2016-05-30 00:00:00.000', NULL, NULL);

update public.Branch set bankoid = '010';
update public.DraftAgent set bankoid = '010';
update public.Agent set bankoid = '010';
update public.DraftAgentServiceStaff set bankoid = '010';
update public.DraftServicePoint set bankoid = '010';
update public.ServicePoint set bankoid = '010';
update public.ServiceTerminal set bankoid = '010';
update public.AgentServiceStaff set bankoid = '010';
update public.Customer set bankoid = '010';
update public.Account set bankoid = '010';
update public.TransLog set bankoid = '010';
update public.Gasbillcollection set bankoid = '010';
update public.Remittance set bankoid = '010';
update public.Unauthserviceterminal set bankoid = '010';

delete from public.bank where oid = '101';

-- Update app menu json
update public.role set appmenujson = '[{"menuId":"SearchAccountForActivationActivity","menuIcon":"vector_ic_new_account","menuText":"Activate Account","subMenu":[]}]' where oid = 'DOER.OP.BDO';
update public.role set appmenujson = '[{"menuID":"AgentStaffEnrollment","menuText":"Agent Staff FP Enrollment","active":true},{"menuID":"AgentTools","menuText":"Tools","active":true}]' where oid = 'AGENT.OWNER';
update public.role set appmenujson = '[{"menuId":"","menuIcon":"vector_ic_customer_and_account","menuText":"Customer & Account","subMenu":[{"menuId":"","menuIcon":"vector_ic_new_account","menuText":"New Account","subMenu":[{"menuId":"SearchByPhotoIDActivity","menuIcon":"vector_ic_personal_account","menuText":"Personal","subMenu":[]}]},{"menuId":"AdditionalAccountSearchByPhotoIDActivity","menuIcon":"vector_ic_additional_account","menuText":"Additional Account","subMenu":[]},{"menuId":"CustomerSearchActivity","menuIcon":"vector_ic_joint_account","menuText":"Joint Account","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_transaction","menuText":"Transaction","subMenu":[{"menuId":"","menuIcon":"vector_ic_cash_deposit","menuText":"Cash Deposit","subMenu":[{"menuId":"CashDepositActivity","menuIcon":"vector_ic_cash_deposit_self","menuText":"Cash Deposit","subMenu":[]},{"menuId":"CashDepositActivity","menuIcon":"vector_ic_cash_deposit_bearer","menuText":"Bearer Deposit","subMenu":[]}]},{"menuId":"CashWithdrawActivity","menuIcon":"vector_ic_cash_withdraw","menuText":"Cash Withdrawal","subMenu":[]},{"menuId":"FundTransferActivity","menuIcon":"vector_ic_fund_transfer","menuText":"Fund Transfer","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_enquiry","menuText":"Enquiry","subMenu":[{"menuId":"BalanceEnquiryActivity","menuIcon":"vector_ic_balance_enquiry","menuText":"Balance Enquiry","subMenu":[]},{"menuId":"MiniStatementActivity","menuIcon":"vector_ic_mini_statement","menuText":"Mini Statement","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_remittance","menuText":"Remittance","subMenu":[{"menuId":"RemittanceRequestActivity","menuIcon":"vector_ic_customer_and_account","menuText":"Remittance Request","subMenu":[]},{"menuId":"RemittanceRequestSearchByPinActivity","menuIcon":"vector_ic_transaction","menuText":"Remittance Withdrawal","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_billcollection","menuText":"Bill Collection","subMenu":[{"menuId":"REBCompanyListActivity","menuIcon":"vector_ic_reb","menuText":"REB (Rural Electricity Board)","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_agent_tools","menuText":"Tools","subMenu":[{"menuId":"AgentToolsActivity","menuIcon":"vector_ic_agent_balance","menuText":"Agent Tools","subMenu":[]}]}]' where oid = 'AGENT.TELLER';
update public.role set appmenujson = '[{"menuId":"SearchAccountForActivationActivity","menuIcon":"vector_ic_new_account","menuText":"Activate Account","subMenu":[]},{"menuId":"","menuIcon":"vector_ic_re_enrollment_fingerprint","menuText":"Existing Customer Enrollment","subMenu":[{"menuId":"ExistingPersonalCustomerEnrollmentSearchActivity","menuIcon":"vector_ic_re_enrollment_fingerprint_personal","menuText":"Personal","subMenu":[]}]}]' where oid = 'BRANCH.MAKER';

-- Update image path
update public.person set 
photopath = '/var/log/csb/data/localphotoserver/customer/' || split_part(photopath, '/', 10),
photoidpathfront = '/var/log/csb/data/localphotoserver/customer/' || split_part(photoidpathfront, '/', 11),
photoidpathback = '/var/log/csb/data/localphotoserver/customer/' || split_part(photoidpathback, '/', 11)
where  split_part(photopath, '/', 3) = 'lib';

-- update remittance
UPDATE public.remittance SET disbursedon = absold.remittance.dateofexchange FROM absold.remittance WHERE absold.remittance.pin = public.remittance.pin; 
UPDATE public.remittance SET branchexhouseoid = absold.remittance.exhouseid FROM absold.remittance WHERE absold.remittance.pin = public.remittance.pin; 

update public.customer set introducerBankAccountNo='' where introducerBankAccountNo is null; 
update public.customer set introducercustomerid='' where introducercustomerid is null; 
update public.person set photoidissuancedate=current_timestamp where photoidissuancedate is null; 
update public.person set ismobilenoverified = 'No' where ismobilenoverified is null; 
update public.person set photoidpathfront = '' where photoidpathfront is null; 
update public.person set photoidpathback = '' where photoidpathback is null; 
delete from public.ddlmetadata; 
--for updated data please pick from absprod database 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('102', '102', 'Title', '{"DDL_Type":"DDL-2", "Name":"Title", "DDLList":[ {"ID":"MR","name":"Mr.","sortOrder":0}, {"ID":"MS","name":"Ms.","sortOrder":1}, {"ID":"MRS","name":"Mrs.","sortOrder":2}, {"ID":"PROF","name":"Prof.","sortOrder":3} , {"ID":"DR","name":"Dr.","sortOrder":4}]}', 'Active', 'Different types of title', 'Admin', current_date); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('103', '103', 'Gender', '{"DDL_Type":"DDL-3","Name":"Gender","DDLList":[{"ID":"Male","name":"MALE","sortOrder":0},{"ID":"Female","name":"FEMALE","sortOrder":1},{"ID":"Other","name":"OTHER","sortOrder":2}]}', 'Active', 'Different types of gender', 'Admin', current_date); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('104', '104', 'MaritalStatus', '{"DDL_Type":"DDL-4","Name":"Marital Status","DDLList":[{"ID":"Married","name":"MARRIED","sortOrder":0},{"ID":"Single","name":"SINGLE","sortOrder":1},{"ID":"Divorced","name":"DIVORCED","sortOrder":2},{"ID":"Partner","name":"PARTNER","sortOrder":3},{"ID":"Widowed","name":"WIDOWED","sortOrder":4},{"ID":"Other","name":"OTHER","sortOrder":5}]}', 'Active', 'Different types of marital status', 'Admin', current_date); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('105', '105', 'PhotoIdType', '{"DDL_Type":"DDL-5","Name":"Photo Id Type","DDLList":[{"ID":"NID","name":"NID","sortOrder":0},{"ID":"PassportNo","name":"PASSPORT","sortOrder":1},{"ID":"DrivingLicence","name":"DRIVING LICENCE","sortOrder":2},{"ID":"BirthCertificate","name":"BIRTH CERTIFICATE","sortOrder":3}]}', 'Active', 'Different types of photo id', 'Admin', current_date); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('106', '106', 'LegalIdType', '{"DDL_Type":"DDL-6", "Name":"Legal Id Type", "DDLList":[ {"ID":"TRADE_LICENSE","name":"TRADE LICENSE","sortOrder":0}]}', 'Active', 'Different types of Legal id', 'Admin', current_timestamp); insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('107', '107', 'NomineeRelation', '{"DDL_Type":"DDL-7", "Name":"Nominee Relation", "DDLList":[ {"ID":"1","name":"AUNTY","sortOrder":0}, {"ID":"2","name":"BROTHER","sortOrder":1}, {"ID":"3","name":"DAUGHTER","sortOrder":2}, {"ID":"4","name":"FATHER","sortOrder":3}, {"ID":"5","name":"GRAND FATHER","sortOrder":4}, {"ID":"6","name":"GRAND MOTHER","sortOrder":5}, {"ID":"7","name":"HUSBAND","sortOrder":6},{"ID":"8","name":"MOTHER","sortOrder":7}, {"ID":"9","name":"OTHERS","sortOrder":8},{"ID":"10","name":"SISTER","sortOrder":9}, {"ID":"11","name":"SON","sortOrder":10}, {"ID":"12","name":"UNCLE","sortOrder":11},{"ID":"13","name":"WIFE","sortOrder":12}]}', 'Active', 'Different types of relation', 'Admin', current_timestamp); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('108', '108', 'JointHolderRelation', '{"DDL_Type":"DDL-8", "Name":"Joint Holder Relation", "DDLList":[ {"ID":"1","name":"Head Office - Branch","sortOrder":0}, {"ID":"2","name":"Group Company - Group Company","sortOrder":1}, {"ID":"3","name":"Spouse - Spouse","sortOrder":2}, {"ID":"4","name":"Parent - Child","sortOrder":3}, {"ID":"5","name":"Sibling - Sibling","sortOrder":4}, {"ID":"9","name":"Same Owner - Same Owner","sortOrder":5}, {"ID":"10","name":"Branch - Head Office","sortOrder":6},{"ID":"12","name":"Group Company - Group Company","sortOrder":7}, {"ID":"13","name":"Spouse - Spouse","sortOrder":8},{"ID":"14","name":"Child - Parent","sortOrder":9}, {"ID":"15","name":"Sibling - Sibling","sortOrder":10}, {"ID":"16","name":"Subsidiary Company - Holding Company","sortOrder":11},{"ID":"17","name":"Sister Concern - Sister Concern","sortOrder":12}, {"ID":"18","name":"Associate Company - Wife","sortOrder":13},{"ID":"19","name":"Wife - Associate","sortOrder":14},{"ID":"20","name":"Holding Company - Subsidiary","sortOrder":15},{"ID":"21","name":"Sister Concern - Sister Concern","sortOrder":16}, {"ID":"99","name":"Same Owner - Same Owner","sortOrder":17}]}', 'Active', 'Different types of joint holder relation', 'Admin', current_timestamp); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('109', '109', 'SectorType', '{"DDL_Type":"DDL-9","Name":"Sector Type","DDLList":[{"ID":"1000","name":"BD NATIONAL","sortOrder":0},{"ID":"1001","name":"FOREIGN NATIONAL","sortOrder":1},{"ID":"1002","name":"STAFF","sortOrder":2},{"ID":"1003","name":"NON RESIDENT BANGLADESHI(NRB)","sortOrder":3},{"ID":"1004","name":"SENIOR CITIZEN","sortOrder":4},{"ID":"1500","name":"BROKERS","sortOrder":5},{"ID":"1501","name":"FUTURE USE","sortOrder":6},{"ID":"1600","name":"CLEARING AGENTS","sortOrder":7},{"ID":"1602","name":"SECURITY DEPOSITORY","sortOrder":9},{"ID":"2000","name":"AGRI & FISHING","sortOrder":10},{"ID":"2001","name":"LARGE SCALE MANUFACTURING","sortOrder":11},{"ID":"2002","name":"MEDIUM SCALE MANUFACTURING","sortOrder":12},{"ID":"2003","name":"FOREIGN ENTERPRISE,COMPANY,FIRM","sortOrder":13},{"ID":"2004","name":"SMALL SCALE MANUFACTURING","sortOrder":14},{"ID":"2005","name":"EXPORT-RMG","sortOrder":15},{"ID":"2006","name":"EXPORT-OTHER","sortOrder":16},{"ID":"2007","name":"WHOLESALE & RETAIL TRADE","sortOrder":17},{"ID":"2008","name":"OTHER PRIVATE BUSINESS ORGANISATION","sortOrder":18},{"ID":"2050","name":"EPZ BUSINESS","sortOrder":19},{"ID":"2999","name":"CORPORATES","sortOrder":20},{"ID":"3001","name":"COMMERCIAL BANKS FOREIGN","sortOrder":21},{"ID":"3002","name":"CENTRAL BANK","sortOrder":22},{"ID":"3003","name":"COMMERCIAL BANKS LOCAL","sortOrder":23},{"ID":"3004","name":"EXCHANGE HOUSE","sortOrder":24},{"ID":"3005","name":"ABL BRANCH","sortOrder":25},{"ID":"3500","name":"FINANCIAL INSTITUTIONS","sortOrder":26},{"ID":"3501","name":"PRIVATE FINANCIAL COMPANY","sortOrder":27},{"ID":"3900","name":"OTHER FINANCIAL INSTITUTIONS","sortOrder":29},{"ID":"4000","name":"PUBLIC SECTOR","sortOrder":30},{"ID":"4001","name":"GOVERNMENT OFFICE","sortOrder":31},{"ID":"4002","name":"AUTONOMOUS BODY","sortOrder":32},{"ID":"4003","name":"PUBLIC CORPORATION","sortOrder":33},{"ID":"4601","name":"NON PROFIT ORGANIZATION","sortOrder":34},{"ID":"4701","name":"NON GOVERNMENT ORGANIZATION(NGO)","sortOrder":35},{"ID":"5000","name":"INTERNATIONAL ORGANISATIONS","sortOrder":36},{"ID":"5001","name":"UNITED NATIONS","sortOrder":37},{"ID":"5002","name":"UNESCO","sortOrder":38},{"ID":"5003","name":"FOREIGN GOVERNMENT & EMBASSIES","sortOrder":39},{"ID":"5006","name":"FOREIGN OFFICER,ORGANIZATION","sortOrder":40},{"ID":"5999","name":"OTHER INTERNATIONAL ORGANISATIONS","sortOrder":41},{"ID":"7001","name":"LOCAL CARD","sortOrder":42},{"ID":"7002","name":"INTERNATIONAL CARD","sortOrder":43},{"ID":"7003","name":"OTHER BANKS CARD","sortOrder":44},{"ID":"9000","name":"OTHER","sortOrder":45}]}', 'Active', 'Different types of sector id', 'Admin', current_date); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('110', '110', 'Target', '{"DDL_Type":"DDL-10","Name":"Target","DDLList":[{"ID":"1","name":"PRIVATE CLIENT - STANDARD","sortOrder":0},{"ID":"2","name":"PRIVATE CLIENT - HIGH NETWORTH","sortOrder":1},{"ID":"6","name":"BLUE CHIP COMPANY","sortOrder":2},{"ID":"7","name":"CORPORATE ENTITY","sortOrder":3},{"ID":"10","name":"HOTLISTED","sortOrder":4},{"ID":"20","name":"PORTFOLIO HOLDER","sortOrder":5},{"ID":"30","name":"BANKS","sortOrder":6},{"ID":"50","name":"GOVERNMENT","sortOrder":7},{"ID":"999","name":"OTHERS","sortOrder":9},{"ID":"9999","name":"T24 UPDATES","sortOrder":10}]}', 'Active', 'Different types of target id', 'Admin', current_date); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('111', '111', 'ECO.PURPOSE.CODE', '{"DDL_Type":"DDL-11","Name":"ECO.PURPOSE.CODE","DDLList":[{"ID":"1101","name":"FOOD CROPS (PADDY, WHEAT, POTATO, MAIZE ETC)","sortOrder":0},{"ID":"1102","name":"CASH CROPS (JUTE, COTTON, TOBACCO, SUGARCANE ETC)","sortOrder":1},{"ID":"1103","name":"LENTILS (MUG, MASUR, KALAI ETC)","sortOrder":2},{"ID":"1104","name":"OIL SEEDS (SAYABEEN, MASTERED OIL, PEANUT ETC)","sortOrder":3},{"ID":"1105","name":"SPICES(ONION, GARLIC, ZINGER ETC)","sortOrder":4},{"ID":"1107","name":"VEGETABLES","sortOrder":5},{"ID":"9900","name":"----NOT USED-----","sortOrder":6}]}', 'Active', 'Different types of Eco perpuse code id', 'Admin', current_date); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('112', '112', 'FBNK.INDUSTRY', '{"DDL_Type":"DDL-12","Name":"FBNK.INDUSTRY","DDLList":[{"ID":"1000","name":"PRIVATE PERSON (NAME)","sortOrder":0},{"ID":"1100","name":"PRIVATE PERSON (NUMBERED)","sortOrder":1},{"ID":"1200","name":"STAFF","sortOrder":2},{"ID":"1600","name":"NON-PROFIT INSTITUTIONS","sortOrder":3},{"ID":"1700","name":"PROPERTY SERVICES","sortOrder":4}]}', 'Active', 'Different types of Bank industry id', 'Admin', current_date); 
insert into public.ddlmetadata (oid, ddlmetadataid, ddlkey, valuejson, status, description, createdby, createdon) VALUES('113', '113', 'CB.SECTOR.CODE', '{"DDL_Type":"DDL-13","Name":"CB.SEC.CODE","DDLList":[{"ID":"911000","name":"Pvt>Wearn>Wearn-Lcl>Wage & Salary Earners (wrkg in the country)","sortOrder":0},{"ID":"111000","name":"PUB>GOVT>FOOD-MIN>FOOD MINISTRY","sortOrder":1},{"ID":"112001","name":"DIRECTORATE OF HEALTH","sortOrder":2},{"ID":"112002","name":"DIRECTORATE OF RELIEF AND REHABILITATION","sortOrder":3},{"ID":"112003","name":"DIRECTORATE OF PRIMARY EDUCATION","sortOrder":4},{"ID":"112004","name":"DIRECTORATE OF NATIONAL SAVINGS","sortOrder":5},{"ID":"112005","name":"DIRECTORATE OF JUTE","sortOrder":6}]}', 'Active', 'Different types of CB sector code id', 'Admin', current_date); 
update public.customer set customerType='PERSONAL CUSTOMER' where customerType='INDIVIDUAL';


