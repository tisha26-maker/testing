/*
Associated ServiceTerminal draft information to be stored here
oid                                      : Surrogate primary key
serviceTerminalId                        : A service Terminal associated with system to be identified by serviceTerminalId, Note: serviceTerminalId start from
servicePointOid                          : Parent table Service Point oid
fpDeviceOid                              : Under which finger print device
clientDeviceOid                          : Under which teller terminal
printerDeviceOid                         : Under which printer device
cardDeviceOid                            : Under which card device (optional) 
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : parent table Agent oid
status                                   : Association status with system i. e. Inactive,Active, Close, Delete
description                              : Short description about service terminal
comments                                 : Comments on service terminal for any type of suggestion
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftServiceTerminal
(
oid                                      varchar(128)                                                not null,
serviceTerminalId                        varchar(128),
servicePointOid                          varchar(128),
fpDeviceOid                              varchar(128),
clientDeviceOid                          varchar(128),
printerDeviceOid                         varchar(128),
cardDeviceOid                            varchar(128),
bankOid                                  varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
status                                   varchar(32),
description                              text,
comments                                 text,
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftServiceTerminal                                     primary key    (oid),
constraint                               ck_status_DraftServiceTerminal                              check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted')
);

/*
Associated ServiceTerminal unauth information to be stored here
oid                                      : Surrogate primary key
serviceTerminalId                        : A service Terminal associated with system to be identified by serviceTerminalId, Note: serviceTerminalId start from
servicePointOid                          : Parent table Service Point oid
fpDeviceOid                              : Under which finger print device
clientDeviceOid                          : Under which teller terminal
printerDeviceOid                         : Under which printer device
cardDeviceOid                            : Under which card device (optional) 
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : parent table Agent oid
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
description                              : Short description about service terminal
comments                                 : Comments on service terminal for any type of suggestion
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
create table                             UnauthServiceTerminal
(
oid                                      varchar(128)                                                not null,
serviceTerminalId                        varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
fpDeviceOid                              varchar(128)                                                not null,
clientDeviceOid                          varchar(128)                                                not null,
printerDeviceOid                         varchar(128)                                                not null,
cardDeviceOid                            varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
description                              text,
comments                                 text,
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
constraint                               pk_UnauthServiceTerminal                                    primary key    (oid),
constraint                               fk_servicePointOid_UnauthServiceTerminal                    foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_fpDeviceOid_UnauthServiceTerminal                        foreign key    (fpDeviceOid)
                                                                                                     references     FpDevice(oid),
constraint                               fk_clientDeviceOid_UnauthServiceTerminal                    foreign key    (clientDeviceOid)
                                                                                                     references     ClientDevice(oid),
constraint                               fk_printerDeviceOid_UnauthServiceTerminal                   foreign key    (printerDeviceOid)
                                                                                                     references     PrinterDevice(oid),
constraint                               fk_cardDeviceOid_UnauthServiceTerminal                      foreign key    (cardDeviceOid)
                                                                                                     references     CardDevice(oid),
constraint                               fk_bankOid_UnauthServiceTerminal                            foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_UnauthServiceTerminal                          foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentOid_UnauthServiceTerminal                           foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               ck_status_UnauthServiceTerminal                             check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthServiceTerminal                         check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthServiceTerminal                  check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthServiceTerminal                        check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Associated ServiceTerminal information to be stored here
oid                                      : Surrogate primary key
serviceTerminalId                        : A service Terminal associated with system to be identified by serviceTerminalId, Note: serviceTerminalId start from
servicePointOid                          : Parent table Service Point oid
fpDeviceOid                              : Under which finger print device
clientDeviceOid                          : Under which teller terminal
printerDeviceOid                         : Under which printer device
cardDeviceOid                            : Under which card device (optional) 
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : Parent table Agent oid
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
description                              : Short description about service terminal
comments                                 : Comments on service terminal for any type of suggestion
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
create table                             ServiceTerminal
(
oid                                      varchar(128)                                                not null,
serviceTerminalId                        varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
fpDeviceOid                              varchar(128)                                                not null,
clientDeviceOid                          varchar(128)                                                not null,
printerDeviceOid                         varchar(128)                                                not null,
cardDeviceOid                            varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentOid                                 varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
description                              text,
comments                                 text,
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
constraint                               pk_ServiceTerminal                                          primary key    (oid),
constraint                               fk_servicePointOid_ServiceTerminal                          foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_fpDeviceOid_ServiceTerminal                              foreign key    (fpDeviceOid)
                                                                                                     references     FpDevice(oid),
constraint                               fk_clientDeviceOid_ServiceTerminal                          foreign key    (clientDeviceOid)
                                                                                                     references     ClientDevice(oid),
constraint                               fk_printerDeviceOid_ServiceTerminal                         foreign key    (printerDeviceOid)
                                                                                                     references     PrinterDevice(oid),
constraint                               fk_cardDeviceOid_ServiceTerminal                            foreign key    (cardDeviceOid)
                                                                                                     references     CardDevice(oid),
constraint                               fk_bankOid_ServiceTerminal                                  foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_ServiceTerminal                                foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentOid_ServiceTerminal                                 foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               ck_status_ServiceTerminal                                   check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_ServiceTerminal                        check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_ServiceTerminal                              check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Associated ServiceTerminal history information to be stored here
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
serviceTerminalId                        : A service Terminal associated with system to be identified by serviceTerminalId, Note: serviceTerminalId start from
servicePointOid                          : Parent table Service Point oid
fpDeviceOid                              : Under which finger print device
clientDeviceOid                          : Under which teller terminal
printerDeviceOid                         : Under which printer device
cardDeviceOid                            : Under which card device (optional) 
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : Parent table Agent oid
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
description                              : Short description about service terminal
comments                                 : Comments on service terminal for any type of suggestion
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
create table                             ServiceTerminalHistory
(
oid                                      varchar(128)                                                not null,
serviceTerminalId                        varchar(128),
servicePointOid                          varchar(128)                                                not null,
fpDeviceOid                              varchar(128)                                                not null,
clientDeviceOid                          varchar(128)                                                not null,
printerDeviceOid                         varchar(128)                                                not null,
cardDeviceOid                            varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentOid                                 varchar(128),
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
description                              text,
comments                                 text,
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
constraint                               pk_ServiceTerminalHistory                                   primary key    (oid)
);


