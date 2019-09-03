/*
Ledger Group information to be stored here
oid                                      : surrogate primary key
dppLedgerGroupId                         : Ledger Group Id
name                                     : Ledger Group Name
description                              : Description of Ledger Group
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
*/
create table                             DppLedgerGroup
(
oid                                      varchar(128)                                                not null,
dppLedgerGroupId                         varchar(128)                                                not null,
name                                     varchar(128)                                                not null,
description                              text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
constraint                               pk_DppLedgerGroup                                           primary key    (oid),
constraint                               u_dppLedgerGroupId_DppLedgerGroup                           unique         (dppLedgerGroupId),
constraint                               u_name_DppLedgerGroup                                       unique         (name)
);

/*
Ledger Category information to be stored here
oid                                      : surrogate primary key
dppLedgerCategoryId                      : Ledger Category Id
name                                     : Ledger Category Name
description                              : Description of Ledger Category
dppLedgerGroupOid                        : Ledger Group Oid
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
*/
create table                             DppLedgerCategory
(
oid                                      varchar(128)                                                not null,
dppLedgerCategoryId                      varchar(128)                                                not null,
name                                     varchar(128)                                                not null,
description                              text,
dppLedgerGroupOid                        varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
constraint                               pk_DppLedgerCategory                                        primary key    (oid),
constraint                               u_dppLedgerCategoryId_DppLedgerCategory                     unique         (dppLedgerCategoryId),
constraint                               u_name_DppLedgerCategory                                    unique         (name),
constraint                               fk_dppLedgerGroupOid_DppLedgerCategory                      foreign key    (dppLedgerGroupOid)
                                                                                                     references     DppLedgerGroup(oid)
);

/*
Ledger information to be stored here
oid                                      : surrogate primary key
dppLedgerId                              : Ledger Id
name                                     : Ledger Name
description                              : Description of Ledger
dppLedgerType                            : Type of Ledger DR(debit), CR(Credit)
openingBalance                           : Opening Balance
ledgerBalance                            : Ledger Balance
closingBalance                           : Closing Balance
lockAmount                               : Lock amount
status                                   : Status of Ledger
subledgerStatus                          : Ledger Category Oid
dppLedgerCategoryOid                     : Ledger Category Id
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
*/
create table                             DppLedger
(
oid                                      varchar(128)                                                not null,
dppLedgerId                              varchar(128)                                                not null,
name                                     varchar(128)                                                not null,
description                              text,
dppLedgerType                            varchar(32)                                                 not null,
openingBalance                           numeric(20,6)                                               not null       default 0,
ledgerBalance                            numeric(20,6)                                               not null       default 0,
closingBalance                           numeric(20,6)                                               not null       default 0,
lockAmount                               numeric(20,6)                                               not null       default 0,
status                                   varchar(32)                                                 not null       default 'Inactive',
subledgerStatus                          varchar(32)                                                 not null       default 'No',
dppLedgerCategoryOid                     varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
constraint                               pk_DppLedger                                                primary key    (oid),
constraint                               u_dppLedgerId_DppLedger                                     unique         (dppLedgerId),
constraint                               u_name_DppLedger                                            unique         (name),
constraint                               ck_dppLedgerType_DppLedger                                  check          (dppLedgerType = 'DR' or dppLedgerType = 'CR'),
constraint                               ck_status_DppLedger                                         check          (status = 'Active' or status = 'Inactive'),
constraint                               ck_subledgerStatus_DppLedger                                check          (subledgerStatus = 'Yes' or subledgerStatus = 'No'),
constraint                               fk_dppLedgerCategoryOid_DppLedger                           foreign key    (dppLedgerCategoryOid)
                                                                                                     references     DppLedgerCategory(oid)
);

