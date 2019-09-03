/*
This table to be used to store associated Agent information with system. An Agent can perform its operation from multiple bank and with a single branch of respective bank
oid                                      : Surrogate primary key
cardDeviceModelId                        : Reference of under whichCardDeviceModel
mnemonic                                 : Unique information of device
make                                     : Maker of card device
model                                    : Model of card device
manufacturer                             : Name of manufacturer from where card device has made
description                              : Description of card device
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
cardType                                 : Type of card
brochurePath                             : Brochure Path for specification
comments                                 : Comments on Printer device for any type of suggestion
status                                   : Association status with system i. e. BankMade,BankApproved,BankRejected,Ineditable,Inactive, Active, Close, Delete,Damaged
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftCardDeviceModel
(
oid                                      varchar(128)                                                not null,
cardDeviceModelId                        varchar(128)                                                not null,
mnemonic                                 varchar(64)                                                 not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64)                                                 not null,
connectivityType                         varchar(32)                                                 not null,
cardType                                 varchar(32)                                                 not null,
brochurePath                             varchar(1024),
comments                                 text,
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftCardDeviceModel                                     primary key    (oid),
constraint                               ck_status_DraftCardDeviceModel                              check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated unauthorized card device information with system.
oid                                      : Surrogate primary key
cardDeviceModelId                        : Reference of under whichCardDeviceModel
mnemonic                                 : Unique information of device
make                                     : Maker of card device
model                                    : Model of card device
manufacturer                             : Name of manufacturer from where card device has made
description                              : Description of card device
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
cardType                                 : Type of card
brochurePath                             : Brochure Path for specification
comments                                 : Comments on Card device for any type of suggestion
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
create table                             UnauthCardDeviceModel
(
oid                                      varchar(128)                                                not null,
cardDeviceModelId                        varchar(128)                                                not null,
mnemonic                                 varchar(64),
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64)                                                 not null,
connectivityType                         varchar(32)                                                 not null,
cardType                                 varchar(32)                                                 not null,
brochurePath                             varchar(1024),
comments                                 text,
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
constraint                               pk_UnauthCardDeviceModel                                    primary key    (oid),
constraint                               ck_status_UnauthCardDeviceModel                             check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthCardDeviceModel                         check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthCardDeviceModel                  check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthCardDeviceModel                        check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Card Device Model information
oid                                      : Surrogate primary key
cardDeviceModelId                        : Reference of under whichCardDeviceModel
mnemonic                                 : Unique information of device
make                                     : Maker of card device
model                                    : Model of card device
manufacturer                             : Name of manufacturer from where card device has made
description                              : Description of card device
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
cardType                                 : Type of card
brochurePath                             : Brochure Path for specification
comments                                 : Comments on Card device for any type of suggestion
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
create table                             CardDeviceModel
(
oid                                      varchar(128)                                                not null,
cardDeviceModelId                        varchar(128)                                                not null,
mnemonic                                 varchar(64),
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64)                                                 not null,
connectivityType                         varchar(32)                                                 not null,
cardType                                 varchar(32),
brochurePath                             varchar(1024),
comments                                 text,
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
constraint                               pk_CardDeviceModel                                          primary key    (oid),
constraint                               ck_status_CardDeviceModel                                   check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_CardDeviceModel                        check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_CardDeviceModel                              check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Card Device Model History information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
cardDeviceModelId                        : Reference of under whichCardDeviceModel
mnemonic                                 : Unique information of device
make                                     : Maker of card device
model                                    : Model of card device
manufacturer                             : Name of manufacturer from where card device has made
description                              : Description of card device
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
cardType                                 : Type of card
brochurePath                             : Brochure Path for specification
comments                                 : Comments on Card device for any type of suggestion
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
create table                             CardDeviceModelHistory
(
oid                                      varchar(128)                                                not null,
cardDeviceModelId                        varchar(128)                                                not null,
mnemonic                                 varchar(64)                                                 not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64)                                                 not null,
connectivityType                         varchar(32)                                                 not null,
cardType                                 varchar(32)                                                 not null,
brochurePath                             varchar(1024),
comments                                 text,
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
constraint                               pk_CardDeviceModelHistory                                   primary key    (oid)
);

/*
This table to be used to store associated draft Card Device information
oid                                      : Will be like as SP0001;1 (Live table's oid & currentVersion) 
cardDeviceId                             : Unique identification of device
identifier                               : Unique information of device
cardDeviceModelOid                       : Reference of under whichCardDeviceModel
deviceStatus                             : Current status of device i.e Assigned, Unassigned
deviceStatusUpdatedOn                    : Reference of whom updated
description                              : Description of card device
comments                                 : Comments on Card device for any type of suggestion
status                                   : Association status with system i. e. BankMade,BankApproved,BankRejected,Ineditable,Inactive, Active, Close, Delete,Damaged
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftCardDevice
(
oid                                      varchar(128)                                                not null,
cardDeviceId                             varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
cardDeviceModelOid                       varchar(128)                                                not null,
deviceStatus                             varchar(32)                                                 not null,
deviceStatusUpdatedOn                    timestamp,
description                              text,
comments                                 text,
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftCardDevice                                          primary key    (oid),
constraint                               ck_deviceStatus_DraftCardDevice                             check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_DraftCardDevice                                   check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated unauthorised Card Device information
oid                                      : Surrogate primary key
cardDeviceId                             : Unique identification of device
identifier                               : Unique information of device
cardDeviceModelOid                       : Reference of under whichCardDeviceModel
deviceStatus                             : Current status of device i.e Assigned, Unassigned
deviceStatusUpdatedOn                    : Reference of whom updated
description                              : Description of card device
comments                                 : Comments on Card device for any type of suggestion
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
create table                             UnauthCardDevice
(
oid                                      varchar(128)                                                not null,
cardDeviceId                             varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
cardDeviceModelOid                       varchar(128)                                                not null,
deviceStatus                             varchar(32)                                                 not null,
deviceStatusUpdatedOn                    timestamp,
description                              text,
comments                                 text,
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
constraint                               pk_UnauthCardDevice                                         primary key    (oid),
constraint                               ck_deviceStatus_UnauthCardDevice                            check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_UnauthCardDevice                                  check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthCardDevice                              check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthCardDevice                       check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthCardDevice                             check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Card Device information
oid                                      : Surrogate primary key
cardDeviceId                             : Unique identification of device
identifier                               : Unique information of device
cardDeviceModelOid                       : Reference of under whichCardDeviceModel
deviceStatus                             : Current status of device i.e Assigned, Unassigned
deviceStatusUpdatedOn                    : Reference of whom updated
description                              : Description of card device
comments                                 : Comments on Card device for any type of suggestion
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
create table                             CardDevice
(
oid                                      varchar(128)                                                not null,
cardDeviceId                             varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
cardDeviceModelOid                       varchar(128)                                                not null,
deviceStatus                             varchar(32)                                                 not null,
deviceStatusUpdatedOn                    timestamp,
description                              text,
comments                                 text,
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
constraint                               pk_CardDevice                                               primary key    (oid),
constraint                               ck_deviceStatus_CardDevice                                  check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_CardDevice                                        check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_CardDevice                             check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_CardDevice                                   check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Card Device History
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
cardDeviceId                             : Unique identification of device
identifier                               : Unique information of device
cardDeviceModelOid                       : Reference of under whichCardDeviceModel
deviceStatus                             : Current status of device i.e Assigned, Unassigned
deviceStatusUpdatedOn                    : Reference of whom updated
description                              : Description of card device
comments                                 : Comments on Card device for any type of suggestion
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
create table                             CardDeviceHistory
(
oid                                      varchar(128)                                                not null,
cardDeviceId                             varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
cardDeviceModelOid                       varchar(128)                                                not null,
deviceStatus                             varchar(32)                                                 not null,
deviceStatusUpdatedOn                    timestamp,
description                              text,
comments                                 text,
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
constraint                               pk_CardDeviceHistory                                        primary key    (oid)
);


