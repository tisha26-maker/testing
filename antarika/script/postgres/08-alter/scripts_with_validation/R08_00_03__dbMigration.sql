
--	27	ProductAccTransProfile-----------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ProductAccTransProfile', 'ProductAccTransProfile', current_timestamp, (select count(*) from absold.ProductAccTransProfile));

-- migrate data from public to absdata
INSERT INTO public.ProductAccTransProfile (oid, productacctpid, accounttpoid, productoid, createdby, createdon, updatedby, updatedon) (SELECT productacctpid, productacctpid, accounttpid, productid, createdby, createdon, updatedby, updatedon FROM absold.ProductAccTransProfile);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.ProductAccTransProfile) where targetTable = 'ProductAccTransProfile' and sourceTable = 'ProductAccTransProfile';

--	28	AgentDraft ----------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('AgentDraft', 'DraftAgent', current_timestamp, (select count(*) from absold.AgentDraft));

-- Disable check constraint ck_agenttype_draftagent, ck_status_agentdraft
ALTER TABLE public.DraftAgent DROP CONSTRAINT ck_status_draftagent;
ALTER TABLE public.DraftAgent DROP CONSTRAINT ck_agenttype_draftagent;

-- migrate data from public to absdata
INSERT INTO public.DraftAgent (oid, agentid, loginid, password, bankoid, branchoid, parentagentid, agenttype, agentname, agentphotopath, kycjson, bankaccountno, status, rejectioncause, roleid, agentcategoryoid, tagdictionaryoid, presentaddress, permanentaddress, draftsavedby, draftsavedon) (SELECT agentid, agentid, loginid, password, bankid, branchid, parentagentid, agenttype, agentname, agentphotopath, kycjson, bankaccountno, status, rejectioncause, roleid, agentcatid, taglibid, presentaddress, permanentaddress, createdby, createdon FROM absold.AgentDraft);

-- Update status value DR=Draft, C= Closed BM= DataUpdated***
UPDATE public.DraftAgent  SET status = CASE WHEN status = 'DR' THEN 'Draft' WHEN status = 'C' THEN 'Closed' WHEN status = 'BM' THEN 'DataUpdated'  ELSE status END  WHERE   status IN ('DR', 'C', 'BM');
-- Update agenttype value
UPDATE public.DraftAgent  SET agenttype = CASE WHEN agenttype = 'A' THEN 'Agent' WHEN agenttype = 'SA' THEN 'SubAgent' WHEN agenttype = 'BA' THEN 'BranchAgent' ELSE 'Agent' END  WHERE   agenttype IN ('A', 'SA', 'BA', '');


-- Enable check constraint ck_agenttype_draftagent, ck_status_agentdraft
ALTER TABLE public.DraftAgent ADD CONSTRAINT ck_status_draftagent check (status = 'Draft' or status = 'Closed' or status = 'DataUpdated');
ALTER TABLE public.DraftAgent ADD CONSTRAINT ck_agenttype_draftagent check (agenttype = 'Agent' or agenttype = 'SubAgent' or agenttype = 'BranchAgent');

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.DraftAgent) where targetTable = 'DraftAgent' and sourceTable = 'AgentDraft';

--	29	Agent --------------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Agent', 'Agent', current_timestamp, (select count(*) from absold.Agent));

-- Disable check constraint ck_agenttype_agent, ck_isnewrecord_agent, ck_status_agent
ALTER TABLE public.Agent DROP CONSTRAINT ck_agenttype_agent;
ALTER TABLE public.Agent DROP CONSTRAINT ck_isnewrecord_agent;
ALTER TABLE public.Agent DROP CONSTRAINT ck_status_agent;

-- Disable column required constraint
ALTER TABLE public.Agent ALTER COLUMN currentVersion DROP NOT NULL;


-- migrate data from public to absdata
INSERT INTO public.Agent (oid, agentid, loginid, password, bankoid, branchoid, parentagentoid, agenttype, agentname, agentphotopath, kycjson, bankaccountno, rejectioncause, roleid, agentcategoryoid, presentaddress, permanentaddress, tagdictionaryoid, status, currentversion, isnewrecord, approvedby, approvedon, createdby, createdon, editedby, editedon)(SELECT agentid, agentid, loginid, password, bankid, branchid, parentagentid, agenttype, agentname, agentphotopath, kycjson, bankaccountno, rejectioncause, roleid, agentcatid, presentaddress, permanentaddress, taglibid, status, null, null, approverid, updatedon, createdby, createdon, updatedby, updatedon FROM absold.Agent);

-- Update status ***
UPDATE public.Agent SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'C' THEN 'Closed' WHEN status = 'AS' THEN 'ApplicationSubmitted'WHEN status = 'BR' THEN 'ApplicationRejected' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'BM' THEN 'DataUpdated' ELSE status END  WHERE   status IN ('BR', 'BM','BA', 'C', 'AS', 'A', 'I');

-- Update agentType ***
UPDATE public.Agent SET agenttype = CASE WHEN agenttype = 'A' THEN 'Agent' WHEN agenttype = 'SA' THEN 'SubAgent' WHEN agenttype = 'BR' THEN 'BranchAgent' ELSE agenttype END  WHERE   agenttype IN ('A', 'SA', 'BR');

-- Update currentVersion column value
Update public.Agent SET currentVersion='1';

-- Enable check constraint ck_agenttype_agent, ck_isnewrecord_agent, ck_status_agent
ALTER TABLE public.Agent ADD CONSTRAINT ck_status_agent check (status = 'ApplicationSubmitted' or status = 'DataUpdated'or status = 'BankApproved' or status = 'Active' or status = 'Hold' or  status = 'Inactive' or status = 'Closed' or status = 'ApplicationRejected' or status = 'Deleted');
ALTER TABLE public.Agent ADD CONSTRAINT ck_agenttype_agent check (agenttype = 'Agent' or agenttype = 'SubAgent' or agenttype = 'BranchAgent');
ALTER TABLE public.Agent ADD CONSTRAINT ck_isnewrecord_agent check (isnewrecord = 'Yes' or isnewrecord = 'No');