/*
Subledger information to be stored here
oid                                      : surrogate primary key
dppSubledgerId                           : Subledger Id
name                                     : Subledger Name
description                              : Description of Subledger
dppSubledgerType                         : Type of Subledger DR(debit), CR(Credit)
servicePointOid                          : ServicePoint Oid
openingBalance                           : Opening Balance
subledgerBalance                         : Ledger Balance
closingBalance                           : Closing Balance
lockAmount                               : Lock amount
status                                   : Status of Subledger
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
isNewRecord                              : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
dppLedgerOid                             : Ledger Oid
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
*/
create table                             DppSubledger
(
oid                                      varchar(128)                                                not null,
dppSubledgerId                           varchar(128)                                                not null,
name                                     varchar(128)                                                not null,
description                              text,
dppSubledgerType                         varchar(32)                                                 not null,
servicePointOid                          varchar(128),
openingBalance                           numeric(20,6)                                               not null       default 0,
subledgerBalance                         numeric(20,6)                                               not null       default 0,
closingBalance                           numeric(20,6)                                               not null       default 0,
lockAmount                               numeric(20,6)                                               not null       default 0,
status                                   varchar(32)                                                 not null       default 'Inactive',
editcommit                               varchar(32),
isNewRecord                              varchar(32),
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
dppLedgerOid                             varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
constraint                               pk_DppSubledger                                             primary key    (oid),
constraint                               u_dppSubledgerId_DppSubledger                               unique         (dppSubledgerId),
constraint                               u_name_DppSubledger                                         unique         (name),
constraint                               ck_dppSubledgerType_DppSubledger                            check          (dppSubledgerType = 'DR' or dppSubledgerType = 'CR'),
constraint                               fk_servicePointOid_DppSubledger                             foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               ck_status_DppSubledger                                      check          (status = 'Active' or status = 'Inactive'),
constraint                               ck_editcommit_DppSubledger                                  check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isNewRecord_DppSubledger                                 check          (isNewRecord = 'Yes' or isNewRecord = 'No'),
constraint                               fk_dppLedgerOid_DppSubledger                                foreign key    (dppLedgerOid)
                                                                                                     references     DppLedger(oid)
);

/*
Marchent rebalancing transaction information to be stored here
oid                                      : Surrogate Primary key
dppGeneralLedgerId                       : General Ledger Id sent from app for this transaction, primary key
creditAmount                             : Original transation credit amount
debitAmount                              : Original transation debit amount
ledgerBalance                            : Current Ledger Balance
subledgerBalance                         : Current Subledger balance
dppLedgerOid                             : Ledger Oid
dppSubledgerOid                          : Subledger Oid
servicePointOid                          : ServicePoint Oid
outletAreaOid                            : OutletArea Oid
outletZoneOid                            : OutletZone Oid
division                                 : Division Code
district                                 : District Code
upazilla                                 : Upazilla Code
"union"                                  : Union Code
transTime                                : Transaction date & time
creditAccount                            : Credited account no
debitAccount                             : Debited account no
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last updated the record
editedOn                                 : When the record was last updated
*/
create table                             DppGeneralLedger
(
oid                                      varchar(128)                                                not null,
dppGeneralLedgerId                       varchar(128)                                                not null,
creditAmount                             numeric(20,6)                                               not null       default 0,
debitAmount                              numeric(20,6)                                               not null       default 0,
ledgerBalance                            numeric(20,6)                                               not null       default 0,
subledgerBalance                         numeric(20,6)                                               not null       default 0,
dppLedgerOid                             varchar(128)                                                not null,
dppSubledgerOid                          varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
outletAreaOid                            varchar(128),
outletZoneOid                            varchar(128),
division                                 varchar(128),
district                                 varchar(128),
upazilla                                 varchar(128),
"union"                                  varchar(128),
transTime                                timestamp                                                   not null,
creditAccount                            varchar(64),
debitAccount                             varchar(64),
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
constraint                               pk_DppGeneralLedger                                         primary key    (oid),
constraint                               fk_dppLedgerOid_DppGeneralLedger                            foreign key    (dppLedgerOid)
                                                                                                     references     DppLedger(oid),
constraint                               fk_dppSubledgerOid_DppGeneralLedger                         foreign key    (dppSubledgerOid)
                                                                                                     references     DppSubledger(oid),
constraint                               fk_servicePointOid_DppGeneralLedger                         foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_outletAreaOid_DppGeneralLedger                           foreign key    (outletAreaOid)
                                                                                                     references     OutletArea(oid),
constraint                               fk_outletZoneOid_DppGeneralLedger                           foreign key    (outletZoneOid)
                                                                                                     references     OutletZone(oid)
);

