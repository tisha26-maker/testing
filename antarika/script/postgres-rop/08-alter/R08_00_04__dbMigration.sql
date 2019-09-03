

--	42	CustomerAccount

-- Disable column required constraint
ALTER TABLE absnew.CustomerAccount DROP CONSTRAINT ck_isbiometricenable_customeraccount;
ALTER TABLE absnew.CustomerAccount DROP CONSTRAINT ck_ismandatorybiometric_customeraccount;

-- migrate data from public to absnew
INSERT INTO absnew.CustomerAccount (oid, customeroid, accountoid, customeraccountrelation, ismandatorybiometric, isbiometricenable)(SELECT customerid || accountid, customerid, accountid, 'PERSONAL_CUSTOMER', ismandatorybiometric, isbiometricenable FROM absold.CustomerAccount);

-- Update ismandatorybiometric isbiometricenable value
UPDATE absnew.CustomerAccount  SET ismandatorybiometric = CASE WHEN ismandatorybiometric = 'Y' THEN 'Yes' WHEN ismandatorybiometric = 'N' THEN 'No' ELSE ismandatorybiometric END  WHERE ismandatorybiometric IN ('Y', 'N');

UPDATE absnew.CustomerAccount  SET isbiometricenable = CASE WHEN isbiometricenable = 'Y' THEN 'Yes' WHEN isbiometricenable = 'N' THEN 'No' ELSE isbiometricenable END  WHERE   isbiometricenable IN ('Y','N');


-- Enable column required constraint
ALTER TABLE absnew.CustomerAccount ADD CONSTRAINT ck_ismandatorybiometric_customeraccount check (ismandatorybiometric = 'Yes' or ismandatorybiometric = 'No');
ALTER TABLE absnew.CustomerAccount ADD CONSTRAINT ck_isbiometricenable_customeraccount check (isbiometricenable = 'Yes' or isbiometricenable = 'No');


--	43	CustomerQrCard

-- Disable check constraint cardstatus
ALTER TABLE absnew.CustomerQrCard DROP CONSTRAINT ck_cardstatus_customerqrcard;
ALTER TABLE absnew.CustomerQrCard DROP CONSTRAINT ck_accountstatus_customerqrcard;
ALTER TABLE absnew.CustomerQrCard DROP CONSTRAINT ck_generatedas_customerqrcard;

-- migrate data from public to absnew
INSERT INTO absnew.CustomerQrCard (oid, accountid, requestdate, pdffilename, pdfgenerationdate, pdfgeneratedby, pdfdownloadedon, pdfdownloadedby, accountstatus, generatedas, remarks, cardstatus, createdby, createdon, updatedby, updatedon) (SELECT oid, accountid, requestdate, pdffilename, pdfgenerationdate, pdfgeneratedby, pdfdownloadedon, pdfdownloadedby, accountstatus, generatedas, remarks, cardstatus, createdby, createdon, updatedby, updatedon FROM absold.CustomerQrCard);

-- Update cardstatus accountstatus generatedas
UPDATE absnew.CustomerQrCard  SET cardstatus = CASE WHEN cardstatus = 'G' THEN 'Generated' WHEN cardstatus = 'D' THEN 'Downloaded' ELSE cardstatus END  WHERE   cardstatus IN ('G', 'D');

UPDATE absnew.CustomerQrCard  SET generatedas = CASE WHEN generatedas = 'BA' THEN 'Batch' WHEN generatedas = 'S' THEN 'Single' ELSE generatedas END  WHERE   generatedas IN ('BA', 'S');

UPDATE absnew.CustomerQrCard SET accountstatus = CASE WHEN accountstatus = 'AS' THEN 'ApplicationSubmitted' WHEN accountstatus = 'DU' THEN 'DataUpdated' WHEN accountstatus = 'BA' THEN 'BankApproved' 	WHEN accountstatus = 'I' THEN 'Inactive' WHEN accountstatus = 'A' THEN 'Active' WHEN accountstatus = 'C' THEN 'Closed' WHEN accountstatus = 'D' THEN 'Deleted' WHEN accountstatus = 'H' THEN 'Hold' WHEN accountstatus = 'AR' THEN 'ApplicationRejected' WHEN accountstatus = 'IE' THEN 'InEditable' ELSE accountstatus END  WHERE   accountstatus IN ('AS', 'DU', 'BA', 'I', 'A', 'C', 'D', 'H', 'AR', 'IE');

