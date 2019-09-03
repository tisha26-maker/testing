--	21	ChargeModelDef -----------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ChargeModelDef', 'ChargeModelDef', current_timestamp, (select count(*) from absold.ChargeModelDef));
-- Disable check constraint - status and isDefault
ALTER TABLE public.ChargeModelDef DROP CONSTRAINT  ck_status_ChargeModelDef;
ALTER TABLE public.ChargeModelDef DROP CONSTRAINT  ck_isdefault_ChargeModelDef;

-- migrate data from public to absdata
INSERT INTO public.ChargeModelDef (oid, chargemodeldefname, description, status, effectivefrom, effectiveto, isdefault, createdby, createdon, updatedby, updatedon) (SELECT oid, name, description, status, effectivefrom, effectiveto, isdefault, createdby, createdon, updatedby, updatedon FROM absold.ChargeModelDef);

-- Update status value A=Active, I=Inactive
UPDATE public.ChargeModelDef SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' ELSE status END  WHERE   status IN ('A', 'I');

-- Update isDefault value Y=Yes, N=No
UPDATE public.ChargeModelDef SET isDefault = CASE WHEN isDefault = 'Y' THEN 'Yes' WHEN isDefault = 'N' THEN 'No' ELSE isDefault END  WHERE   isDefault IN ('Y', 'N');

-- Enable check constraint for status and isDefault
ALTER TABLE public.ChargeModelDef ADD CONSTRAINT ck_status_ChargeModelDef check (status = 'Active' or status = 'Inactive');
ALTER TABLE public.ChargeModelDef ADD CONSTRAINT ck_isdefault_ChargeModelDef check (isDefault = 'Yes' or isDefault = 'No');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.ChargeModelDef) where targetTable = 'ChargeModelDef' and sourceTable = 'ChargeModelDef';

--	22	ChargeModelItem ----------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ChargeModelItem', 'ChargeModelItem', current_timestamp, (select count(*) from absold.ChargeModelItem));

-- Disable check constraint - status
ALTER TABLE public.ChargeModelItem DROP CONSTRAINT  ck_status_ChargeModelItem;

-- migrate data from public to absdata
INSERT INTO public.ChargeModelItem (oid, chargekey, chargemodeldefoid, valuejson, rejectioncause, status, createdby, createdon, updatedby, updatedon) (SELECT oid, chargekey, chargemodeldefid, valuejson, rejectioncause, status, createdby, createdon, updatedby, updatedon FROM absold.ChargeModelItem);

-- Update status value A=Active, I=Inactive
UPDATE public.ChargeModelItem  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' ELSE status END  WHERE   status IN ('A', 'I');

-- Enable check constraint for statust
ALTER TABLE public.ChargeModelItem ADD CONSTRAINT ck_status_ChargeModelItem check (status = 'Active' or status = 'Inactive');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.ChargeModelItem) where targetTable = 'ChargeModelItem' and sourceTable = 'ChargeModelItem';

--	23	PasswordPolicy -------------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('PasswordPolicy', 'PasswordPolicy', current_timestamp, (select count(*) from absold.PasswordPolicy));

-- Disable check constraint - status
ALTER TABLE public.PasswordPolicy DROP CONSTRAINT  ck_status_PasswordPolicy;

-- migrate data from public to absdata
INSERT INTO public.PasswordPolicy (oid, passwordpolicyid, passwordpolicyname, status, effectivefrom, effectiveto, description, policyjson, createdby, createdon, updatedby, updatedon) (SELECT passwordpolicyid as oid, passwordpolicyid, name, status, effectivefrom, effectiveto, description, policyjson, createdby, createdon, updatedby, updatedon FROM absold.PasswordPolicy);


-- Update status value A=Active, I=Inactive
UPDATE public.PasswordPolicy SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' ELSE status END  WHERE   status IN ('A', 'I');

-- Enable check constraint for statust
ALTER TABLE public.PasswordPolicy ADD CONSTRAINT ck_status_PasswordPolicy check (status = 'Active' or status = 'Inactive');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.PasswordPolicy) where targetTable = 'PasswordPolicy' and sourceTable = 'PasswordPolicy';

--	24	PasswordHistory -------------------------------------------------------------------------
-- Pre validation 
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('PasswordHistory', 'PasswordHistory', current_timestamp, (select count(*) from absold.PasswordHistory));

-- migrate data from public to absdata
INSERT INTO public.PasswordHistory (oid, passhistoryid, loginid, oldpassword, newpassword, createdby, createdon, updatedby, updatedon) (SELECT passHistoryid, passhistoryid, loginid, oldpassword, newpassword, createdby, createdon, updatedby, updatedon FROM absold.PasswordHistory);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.PasswordHistory) where targetTable = 'PasswordHistory' and sourceTable = 'PasswordHistory';

--	25	AccountTransactionProfile ----------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('AccountTransactionProfile', 'AccountTransactionProfile', current_timestamp, (select count(*) from absold.AccountTransactionProfile));