/*
Marchent rebalancing request information to be stored here
oid                                      : Surrogate Primary key
requestId                                : Request Id
requestTime                              : Request date & time
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
isNewRecord                              : Record will show up new for a specific time. Its will be Yes or No
isApproverRemarks                        : If approver adds any remarks it is Yes. if approver does not add any remarks, It will be No
approverRemarks                          : Approver remarks for further action
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
approvedBy                               : Who (which login) approved the record
approvedOn                               : Strore the time for approval
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last updated the record
editedOn                                 : When the record was last updated
*/
create table                             DppRebalancingRequest
(
oid                                      varchar(128)                                                not null,
requestId                                varchar(128)                                                not null,
requestTime                              timestamp,
editcommit                               varchar(32),
isNewRecord                              varchar(32),
isApproverRemarks                        varchar(32),
approverRemarks                          text,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
constraint                               pk_DppRebalancingRequest                                    primary key    (oid),
constraint                               ck_editcommit_DppRebalancingRequest                         check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isNewRecord_DppRebalancingRequest                        check          (isNewRecord = 'Yes' or isNewRecord = 'No'),
constraint                               ck_isApproverRemarks_DppRebalancingRequest                  check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No')
);

/*
Marchent rebalancing transaction information to be stored here
oid                                      : Surrogate Primary key
requestDetailsId                         : Request Details Id
servicePointOid                          : DppGeneralLedger oid
dppSubledgerOid                          : DppSubledger oid
dppRebalancingRequestOid                 : DppRebalancingRequest oid
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last updated the record
editedOn                                 : When the record was last updated
*/
create table                             DppDraftRebalancingRequestDetails
(
oid                                      varchar(128)                                                not null,
requestDetailsId                         varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
dppSubledgerOid                          varchar(128)                                                not null,
dppRebalancingRequestOid                 varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
constraint                               pk_DppDraftRebalancingRequestDetails                        primary key    (oid),
constraint                               fk_servicePointOid_DppDraftRebalancingRequestDetails        foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid)
);

/*
Marchent rebalancing transaction information to be stored here
oid                                      : Surrogate Primary key
requestDetailsId                         : Request Details Id
ftAmount                                 : Ft amount for a marchent on a specific request
servicePointOid                          : DppGeneralLedger oid
dppRebalancingRequestOid                 : DppRebalancingRequest oid
status                                   : 
cbsReferenceNo                           : Cbs transtion Tracking number
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
isNewRecord                              : Record will show up new for a specific time. Its will be Yes or No
isApproverRemarks                        : If approver adds any remarks it is Yes. if approver does not add any remarks, It will be No
approverRemarks                          : Approver remarks for further action
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
approvedBy                               : Who (which login) approved the record
approvedOn                               : Strore the time for approval
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last updated the record
editedOn                                 : When the record was last updated
*/
create table                             DppRebalancingRequestDetails
(
oid                                      varchar(128)                                                not null,
requestDetailsId                         varchar(128)                                                not null,
ftAmount                                 numeric(20,6)                                               not null,
servicePointOid                          varchar(128)                                                not null,
dppRebalancingRequestOid                 varchar(128)                                                not null,
status                                   varchar(32)                                                 not null       default 'Submitted',
cbsReferenceNo                           varchar(128),
editcommit                               varchar(32),
isNewRecord                              varchar(32),
isApproverRemarks                        varchar(32),
approverRemarks                          text,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
constraint                               pk_DppRebalancingRequestDetails                             primary key    (oid),
constraint                               fk_servicePointOid_DppRebalancingRequestDetails             foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_dppRebalancingRequestOid_DppRebalancingRequestDetails    foreign key    (dppRebalancingRequestOid)
                                                                                                     references     DppRebalancingRequest(oid),
constraint                               ck_status_DppRebalancingRequestDetails                      check          (status = 'Submitted' or status = 'Approved' or status = 'Rejected'),
constraint                               ck_editcommit_DppRebalancingRequestDetails                  check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isNewRecord_DppRebalancingRequestDetails                 check          (isNewRecord = 'Yes' or isNewRecord = 'No'),
constraint                               ck_isApproverRemarks_DppRebalancingRequestDetails           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No')
);