-- Enable check constraint for cardstatus
ALTER TABLE absnew.CustomerQrCard ADD CONSTRAINT ck_cardstatus_customerqrcard check (cardstatus = 'Generated' or cardstatus = 'Downloaded');
ALTER TABLE absnew.CustomerQrCard ADD CONSTRAINT ck_generatedas_customerqrcard check (generatedas = 'Batch' or generatedas = 'Single');
ALTER TABLE absnew.CustomerQrCard ADD CONSTRAINT ck_accountstatus_customerqrcard check (accountstatus = 'ApplicationSubmitted' or accountstatus = 'DataUpdated' or accountstatus = 'BankApproved' or accountstatus = 'Inactive' or accountstatus = 'Active'or accountstatus = 'Closed' or accountstatus = 'Deleted' or accountstatus = 'Hold' or accountstatus = 'ApplicationRejected' or accountstatus = 'InEditable');


--	44	Fingerprint

-- drop not null constraint
alter table absnew.PersonFingerprint alter column riMetaData drop not null;
alter table absnew.PersonFingerprint alter column rmMetaData drop not null;
alter table absnew.PersonFingerprint alter column rtMetaData drop not null;
alter table absnew.PersonFingerprint alter column rrMetaData drop not null;
alter table absnew.PersonFingerprint alter column rpMetaData drop not null;
alter table absnew.PersonFingerprint alter column liMetaData drop not null;
alter table absnew.PersonFingerprint alter column lmMetaData drop not null;
alter table absnew.PersonFingerprint alter column ltMetaData drop not null;
alter table absnew.PersonFingerprint alter column lrMetaData drop not null;
alter table absnew.PersonFingerprint alter column lpMetaData drop not null;


-- migrate data from public to absnew
INSERT INTO absnew.PersonFingerprint (oid, identifiyerid, fpdeviceoid, fpdevicemodeloid,fpdevicemnemonic, clientsidesdk, serversidesdk, defaultfinger, fpdetails, ri, rm, rt, rr, rp, li, lm, lt, lr, lp, rimetadata, rmmetadata, rtmetadata, rrmetadata, rpmetadata, limetadata, lmmetadata, ltmetadata,lrmetadata, lpmetadata, makerid, checkerid, approverid, rejectioncause, createdby, createdon, updatedby, updatedon) (SELECT oid, identifiyerid, 'FD0000001', 'Morpho-MSO1300E2', null, null, null, defaultfp, 'Person fingerprint data', ri, rm, rt, rr, rp, li, lm, lt, lr, lp, rimetadata, rmmetadata, rtmetadata, rrmetadata, rpmetadata,limetadata, lmmetadata, ltmetadata, lrmetadata, lpmetadata, createdby, null, null, null,createdby, createdon, updatedby, updatedon FROM absold.fingerprint);

-- update oid and identifiyerid by personoid
update absnew.personfingerprint fp set oid = cp.personoid, identifiyerid = cp.personoid from absnew.customerperson cp where fp.identifiyerid = cp.customeroid;

-- update absnew.fpdetils
update absnew.PersonFingerprint
set fpdetails = '{ri='|| CASE WHEN ri IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN ri ELSE 'ENROLLED' END
||', rm=' || CASE WHEN rm IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN rm ELSE 'ENROLLED' END
||', rt=' || CASE WHEN rt IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN rt ELSE 'ENROLLED' END
||', rr=' || CASE WHEN rr IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN rr ELSE 'ENROLLED' END
||', rp=' || CASE WHEN rp IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN rp ELSE 'ENROLLED' END
||', li=' || CASE WHEN li IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN li ELSE 'ENROLLED' END
||', lm=' || CASE WHEN lm IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN lm ELSE 'ENROLLED' END
||', lt=' || CASE WHEN lt IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN lt ELSE 'ENROLLED' END
||', lr=' || CASE WHEN lr IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN lr ELSE 'ENROLLED' END
||', lp=' || CASE WHEN lp IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN lp ELSE 'ENROLLED' END
|| '}';