-- Disable check constraint
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_tptype_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoCashTrnPerDay_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoCashTrnPerWeek_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoCashTrnPerMonth_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxCashTrnPerDay_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxCashTrnPerWeek_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxCashTrnPerMonth_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxDpPerTrn_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxDpPerDay_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxDpPerWeek_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxDpPerMonth_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoDpPerDay_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoDpPerWeek_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoDpPerMonth_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxWdPerTrn_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxWdPerDay_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxWdPerWeek_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxWdPerMonth_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoWdPerDay_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoWdPerWeek_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoWdPerMonth_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxFdPerTrn_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxFdPerDay_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxFdPerWeek_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxFdPerMonth_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoFdPerDay_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoFdPerWeek_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoFdPerMonth_AccountTransactionProfile;
ALTER TABLE public.AccountTransactionProfile DROP CONSTRAINT  ck_status_AccountTransactionProfile;

INSERT INTO public.AccountTransactionProfile (oid, accounttpid, name, tptype, description, maxdppertrn, maxdpperday, maxdpperweek, maxdppermonth, maxnodpperday, maxnodpperweek, maxnodppermonth,maxwdpertrn, maxwdperday, maxwdperweek, maxwdpermonth, maxnowdperday, maxnowdperweek, maxnowdpermonth, maxfdpertrn, maxfdperday, maxfdperweek, maxfdpermonth, maxnofdperday, maxnofdperweek, maxnofdpermonth, enabledmaxdppertrn, enabledmaxdpperday, enabledmaxdpperweek, enabledmaxdppermonth, enabledmaxnodpperday, enabledmaxnodpperweek, enabledmaxnodppermonth, enabledmaxwdpertrn, enabledmaxwdperday, enabledmaxwdperweek, enabledmaxwdpermonth, enabledmaxnowdperday, enabledmaxnowdperweek, enabledmaxnowdpermonth, enabledmaxfdpertrn, enabledmaxfdperday, enabledmaxfdperweek, enabledmaxfdpermonth, enabledmaxnofdperday, enabledmaxnofdperweek, enabledmaxnofdpermonth, blockmaxdppertrn, blockmaxdpperday, blockmaxdpperweek, blockmaxdppermonth, blockmaxnodpperday, blockmaxnodpperweek, blockmaxnodppermonth, blockmxwdpertrn, blockmaxwdperday, blockmaxwdperweek, blockmaxwdpermonth, blockmaxnowdperday, blockmaxnowdperweek, blockmaxnowdpermonth, blockmaxfdpertrn, blockmaxfdperday, blockmaxfdperweek, blockmaxfdpermonth, blockmaxnofdperday,blockmaxnofdperweek, blockmaxnofdpermonth, rejectioncause, status, createdby, createdon, updatedby, updatedon, maxnocashtrnperday, maxnocashtrnperweek, maxnocashtrnpermonth, maxcashtrnperday, maxcashtrnperweek, maxcashtrnpermonth, enabledmaxnocashtrnperday,enabledmaxnocashtrnperweek, enabledmaxnocashtrnpermonth, enabledmaxcashtrnperday, enabledmaxcashtrnperweek, enabledmaxcashtrnpermonth) (select accounttpid, accounttpid, name, tptype, description, maxdppertrn, maxdpperday, maxdpperweek, maxdppermonth, maxnodpperday, maxnodpperweek, maxnodppermonth, maxwdpertrn, maxwdperday, maxwdperweek, maxwdpermonth, maxnowdperday, maxnowdperweek, maxnowdpermonth, maxfdpertrn,maxfdperday, maxfdperweek, maxfdpermonth, maxnofdperday, maxnofdperweek, maxnofdpermonth, enabledmaxdppertrn, enabledmaxdpperday, enabledmaxdpperweek, enabledmaxdppermonth, enabledmaxnodpperday, enabledmaxnodpperweek, enabledmaxnodppermonth, enabledmaxwdpertrn, enabledmaxwdperday, enabledmaxwdperweek, enabledmaxwdpermonth, enabledmaxnowdperday, enabledmaxnowdperweek, enabledmaxnowdpermonth, enabledmaxfdpertrn, enabledmaxfdperday, enabledmaxfdperweek, enabledmaxfdpermonth, enabledmaxnofdperday, enabledmaxnofdperweek, enabledmaxnofdpermonth, blockmaxdppertrn, blockmaxdpperday, blockmaxdpperweek, blockmaxdppermonth, blockmaxnodpperday, blockmaxnodpperweek, blockmaxnodppermonth, blockmxwdpertrn, blockmaxwdperday, blockmaxwdperweek, blockmaxwdpermonth, blockmaxnowdperday, blockmaxnowdperweek, blockmaxnowdpermonth, blockmaxfdpertrn, blockmaxfdperday, blockmaxfdperweek, blockmaxfdpermonth, blockmaxnofdperday, blockmaxnofdperweek, blockmaxnofdpermonth, rejectioncause, status, createdby, createdon, updatedby, updatedon, maxnocashtrnperday, maxnocashtrnperweek, maxnocashtrnpermonth, maxcashtrnperday, maxcashtrnperweek, maxcashtrnpermonth, enabledmaxnocashtrnperday, enabledmaxnocashtrnperweek, enabledmaxnocashtrnpermonth, enabledmaxcashtrnperday, enabledmaxcashtrnperweek, enabledmaxcashtrnpermonth FROM absold.AccountTransactionProfile);


-- Update status value SP=Specific, DF=Specific, ND=NotDefined
UPDATE public.AccountTransactionProfile SET tpType = CASE WHEN tpType = 'SP' THEN 'Specific'WHEN tpType = 'DF' THEN 'Default' WHEN tpType = 'ND' THEN 'NotDefined'ELSE tpType END  WHERE   tpType IN ('SP','DF', 'ND');