-- Enable column required constraint
ALTER TABLE public.Agent ALTER COLUMN currentVersion SET NOT NULL;
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Agent) where targetTable = 'Agent' and sourceTable = 'Agent';

--	30	AgentAccountDraft ------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('AgentAccountDraft', 'AgentAccountDraft', current_timestamp, (select count(*) from absold.AgentAccountDraft));

-- migrate data from public to absdata
INSERT INTO public.AgentAccountDraft (oid, agentAccountId, bankAccountNo, accountType, agentOid, createdBy, createdOn, updatedBy,updatedOn) (SELECT agentAccId as oid , agentAccId, accountNo, accountType, agentId, createdBy, createdOn, updatedBy, updatedOn  FROM absold.AgentAccountDraft);
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.AgentAccountDraft) where targetTable = 'AgentAccountDraft' and sourceTable = 'AgentAccountDraft';

--	31	AgentAccount -----------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('AgentAccount', 'AgentAccount', current_timestamp, (select count(*) from absold.AgentAccount));

-- migrate data from public to absdata
INSERT INTO public.AgentAccount (oid,agentAccountId, bankAccountNo, accountType, agentOid, createdBy, createdOn, updatedBy,updatedOn) (SELECT agentAccId as oid , agentAccId, accountNo, accountType, agentId, createdBy, createdOn, updatedBy, updatedOn  FROM absold.AgentAccount);
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.AgentAccount) where targetTable = 'AgentAccount' and sourceTable = 'AgentAccount';

--	32	AgentServiceStaffDraft --------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('AgentServiceStaffDraft', 'DraftAgentServiceStaff', current_timestamp, (select count(*) from absold.AgentServiceStaffDraft));

-- Disable check constraint - status
ALTER TABLE public.DraftAgentServiceStaff DROP CONSTRAINT  ck_status_DraftAgentServiceStaff;

-- migrate data from public to absdata
INSERT INTO public.DraftAgentServiceStaff (oid, agentServiceStaffId, servicePointOid, agentStaffName, agentStaffPhotoPath, kycJson, loginId, password, roleId, agentOid, bankOid, branchOid, status, rejectionCause, presentAddress, permanentAddress, draftSavedBy, draftSavedOn ) (SELECT oid, assId, servicePointId, agentStaffName, agentStaffPhotoPath, kycJson, loginId, password, roleid, agentId, bankId, branchId, assStatus, rejectionCause, presentAddress, permanentAddress, createdBy, createdOn FROM absold.AgentServiceStaffDraft);


-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive,C=Close,D=Delete , DR=Draft ,BR=BankRejected, IE=Ineditable
UPDATE public.DraftAgentServiceStaff SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'C' THEN 'Close' WHEN status = 'D' THEN 'Delete' WHEN status = 'DR' THEN 'Draft' WHEN status = 'BR' THEN 'BankRejected'  WHEN status = 'IE' THEN 'InEditable' ELSE status END WHERE   status IN ('BM', 'BA','A', 'I', 'C', 'D','DR', 'IE', 'BR' );

-- update agentoid
update public.DraftAgentServiceStaff ags set agentoid=(select oid from public.agent ag where ags.agentoid=ag.loginid);

-- Enable check constraint for status
ALTER TABLE public.DraftAgentServiceStaff ADD CONSTRAINT ck_status_DraftAgentServiceStaff check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Close' or status = 'Delete' or status = 'Draft' or status = 'BankRejected' or status = 'InEditable');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.DraftAgentServiceStaff) where targetTable = 'DraftAgentServiceStaff' and sourceTable = 'AgentServiceStaffDraft';

--	33	AgentCategory ------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('AgentCategory', 'AgentCategory', current_timestamp, (select count(*) from absold.AgentCategory));

-- migrate data from public to absdata
INSERT INTO public.AgentCategory (oid, agentcategoryid, name, description, createdby, createdon, updatedby, updatedon) (SELECT agentcatid, agentcatid, name, description, createdby, createdon, updatedby, updatedon FROM absold.AgentCategory);

-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.AgentCategory) where targetTable = 'AgentCategory' and sourceTable = 'AgentCategory';

--	34	OutletArea --------------------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('OutletArea', 'OutletArea', current_timestamp, (select count(*) from absold.OutletArea));

-- Disable column required constraint
ALTER TABLE public.OutletArea ALTER COLUMN currentVersion DROP NOT NULL;

-- Disable check constraint status
ALTER TABLE public.OutletArea DROP CONSTRAINT ck_status_outletarea;

-- migrate data from public to absdata
INSERT INTO public.OutletArea (oid, outletareaid, name, description, rejectioncause, status, currentversion, isnewrecord, approvedby, approvedon, createdby, createdon, editedby, editedon)  (SELECT outletareaid, outletareaid, name, description, rejectioncause, status, null, null, null, null, createdby, createdon, updatedby, updatedon FROM absold.OutletArea);


-- Update status value A=Active, I=Inactive
UPDATE public.OutletArea  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' ELSE status END  WHERE   status IN ('I', 'A');

--Update currentVersion column value
Update public.OutletArea SET currentVersion='1';

-- Enable column required constraint
ALTER TABLE public.OutletArea ALTER COLUMN currentVersion SET NOT NULL;

-- Enable check constraint for cardstatus
ALTER TABLE public.OutletArea ADD CONSTRAINT ck_status_OutletArea check (status = 'Inactive' or status = 'Closed' or status = 'Active' or status = 'Deleted');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.OutletArea) where targetTable = 'OutletArea' and sourceTable = 'OutletArea';

--	35	OutletZone ------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('OutletZone', 'OutletZone', current_timestamp, (select count(*) from absold.OutletZone));

-- Disable column required constraint
ALTER TABLE public.OutletZone ALTER COLUMN currentVersion DROP NOT NULL;

-- Disable check constraint status
ALTER TABLE public.OutletZone DROP CONSTRAINT ck_status_outletzone;
ALTER TABLE public.OutletZone DROP CONSTRAINT ck_isNewRecord_outletzone;

