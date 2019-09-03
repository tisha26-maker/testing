/*
This table is used to store unauth BDT account balance information 
oid                                      : Surrogate primary key
bdtAccountBalanceId                      : BDT Account Balance Id
branchOid                                : Parent table Brnach oid
bankAccountNo                            : Bank account no (BDT GL code)
startBalance                             : Starting balance for a account
startBalanceTakingTime                   : When take this balance as starting balance
endBalance                               : Balance of the end for a day or a certain period 
endBalanceTakingTime                     : When take this balance as ending balance
differStartBalanceEndBalance             : Diffrence balance between BOD and EOD
traceId                                  : Trace Id of this record
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthBDTAccountBalance
(
oid                                      varchar(128)                                                not null,
bdtAccountBalanceId                      varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
bankAccountNo                            varchar(64),
startBalance                             numeric(20,6)                                               not null,
startBalanceTakingTime                   timestamp,
endBalance                               numeric(20,6)                                               not null,
endBalanceTakingTime                     timestamp,
differStartBalanceEndBalance             numeric(20,6)                                               not null,
traceId                                  varchar(128),
editCommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthBDTAccountBalance                                  primary key    (oid),
constraint                               ck_editCommit_UnauthBDTAccountBalance                       check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_status_UnauthBDTAccountBalance                           check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_UnauthBDTAccountBalance                check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthBDTAccountBalance                      check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to store BDT account balance information 
oid                                      : Surrogate primary key
bdtAccountBalanceId                      : BDT Account Balance Id
branchOid                                : Parent table Brnach oid
bankAccountNo                            : Bank account no (BDT GL code)
startBalance                             : Starting balance for a account
startBalanceTakingTime                   : When take this balance as starting balance
endBalance                               : Balance of the end for a day or a certain period 
endBalanceTakingTime                     : When take this balance as ending balance
differStartBalanceEndBalance             : Diffrence balance between BOD and EOD
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             BDTAccountBalance
(
oid                                      varchar(128)                                                not null,
bdtAccountBalanceId                      varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
bankAccountNo                            varchar(64),
startBalance                             numeric(20,6)                                               not null,
startBalanceTakingTime                   timestamp,
endBalance                               numeric(20,6)                                               not null,
endBalanceTakingTime                     timestamp,
differStartBalanceEndBalance             numeric(20,6)                                               not null,
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_BDTAccountBalance                                        primary key    (oid),
constraint                               ck_status_BDTAccountBalance                                 check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_BDTAccountBalance                      check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_BDTAccountBalance                            check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to store BDT account balance history
oid                                      : Surrogate primary key
bdtAccountBalanceId                      : BDT Account Balance Id
branchOid                                : Parent table Brnach oid
bankAccountNo                            : Bank account no (BDT GL code)
startBalance                             : Starting balance for a account
startBalanceTakingTime                   : When take this balance as starting balance
endBalance                               : Balance of the end for a day or a certain period 
endBalanceTakingTime                     : When take this balance as ending balance
differStartBalanceEndBalance             : Diffrence balance between BOD and EOD
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             BDTAccountBalanceHistory
(
oid                                      varchar(128)                                                not null,
bdtAccountBalanceId                      varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
bankAccountNo                            varchar(64),
startBalance                             numeric(20,6)                                               not null,
startBalanceTakingTime                   timestamp,
endBalance                               numeric(20,6)                                               not null,
endBalanceTakingTime                     timestamp,
differStartBalanceEndBalance             numeric(20,6)                                               not null,
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_BDTAccountBalanceHistory                                 primary key    (oid),
constraint                               ck_status_BDTAccountBalanceHistory                          check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_BDTAccountBalanceHistory               check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_BDTAccountBalanceHistory                     check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to collect unauth charge reconcilation information
oid                                      : Surrogate primary key
collectedChargeReconcilationId           : Unauth Collected Charge Reconcilation Id
collectedChargeAmount                    : Amount of collecting charge
bankAccountNo                            : Agent bank account no
startBalance                             : Starting balance for a account
endBalance                               : When take this balance as ending balance
differStartBalanceEndBalance             : Diffrence balance between BOD and EOD
reconcilationStatus                      : Status of reconcilation
branchOid                                : Parent table Brnach oid
servicePointOid                          : Oid of servicepoint table
traceId                                  : Trace Id of this record
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthCollectedChargeReconcilation
(
oid                                      varchar(128)                                                not null,
collectedChargeReconcilationId           varchar(128)                                                not null,
collectedChargeAmount                    numeric(20,6)                                               not null,
bankAccountNo                            varchar(64),
startBalance                             numeric(20,6)                                               not null,
endBalance                               numeric(20,6)                                               not null,
differStartBalanceEndBalance             numeric(20,6)                                               not null,
reconcilationStatus                      varchar(32)                                                 not null,
branchOid                                varchar(128)                                                not null,
servicePointOid                          varchar(128),
traceId                                  varchar(128),
editCommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthCollectedChargeReconcilation                       primary key    (oid),
constraint                               ck_reconcilationStatus_UnauthCollectedChargeReconcilation   check          (reconcilationStatus = 'Ok' or reconcilationStatus = 'Pending Failed'),
constraint                               ck_editCommit_UnauthCollectedChargeReconcilation            check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_status_UnauthCollectedChargeReconcilation                check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_UnauthCollectedChargeReconcilation     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthCollectedChargeReconcilation           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to collect  charge reconcilation information
oid                                      : Surrogate primary key
collectedChargeReconcilationId           : Unauth Collected Charge Reconcilation Id
collectedChargeAmount                    : Amount of collecting charge
bankAccountNo                            : Agent bank account no
startBalance                             : Starting balance for a account
endBalance                               : When take this balance as ending balance
differStartBalanceEndBalance             : Diffrence balance between BOD and EOD
reconcilationStatus                      : Status of reconcilation
branchOid                                : Parent table Brnach oid
servicePointOid                          : Oid of servicepoint table
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             CollectedChargeReconcilation
(
oid                                      varchar(128)                                                not null,
collectedChargeReconcilationId           varchar(128)                                                not null,
collectedChargeAmount                    numeric(20,6),
bankAccountNo                            varchar(64),
startBalance                             numeric(20,6)                                               not null,
endBalance                               numeric(20,6),
differStartBalanceEndBalance             numeric(20,6),
reconcilationStatus                      varchar(32),
branchOid                                varchar(128)                                                not null,
servicePointOid                          varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_CollectedChargeReconcilation                             primary key    (oid),
constraint                               ck_reconcilationStatus_CollectedChargeReconcilation         check          (reconcilationStatus = 'Ok' or reconcilationStatus = 'Pending Failed'),
constraint                               ck_status_CollectedChargeReconcilation                      check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_CollectedChargeReconcilation           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_CollectedChargeReconcilation                 check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to collect  charge reconcilation history
oid                                      : Surrogate primary key
collectedChargeReconcilationId           : Unauth Collected Charge Reconcilation Id
collectedChargeAmount                    : Amount of collecting charge
bankAccountNo                            : Agent bank account no
startBalance                             : Starting balance for a account
endBalance                               : When take this balance as ending balance
differStartBalanceEndBalance             : Diffrence balance between BOD and EOD
reconcilationStatus                      : Status of reconcilation
branchOid                                : Parent table Brnach oid
servicePointOid                          : Oid of servicepoint table
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             CollectedChargeReconcilationHistory
(
oid                                      varchar(128)                                                not null,
collectedChargeReconcilationId           varchar(128)                                                not null,
collectedChargeAmount                    numeric(20,6)                                               not null,
bankAccountNo                            varchar(64),
startBalance                             numeric(20,6)                                               not null,
endBalance                               numeric(20,6)                                               not null,
differStartBalanceEndBalance             numeric(20,6)                                               not null,
reconcilationStatus                      varchar(32)                                                 not null,
branchOid                                varchar(128)                                                not null,
servicePointOid                          varchar(128),
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_CollectedChargeReconcilationHistory                      primary key    (oid),
constraint                               ck_reconcilationStatus_CollectedChargeReconcilationHistory  check          (reconcilationStatus = 'Ok' or reconcilationStatus = 'Pending Failed'),
constraint                               ck_status_CollectedChargeReconcilationHistory               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_CollectedChargeReconcilationHistory    check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_CollectedChargeReconcilationHistory          check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);