-- update fingerpint
update absnew.PersonFingerprint
set
ri = '{' || CASE WHEN ri IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || ri END  || '}',
rm = '{' || CASE WHEN rm IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || rm END  || '}',
rt = '{' || CASE WHEN rt IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || rt END  || '}',
rr = '{' || CASE WHEN rr IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || rr END  || '}',
rp = '{' || CASE WHEN rp IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || rp END  || '}',
li = '{' || CASE WHEN li IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || li END  || '}',
lm = '{' || CASE WHEN lm IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || lm END  || '}',
lt = '{' || CASE WHEN lt IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || lt END  || '}',
lr = '{' || CASE WHEN lr IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || lr END  || '}',
lp = '{' || CASE WHEN lp IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE '1=' || lp END  || '}';

-- update fingerprint metadata
update absnew.PersonFingerprint set
rimetadata = '{' || CASE WHEN ri = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
rmmetadata = '{' || CASE WHEN rm = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
rtmetadata = '{' || CASE WHEN rt = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
rrmetadata = '{' || CASE WHEN rr = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
rpmetadata = '{' || CASE WHEN rp = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
limetadata = '{' || CASE WHEN li = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
lmmetadata = '{' || CASE WHEN lm = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
ltmetadata = '{' || CASE WHEN lt = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
lrmetadata = '{' || CASE WHEN lr = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}',
lpmetadata = '{' || CASE WHEN lp = '{}' THEN '' ELSE '1={fingerQuality=110.0}' END  || '}';

-- add not null constraint
alter table absnew.PersonFingerprint alter column riMetaData set not null;
alter table absnew.PersonFingerprint alter column rmMetaData set not null;
alter table absnew.PersonFingerprint alter column rtMetaData set not null;
alter table absnew.PersonFingerprint alter column rrMetaData set not null;
alter table absnew.PersonFingerprint alter column rpMetaData set not null;
alter table absnew.PersonFingerprint alter column liMetaData set not null;
alter table absnew.PersonFingerprint alter column lmMetaData set not null;
alter table absnew.PersonFingerprint alter column ltMetaData set not null;
alter table absnew.PersonFingerprint alter column lrMetaData set not null;
alter table absnew.PersonFingerprint alter column lpMetaData set not null;

--	45	FingerprintLog

-- Disble foreign key constraint fk_personfingerprintoid_personfingerprintlog
--ALTER TABLE absnew.personfingerprintlog DROP CONSTRAINT fk_personfingerprintoid_personfingerprintlog;

-- Disable check constraint status
ALTER TABLE absnew.personfingerprintlog DROP CONSTRAINT ck_status_personfingerprintlog;

-- migrate data from public to absnew
INSERT INTO absnew.personfingerprintlog (oid, personfingerprintoid, identifiyerid, changefromfinger, changetofinger, changereason, applydate, changedate, status, createdby, createdon, updatedby, updatedon)
(SELECT oid, fingerprintid, identifiyerid, changefromfinger, changetofinger, changereason, applydate, changedate, status, createdby, createdon, updatedby, updatedon FROM absold.fingerprintlog);

UPDATE absnew.personfingerprintlog SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' ELSE status END  WHERE   status IN ('A', 'I');

update absnew.personfingerprintlog fp set personfingerprintoid = cp.personoid, identifiyerid = cp.personoid from absnew.customerperson cp where fp.identifiyerid = cp.customeroid;

-- Enable ck_status_personfingerprintlog
ALTER TABLE absnew.personfingerprintlog ADD CONSTRAINT ck_status_personfingerprintlog check (status = 'Active' or status = 'Inactive');