-- migrate data from public to absdata
INSERT INTO public.OutletZone (oid, outletzoneid, name, description, outletareaoid, status, rejectioncause, currentversion, isnewrecord, approvedby, approvedon, createdby, createdon, editedby, editedon) (SELECT outletzoneid, outletzoneid, name, description, outletareaid, status, rejectioncause, null, null, null, null, createdby, createdon, updatedby, updatedon FROM absold.OutletZone);


-- Update status value A=Active, I=Inactive
UPDATE public.OutletZone  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' ELSE status END  WHERE   status IN ('I', 'A');

--Update currentVersion column value
Update public.OutletZone SET currentVersion='1';

ALTER TABLE public.OutletZone ALTER COLUMN currentVersion SET NOT NULL;
ALTER TABLE public.OutletZone ADD CONSTRAINT ck_status_outletzone check (status = 'Inactive' or status = 'Closed' or status = 'Active' or status = 'Deleted');
ALTER TABLE public.OutletZone ADD CONSTRAINT ck_isNewRecord_outletzone check (isNewRecord = 'Yes' or isNewRecord = 'No');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.OutletZone) where targetTable = 'OutletZone' and sourceTable = 'OutletZone';

--	36	ServicePointDraft --------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ServicePointDraft', 'DraftServicePoint', current_timestamp, (select count(*) from absold.ServicePointDraft));

-- Disable check constraint - status
ALTER TABLE public.DraftServicePoint DROP CONSTRAINT  ck_status_DraftServicePoint;

-- migrate data from public to absdata
INSERT INTO public.DraftServicePoint (oid , servicePointId, servicePointName, bankAccountNo, city, postalCode, district, division, thana, telephone1, telephone2, emailAddress, longitude, latitude, photoPath, applyDate, openingDate, tin, tradeLicenceNo, rejectionCause, status, bankOid, branchOid, agentOid, outletZoneOid, outletTpOid, presentAddress, permanentAddress, draftSavedBy, draftSavedOn)
(SELECT servicepointid as oid, servicepointid, servicepointname, bankaccountno,city, postalcode, district,division,thana,telephone1,telephone2,emailaddress,longitude,latitude,photopath,applydate,openingdate,tin,tradelicence,rejectioncause,servicepointstatus ,bankid,branchid,agentid,outletzoneid,outlettpid,presentaddress,addressline2,createdby,createdon FROM absold.ServicePointDraft);


-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive,C=Close,D=Delete , DR=Draft ,BR=BankRejected, IE=Ineditable
UPDATE public.DraftServicePoint SET status = CASE WHEN status = 'BM' THEN 'BankMade'WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'C' THEN 'Close'WHEN status = 'D' THEN 'Delete'WHEN status = 'DR' THEN 'Draft'WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable'ELSE status END  WHERE   status IN ('BM', 'BA','A', 'I', 'C', 'D','DR', 'IE', 'BR' );

-- Enable check constraint for status
ALTER TABLE public.DraftServicePoint ADD CONSTRAINT ck_status_DraftServicePoint check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Close' or status = 'Delete' or status = 'Draft' or status = 'BankRejected' or status = 'InEditable');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.DraftServicePoint) where targetTable = 'DraftServicePoint' and sourceTable = 'ServicePointDraft';

--	37	ServicePoint ---------------------------------------------------
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ServicePoint', 'ServicePoint', current_timestamp, (select count(*) from absold.ServicePoint));

-- Disable check constraint - status
ALTER TABLE public.ServicePoint DROP CONSTRAINT  ck_status_ServicePoint;


-- Disable check constraint - isNewRecord
ALTER TABLE public.ServicePoint DROP CONSTRAINT  ck_isNewRecord_ServicePoint;

-- migrate data from public to absdata
INSERT INTO public.ServicePoint (oid , servicePointId, servicePointName, bankAccountNo, city, postalCode, district, division, thana, telephone1, telephone2, emailAddress, longitude, latitude, photopath, applyDate, openingDate, tin, tradeLicenceNo, status, currentVersion, isNewRecord , approvedBy ,rejectionCause, bankOid, branchOid, agentOid, outletZoneOid, outletTpOid, presentAddress, permanentAddress, createdBy, createdOn, editedBy, editedOn) (SELECT servicepointid as oid , servicepointid, servicepointname, bankaccountno, city, postalcode, district, division, thana, telephone1, telephone2, emailaddress, longitude, latitude, photopath, applydate, openingdate, tin, tradelicence, servicepointstatus, '1',null,approverid,rejectioncause, bankid, branchid,  agentid, outletzoneid, outlettpid, presentaddress, addressline2, createdby, createdon, updatedby, updatedon FROM absold.ServicePoint);

-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive,C=Close,D=Delete  DR=Draft BR=BankRejected, IE=Ineditable
UPDATE public.ServicePoint SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'C' THEN 'Close' WHEN status = 'D' THEN 'Delete' WHEN status = 'DR' THEN 'Draft' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('BM', 'BA','A', 'I', 'C', 'D','DR', 'IE', 'BR' );

-- Enable check constraint for status
ALTER TABLE public.ServicePoint ADD CONSTRAINT ck_status_ServicePoint check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Close' or status = 'Delete' or status = 'Draft' or status = 'BankRejected' or status = 'InEditable');

-- Update branch servicepointid
update public.servicepoint set oid = substring(oid, 7), servicepointid = substring(servicepointid, 7) where oid like 'SP%';

-- Enable check constraint for isNewRecord
ALTER TABLE public.ServicePoint ADD CONSTRAINT ck_isNewRecord_ServicePoint check (isNewRecord = 'Yes' or isNewRecord = 'No');
-- Post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.ServicePoint) where targetTable = 'ServicePoint' and sourceTable = 'ServicePoint';

--	38	ServiceTerminal
-- ================================================== FpDevice ==================================================
-- Pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ServiceTerminal', 'FpDevice', current_timestamp, (select count(*) from absold.ServiceTerminal));

-- Disable check constraint - deviceStatus
ALTER TABLE public.FpDevice DROP CONSTRAINT  ck_deviceStatus_FpDevice;

-- Disable check constraint - status
ALTER TABLE public.FpDevice DROP CONSTRAINT  ck_status_FpDevice;