-- Update status value A=Active, I=Inactive, BM=BankMade
UPDATE public.AccountTransactionProfile  SET status = CASE WHEN status = 'BM' THEN 'Made' WHEN status = 'BA' THEN 'Approved' WHEN status = 'I' THEN 'Inactive' WHEN status = 'A' THEN 'Active' ELSE status END  WHERE   status IN ('BM', 'A', 'I');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile SET enabledMaxNoCashTrnPerDay = CASE WHEN enabledMaxNoCashTrnPerDay = 'Y' THEN 'Yes' WHEN enabledMaxNoCashTrnPerDay = 'N' THEN 'No' ELSE enabledMaxNoCashTrnPerDay END  WHERE   enabledMaxNoCashTrnPerDay IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile SET enabledMaxNoCashTrnPerWeek = CASE WHEN enabledMaxNoCashTrnPerWeek = 'Y' THEN 'Yes' WHEN enabledMaxNoCashTrnPerWeek = 'N' THEN 'No' ELSE enabledMaxNoCashTrnPerWeek END  WHERE   enabledMaxNoCashTrnPerWeek IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoCashTrnPerMonth = CASE
WHEN enabledMaxNoCashTrnPerMonth = 'Y' THEN 'Yes'
WHEN enabledMaxNoCashTrnPerMonth = 'N' THEN 'No'
ELSE enabledMaxNoCashTrnPerMonth END  WHERE   enabledMaxNoCashTrnPerMonth IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxCashTrnPerDay = CASE
WHEN enabledMaxCashTrnPerDay = 'Y' THEN 'Yes'
WHEN enabledMaxCashTrnPerDay = 'N' THEN 'No'
ELSE enabledMaxCashTrnPerDay END  WHERE   enabledMaxCashTrnPerDay IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxCashTrnPerWeek = CASE
WHEN enabledMaxCashTrnPerWeek = 'Y' THEN 'Yes'
WHEN enabledMaxCashTrnPerWeek = 'N' THEN 'No'
ELSE enabledMaxCashTrnPerWeek END  WHERE   enabledMaxCashTrnPerWeek IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxCashTrnPerMonth = CASE
WHEN enabledMaxCashTrnPerMonth = 'Y' THEN 'Yes'
WHEN enabledMaxCashTrnPerMonth = 'N' THEN 'No'
ELSE enabledMaxCashTrnPerMonth END  WHERE   enabledMaxCashTrnPerMonth IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxDpPerTrn = CASE
WHEN enabledMaxDpPerTrn = 'Y' THEN 'Yes'
WHEN enabledMaxDpPerTrn = 'N' THEN 'No'
ELSE enabledMaxDpPerTrn END  WHERE   enabledMaxDpPerTrn IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxDpPerDay = CASE
WHEN enabledMaxDpPerDay = 'Y' THEN 'Yes'
WHEN enabledMaxDpPerDay = 'N' THEN 'No'
ELSE enabledMaxDpPerDay END  WHERE   enabledMaxDpPerDay IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxDpPerWeek = CASE
WHEN enabledMaxDpPerWeek = 'Y' THEN 'Yes'
WHEN enabledMaxDpPerWeek = 'N' THEN 'No'
ELSE enabledMaxDpPerWeek END  WHERE   enabledMaxDpPerWeek IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxDpPerMonth = CASE
WHEN enabledMaxDpPerMonth = 'Y' THEN 'Yes'
WHEN enabledMaxDpPerMonth = 'N' THEN 'No'
ELSE enabledMaxDpPerMonth END  WHERE   enabledMaxDpPerMonth IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoDpPerDay = CASE
WHEN enabledMaxNoDpPerDay = 'Y' THEN 'Yes'
WHEN enabledMaxNoDpPerDay = 'N' THEN 'No'
ELSE enabledMaxNoDpPerDay END  WHERE   enabledMaxNoDpPerDay IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoDpPerWeek = CASE
WHEN enabledMaxNoDpPerWeek = 'Y' THEN 'Yes'
WHEN enabledMaxNoDpPerWeek = 'N' THEN 'No'
ELSE enabledMaxNoDpPerWeek END  WHERE   enabledMaxNoDpPerWeek IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoDpPerMonth = CASE
WHEN enabledMaxNoDpPerMonth = 'Y' THEN 'Yes'
WHEN enabledMaxNoDpPerMonth = 'N' THEN 'No'
ELSE enabledMaxNoDpPerMonth END  WHERE   enabledMaxNoDpPerMonth IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxWdPerTrn = CASE
WHEN enabledMaxWdPerTrn = 'Y' THEN 'Yes'
WHEN enabledMaxWdPerTrn = 'N' THEN 'No'
ELSE enabledMaxWdPerTrn END  WHERE   enabledMaxWdPerTrn IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxWdPerDay = CASE
WHEN enabledMaxWdPerDay = 'Y' THEN 'Yes'
WHEN enabledMaxWdPerDay = 'N' THEN 'No'
ELSE enabledMaxWdPerDay END  WHERE   enabledMaxWdPerDay IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxWdPerWeek = CASE
WHEN enabledMaxWdPerWeek = 'Y' THEN 'Yes'
WHEN enabledMaxWdPerWeek = 'N' THEN 'No'
ELSE enabledMaxWdPerWeek END  WHERE   enabledMaxWdPerWeek IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxWdPerMonth = CASE
WHEN enabledMaxWdPerMonth = 'Y' THEN 'Yes'
WHEN enabledMaxWdPerMonth = 'N' THEN 'No'
ELSE enabledMaxWdPerMonth END  WHERE   enabledMaxWdPerMonth IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoWdPerDay = CASE
WHEN enabledMaxNoWdPerDay = 'Y' THEN 'Yes'
WHEN enabledMaxNoWdPerDay = 'N' THEN 'No'
ELSE enabledMaxNoWdPerDay END  WHERE   enabledMaxNoWdPerDay IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoWdPerWeek = CASE
WHEN enabledMaxNoWdPerWeek = 'Y' THEN 'Yes'
WHEN enabledMaxNoWdPerWeek = 'N' THEN 'No'
ELSE enabledMaxNoWdPerWeek END  WHERE   enabledMaxNoWdPerWeek IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoWdPerMonth = CASE
WHEN enabledMaxNoWdPerMonth = 'Y' THEN 'Yes'
WHEN enabledMaxNoWdPerMonth = 'N' THEN 'No'
ELSE enabledMaxNoWdPerMonth END  WHERE   enabledMaxNoWdPerMonth IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxFdPerTrn = CASE
WHEN enabledMaxFdPerTrn = 'Y' THEN 'Yes'
WHEN enabledMaxFdPerTrn = 'N' THEN 'No'
ELSE enabledMaxFdPerTrn END  WHERE   enabledMaxFdPerTrn IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxFdPerDay = CASE
WHEN enabledMaxFdPerDay = 'Y' THEN 'Yes'
WHEN enabledMaxFdPerDay = 'N' THEN 'No'
ELSE enabledMaxFdPerDay END  WHERE   enabledMaxFdPerDay IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxFdPerWeek = CASE
WHEN enabledMaxFdPerWeek = 'Y' THEN 'Yes'
WHEN enabledMaxFdPerWeek = 'N' THEN 'No'
ELSE enabledMaxFdPerWeek END  WHERE   enabledMaxFdPerWeek IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxFdPerMonth = CASE
WHEN enabledMaxFdPerMonth = 'Y' THEN 'Yes'
WHEN enabledMaxFdPerMonth = 'N' THEN 'No'
ELSE enabledMaxFdPerMonth END  WHERE   enabledMaxFdPerMonth IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoFdPerDay = CASE
WHEN enabledMaxNoFdPerDay = 'Y' THEN 'Yes'
WHEN enabledMaxNoFdPerDay = 'N' THEN 'No'
ELSE enabledMaxNoFdPerDay END  WHERE   enabledMaxNoFdPerDay IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoFdPerWeek = CASE
WHEN enabledMaxNoFdPerWeek = 'Y' THEN 'Yes'
WHEN enabledMaxNoFdPerWeek = 'N' THEN 'No'
ELSE enabledMaxNoFdPerWeek END  WHERE   enabledMaxNoFdPerWeek IN ('Y', 'N');