-- Enable fk_personfingerprintoid_personfingerprintlog
--ALTER TABLE absnew.personfingerprintlog add CONSTRAINT fk_personfingerprintoid_personfingerprintlog foreign key (personfingerprintoid) references absnew.personfingerprint(oid);


--	46	SignatoryInfo
-- ========================================== Signatoryinfo ==========================================
-- migrate data from public to absnew
INSERT INTO absnew.SignatoryInfo (oid, signatoryinfoid, accountoid, mandatorybioauthcustomerjson, bioauthcustomerjson, mandatorybioauthcustomercount, bioauthcustomercount, createdby, createdon, updatedby, updatedon) (SELECT signatoryinfoid, signatoryinfoid, accountid, mandatorybioauthcustomer, bioauthcustomer, mandatorybioauthcustomerno, bioauthcustomerno, createdby, createdon, updatedby, updatedon FROM absold.SignatoryInfo);

-- ========================================== AccountOperationInstruction ==========================================
-- drop aoijson not null constraint
alter table absnew.AccountOperationInstruction alter column aoijson drop not null;

-- migrate data from public to absnew
INSERT INTO absnew.AccountOperationInstruction (oid, accountoid, status, createdby, createdon, updatedby, updatedon) (SELECT signatoryinfoid, accountid, 'Active', createdby, createdon, updatedby, updatedon FROM absold.SignatoryInfo);

