--	59	Remittance

-- Disable check constraint for status
ALTER TABLE absnew.Remittance DROP CONSTRAINT ck_status_remittance;
ALTER TABLE absnew.Remittance DROP CONSTRAINT ck_photoidtype_remittance;
ALTER TABLE absnew.Remittance DROP CONSTRAINT fk_agentoid_remittance;
alter table absnew.Remittance alter serviceterminaloid drop not null;

-- migrate data from public to absnew
INSERT INTO absnew.Remittance (oid, ifrid, pin, ttnumber, photoid, photoidtype, photoidfrontpath, photoidbackpath,
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
UPDATE absnew.Remittance
SET status = CASE
WHEN status = 'BR' THEN 'BankRejected'
WHEN status = 'IE' THEN 'InEditable'
WHEN status = 'BM' THEN 'BankMade'
WHEN status = 'P' THEN 'Disbursed'
WHEN status = 'BA' THEN 'BankApproved'
WHEN status = 'C' THEN 'Cancel'
WHEN status = 'AS' THEN 'ApplicationSubmitted'
ELSE status END;

-- Update photoidtype value
UPDATE absnew.Remittance
SET photoidtype = CASE
WHEN photoidtype = 'BIRTH CERT' THEN 'BirthCertificate'
WHEN photoidtype = 'Passport No' THEN 'PassportNo'
WHEN photoidtype = 'PASSPORT' THEN 'PassportNo'
WHEN photoidtype = '4617580669' THEN 'DrivingLicense'
WHEN photoidtype = '8510388275884' THEN 'DrivingLicense'
WHEN photoidtype = 'NID' THEN 'NID'
ELSE photoidtype END;

-- Update agent oid
update absnew.Remittance r
set agentoid = (select oid from absnew.agent a where r.agentoid = a.loginid);

-- Enable check constraint for status
ALTER TABLE absnew.Remittance ADD CONSTRAINT ck_status_remittance check (status = 'ApplicationSubmitted' or status = 'DataUpdated'
or status = 'InEditable' or status = 'BankApproved' or status = 'ApplicationRejected' or status = 'BankMade' or status = 'Pending' or status = 'Disbursed'
or status = 'Close' or status = 'OK' or status = 'Failed' or status = 'Cancel' or status = 'BankRejected');

-- Enable check constraint for photoidtype
ALTER TABLE absnew.Remittance ADD CONSTRAINT ck_photoidtype_remittance check (photoidtype = 'NID' or photoidtype = 'PassportNo' or photoidtype = 'BirthCertificate' or photoidtype = 'DrivingLicense');

-- Enable fk constraint for agent oid
alter table absnew.remittance add constraint fk_agentoid_remittance foreign key (agentoid) references absnew.agent(oid);

-- Update bank oid 101 to 010
insert into absnew.bank
(oid, bankid, bankname, status, createdby, createdon, updatedby, updatedon)
values('010', '010', 'Agrani Bank Limited', 'Active', 'agentbanking', '2016-05-30 00:00:00.000', NULL, NULL);

update absnew.Branch set bankoid = '010';
update absnew.DraftAgent set bankoid = '010';
update absnew.Agent set bankoid = '010';
update absnew.DraftAgentServiceStaff set bankoid = '010';
update absnew.DraftServicePoint set bankoid = '010';
update absnew.ServicePoint set bankoid = '010';
update absnew.ServiceTerminal set bankoid = '010';
update absnew.AgentServiceStaff set bankoid = '010';
update absnew.Customer set bankoid = '010';
update absnew.Account set bankoid = '010';
update absnew.TransLog set bankoid = '010';
update absnew.Gasbillcollection set bankoid = '010';
update absnew.Remittance set bankoid = '010';
update absnew.Unauthserviceterminal set bankoid = '010';

delete from absnew.bank where oid = '101';

-- Update app menu json
update absnew.role set appmenujson = '[{"menuId":"SearchAccountForActivationActivity","menuIcon":"vector_ic_new_account","menuText":"Activate Account","subMenu":[]}]' where oid = 'DOER.OP.BDO';
update absnew.role set appmenujson = '[{"menuID":"AgentStaffEnrollment","menuText":"Agent Staff FP Enrollment","active":true},{"menuID":"AgentTools","menuText":"Tools","active":true}]' where oid = 'AGENT.OWNER';
update absnew.role set appmenujson = '[{"menuId":"","menuIcon":"vector_ic_customer_and_account","menuText":"Customer & Account","subMenu":[{"menuId":"","menuIcon":"vector_ic_new_account","menuText":"New Account","subMenu":[{"menuId":"SearchByPhotoIDActivity","menuIcon":"vector_ic_personal_account","menuText":"Personal","subMenu":[]}]},{"menuId":"AdditionalAccountSearchByPhotoIDActivity","menuIcon":"vector_ic_additional_account","menuText":"Additional Account","subMenu":[]},{"menuId":"CustomerSearchActivity","menuIcon":"vector_ic_joint_account","menuText":"Joint Account","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_transaction","menuText":"Transaction","subMenu":[{"menuId":"","menuIcon":"vector_ic_cash_deposit","menuText":"Cash Deposit","subMenu":[{"menuId":"CashDepositActivity","menuIcon":"vector_ic_cash_deposit_self","menuText":"Cash Deposit","subMenu":[]},{"menuId":"CashDepositActivity","menuIcon":"vector_ic_cash_deposit_bearer","menuText":"Bearer Deposit","subMenu":[]}]},{"menuId":"CashWithdrawActivity","menuIcon":"vector_ic_cash_withdraw","menuText":"Cash Withdrawal","subMenu":[]},{"menuId":"FundTransferActivity","menuIcon":"vector_ic_fund_transfer","menuText":"Fund Transfer","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_enquiry","menuText":"Enquiry","subMenu":[{"menuId":"BalanceEnquiryActivity","menuIcon":"vector_ic_balance_enquiry","menuText":"Balance Enquiry","subMenu":[]},{"menuId":"MiniStatementActivity","menuIcon":"vector_ic_mini_statement","menuText":"Mini Statement","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_remittance","menuText":"Remittance","subMenu":[{"menuId":"RemittanceRequestActivity","menuIcon":"vector_ic_customer_and_account","menuText":"Remittance Request","subMenu":[]},{"menuId":"RemittanceRequestSearchByPinActivity","menuIcon":"vector_ic_transaction","menuText":"Remittance Withdrawal","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_billcollection","menuText":"Bill Collection","subMenu":[{"menuId":"REBCompanyListActivity","menuIcon":"vector_ic_reb","menuText":"REB (Rural Electricity Board)","subMenu":[]}]},{"menuId":"","menuIcon":"vector_ic_agent_tools","menuText":"Tools","subMenu":[{"menuId":"AgentToolsActivity","menuIcon":"vector_ic_agent_balance","menuText":"Agent Tools","subMenu":[]}]}]' where oid = 'AGENT.TELLER';
update absnew.role set appmenujson = '[{"menuId":"SearchAccountForActivationActivity","menuIcon":"vector_ic_new_account","menuText":"Activate Account","subMenu":[]},{"menuId":"","menuIcon":"vector_ic_re_enrollment_fingerprint","menuText":"Existing Customer Enrollment","subMenu":[{"menuId":"ExistingPersonalCustomerEnrollmentSearchActivity","menuIcon":"vector_ic_re_enrollment_fingerprint_personal","menuText":"Personal","subMenu":[]}]}]' where oid = 'BRANCH.MAKER';