-- migrate data from public to absdata
INSERT INTO public.FpDevice (oid,fpDeviceId,identifier,fpDeviceModelOid,deviceStatus,deviceStatusUpdatedOn,status,currentVersion,createdBy,createdOn,editedBy,editedOn) (SELECT 'FD' || LPAD(row_number() over()::text, 7, '0'), 'FD' || LPAD(row_number() over()::text, 7, '0'),biometricdeviceaddress,'Morpho-MSO1300E2','Assigned',updatedon,serviceterminalstatus,'1',createdby,createdon,updatedby,updatedon FROM absold.ServiceTerminal);


-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive,BR=BankRejected, IE=Ineditable
UPDATE public.FpDevice SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('BM', 'BA','A', 'I','IE', 'BR' );

-- Enable check constraint for deviceStatus
ALTER TABLE public.FpDevice ADD CONSTRAINT ck_deviceStatus_FpDevice check (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned');

ALTER TABLE public.FpDevice ADD CONSTRAINT ck_status_FpDevice check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Close' or status = 'Delete' or status = 'Damaged' or status = 'BankRejected' or status = 'InEditable');
-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.FpDevice) where targetTable = 'FpDevice' and sourceTable = 'ServiceTerminal';

-- ================================================== ClientDevice ==================================================
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ServiceTerminal', 'ClientDevice', current_timestamp, (select count(*) from absold.ServiceTerminal));

-- Disable check constraint - deviceStatus
ALTER TABLE public.ClientDevice DROP CONSTRAINT  ck_deviceStatus_ClientDevice;

-- Disable check constraint - status
ALTER TABLE public.ClientDevice DROP CONSTRAINT  ck_status_ClientDevice;

-- migrate data from public to absdata
INSERT INTO public.ClientDevice (oid, clientDeviceId, identifier,optionalIdentifier,clientDeviceModelOid,deviceStatus,deviceStatusUpdatedOn,status,currentVersion,createdBy,createdOn,editedBy,editedOn)(SELECT 'CLD' || LPAD(row_number() over()::text, 7, '0'),'CLD' || LPAD(row_number() over()::text, 7, '0'),serviceclientdeviceaddress,serviceclientdeviceaddress,'SAMSUNG-GALAXY J MAX','Assigned',updatedon,serviceterminalstatus,'1',createdby, createdon,updatedby,updatedon FROM absold.ServiceTerminal);

-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive,BR=BankRejected, IE=Ineditable
UPDATE public.ClientDevice SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'BankRejected'  WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('BM', 'BA','A', 'I','IE', 'BR' );

-- Enable check constraint for deviceStatus
ALTER TABLE public.ClientDevice ADD CONSTRAINT ck_deviceStatus_ClientDevice check (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned');

-- Enable check constraint for status
ALTER TABLE public.ClientDevice ADD CONSTRAINT ck_status_ClientDevice check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Close' or status = 'Delete' or status = 'Damaged' or status = 'BankRejected' or status = 'InEditable');

-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.ClientDevice) where targetTable = 'ClientDevice' and sourceTable = 'ServiceTerminal';

-- ================================================== PrinterDevice ==================================================
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ServiceTerminal', 'PrinterDevice', current_timestamp, (select count(*) from absold.ServiceTerminal));

-- Disable check constraint - deviceStatus
ALTER TABLE public.PrinterDevice DROP CONSTRAINT  ck_deviceStatus_PrinterDevice;

-- Disable check constraint - status
ALTER TABLE public.PrinterDevice DROP CONSTRAINT  ck_status_PrinterDevice;

 -- migrate data from public to absdata
INSERT INTO public.PrinterDevice (oid,printerDeviceId,identifier,printerDeviceModelOid,deviceStatus,deviceStatusUpdatedOn,status,currentVersion,createdBy,createdOn,editedBy,editedOn)(SELECT 'PD' || LPAD(row_number() over()::text, 7, '0'),'PD' || LPAD(row_number() over()::text, 7, '0'), printerdeviceaddress, 'DATECS-DPP-250', 'Assigned', updatedon, serviceterminalstatus,'1',createdby,createdon,updatedby,updatedon FROM absold.ServiceTerminal);

-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive,BR=BankRejected, IE=Ineditable
UPDATE public.PrinterDevice SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable' ELSE status END  WHERE   status IN ('BM', 'BA','A', 'I','IE', 'BR' );

-- Enable check constraint for deviceStatus
ALTER TABLE public.PrinterDevice ADD CONSTRAINT ck_deviceStatus_PrinterDevice check (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned');

-- Enable check constraint for status
ALTER TABLE public.PrinterDevice ADD CONSTRAINT ck_status_PrinterDevice check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Close' or status = 'Delete' or status = 'Damaged' or status = 'BankRejected' or status = 'InEditable');
-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.PrinterDevice) where targetTable = 'PrinterDevice' and sourceTable = 'ServiceTerminal';

-- ================================================== CardDevice ==================================================
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ServiceTerminal', 'CardDevice', current_timestamp, (select count(*) from absold.ServiceTerminal));

-- Disable check constraint - deviceStatus
ALTER TABLE public.CardDevice DROP CONSTRAINT  ck_deviceStatus_CardDevice;

-- Disable check constraint - status
ALTER TABLE public.CardDevice DROP CONSTRAINT  ck_status_CardDevice;

INSERT INTO public.CardDevice (oid,cardDeviceId,identifier,cardDeviceModelOid,deviceStatus,deviceStatusUpdatedOn,status,currentVersion,createdBy,createdOn,editedBy,editedOn) (SELECT 'CD' || LPAD(row_number() over()::text, 7, '0'),'CD' || LPAD(row_number() over()::text, 7, '0'),carddeviceaddress,'EVOLUTE-IMPRESS','Assigned',updatedon,serviceterminalstatus,'1',createdby,createdon,updatedby,updatedon FROM absold.ServiceTerminal);

-- Update status value BM=BankMade, BA=BankApproved, A=Active, I=Inactive,BR=BankRejected, IE=Ineditable
UPDATE public.CardDevice SET status = CASE WHEN status = 'BM' THEN 'BankMade' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'BankRejected' WHEN status = 'IE' THEN 'InEditable'ELSE status END  WHERE   status IN ('BM', 'BA','A', 'I','IE', 'BR' );

