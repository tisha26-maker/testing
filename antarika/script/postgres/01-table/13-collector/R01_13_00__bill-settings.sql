/*
This table to be used to store Bill Types (Such as: Revenue, Utility Bill, Toll, Pasport Fees etc.) 
oid                                      : Surrogate primary key
billTypeId                               : If user could want provide any id
billTypeName                             :  Bill type name
billTypeDescription                      : Description for bill type
makerId                                  : User id, who make bill type
checkerId                                : User id, who check bill type
approverId                               : User id, who approve bill type
billTypeStatus                           : Bill Type Status Make (BM) , Rejected (BR) , Active (A) , Checked (BC) , Submitted (AS) 
rejectionCause                           : Bill type rejection cause
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             BillType
(
oid                                      varchar(128)                                                not null,
billTypeId                               varchar(128),
billTypeName                             varchar(256),
billTypeDescription                      text,
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
billTypeStatus                           varchar(32)                                                 not null,
rejectionCause                           text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_BillType                                                 primary key    (oid),
constraint                               ck_billTypeStatus_BillType                                  check          (billTypeStatus = 'Active' or billTypeStatus = 'Inactive' or billTypeStatus = 'Rejected' or billTypeStatus = 'Make' or billTypeStatus = 'Checked' or billTypeStatus = 'Approved' or billTypeStatus = 'Sumitted' or billTypeStatus = 'InEditable')
);

/*
This table to be used to store Utility Company Information
oid                                      : Company oid generated by system
companyName                              : Name of the company
companyCode                              : If user want to provide any code
vatAmount                                : Vat amount on bill
surCharge                                : Sur charge on bill (Like Additional charge) 
location                                 : Location of company
revenueThreshold                         : For which amount stamp will stamp in bill
stampValue                               : Value of stamp
contactNumber                            : In which number will contact
contactPerson                            : With whom will contact
billTypeOid                              : Oid of bill type table
centralizeBilling                        : Will billing amount goes to branch specific accountNumber or a single central account number
debitAccount                             : From which account amount will go
creditAccount                            : In which account amount will go
makerId                                  : User id, who make bill type
checkerId                                : User id, who check bill type
approverId                               : User id, who approve bill type
companyStatus                            :  Company Status  Active, Inactive
rejectionCause                           : Company rejection cause
cutVat                                   : Will vat will take
useVatAccount                            : Will use vat account
vatAccount                               : Vat account number
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             UtilityCompany
(
oid                                      varchar(128)                                                not null,
companyName                              varchar(256)                                                not null,
companyCode                              varchar(128),
vatAmount                                numeric(20,6),
surCharge                                numeric(20,6),
location                                 varchar(256),
revenueThreshold                         numeric(20,6),
stampValue                               numeric(20,6),
contactNumber                            varchar(64),
contactPerson                            varchar(256),
billTypeOid                              varchar(128),
centralizeBilling                        varchar(64)                                                 not null,
debitAccount                             varchar(64),
creditAccount                            varchar(64),
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
companyStatus                            varchar(32)                                                 not null,
rejectionCause                           text,
cutVat                                   numeric(20,6),
useVatAccount                            varchar(64),
vatAccount                               varchar(64),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_UtilityCompany                                           primary key    (oid),
constraint                               ck_companyStatus_UtilityCompany                             check          (companyStatus = 'Active' or companyStatus = 'Inactive')
);

/*
This table to be used to store Palli Bidyut Samity Information
oid                                      : Palli Bidyut Samity oid generated by system
samityName                               : Name of the samity
samityCode                               : If user want to provide any code
vatAmount                                : Vat amount on bill
surCharge                                : Sur charge on bill (Like Additional charge) 
location                                 : Location of Palli Bidyut Samity
revenueThreshold                         : For which amount stamp will stamp in bill
stampValue                               : Value of stamp
contactNumber                            : In which number will contact
contactPerson                            : With whom will contact
billTypeOid                              : Oid of bill type table
centralizeBilling                        : Will billing amount goes to branch specific accountNumber or a single central account number
debitAccount                             : From which account amount will go
creditAccount                            : In which account amount will go
makerId                                  : User id, who make bill type
checkerId                                : User id, who check bill type
approverId                               : User id, who approve bill type
status                                   :  status  Active, Inactive
rejectionCause                           : Palli Bidyut Samity rejection cause
cutVat                                   : Will vat will take
useVatAccount                            : Will use vat account
vatAccount                               : Vat account number
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             PalliBidyutSamity
(
oid                                      varchar(128)                                                not null,
samityName                               varchar(256)                                                not null,
samityCode                               varchar(128),
vatAmount                                numeric(20,6),
surCharge                                numeric(20,6),
location                                 varchar(256),
revenueThreshold                         numeric(20,6),
stampValue                               numeric(20,6),
contactNumber                            varchar(64),
contactPerson                            varchar(256),
billTypeOid                              varchar(128),
centralizeBilling                        varchar(64)                                                 not null,
debitAccount                             varchar(64),
creditAccount                            varchar(64),
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
status                                   varchar(32)                                                 not null,
rejectionCause                           text,
cutVat                                   numeric(20,6),
useVatAccount                            varchar(64),
vatAccount                               varchar(64),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_PalliBidyutSamity                                        primary key    (oid),
constraint                               ck_status_PalliBidyutSamity                                 check          (status = 'Active' or status = 'Inactive')
);

/*
This table to be used to store Utility Company Information
oid                                      : Company Zone oid generated by system
zoneName                                 : Name of the zone
zoneCode                                 : If user want to provide any code
companyOid                               : Oid of UtilityCompany table
location                                 : Location of company
contactPerson                            : With whom will contact
contactNumber                            : In which number will contact
makerId                                  : User id, who make bill type
checkerId                                : User id, who check bill type
approverId                               : User id, who approve bill type
companyZoneStatus                        : Company Zone Status Make (BM) , Rejected (BR) , Active (A) , Checked (BC) , Submitted (AS) 
rejectionCause                           : Company rejection cause
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             CompanyZone
(
oid                                      varchar(128)                                                not null,
zoneName                                 varchar(256)                                                not null,
zoneCode                                 varchar(128),
companyOid                               varchar(128),
location                                 varchar(256),
contactPerson                            varchar(256),
contactNumber                            varchar(64),
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
companyZoneStatus                        varchar(32)                                                 not null,
rejectionCause                           text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_CompanyZone                                              primary key    (oid),
constraint                               ck_companyZoneStatus_CompanyZone                            check          (companyZoneStatus = 'Active' or companyZoneStatus = 'Rejected' or companyZoneStatus = 'Make' or companyZoneStatus = 'Checked' or companyZoneStatus = 'Submitted' or companyZoneStatus = 'InEditable' or companyZoneStatus = 'Inactive' or companyZoneStatus = 'Closed')
);

/*
This table to be used to store Palli Bidyut Samity Zone Information
oid                                      : Palli Bidyut Samity Zone oid generated by system
zoneName                                 : Name of the zone
zoneCode                                 : If user want to provide any code
samityOid                                : Oid of PalliBidyutSamity table
location                                 : Location of PalliBidyutSamity
contactPerson                            : With whom will contact
contactNumber                            : In which number will contact
makerId                                  : User id, who make bill type
checkerId                                : User id, who check bill type
approverId                               : User id, who approve bill type
status                                   : status Make (BM) , Rejected (BR) , Active (A) , Checked (BC) , Submitted (AS) 
rejectionCause                           : Palli Bidyut Samity Zone rejection cause
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             PalliBidyutSamityZone
(
oid                                      varchar(128)                                                not null,
zoneName                                 varchar(256)                                                not null,
zoneCode                                 varchar(128),
samityOid                                varchar(128),
location                                 varchar(256),
contactPerson                            varchar(256),
contactNumber                            varchar(64),
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
status                                   varchar(32)                                                 not null,
rejectionCause                           text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_PalliBidyutSamityZone                                    primary key    (oid),
constraint                               ck_status_PalliBidyutSamityZone                             check          (status = 'Active' or status = 'Inactive')
);

/*
This table to be used to store Utility Company zone branch relation information
oid                                      : Zone Branch oid generated by system
companyZoneOid                           : Oid of CompanyZone table
branchOid                                : BranchId of Branch table
debitAccount                             : From which account amount will go
creditAccount                            : In which account amount will go
vatAccount                               : Vat account number
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ZoneBranch
(
oid                                      varchar(128)                                                not null,
companyZoneOid                           varchar(128)                                                not null,
branchOid                                varchar(128),
debitAccount                             varchar(64),
creditAccount                            varchar(64),
vatAccount                               varchar(64),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ZoneBranch                                               primary key    (oid),
constraint                               fk_companyZoneOid_ZoneBranch                                foreign key    (companyZoneOid)
                                                                                                     references     CompanyZone(oid),
constraint                               fk_branchOid_ZoneBranch                                     foreign key    (branchOid)
                                                                                                     references     Branch(oid)
);

/*
This table to be used to store Utility Company zone agetn relatin information.
oid                                      : Zone Agent oid generated by system
companyOid                               : Oid of UtilityCompany table
zoneOid                                  : Oid of CompanyZone table
agentOid                                 : BranchId of Agent table
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ZoneAgent
(
oid                                      varchar(128)                                                not null,
companyOid                               varchar(128)                                                not null,
zoneOid                                  varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ZoneAgent                                                primary key    (oid),
constraint                               fk_companyOid_ZoneAgent                                     foreign key    (companyOid)
                                                                                                     references     UtilityCompany(oid),
constraint                               fk_zoneOid_ZoneAgent                                        foreign key    (zoneOid)
                                                                                                     references     CompanyZone(oid),
constraint                               fk_agentOid_ZoneAgent                                       foreign key    (agentOid)
                                                                                                     references     Agent(oid)
);

/*
This table to be used to store PBS Zone Outlet information.
oid                                      : PBS Zone Outlet oid generated by system
palliBidyutSamityOid                     : Oid of palli Bidyut Samity table
palliBidyutSamityZoneOid                 : Oid of palli Bidyut Samity Zone table
branchOid                                : Oid of branch table
agentOid                                 : Oid of agent table
servicepointOid                          : Oid of servicepoint table
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             PBSZoneOutlet
(
oid                                      varchar(128)                                                not null,
palliBidyutSamityOid                     varchar(128),
palliBidyutSamityZoneOid                 varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
servicepointOid                          varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_PBSZoneOutlet                                            primary key    (oid),
constraint                               ck_status_PBSZoneOutlet                                     check          (status = 'Active' or status = 'Inactive' or status = 'Cancel' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_PBSZoneOutlet                          check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_PBSZoneOutlet                                check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store Unauth PBS Zone Outlet information.
oid                                      : PBS Zone Outlet oid generated by system
palliBidyutSamityOid                     : Oid of palli Bidyut Samity table
palliBidyutSamityZoneOid                 : Oid of palli Bidyut Samity Zone table
branchOid                                : Oid of branch table
agentOid                                 : Oid of agent table
servicepointOid                          : Oid of servicepoint table
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthPBSZoneOutlet
(
oid                                      varchar(128)                                                not null,
palliBidyutSamityOid                     varchar(128),
palliBidyutSamityZoneOid                 varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
servicepointOid                          varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
editcommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthPBSZoneOutlet                                      primary key    (oid),
constraint                               ck_status_UnauthPBSZoneOutlet                               check          (status = 'Active' or status = 'Inactive' or status = 'Cancel' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthPBSZoneOutlet                           check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthPBSZoneOutlet                    check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthPBSZoneOutlet                          check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store PBS Zone Outlet History information.
oid                                      : PBS Zone Outlet oid generated by system
palliBidyutSamityOid                     : Oid of palli Bidyut Samity table
palliBidyutSamityZoneOid                 : Oid of palli Bidyut Samity Zone table
branchOid                                : Oid of branch table
agentOid                                 : Oid of agent table
servicepointOid                          : Oid of servicepoint table
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             PBSZoneOutletHistory
(
oid                                      varchar(128)                                                not null,
palliBidyutSamityOid                     varchar(128),
palliBidyutSamityZoneOid                 varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
servicepointOid                          varchar(128),
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_PBSZoneOutletHistory                                     primary key    (oid),
constraint                               ck_status_PBSZoneOutletHistory                              check          (status = 'Active' or status = 'Inactive' or status = 'Cancel' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_PBSZoneOutletHistory                   check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_PBSZoneOutletHistory                         check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