-- Update status value Y=Yes, N=No
UPDATE public.AccountTransactionProfile
SET enabledMaxNoFdPerMonth = CASE
WHEN enabledMaxNoFdPerMonth = 'Y' THEN 'Yes'
WHEN enabledMaxNoFdPerMonth = 'N' THEN 'No'
ELSE enabledMaxNoFdPerMonth END  WHERE   enabledMaxNoFdPerMonth IN ('Y', 'N');


-- Enable check constraint
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_tptype_AccountTransactionProfile check (tpType = 'Default' or tpType = 'Specific' or tpType = 'NotDefined');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoCashTrnPerDay_AccountTransactionProfile check (enabledMaxNoCashTrnPerDay = 'Yes' or enabledMaxNoCashTrnPerDay = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoCashTrnPerWeek_AccountTransactionProfile check (enabledMaxNoCashTrnPerWeek = 'Yes' or enabledMaxNoCashTrnPerWeek = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoCashTrnPerMonth_AccountTransactionProfile check (enabledMaxNoCashTrnPerMonth = 'Yes' or enabledMaxNoCashTrnPerMonth = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxCashTrnPerDay_AccountTransactionProfile check (enabledMaxCashTrnPerDay = 'Yes' or enabledMaxNoCashTrnPerDay = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxCashTrnPerWeek_AccountTransactionProfile check (enabledMaxCashTrnPerWeek = 'Yes' or enabledMaxCashTrnPerWeek = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxCashTrnPerMonth_AccountTransactionProfile check (enabledMaxCashTrnPerMonth = 'Yes' or enabledMaxCashTrnPerMonth = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxDpPerTrn_AccountTransactionProfile check (enabledMaxDpPerTrn = 'Yes' or enabledMaxDpPerTrn = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxDpPerDay_AccountTransactionProfile check (enabledMaxDpPerDay = 'Yes' or enabledMaxDpPerDay = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxDpPerWeek_AccountTransactionProfile check (enabledMaxDpPerWeek = 'Yes' or enabledMaxDpPerWeek = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxDpPerMonth_AccountTransactionProfile check (enabledMaxDpPerMonth = 'Yes' or enabledMaxDpPerMonth = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoDpPerDay_AccountTransactionProfile check (enabledMaxNoDpPerDay = 'Yes' or enabledMaxNoDpPerDay = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoDpPerWeek_AccountTransactionProfile check (enabledMaxNoDpPerWeek = 'Yes' or enabledMaxNoDpPerWeek = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoDpPerMonth_AccountTransactionProfile check (enabledMaxNoDpPerMonth = 'Yes' or enabledMaxNoDpPerMonth = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxWdPerTrn_AccountTransactionProfile check (enabledMaxWdPerTrn = 'Yes' or enabledMaxWdPerTrn = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxWdPerDay_AccountTransactionProfile check (enabledMaxWdPerDay = 'Yes' or enabledMaxWdPerDay = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxWdPerWeek_AccountTransactionProfile check (enabledMaxWdPerWeek = 'Yes' or enabledMaxWdPerWeek = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxWdPerMonth_AccountTransactionProfile check (enabledMaxWdPerMonth = 'Yes' or enabledMaxWdPerMonth = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoWdPerDay_AccountTransactionProfile check (enabledMaxNoWdPerDay = 'Yes' or enabledMaxNoWdPerDay = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_eenabledMaxNoWdPerWeek_AccountTransactionProfile check (enabledMaxNoWdPerWeek = 'Yes' or enabledMaxNoWdPerWeek = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoWdPerMonth_AccountTransactionProfile check (enabledMaxNoWdPerMonth = 'Yes' or enabledMaxNoWdPerMonth = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxFdPerTrn_AccountTransactionProfile check (enabledMaxFdPerTrn = 'Yes' or enabledMaxFdPerTrn = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxFdPerDay_AccountTransactionProfile check (enabledMaxFdPerDay = 'Yes' or enabledMaxFdPerDay = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxFdPerWeek_AccountTransactionProfile check (enabledMaxFdPerWeek = 'Yes' or enabledMaxFdPerWeek = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxFdPerMonth_AccountTransactionProfile check (enabledMaxFdPerMonth = 'Yes' or enabledMaxFdPerMonth = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoFdPerDay_AccountTransactionProfile check (enabledMaxNoFdPerDay = 'Yes' or enabledMaxNoFdPerDay = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoFdPerWeek_AccountTransactionProfile check (enabledMaxNoFdPerWeek = 'Yes' or enabledMaxNoFdPerWeek = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_enabledMaxNoFdPerMonth_AccountTransactionProfile check (enabledMaxNoFdPerMonth = 'Yes' or enabledMaxNoFdPerMonth = 'No');
ALTER TABLE public.AccountTransactionProfile ADD CONSTRAINT ck_status_AccountTransactionProfile check (status = 'Active' or status = 'Inactive' or status = 'Made' or status = 'Approved');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.AccountTransactionProfile) where targetTable = 'AccountTransactionProfile' and sourceTable = 'AccountTransactionProfile';


--	26	OutletTransactionProfile ------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('OutletTransactionProfile', 'OutletTransactionProfile', current_timestamp, (select count(*) from absold.OutletTransactionProfile));

-- Disable check constraint
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_tpType_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoCashTrnPerDay_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoCashTrnPerWeek_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoCashTrnPerMonth_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxCashTrnPerDay_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxCashTrnPerWeek_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxCashTrnPerMonth_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxDpPerTrn_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxDpPerDay_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxDpPerWeek_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxDpPerMonth_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxWdPerTrn_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxWdPerDay_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxWdPerWeek_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxWdPerMonth_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxFdPerTrn_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxFdPerDay_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxFdPerWeek_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxFdPerMonth_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoFdPerDay_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoFdPerWeek_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxNoFdPerMonth_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMinBalance_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_enabledMaxBalance_OutletTransactionProfile;
ALTER TABLE public.OutletTransactionProfile DROP CONSTRAINT  ck_status_OutletTransactionProfile;

-- migrate data from public to absdata
INSERT INTO public.OutletTransactionProfile (oid, outletTpId, name, tpType, description, maxDpPerTrn, maxDpPerDay, maxDpPerWeek, maxDpPerMonth, maxWdPerTrn, maxWdPerDay, maxWdPerWeek, maxWdPerMonth,maxFdPerTrn, maxFdPerDay, maxFdPerWeek, maxFdPerMonth, maxNoFdPerDay, maxNoFdPerWeek, maxNoFdPerMonth, minBalance, maxBalance, maxNoCashTrnPerDay, maxNoCashTrnPerWeek, maxNoCashTrnPerMonth, maxCashTrnPerDay, maxCashTrnPerWeek, maxCashTrnPerMonth, enabledMaxNoCashTrnPerDay, enabledMaxNoCashTrnPerWeek, enabledMaxNoCashTrnPerMonth, enabledMaxCashTrnPerDay, enabledMaxCashTrnPerWeek, enabledMaxCashTrnPerMonth, enabledMaxDpPerTrn, enabledMaxDpPerDay, enabledMaxDpPerWeek, enabledMaxDpPerMonth, enabledMaxWdPerTrn, enabledMaxWdPerDay, enabledMaxWdPerWeek, enabledMaxWdPerMonth, enabledMaxFdPerTrn, enabledMaxFdPerDay, enabledMaxFdPerWeek, enabledMaxFdPerMonth, enabledMaxNoFdPerDay, enabledMaxNoFdPerWeek, enabledMaxNoFdPerMonth, enabledMinBalance, enabledMaxBalance,blockMaxDpPerTrn,blockMaxDpPerDay,blockMaxDpPerWeek,blockMaxDpPerMonth,blockMxWdPerTrn,blockMaxWdPerDay,blockMaxWdPerWeek,blockMaxWdPerMonth,blockMaxFdPerTrn,blockMaxFdPerDay,blockMaxFdPerWeek,blockMaxFdPerMonth,blockMaxNoFdPerDay,blockMaxNoFdPerWeek, blockMaxNoFdPerMonth,blockMinBalance,blockMaxBalance,rejectionCause,status,createdBy,createdOn,updatedBy,updatedOn) (SELECT outlettpid,outlettpid,name,tptype,description,maxdppertrn,maxdpperday,maxdpperweek,maxdppermonth,maxwdpertrn,maxwdperday,maxwdperweek,maxwdpermonth,  maxfdpertrn,maxfdperday,maxfdperweek, maxfdpermonth,maxnofdperday,maxnofdperweek,maxnofdpermonth,minbalance,maxbalance,maxnocashtrnperday,maxnocashtrnperweek,maxnocashtrnpermonth,maxcashtrnperday,maxcashtrnperweek,maxcashtrnpermonth, enabledmaxnocashtrnperday,enabledmaxnocashtrnperweek,enabledmaxnocashtrnpermonth,enabledmaxcashtrnperday,enabledmaxcashtrnperweek,enabledmaxcashtrnpermonth,enabledmaxdppertrn,enabledmaxdpperday, enabledmaxdpperweek,enabledmaxdppermonth,enabledmaxwdpertrn,enabledmaxwdperday,enabledmaxwdperweek,enabledmaxwdpermonth,enabledmaxfdpertrn,enabledmaxfdperday,enabledmaxfdperweek,enabledmaxfdpermonth, enabledmaxnofdperday,enabledmaxnofdperweek,enabledmaxnofdpermonth,enabledminbalance,enabledmaxbalance,blockmaxdppertrn,blockmaxdpperday,blockmaxdpperweek,blockmaxdppermonth,blockmxwdpertrn,blockmaxwdperday, blockmaxwdperweek,blockmaxwdpermonth,blockmaxfdpertrn,blockmaxfdperday,blockmaxfdperweek,blockmaxfdpermonth,blockmaxnofdperday,blockmaxnofdperweek,blockmaxnofdpermonth,blockminbalance,blockmaxbalance, rejectioncause,status,createdby,createdon,updatedby,updatedon FROM absold.OutletTransactionProfile);

-- Update enabledMaxNoCashTrnPerDay value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxNoCashTrnPerDay = CASE
WHEN enabledMaxNoCashTrnPerDay = 'N' THEN 'No'
WHEN enabledMaxNoCashTrnPerDay = 'Y' THEN 'Yes'
ELSE enabledMaxNoCashTrnPerDay END  WHERE   enabledMaxNoCashTrnPerDay IN ('N', 'Y');

-- Update status value A=Active, I=Inactive, BM=BankMade
UPDATE public.OutletTransactionProfile
SET status = CASE
WHEN status = 'BM' THEN 'Made'
WHEN status = 'BA' THEN 'Approved'
WHEN status = 'I' THEN 'Inactive'
WHEN status = 'A' THEN 'Active'
ELSE status END  WHERE   status IN ('BM', 'A', 'I', 'BA');

-- Update enabledMaxNoCashTrnPerWeek value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxNoCashTrnPerWeek = CASE
WHEN enabledMaxNoCashTrnPerWeek = 'N' THEN 'No'
WHEN enabledMaxNoCashTrnPerWeek = 'Y' THEN 'Yes'
ELSE enabledMaxNoCashTrnPerWeek END  WHERE   enabledMaxNoCashTrnPerWeek IN ('N', 'Y');

-- Update enabledMaxNoCashTrnPerMonth value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxNoCashTrnPerMonth = CASE
WHEN enabledMaxNoCashTrnPerMonth = 'N' THEN 'No'
WHEN enabledMaxNoCashTrnPerMonth = 'Y' THEN 'Yes'
ELSE enabledMaxNoCashTrnPerMonth END  WHERE   enabledMaxNoCashTrnPerMonth IN ('N', 'Y');

-- Update enabledMaxCashTrnPerDay value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxCashTrnPerDay = CASE
WHEN enabledMaxCashTrnPerDay = 'N' THEN 'No'
WHEN enabledMaxCashTrnPerDay = 'Y' THEN 'Yes'
ELSE enabledMaxCashTrnPerDay END  WHERE   enabledMaxCashTrnPerDay IN ('N', 'Y');

-- Update enabledMaxCashTrnPerWeek value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxCashTrnPerWeek = CASE
WHEN enabledMaxCashTrnPerWeek = 'N' THEN 'No'
WHEN enabledMaxCashTrnPerWeek = 'Y' THEN 'Yes'
ELSE enabledMaxCashTrnPerWeek END  WHERE   enabledMaxCashTrnPerWeek IN ('N', 'Y');

-- Update enabledMaxCashTrnPerMonth value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxCashTrnPerMonth = CASE
WHEN enabledMaxCashTrnPerMonth = 'N' THEN 'No'
WHEN enabledMaxCashTrnPerMonth = 'Y' THEN 'Yes'
ELSE enabledMaxCashTrnPerMonth END  WHERE   enabledMaxCashTrnPerMonth IN ('N', 'Y');

-- Update enabledMaxDpPerTrn value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxDpPerTrn = CASE
WHEN enabledMaxDpPerTrn = 'N' THEN 'No'
WHEN enabledMaxDpPerTrn = 'Y' THEN 'Yes'
ELSE enabledMaxDpPerTrn END  WHERE   enabledMaxDpPerTrn IN ('N', 'Y');

-- Update enabledMaxDpPerDay value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxDpPerDay = CASE
WHEN enabledMaxDpPerDay = 'N' THEN 'No'
WHEN enabledMaxDpPerDay = 'Y' THEN 'Yes'
ELSE enabledMaxDpPerDay END  WHERE   enabledMaxDpPerDay IN ('N', 'Y');

-- Update enabledMaxDpPerWeek value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxDpPerWeek = CASE
WHEN enabledMaxDpPerWeek = 'N' THEN 'No'
WHEN enabledMaxDpPerWeek = 'Y' THEN 'Yes'
ELSE enabledMaxDpPerWeek END  WHERE   enabledMaxDpPerWeek IN ('N', 'Y');

-- Update enabledMaxDpPerMonth value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxDpPerMonth = CASE
WHEN enabledMaxDpPerMonth = 'N' THEN 'No'
WHEN enabledMaxDpPerMonth = 'Y' THEN 'Yes'
ELSE enabledMaxDpPerMonth END  WHERE   enabledMaxDpPerMonth IN ('N', 'Y');

-- Update enabledMaxWdPerTrn value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxWdPerTrn = CASE
WHEN enabledMaxWdPerTrn = 'N' THEN 'No'
WHEN enabledMaxWdPerTrn = 'Y' THEN 'Yes'
ELSE enabledMaxWdPerTrn END  WHERE   enabledMaxWdPerTrn IN ('N', 'Y');

-- Update enabledMaxWdPerDay value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxWdPerDay = CASE
WHEN enabledMaxWdPerDay = 'N' THEN 'No'
WHEN enabledMaxWdPerDay = 'Y' THEN 'Yes'
ELSE enabledMaxWdPerDay END  WHERE   enabledMaxWdPerDay IN ('N', 'Y');

-- Update enabledMaxWdPerWeek value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxWdPerWeek = CASE
WHEN enabledMaxWdPerWeek = 'N' THEN 'No'
WHEN enabledMaxWdPerWeek = 'Y' THEN 'Yes'
ELSE enabledMaxWdPerWeek END  WHERE   enabledMaxWdPerWeek IN ('N', 'Y');

-- Update enabledMaxWdPerMonth value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxWdPerMonth = CASE
WHEN enabledMaxWdPerMonth = 'N' THEN 'No'
WHEN enabledMaxWdPerMonth = 'Y' THEN 'Yes'
ELSE enabledMaxWdPerMonth END  WHERE   enabledMaxWdPerMonth IN ('N', 'Y');

-- Update enabledMaxFdPerTrn value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxFdPerTrn = CASE
WHEN enabledMaxFdPerTrn = 'N' THEN 'No'
WHEN enabledMaxFdPerTrn = 'Y' THEN 'Yes'
ELSE enabledMaxFdPerTrn END  WHERE   enabledMaxFdPerTrn IN ('N', 'Y');

-- Update enabledMaxFdPerDay value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxFdPerDay = CASE
WHEN enabledMaxFdPerDay = 'N' THEN 'No'
WHEN enabledMaxFdPerDay = 'Y' THEN 'Yes'
ELSE enabledMaxFdPerDay END  WHERE   enabledMaxFdPerDay IN ('N', 'Y');

-- Update enabledMaxFdPerWeek value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxFdPerWeek = CASE
WHEN enabledMaxFdPerWeek = 'N' THEN 'No'
WHEN enabledMaxFdPerWeek = 'Y' THEN 'Yes'
ELSE enabledMaxFdPerWeek END  WHERE   enabledMaxFdPerWeek IN ('N', 'Y');

-- Update enabledMaxFdPerMonth value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxFdPerMonth = CASE
WHEN enabledMaxFdPerMonth = 'N' THEN 'No'
WHEN enabledMaxFdPerMonth = 'Y' THEN 'Yes'
ELSE enabledMaxFdPerMonth END  WHERE   enabledMaxFdPerMonth IN ('N', 'Y');

-- Update enabledMaxNoFdPerDay value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxNoFdPerDay = CASE
WHEN enabledMaxNoFdPerDay = 'N' THEN 'No'
WHEN enabledMaxNoFdPerDay = 'Y' THEN 'Yes'
ELSE enabledMaxNoFdPerDay END  WHERE   enabledMaxNoFdPerDay IN ('N', 'Y');

-- Update enabledMaxNoFdPerWeek value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxNoFdPerWeek = CASE
WHEN enabledMaxNoFdPerWeek = 'N' THEN 'No'
WHEN enabledMaxNoFdPerWeek = 'Y' THEN 'Yes'
ELSE enabledMaxNoFdPerWeek END  WHERE   enabledMaxNoFdPerWeek IN ('N', 'Y');

-- Update enabledMaxNoFdPerMonth value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxNoFdPerMonth = CASE
WHEN enabledMaxNoFdPerMonth = 'N' THEN 'No'
WHEN enabledMaxNoFdPerMonth = 'Y' THEN 'Yes'
ELSE enabledMaxNoFdPerMonth END  WHERE   enabledMaxNoFdPerMonth IN ('N', 'Y');

-- Update enabledMinBalance value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMinBalance = CASE
WHEN enabledMinBalance = 'N' THEN 'No'
WHEN enabledMinBalance = 'Y' THEN 'Yes'
ELSE enabledMinBalance END  WHERE   enabledMinBalance IN ('N', 'Y');

-- Update enabledMaxBalance value N=NO, Y =Yes
UPDATE public.OutletTransactionProfile
SET enabledMaxBalance = CASE
WHEN enabledMaxBalance = 'N' THEN 'No'
WHEN enabledMaxBalance = 'Y' THEN 'Yes'
ELSE enabledMaxBalance END  WHERE   enabledMaxBalance IN ('N', 'Y');

-- Update tpType value DF=Default
UPDATE public.OutletTransactionProfile
SET tpType = CASE
WHEN tpType = 'DF' THEN 'Default'
ELSE tpType END  WHERE   tpType IN ('DF');

-- Enable check constraint
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_tpType_OutletTransactionProfile check (tpType = 'Default' or tpType = 'Specific' or tpType = 'NotDefined');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxNoCashTrnPerDay_OutletTransactionProfile check (enabledMaxNoCashTrnPerDay = 'Yes' or enabledMaxNoCashTrnPerDay = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxNoCashTrnPerWeek_OutletTransactionProfile check (enabledMaxNoCashTrnPerWeek = 'Yes' or enabledMaxNoCashTrnPerWeek = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxNoCashTrnPerMonth_OutletTransactionProfile check (enabledMaxNoCashTrnPerMonth = 'Yes' or enabledMaxNoCashTrnPerMonth = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxCashTrnPerDay_OutletTransactionProfile check (enabledMaxCashTrnPerDay = 'Yes' or enabledMaxCashTrnPerDay = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxCashTrnPerWeek_OutletTransactionProfile check (enabledMaxCashTrnPerWeek = 'Yes' or enabledMaxCashTrnPerWeek = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxCashTrnPerMonth_OutletTransactionProfile check (enabledMaxCashTrnPerMonth = 'Yes' or enabledMaxCashTrnPerMonth = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxDpPerTrn_OutletTransactionProfile check (enabledMaxDpPerTrn = 'Yes' or enabledMaxDpPerTrn = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxDpPerDay_OutletTransactionProfile check (enabledMaxDpPerDay = 'Yes' or enabledMaxDpPerDay = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxDpPerWeek_OutletTransactionProfile check (enabledMaxDpPerWeek = 'Yes' or enabledMaxDpPerWeek = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxDpPerMonth_OutletTransactionProfile check (enabledMaxDpPerMonth = 'Yes' or enabledMaxDpPerMonth = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxWdPerTrn_OutletTransactionProfile check (enabledMaxWdPerTrn = 'Yes' or enabledMaxWdPerTrn = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxWdPerDay_OutletTransactionProfile check (enabledMaxWdPerDay = 'Yes' or enabledMaxWdPerDay = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxWdPerWeek_OutletTransactionProfile check (enabledMaxWdPerWeek = 'Yes' or enabledMaxWdPerWeek = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxWdPerMonth_OutletTransactionProfile check (enabledMaxWdPerMonth = 'Yes' or enabledMaxWdPerMonth = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxFdPerTrn_OutletTransactionProfile check (enabledMaxFdPerTrn = 'Yes' or enabledMaxFdPerTrn = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxFdPerDay_OutletTransactionProfile check (enabledMaxFdPerDay = 'Yes' or enabledMaxFdPerDay = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxFdPerWeek_OutletTransactionProfile check (enabledMaxFdPerWeek = 'Yes' or enabledMaxFdPerWeek = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxFdPerMonth_OutletTransactionProfile check (enabledMaxFdPerMonth = 'Yes' or enabledMaxFdPerMonth = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxNoFdPerDay_OutletTransactionProfile check (enabledMaxNoFdPerDay = 'Yes' or enabledMaxNoFdPerDay = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxNoFdPerWeek_OutletTransactionProfile check (enabledMaxNoFdPerWeek = 'Yes' or enabledMaxNoFdPerWeek = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxNoFdPerMonth_OutletTransactionProfile check (enabledMaxNoFdPerMonth = 'Yes' or enabledMaxNoFdPerMonth = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMinBalance_OutletTransactionProfile check (enabledMinBalance = 'Yes' or enabledMinBalance = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_enabledMaxBalance_OutletTransactionProfile check (enabledMaxBalance = 'Yes' or enabledMaxBalance = 'No');
ALTER TABLE public.OutletTransactionProfile ADD CONSTRAINT ck_status_OutletTransactionProfile check (status = 'Active' or status = 'Inactive' or status = 'Made' or status = 'Approved');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.OutletTransactionProfile) where targetTable = 'OutletTransactionProfile' and sourceTable = 'OutletTransactionProfile';