-- Enable check constraint for deviceStatus
ALTER TABLE public.CardDevice ADD CONSTRAINT ck_deviceStatus_CardDevice check (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned');

-- Enable check constraint for status
ALTER TABLE public.CardDevice ADD CONSTRAINT ck_status_CardDevice check (status = 'BankMade' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Close' or status = 'Delete' or status = 'Damaged' or status = 'BankRejected' or status = 'InEditable');
-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.CardDevice) where targetTable = 'CardDevice' and sourceTable = 'ServiceTerminal';

-- ================================================== ServiceTerminal ==================================================
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('ServiceTerminal', 'ServiceTerminal', current_timestamp, (select count(*) from absold.ServiceTerminal));

ALTER TABLE public.ServiceTerminal DROP CONSTRAINT fk_agentOid_ServiceTerminal;
ALTER TABLE public.ServiceTerminal DROP CONSTRAINT fk_fpDeviceOid_ServiceTerminal;
ALTER TABLE public.ServiceTerminal DROP CONSTRAINT fk_clientDeviceOid_ServiceTerminal;
ALTER TABLE public.ServiceTerminal DROP CONSTRAINT fk_printerDeviceOid_ServiceTerminal;
ALTER TABLE public.ServiceTerminal DROP CONSTRAINT fk_cardDeviceOid_ServiceTerminal;
ALTER TABLE public.ServiceTerminal DROP CONSTRAINT ck_status_serviceterminal;
alter table public.ServiceTerminal drop constraint fk_servicepointoid_ServiceTerminal;

INSERT INTO public.ServiceTerminal (oid, serviceTerminalId, servicePointOid, fpDeviceOid, clientDeviceOid, printerDeviceOid, cardDeviceOid, bankOid, branchOid, status, currentVersion, createdBy, createdOn, editedBy, editedOn)(SELECT serviceterminalid, serviceterminalid, servicepointid, biometricdeviceaddress, serviceclientdeviceaddress,printerdeviceaddress, carddeviceaddress, bankid, branchid, serviceterminalstatus, '1', createdby, createdon, updatedby, updatedon FROM absold.ServiceTerminal);

UPDATE 	public.ServiceTerminal st SET agentOid = (SELECT agentoid from public.servicepoint sp where sp.oid = st.servicepointoid);
UPDATE  public.ServiceTerminal st SET fpDeviceOid = (SELECT oid from public.FpDevice fp where fp.identifier = st.fpDeviceOid);
UPDATE  public.ServiceTerminal st SET clientDeviceOid = (SELECT oid from public.ClientDevice cl where cl.identifier = st.clientDeviceOid);
UPDATE  public.ServiceTerminal st SET printerDeviceOid = (SELECT oid from public.PrinterDevice pt where pt.identifier = st.printerDeviceOid);
UPDATE  public.ServiceTerminal st SET cardDeviceOid = (SELECT oid from public.CardDevice cd where cd.identifier = st.cardDeviceOid);

UPDATE public.ServiceTerminal  SET status = CASE WHEN status = 'BM' THEN 'Made' WHEN status = 'BA' THEN 'Approved 'WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'BR' THEN 'Rejected' WHEN status = 'IE' THEN 'InEditable' WHEN status = 'C' THEN 'Closed' WHEN status = 'D' THEN 'Deleted'ELSE status END  WHERE   status IN ('BM', 'BA','A', 'I','IE', 'BR', 'C', 'D');

-- Update branch servicepointid
update public.serviceterminal set servicepointoid = substring(servicepointoid, 7) where servicepointoid like 'SP%';

-- Enable check and fk
ALTER TABLE public.ServiceTerminal ADD CONSTRAINT fk_agentOid_ServiceTerminal FOREIGN KEY (agentOid) REFERENCES public.Agent(oid);
ALTER TABLE public.ServiceTerminal ADD CONSTRAINT fk_fpDeviceOid_ServiceTerminal FOREIGN KEY (fpDeviceOid) REFERENCES public.FpDevice(oid);
ALTER TABLE public.ServiceTerminal ADD CONSTRAINT fk_clientDeviceOid_ServiceTerminal FOREIGN KEY (clientDeviceOid) REFERENCES public.ClientDevice(oid);
ALTER TABLE public.ServiceTerminal ADD CONSTRAINT fk_printerDeviceOid_ServiceTerminal FOREIGN KEY (printerDeviceOid) REFERENCES public.PrinterDevice(oid);
ALTER TABLE public.ServiceTerminal ADD CONSTRAINT fk_cardDeviceOid_ServiceTerminal FOREIGN KEY (cardDeviceOid) REFERENCES public.CardDevice(oid);

ALTER TABLE public.ServiceTerminal ADD CONSTRAINT ck_status_serviceterminal check (status = 'Made' or status = 'Approved' or status = 'Active' or status = 'Inactive' or status = 'Close' or status = 'Delete' or status = 'Damaged' or status = 'Rejected' or status = 'InEditable');

alter table public.ServiceTerminal add constraint fk_servicepointoid_ServiceTerminal foreign key (servicepointoid) references public.servicepoint(oid);
-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.ServiceTerminal) where targetTable = 'ServiceTerminal' and sourceTable = 'ServiceTerminal';

--	39	AgentServiceStaff
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('AgentServiceStaff', 'AgentServiceStaff', current_timestamp, (select count(*) from absold.AgentServiceStaff));

-- Disable check constraint ck_status_agentservicestaff, ck_isnewrecord_agentservicestaff
ALTER TABLE public.AgentServiceStaff DROP CONSTRAINT ck_status_agentservicestaff;
ALTER TABLE public.AgentServiceStaff DROP CONSTRAINT ck_isnewrecord_agentservicestaff;

-- Disable column fk  constraint
ALTER TABLE public.AgentServiceStaff DROP CONSTRAINT fk_servicePointOid_AgentServiceStaff;
ALTER TABLE public.AgentServiceStaff DROP CONSTRAINT fk_bankOid_AgentServiceStaff;
ALTER TABLE public.AgentServiceStaff DROP CONSTRAINT fk_branchOid_AgentServiceStaff;