update absnew.AccountOperationInstruction aoi set aoijson = (
select '{"csbAccountNo":"'||a.accountid||'","operationInstructionType":"single","minGroupsRequired":1,"groups":[{"groupName":"A","isGroupMandatory":"Y","minSignaturesRequired":1,
"signatories":[{"isExistingCustomer":"Y","idType":"PersonId","idNo":"'||p."oid"||'","isSignatureMandatory":"Y","name":"'||p.fullname||'",
"fingerprint":{"clientSideSDK":"clientSideSDK","serverSideSDK":"serverSideSDK","enrolledFpList":"'||
(SELECT regexp_replace(
CASE WHEN ri IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'ri,' END ||
CASE WHEN rm IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'rm,' END ||
CASE WHEN rt IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'rt,' END ||
CASE WHEN rr IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'rr,' END ||
CASE WHEN rp IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'rp,' END ||
CASE WHEN li IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'li,' END ||
CASE WHEN lm IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'lm,' END ||
CASE WHEN lt IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'lt,' END ||
CASE WHEN lr IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'lr,' END ||
CASE WHEN lp IN ('FINGER_NOT_PRESENT', 'NOT_SCANNED', 'CANNOT_VERIFY') THEN '' ELSE 'lp,' END
, ',+$', '') enrolledFpList FROM absnew.personfingerprint where oid = pf.oid)||'""}}]}]}'
from absnew.customeraccount ca, absnew.customer c, absnew.account a, absnew.person p, absnew.customerperson cp, absnew.personfingerprint pf
where ca.customeroid = c.oid and ca.accountoid=a.oid and cp.customeroid=c.oid
and cp.personoid = p.oid and p.oid = pf.identifiyerid and a.oid = aoi.accountoid);

-- set aoijson not null constraint
-- alter table absnew.AccountOperationInstruction alter column aoijson set not null;

--	47	TransLog

-- Disable check constraint transStatus, cbsStatus, ackMethod, printStatus
ALTER TABLE absnew.TransLog DROP CONSTRAINT ck_ackmethod_translog;
ALTER TABLE absnew.TransLog DROP CONSTRAINT ck_cbsstatus_translog;
ALTER TABLE absnew.TransLog DROP CONSTRAINT ck_printstatus_translog;
ALTER TABLE absnew.TransLog DROP CONSTRAINT ck_transstatus_translog;


-- migrate data from public to absnew
INSERT INTO absnew.TransLog (oid, requestid, transtype, transamount, chargeamount, vatamount, transtime, transstatus,cbsstatus, ackmethod, printstatus, accountoid, creditedaccount, debitedaccount, transid, referenceno, narration, bankoid, branchoid, agentoid, servicepointoid, serviceterminaloid, processcode, reverserefno, reversetype, reversetime, reverserid, reversestatus, reversestatusnote,transstatusnote, ackstatus, ackstatusnote, makerid, chargedparty, chargingparty, traceid,errorsource, errorcode, errorsubcode, errortext, creditedaccountcustomerid, creditedaccountcbscustomerid,creditedaccountbranchid, creditedaccountagentid, debitedaccountcustomerid, debitedaccountcbscustomerid, debitedaccountbranchid, debitedaccountagentid, transoutletareaid, transoutletzoneid, transservicepointid, transagentid,
transagentcbsaccountid, transagentcbscustomerid, transagentbranchid, transagentstaffid, transagentcaoid, transterminalid,transterminalmodel, transfpdeviceid, transfpdevicemodel, transprinterid, transprintermodel, transretrycount, transentrystarttime, transentryendtime, transentryseconds, transbbscode, lattitude, longitude, createdby, createdon, updatedby, updatedon)(SELECT requestid, requestid, transtype, transamount, chargeamount, vatamount, transdate, transstatus, null, null, null, accountid, creditedaccount, debitedaccount, transid, referenceno, narration, bankid,branchid, agentid, servicepointid, serviceterminalid, processcode, reverserefno, reversetype, reversedate, reverserid, reversestatus, reversestatusnote, transstatusnote, ackstatus, ackstatusnote, makerid, chargedparty, chargingparty, traceid, errorsource, errorcode, errorsubcode, errortext, creditedaccountcustomerid, creditedaccountcbscustomerid, creditedaccountbranchid, creditedaccountagentid, debitedaccountcustomerid, debitedaccountcbscustomerid, debitedaccountbranchid, debitedaccountagentid, transoutletareaid, transoutletzoneid, transservicepointid, transagentid, transagentcbsaccountid, transagentcbscustomerid, transagentbranchid, transagentstaffid, transagentcaoid, transterminalid, transterminalmodel, transfpdeviceid, transfpdevicemodel, transprinterid, transprintermodel, transretrycount::integer, transentrystarttime, transentryendtime, transentryduration, transbbscode, lattitude, longitude, createdby, createdon, updatedby, updatedon FROM absold.TransLog);

-- Update agentoid reference by agentoid
update absnew.TransLog a SET agentoid = (Select oid from absnew.agent where a.agentoid = loginid);



-- Enable check constraint transStatus, cbsStatus, ackMethod, printStatus
ALTER TABLE absnew.TransLog ADD CONSTRAINT ck_transStatus_translog check (transStatus = 'RequestReceived' or transStatus = 'OK' or transStatus = 'Pending' or transStatus = 'Failed');
ALTER TABLE absnew.TransLog ADD CONSTRAINT ck_cbsstatus_translog check (cbsStatus = 'RequestNotSent' or cbsStatus = 'RequestReceived'or cbsStatus = 'RequestSent' or cbsStatus = 'OK' or cbsStatus = 'Pending' or cbsStatus = 'Failed');
ALTER TABLE absnew.TransLog ADD CONSTRAINT ck_ackMethod_translog check (ackMethod = 'App' or ackMethod = 'Manual');
ALTER TABLE absnew.TransLog ADD CONSTRAINT ck_printStatus_translog check (printStatus = 'RequestReceived ' or printStatus = 'RequestNotReceived' or printStatus = 'Printed' or printStatus = 'PaperPrinted');


--	48	FundTransferChargeModel

-- migrate data from public to absnew
INSERT INTO absnew.FundTransferChargeModel (oid, modelid, servicepointoid, chargejson, createdby, createdon, updatedby, updatedon) (SELECT modelid, modelid, servicepointid, chargejson, createdby,createdon, updatedby, updatedon FROM absold.FundTransferChargeModel);


--	49	BillType

-- Disable check constraint - status
ALTER TABLE absnew.BillType DROP CONSTRAINT  ck_billTypeStatus_BillType;

-- migrate data from public to absnew
INSERT INTO absnew.BillType (oid, billtypeid, billtypename, billtypedescription, makerid, checkerid, approverid, billtypestatus, rejectioncause, createdby, createdon, updatedby, updatedon)(SELECT oid, billtypeid, billtypename, billtypedescription, makerid, checkerid, approverid, billtypestatus, rejectioncause, createdby, createdon, updatedby, updatedon FROM absold.BillType);

-- Update actionType value G=Generated, S=Submitted
UPDATE absnew.BillType
SET billtypestatus = CASE
WHEN billtypestatus = 'A' THEN 'Active'
WHEN billtypestatus = 'I' THEN 'Inactive'
WHEN billtypestatus = 'BM' THEN 'Make'
WHEN billtypestatus = 'BA' THEN 'Approved'
WHEN billtypestatus = 'BR' THEN 'Rejected'
WHEN billtypestatus = 'IE' THEN 'InEditable'
WHEN billtypestatus = 'BC' THEN 'Checked'
WHEN billtypestatus = 'AS' THEN 'Sumitted'
ELSE billtypestatus END  WHERE   billtypestatus IN ('A', 'I', 'BM', 'BA', 'BR', 'IE');

-- Enable check constraint for status
ALTER TABLE absnew.BillType ADD CONSTRAINT ck_billTypeStatus_BillType check (billTypeStatus = 'Make' or billTypeStatus = 'Approved'
or billTypeStatus = 'Active' or billTypeStatus = 'Inactive' or billTypeStatus = 'Rejected' or billTypeStatus = 'InEditable' or billTypeStatus = 'Checked' or billTypeStatus = 'Sumitted');



--	50	UtilityCompany

-- Disable check constraint - status
ALTER TABLE absnew.UtilityCompany DROP CONSTRAINT  ck_companystatus_UtilityCompany;

-- migrate data from public to absnew
INSERT INTO absnew.UtilityCompany (oid, companyname, companycode, vatamount, surcharge, location, revenuethreshold,stampvalue, contactnumber, contactperson, billtypeoid, centralizebilling, debitaccount, creditaccount, makerid, checkerid, approverid, companystatus, rejectioncause, cutvat, usevataccount, vataccount, createdby, createdon, updatedby, updatedon) (SELECT oid, companyname, companycode, vatamount, surcharge, location, revenuethreshold, stampvalue, contactnumber, contactperson, billtypeoid, centralizebilling, debitaccount, creditaccount, makerid, checkerid, approverid, companystatus, rejectioncause, cutvat :: integer, usevataccount, vataccount, createdby, createdon, updatedby, updatedon FROM absold.UtilityCompany);


-- Update status value A=Active, I=Inactive
UPDATE absnew.UtilityCompany SET companystatus = CASE WHEN companystatus = 'A' THEN 'Active' WHEN companystatus = 'I' THEN 'Inactive' ELSE companystatus END  WHERE   companystatus IN ('I', 'A');


-- Enable check constraint for status
ALTER TABLE absnew.UtilityCompany ADD CONSTRAINT ck_companystatus_utilitycompany check (companystatus = 'Active' or companystatus = 'Inactive');


--	51	CompanyZone

-- Disable check constraint - status
ALTER TABLE absnew.CompanyZone DROP CONSTRAINT  ck_companyzonestatus_CompanyZone;

-- migrate data from public to absnew
INSERT INTO absnew.CompanyZone (oid, zonename, zonecode, companyoid, location, contactperson, contactnumber,makerid, checkerid, approverid, companyzonestatus, rejectioncause, createdby, createdon, updatedby, updatedon) (SELECT oid, zonename, zonecode, companyoid, location, contactperson, contactnumber, makerid, checkerid, approverid, companyzonestatus, rejectioncause, createdby, createdon, updatedby, updatedon FROM absold.CompanyZone);

-- Update status value A=Active, I=Inactive
UPDATE absnew.CompanyZone SET companyzonestatus = CASE WHEN companyzonestatus = 'A' THEN 'Active' WHEN companyzonestatus = 'I' THEN 'Inactive' WHEN companyzonestatus = 'C' THEN 'Closed' ELSE companyzonestatus END  WHERE   companyzonestatus IN ('I', 'A', 'C');


-- Enable check constraint for status
ALTER TABLE absnew.CompanyZone ADD CONSTRAINT ck_companyzonestatus_CompanyZone check (companyzonestatus = 'Active' or companyzonestatus = 'Inactive'  or companyzonestatus = 'Closed');


--	52	ZoneBranch

-- migrate data from public to absnew
INSERT INTO absnew.ZoneBranch (oid, companyzoneoid, branchoid, debitaccount, creditaccount, vataccount, createdby, createdon, updatedby, updatedon) (SELECT oid, zoneoid, branchid, debitaccount, creditaccount, vataccount, createdby, createdon, updatedby, updatedon FROM absold.ZoneBranch);


--	53	ZoneAgent

-- Disable foreign key constraint
ALTER TABLE absnew.ZoneAgent DROP CONSTRAINT  fk_agentoid_ZoneAgent;

-- migrate data from public to absnew
INSERT INTO absnew.ZoneAgent (oid, companyoid, zoneoid, agentoid, createdby, createdon, updatedby, updatedon) (SELECT oid, companyoid, zoneoid, agentid, createdby, createdon, updatedby, updatedon FROM absold.ZoneAgent);


-- Update agentoid reference by agentoid
update absnew.ZoneAgent a SET agentoid = (Select oid from absnew.agent where a.agentoid = loginid);

-- Enable foreign key constraint
alter table absnew.ZoneAgent add constraint fk_agentoid_ZoneAgent foreign key (agentoid) references absnew.agent(oid);

--	54	BillCollection

-- Disable check constraint
ALTER TABLE absnew.BillCollection DROP CONSTRAINT  ck_paymentType_BillCollection;
ALTER TABLE absnew.BillCollection DROP CONSTRAINT  ck_billStatus_BillCollection;

-- migrate data from public to absnew
INSERT INTO absnew.BillCollection (oid, csbrequestid, cbsreferenceid, cbsvatreferenceid, utilitycompanyoid,companyzoneoid, zonecode, entrydate, duedate, lastpaymentdate, billpaymentmonth, customername, customermobileno, meterno, usedunit, billreferencenumber, booknumber, billamount, vatamount, meterrent, transformerrent, penalty, othersfee, latefee, netbillamount, customerid, billtypeoid, paymenttype, accountnumber, debitaccount, creditaccount,revenuecount, billpic, submitterid, makerid, checkerid, approverid, billstatus, vattransstatus, rejectioncause,agentoid, servicepointoid, branchoid, bankoid, submissiondate, transactiondate, valuejson, cutagentcharge, vataccount, acutalamount, monthnumber, createdby, createdon, updatedby, updatedon) (SELECT oid, csbrequestid, cbsreferanceid, null, companyid, zoneid, zonecode, entrydate, duedate, null, billpaymentmonth, customername, customermobileno, meterno, usedunit, billreferencenumber, booknumber, billamount, vatamount,meterrent, transformerrent, penalty, othersfee, latefee, netbillamount, customerid, billtype, paymenttype, accountnumber, debitaccount, creditaccount, revenuecount, null, submitterid, makerid, checkerid, approverid, billstatus, null,rejectioncause, agentid, servicepointid, branchid, bankid, submissiondate, transactiondate, valuejson, cutagentcharge, vataccount, acutalamount, null, createdby, createdon, updatedby, updatedon FROM absold.BillCollection);


-- Update status value Cash, Account, Check
UPDATE absnew.BillCollection
SET paymentType = CASE
WHEN paymentType = 'CASH' THEN 'Cash'
WHEN paymentType = 'ACCOUNT' THEN 'Account'
WHEN paymentType = 'CHEQUE' THEN 'Cheque'
ELSE paymentType END;

-- Update status value Failed, OK, Pending
UPDATE absnew.BillCollection
SET billStatus = CASE
WHEN billStatus = 'P' THEN 'Pending'
WHEN billStatus = 'OK' THEN 'OK'
WHEN billStatus = 'F' THEN 'Failed'
ELSE billStatus END;

-- Enable check constraint for Cash, Account, Check
ALTER TABLE absnew.BillCollection ADD CONSTRAINT ck_paymentType_BillCollection check (paymentType = 'Cash' or paymentType = 'Account'  or paymentType = 'Cheque');
ALTER TABLE absnew.BillCollection ADD CONSTRAINT ck_billStatus_BillCollection check (billStatus = 'Failed' or billStatus = 'OK'  or billStatus = 'Pending');


--	55	RebChargeModel

-- migrate data from public to absnew
INSERT INTO absnew.RebChargeModel (oid, rebchargemodelid, servicepointoid, rebchargejson, createdby, createdon, updatedby, updatedon)(SELECT rebchargemodelid, rebchargemodelid, servicepointid, rebchargejson, createdby, createdon, updatedby, updatedon FROM absold.RebChargeModel);

--	56	GasBillCollection

-- disable constraint
alter table absnew.gasbillcollection drop constraint fk_agentoid_gasbillcollection;
alter table absnew.gasbillcollection drop constraint fk_serviceterminaloid_gasbillcollection;

-- migrate data from public to absnew
INSERT INTO absnew.GasBillCollection (oid, csbrequestid, cbsreferenceno, traceid, entrydate, paymentmonth, customercode, customername, customermobileno, billreferencenumber, billamount, vatamount, chargeamount, billtype,debitaccount, creditaccount, submittedby, makerid, checkerid, approverid, status, rejectioncause, agentoid, servicepointoid, serviceterminaloid, branchoid, bankoid, transactiondate, createdby, createdon, updatedby, updatedon) (SELECT oid, csbrequestid, cbsreferanceno, traceid, entrydate, paymentmonth, customercode, customername,customermobileno, billreferencenumber, billamount, vatamount, chargeamount, billtype, debitaccount, creditaccount,submittedby, makerid, checkerid, approverid, status, rejectioncause, agentid, servicepointid, serviceterminalid,branchid, bankid, transactiondate, createdby, createdon, updatedby, updatedon FROM absold.GasBillCollection);

-- update data
update absnew.GasBillCollection g set agentoid = (select oid from absnew.agent a where g.agentoid = a.loginid);

-- add constraint
alter table absnew.GasBillCollection add constraint fk_agentoid_gasbillcollection foreign key (agentoid) references absnew.agent(oid);
alter table absnew.GasBillCollection add constraint fk_serviceterminaloid_gasbillcollection foreign key (serviceterminaloid) references absnew.serviceterminal(oid);

--	57	GasJalalabadChargeModel


-- migrate data from public to absnew
INSERT INTO absnew.GasJalalabadChargeModel (oid, gasjalalabadchargemodelid, servicepointoid, gaschargejson, createdaccount, createdby, createdon, updatedby, updatedon) (SELECT oid, gasjalalabadchargemodelid, servicepointid, gaschargejson, createdaccount, createdby, createdon, updatedby, updatedon FROM absold.GasJalalabadChargeModel);

--	58	ExchangeHouse

-- Disable check constraint for status
ALTER TABLE absnew.ExchangeHouse DROP CONSTRAINT ck_status_exchangehouse;

-- migrate data from public to absnew
INSERT INTO absnew.ExchangeHouse (oid, exhouseid, exhousename, glaccountno, accountjson, status, makerid, checkerid,approverid, rejectioncause, createdby, createdon, updatedby, updatedon)
(SELECT exhouseid, exhouseid, exhousename, glaccountno, accountjson, status, makerid, checkerid, approverid, rejectioncause, createdby, createdon, updatedby, updatedon FROM absold.ExchangeHouse);

-- Update status value A=Active, I=Inactive
UPDATE absnew.ExchangeHouse SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive'  ELSE status END  WHERE   status IN ('I', 'A');

 -- Enable check constraint for status
ALTER TABLE absnew.ExchangeHouse ADD CONSTRAINT ck_status_exchangehouse check (status = 'Active' or status = 'Inactive');



