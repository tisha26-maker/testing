/*
This table to be used to store associated FP device draft infromation 
oid                                      : Surrogate primary key
fpDeviceModelId                          : Fingerprint device Id, it should be unique
make                                     : Maker (Trade name) of fingerprint device
model                                    : Model of Fingerprint device 
manufacturer                             : Name of manufacturer from where Fingerprint device has made
description                              : Description of category
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
scannerType                              : Type of scanning system
mnemonic                                 : Unique information of device
resolutionInDpi                          : Resolution in DPI
imageCaptureArea                         : Image capturing area of device (width x height)
fpImageSize                              : Horizontal & vertical pixel range
brochurePath                             : Brochure path of device for specification
comments                                 : Comments on FP device model for any type of suggestion
status                                   : Association status with system i. e. BankMade,BankApproved,BankRejected,Ineditable,Inactive, Active, Close, Delete,Damaged
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftFpDeviceModel
(
oid                                      varchar(128)                                                not null,
fpDeviceModelId                          varchar(128),
make                                     varchar(256),
model                                    varchar(256),
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(256),
connectivityType                         varchar(32),
scannerType                              varchar(32),
mnemonic                                 varchar(64),
resolutionInDpi                          numeric(8,0),
imageCaptureArea                         varchar(64),
fpImageSize                              varchar(256),
brochurePath                             varchar(1024),
comments                                 text,
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftFpDeviceModel                                       primary key    (oid),
constraint                               ck_connectivityType_DraftFpDeviceModel                      check          (connectivityType = 'USB-OTG' or connectivityType = 'Bluetooth' or connectivityType = 'USB-Bulitin'),
constraint                               ck_scannerType_DraftFpDeviceModel                           check          (scannerType = 'Optical' or scannerType = 'Capacitive'),
constraint                               ck_status_DraftFpDeviceModel                                check          (status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated FP device un auth information
oid                                      : Surrogate primary key
fpDeviceModelId                          : Fingerprint device Id, it should be unique
make                                     : Maker (Trade name) of fingerprint device
model                                    : Model of Fingerprint device 
manufacturer                             : Name of manufacturer from where Fingerprint device has made
description                              : Description of category
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
scannerType                              : Type of scanning system
mnemonic                                 : Unique information of device
resolutionInDpi                          : Resolution in DPI
imageCaptureArea                         : Image capturing area of device (width x height)
fpImageSize                              : Horizontal & vertical pixel range
brochurePath                             : Brochure Path for specification
comments                                 : Comments on FP device model for any type of suggestion
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
create table                             UnauthFpDeviceModel
(
oid                                      varchar(128)                                                not null,
fpDeviceModelId                          varchar(128)                                                not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(256)                                                not null,
connectivityType                         varchar(32)                                                 not null,
scannerType                              varchar(32)                                                 not null,
mnemonic                                 varchar(64),
resolutionInDpi                          numeric(8,0),
imageCaptureArea                         varchar(64),
fpImageSize                              varchar(256),
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
constraint                               pk_UnauthFpDeviceModel                                      primary key    (oid),
constraint                               ck_connectivityType_UnauthFpDeviceModel                     check          (connectivityType = 'USB-OTG' or connectivityType = 'Bluetooth' or connectivityType = 'USB-Bulitin'),
constraint                               ck_scannerType_UnauthFpDeviceModel                          check          (scannerType = 'Optical' or scannerType = 'Capacitive'),
constraint                               ck_status_UnauthFpDeviceModel                               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthFpDeviceModel                           check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthFpDeviceModel                    check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthFpDeviceModel                          check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated fp device model information
oid                                      : Surrogate primary key
fpDeviceModelId                          : Fingerprint device Id, it should be unique
make                                     : Maker (Trade name) of fingerprint device
model                                    : Model of Fingerprint device 
manufacturer                             : Name of manufacturer from where Fingerprint device has made
description                              : Short description of category
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
scannerType                              : Type of scanning system
mnemonic                                 : Unique information of device
resolutioninDpi                          : Resolution in DPI
imageCaptureArea                         : Image capturing area of device (width x height)
fpImageSize                              : Horizontal & vertical pixel range
brochurePath                             : Brochure Path for specification
comments                                 : Comments on FP device model for any type of suggestion
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
create table                             FpDeviceModel
(
oid                                      varchar(128)                                                not null,
fpDeviceModelId                          varchar(128)                                                not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(256)                                                not null,
connectivityType                         varchar(32)                                                 not null,
scannerType                              varchar(32)                                                 not null,
mnemonic                                 varchar(64),
resolutioninDpi                          numeric(8,0),
imageCaptureArea                         varchar(64),
fpImageSize                              varchar(256),
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
constraint                               pk_FpDeviceModel                                            primary key    (oid),
constraint                               ck_connectivityType_FpDeviceModel                           check          (connectivityType = 'USB-OTG' or connectivityType = 'Bluetooth' or connectivityType = 'USB-Bulitin'),
constraint                               ck_scannerType_FpDeviceModel                                check          (scannerType = 'Optical' or scannerType = 'Capacitive'),
constraint                               ck_status_FpDeviceModel                                     check          (status = 'Active' or status = 'Inactive' or status = 'Cancel' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_FpDeviceModel                          check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_FpDeviceModel                                check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated fp device model history information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
fpDeviceModelId                          : Fingerprint device Id, it should be unique
make                                     : Maker of fingerprint device
model                                    : Model of Fingerprint device 
manufacturer                             : Name of manufacturer from where Fingerprint device has made
description                              : Short description of category
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
scannerType                              : Type of scanning system
mnemonic                                 : Unique information of device
resolutioninDpi                          : Resolution in DPI
imageCaptureArea                         : Image capturing area of device (width x height)
fpImageSize                              : Horizontal & vertical pixel range
brochurePath                             : Brochure Path for specification
comments                                 : Comments on FP device model for any type of suggestion
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
create table                             FpDeviceModelHistory
(
oid                                      varchar(128)                                                not null,
fpDeviceModelId                          varchar(128)                                                not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(256)                                                not null,
connectivityType                         varchar(32)                                                 not null,
scannerType                              varchar(32)                                                 not null,
mnemonic                                 varchar(64),
resolutioninDpi                          numeric(8,0),
imageCaptureArea                         varchar(64),
fpImageSize                              varchar(256),
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
deletionRemark                           text
);

/*
This table to be used to store associated draft fp device information
oid                                      : Surrogate primary key
fpDeviceId                               : Fingerprint device Id, it should be unique
identifier                               : Unique information of device
fpDeviceModelOid                         : Reference of under which FpDeviceModel
deviceStatus                             : Current status of device i.e Assigned, Unassigned
deviceStatusUpdatedOn                    : Reference of whom updated
description                              : Description of finger print device
comments                                 : Comments on FP device for any type of suggestion
status                                   : Association status with system i. e. BankMade,BankApproved,BankRejected,Ineditable,Inactive, Active, Close, Delete,Damaged
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftFpDevice
(
oid                                      varchar(128)                                                not null,
fpDeviceId                               varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
fpDeviceModelOid                         varchar(128)                                                not null,
deviceStatus                             varchar(32)                                                 not null,
deviceStatusUpdatedOn                    timestamp,
description                              text,
comments                                 text,
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                                  default current_timestamp,
constraint                               pk_DraftFpDevice                                            primary key    (oid),
constraint                               ck_deviceStatus_DraftFpDevice                               check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_DraftFpDevice                                     check          (status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated unauth fp device imformation
oid                                      : Surrogate primary key
fpDeviceId                               : Fingerprint device Id, it should be unique
identifier                               : Unique information of device
fpDeviceModelOid                         : Reference of under which FpDeviceModel
deviceStatus                             : Current status of device i.e Assigned, Unassigned
deviceStatusUpdatedOn                    : Reference of whom updated
description                              : Description of finger print device
comments                                 : Comments on FP device for any type of suggestion
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of fp device
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
create table                             UnauthFpDevice
(
oid                                      varchar(128)                                                not null,
fpDeviceId                               varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
fpDeviceModelOid                         varchar(128)                                                not null,
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
constraint                               pk_UnauthFpDevice                                           primary key    (oid),
constraint                               ck_deviceStatus_UnauthFpDevice                              check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_UnauthFpDevice                                    check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthFpDevice                                check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthFpDevice                         check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthFpDevice                               check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated fp device information
oid                                      : Surrogate primary key
fpDeviceId                               : Fingerprint device Id, it should be unique
identifier                               : Unique information of device
fpDeviceModelOid                         : Reference of under which FpDeviceModel
deviceStatus                             : Current status of device i.e Assigned, Unassigned
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of finger print device
comments                                 : Comments on FP device for any type of suggestion
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
create table                             FpDevice
(
oid                                      varchar(128)                                                not null,
fpDeviceId                               varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
fpDeviceModelOid                         varchar(128)                                                not null,
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
constraint                               pk_FpDevice                                                 primary key    (oid),
constraint                               fk_fpDeviceModelOid_FpDevice                                foreign key    (fpDeviceModelOid)
                                                                                                     references     FpDeviceModel(oid),
constraint                               ck_deviceStatus_FpDevice                                    check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_FpDevice                                          check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_FpDevice                               check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_FpDevice                                     check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated fp device history information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
fpDeviceId                               : Fingerprint device Id, it should be unique
identifier                               : Unique information of device
fpDeviceModelOid                         : Reference of under which FpDeviceModel
deviceStatus                             : Current status of device i.e Assigned, Unassigned
deviceStatusUpdatedOn                    : Reference of whom updated
description                              : Description of finger print device
comments                                 : Comments on FP device for any type of suggestion
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
create table                             FpDeviceHistory
(
oid                                      varchar(128)                                                not null,
fpDeviceId                               varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
fpDeviceModelOid                         varchar(128)                                                not null,
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
deletionRemark                           text
);