-- Disable column required constraint
ALTER TABLE public.AgentServiceStaff ALTER COLUMN currentVersion DROP NOT NULL;

-- migrate data from public to absdata
INSERT INTO public.AgentServiceStaff (oid, agentservicestaffid, servicepointoid, agentstaffname, agentstaffphotopath, kycjson, loginid, password, roleid, agentoid, bankoid, branchoid, status,  currentversion, isnewrecord, approvedby,approvedon, rejectioncause, presentaddress, permanentaddress, createdby, createdon, editedby, editedon) (SELECT oid, assid, servicepointid, agentstaffname, agentstaffphotopath,kycjson, loginid, password, roleid, agentid, bankid, branchid, assstatus, null, null, approverid, updatedon, rejectioncause, presentaddress, permanentaddress, createdby, createdon, updatedby, updatedon FROM absold.AgentServiceStaff);

-- Update status value BR=ApplicationRejected, BM=DataUpdated ***
UPDATE public.AgentServiceStaff SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive'WHEN status = 'C' THEN 'Closed' WHEN status = 'AS' THEN 'ApplicationSubmitted' WHEN status = 'BR' THEN 'ApplicationRejected' WHEN status = 'BA' THEN 'BankApproved'WHEN status = 'BM' THEN 'DataUpdated'ELSE status END  WHERE   status IN ('BR', 'BM','BA', 'C', 'AS', 'A', 'I');

-- Update currentVersion column value
Update public.AgentServiceStaff SET currentVersion='1';

-- update agentoid
update public.AgentServiceStaff ags set agentoid=(select oid from public.Agent ag where ags.agentoid=ag.loginid);

-- Enable check constraint ck_currentversion_agentservicestaff, ck_status_agentservicestaff, ck_isnewrecord_agentservicestaff
ALTER TABLE public.AgentServiceStaff ADD CONSTRAINT ck_status_agentservicestaff check (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'DataUpdated' or status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'ApplicationRejected' or status = 'Deleted');
ALTER TABLE public.AgentServiceStaff ADD CONSTRAINT ck_isnewrecord_agentservicestaff check (isnewrecord = 'Yes' or isnewrecord = 'No');

-- Enable check
ALTER TABLE public.AgentServiceStaff ADD CONSTRAINT fk_servicePointOid_AgentServiceStaff FOREIGN KEY (servicePointOid) REFERENCES public.ServicePoint(oid);
ALTER TABLE public.AgentServiceStaff ADD CONSTRAINT fk_bankOid_AgentServiceStaff FOREIGN KEY (bankOid) REFERENCES public.Bank(oid);
ALTER TABLE public.AgentServiceStaff ADD CONSTRAINT fk_branchOid_AgentServiceStaff FOREIGN KEY (branchOid) REFERENCES public.Branch(oid);

-- Enable column required constraint
ALTER TABLE public.AgentServiceStaff ALTER COLUMN currentVersion SET NOT NULL;
-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.AgentServiceStaff) where targetTable = 'AgentServiceStaff' and sourceTable = 'AgentServiceStaff';

--	40	Customer
-- ========================================== Person ==========================================
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Customer', 'Person', current_timestamp, (select count(*) from absold.Customer));

-- Disable check constraint ck_gender_person, ck_photoidtype_person, ck_status_person
ALTER TABLE public.person DROP CONSTRAINT ck_gender_person;
ALTER TABLE public.person DROP CONSTRAINT ck_photoidtype_person;
ALTER TABLE public.person DROP CONSTRAINT ck_status_person;

-- migrate data from public to absdata
INSERT INTO public.person (oid, personid, title, fullname, firstname, middlename, lastname, gender, dateofbirth, placeofbirth, countryofbirth, fathername, mothername, spousename, maritalstatus, nationality, residentstatus, occupation, monthlyincome, photoidtype, photoidno, photoidissuancedate, photoidexpirationdate, otherphotoidjson, etin, presentaddress, proofofaddress, permanentaddress, ismobilenoverified, mobileno, officephoneno, residencephoneno, email, emergencycontactjson, reverserelation, photopath, photoidpathfront, photoidpathback, proofofaddressphotopath, traceid, currentversion, cbscurrentversion, status, editedby, editedon, approvedby,approvedon, remarkedby, remarkedon, isapproverremarks, approverremarks, isnewrecord, applicationdate, createdby, createdon, dataupdatedby, dataupdatedon, dataupdateapprovedby, dataupdateapprovedon, bankapprovedby, bankapprovedon, bankapprovalauthorizedby, bankapprovalauthorizedon, activatedby, activatedon, applicationrejectedby, applicationrejectedon, applicationrejectionreason, closedby, closedon, closingremark, deletedby, deletedon, deletionremark) (SELECT 'PS' || LPAD(row_number() over()::text, 9, '0'), 'PS' || LPAD(row_number() over()::text, 9, '0'), 'MR', customername, customername, null, customername, gender, null, null, null, null, null, null, null, null, null, null, null, photoidtype, photoid, null, null, null, null, presentaddress, null, permanentaddress, null, mobileno, phonenooffice, phonenores, email, customerid, null, photopath, photoidpathfront, photoidpathback, null, traceId, 1, null, customerstatus, updatedby, updatedon, approvedby, approvedon, null, null, null, null, null, applicationdate, createdby, createdon, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,null, null, null FROM absold.customer);

-- Update status
UPDATE public.Person SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'C' THEN 'Closed' WHEN status = 'AS' THEN 'ApplicationSubmitted' WHEN status = 'BR' THEN 'ApplicationRejected' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'BM' THEN 'DataUpdated' ELSE status END  WHERE   status IN ('BR', 'BM','BA', 'C', 'AS', 'A', 'I');

UPDATE public.Person SET gender = CASE WHEN gender = 'MALE' THEN 'Male' WHEN gender = 'male' THEN 'Male' WHEN gender = 'FEMALE' THEN 'Female' WHEN gender = 'female' THEN 'Female'WHEN gender = 'others' THEN 'Other' WHEN gender = 'OTHERS' THEN 'Other' ELSE gender END;

UPDATE public.Person  SET photoidtype = CASE WHEN photoidtype = 'Passport No' THEN 'PassportNo' WHEN photoidtype = 'VOTER.ID' THEN 'NID' WHEN photoidtype = 'NID' THEN 'NID' WHEN photoidtype = 'NATIONAL.ID.CARD' THEN 'NID' ELSE gender END;

-- Enable check constraint ck_gender_person, ck_photoidtype_person, ck_status_person
-- ALTER TABLE public.person ADD CONSTRAINT ck_gender_person check (gender = 'Male' or gender = 'Female' or gender = 'Other');
ALTER TABLE public.person ADD CONSTRAINT ck_photoidtype_person check (photoidtype = 'VoterId' or photoidtype = 'NID' or photoidtype = 'PassportNo' or photoidtype = 'BirthCertificate' or photoidtype = 'DrivingLicense');

ALTER TABLE public.person ADD CONSTRAINT ck_status_person check (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'ApplicationRejected'  or status = 'Hold'  or status = 'Deleted' or status = 'ApplicationReceived');

-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Person) where targetTable = 'Person' and sourceTable = 'Customer';

-- =========================================== Customer ===========================================
-- pre validation 
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Customer', 'Customer', current_timestamp, (select count(*) from absold.Customer));

-- Disable check constraint ck_enrollmenttype_customer, ck_isapproverremarks_customer, ck_isintroduceragent_customer,
-- ck_isnewrecord_customer, ck_status_customer
ALTER TABLE public.customer DROP CONSTRAINT ck_enrollmenttype_customer;
ALTER TABLE public.customer DROP CONSTRAINT ck_isapproverremarks_customer;
ALTER TABLE public.customer DROP CONSTRAINT ck_isintroduceragent_customer;
ALTER TABLE public.customer DROP CONSTRAINT ck_isnewrecord_customer;
ALTER TABLE public.customer DROP CONSTRAINT ck_status_customer;

alter table public.customer alter column typedcustomeroid drop not null;

alter table public.customer drop constraint fk_agentoid_customer;
alter table public.customer drop constraint fk_servicepointoid_customer;

-- migrate data from public to absdata
-- tamporary store customerid in emergencycontactjson column
INSERT INTO public.customer (oid, customerid, bankcustomerid, mnemonic, applicant, typedcustomeroid, ecopurposecode, language, nationality, cbsectorcode, cbindustrycode, residence, sector, target, dataupdateapprovedby, dataupdateapprovedon, customertype, enrollmenttype, introducerbankaccountno, introducercustomerid, isintroduceragent, cbscustomerstatus, cbsfailurereason, agentoid, servicepointoid, serviceterminaloid, bankoid, branchoid, agentstaffoid, traceid, currentversion, cbscurrentversion,status, editedby, editedon, approvedby, approvedon, remarkedby, remarkedon, isapproverremarks, approverremarks, isnewrecord, applicationdate, createdby, createdon, bankcustomeridcreateref, bankcustomeridcreateon, bankcustomeridupdateref, bankcustomeridupdateon, dataupdatedby, dataupdatedon, bankapprovalauthorizedby, bankapprovalauthorizedon, bankapprovedby, bankapprovedon, activatedby, activatedon, applicationrejectedby, applicationrejectedon, applicationrejectionreason,closedby, closedon, closingremark, deletedby, deletedon, deletionremark)(SELECT customerid, customerid, bankcustomerid, mnemonic, customername, null, null, null, null,null, null, null, null, null, null, null, customertype, enrollmenttype, null, null, 'Yes', cbsstatus, cbsfailurereason,agentid, servicepointid, 'ST0000029', bankid, branchid, '27600101', traceid, '1', null, customerstatus, null, null, approvedby, approvedon, null, null, null, null, null, applicationdate, createdby, createdon, null, null, null,null, null, null, null, null, approvedby, approvedon, activatedby, activatedon, rejectedby, rejectedon, rejectionreason,
 closedby, closedon, null, null, null, null FROM absold.customer);


-- update customer table typedcustomeroid
update public.customer c SET typedcustomeroid = (Select oid from public.person where c.oid = emergencycontactjson);
update public.person set emergencycontactjson = null;

-- update customer table agentoid
update public.customer c SET agentoid = (Select oid from public.agent where c.agentoid = loginid);

-- Update status
UPDATE public.customer SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'C' THEN 'Closed' WHEN status = 'AS' THEN 'ApplicationSubmitted' WHEN status = 'BR' THEN 'ApplicationRejected' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'BM' THEN 'DataUpdated' ELSE status END  WHERE   status IN ('BR', 'BM','BA', 'C', 'AS', 'A', 'I');

-- Update branch servicepointid
update public.customer set servicepointoid = substring(servicepointoid, 7) where servicepointoid like 'SP%';

-- Enable check constraint ck_enrollmenttype_customer, ck_isapproverremarks_customer, ck_isintroduceragent_customer,
-- ck_isnewrecord_customer, ck_status_customer
ALTER TABLE public.customer ADD CONSTRAINT ck_enrollmenttype_customer check (enrollmenttype = 'CSB' or enrollmenttype = 'CBS');
ALTER TABLE public.customer ADD CONSTRAINT ck_isapproverremarks_customer check (isapproverremarks = 'Yes' or isapproverremarks = 'No');
ALTER TABLE public.customer ADD CONSTRAINT ck_isintroduceragent_customer check (isintroduceragent = 'Yes' or isintroduceragent = 'No');
ALTER TABLE public.customer ADD CONSTRAINT ck_isnewrecord_customer check (isnewrecord = 'Yes' or isnewrecord = 'No');
ALTER TABLE public.customer ADD CONSTRAINT ck_status_customer check (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'ApplicationRejected'  or status = 'Hold'  or status = 'Deleted');
alter table public.customer add constraint fk_agentoid_customer foreign key (agentoid) references public.agent(oid);
alter table public.customer add constraint fk_servicepointoid_customer foreign key (servicepointoid) references public.servicepoint(oid);
alter table public.customer alter column typedcustomeroid set not null;
-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Customer) where targetTable = 'Customer' and sourceTable = 'Customer';

-- ========================================================= CustomerPerson =========================================================
-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Customer', 'CustomerPerson', current_timestamp, (select count(*) from absold.Customer));

INSERT INTO public.customerperson(oid, customeroid, personoid)(SELECT oid, oid, typedcustomeroid FROM public.customer);

-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.CustomerPerson) where targetTable = 'CustomerPerson' and sourceTable = 'Customer';

--	41	Account

-- pre validation
insert into public.DataValidation (sourceTable, targetTable, insertTime, sourceTableCount) values ('Account', 'Account', current_timestamp, (select count(*) from absold.Account));

-- Disable check constraint ck_fdrrenewprincipalandinterestflag_account, ck_fdrrenewprincipalflag_account,
-- ck_isapproverremarks_account, ck_isnewrecord_account, ck_status_account
ALTER TABLE public.Account DROP CONSTRAINT ck_fdrrenewprincipalandinterestflag_account;
ALTER TABLE public.Account DROP CONSTRAINT ck_fdrrenewprincipalflag_account;
ALTER TABLE public.Account DROP CONSTRAINT ck_isapproverremarks_account;
ALTER TABLE public.Account DROP CONSTRAINT ck_isnewrecord_account;
ALTER TABLE public.Account DROP CONSTRAINT ck_status_account;
alter table public.account drop constraint fk_agentoid_account;
alter table public.account drop constraint fk_serviceterminaloid_account;
alter table public.account drop constraint fk_servicepointoid_account;

-- migrate data from public to absdata
INSERT INTO public.Account (oid, accountid, bankcustomerid, bankaccountno, mnemonic, accounttitle, mobileno, accounttype, enrollmenttype, productoid, productname, producttype, currency, initialdeposit, initialdepositref, nomineejson, jointholderjson, minordateofbirth, minorrelationwithcustomer, additionalaccountdetailjson, fdrstartdate, fdrmaturitydate, fdrreceiptno, fdrperiod, fdrcreditliquidationaccountno, fdrdebitliquidationaccountno, fdrinterestliquidationaccountno, fdrtenureinmonths, fdrrenewprincipalflag, fdrrenewprincipalandinterestflag, rdonetimedeposit, rdinstallmentamount, rdnumberofinstallment, rdstartdate, rdmaturitydate, cbsaccountstatus,  cbsfailurereason, agentoid, servicepointoid, serviceterminaloid, bankoid, branchoid, agentstaffoid, traceid,
currentversion, cbscurrentversion, status, editedby, editedon, approvedby, approvedon, remarkedby, remarkedon, isapproverremarks, approverremarks, isnewrecord, applicationdate, createdby, createdon, bankaccountnocreateref, bankaccountnocreatedon, bankaccountnoupdateon, bankaccountnoupdateref, dataupdatedby, dataupdatedon, dataupdateapprovedby, dataupdateapprovedon, bankapprovedby, bankapprovedon, bankapprovalauthorizedby, bankapprovalauthorizedon, activatedby, activatedon, applicationrejectedby, applicationrejectedon, applicationrejectionreason, closedby, closedon, closingremark, deletedby, deletedon, deletionremark) (SELECT accountid, accountid, null, bankaccountno, mnemonic, accounttitle,  mobileno, accounttype, enrollmenttype, productid, productname, null, 'BDT', initialdeposit, initialdepositrefid, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, agentid, servicepointid, 'ST0000029', bankid, branchid, '27600101', traceid, '1', null, accountstatus, updatedby, updatedon, null, null, null, null, null, null, null, applicationdate, createdby, createdon, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null FROM absold.Account);

-- Update status value BR=ApplicationRejected, BM=DataUpdated ***
UPDATE public.Account  SET status = CASE WHEN status = 'A' THEN 'Active' WHEN status = 'I' THEN 'Inactive' WHEN status = 'C' THEN 'Closed' WHEN status = 'AS' THEN 'ApplicationSubmitted' WHEN status = 'BR' THEN 'ApplicationRejected' WHEN status = 'BA' THEN 'BankApproved' WHEN status = 'BM' THEN 'DataUpdated'ELSE status END  WHERE   status IN ('BR', 'BM','BA', 'C', 'AS', 'A', 'I');

-- update account table agentoid
update public.account a SET agentoid = (Select oid from public.agent where a.agentoid = loginid);

-- update product name
update public.account set productname =(select productname from public.product where oid=productoid);
update public.account set producttype =(select producttype from public.product where oid=productoid);

-- Update branch servicepointid
update public.account set servicepointoid = substring(servicepointoid, 7) where servicepointoid like 'SP%';

-- Enable check constraint status
ALTER TABLE public.Account ADD CONSTRAINT ck_fdrrenewprincipalandinterestflag_account check (fdrrenewprincipalandinterestflag = 'Yes' or fdrrenewprincipalandinterestflag = 'No');
ALTER TABLE public.Account ADD CONSTRAINT ck_fdrrenewprincipalflag_account check (fdrrenewprincipalflag = 'Yes' or fdrrenewprincipalflag = 'No');
ALTER TABLE public.Account ADD CONSTRAINT ck_isapproverremarks_account check (isapproverremarks = 'Yes' or isapproverremarks = 'No');
ALTER TABLE public.Account ADD CONSTRAINT ck_isnewrecord_account check (isnewrecord = 'Yes' or isnewrecord = 'No');
ALTER TABLE public.Account ADD CONSTRAINT ck_status_account check (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Deleted' or status = 'Closed' or status = 'Hold' or status = 'ApplicationRejected' or status = 'ApplicationReceived');
alter table public.account add constraint fk_agentoid_account foreign key (agentoid) references public.agent(oid);


alter table public.Account add constraint fk_servicepointoid_account foreign key (servicepointoid) references public.servicepoint(oid);
alter table public.Account add constraint fk_serviceterminaloid_account foreign key (serviceterminaloid) references public.serviceterminal(oid);

-- post validation
update public.DataValidation set updatetime = current_timestamp, targetTableCount = (select count(*) from public.Account) where targetTable = 'Account' and sourceTable = 'Account';









