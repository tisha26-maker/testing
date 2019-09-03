/*
This table to be used to store associated client device draft infrometion
oid                                      : Surrogate primary key
clientDeviceModelId                      : Reference of under which ClientDeviceModel
mnemonic                                 : Unique information of device
make                                     : Maker of client device
model                                    : Model of client device
manufacturer                             : Name of manufacturer from where client device has made
description                              : Description of client device
countryOfOrigin                          : Name of the country where device was made or originated from
deviceType                               : Type of device
operatingSystem                          : Name of operating system.
osVersion                                : Version of Operating system, If android version whould be lolipop, kitkat etc
screenResolution                         : Device's Screen Resolution
screenSizeInInches                       : Size of screen in inches
cameraType                               : Mode of camera
cameraAutoFocus                          : Whether camera supports autofocus or not
cameraResolution                         : Resolution of camera in MegaPixel
noOfSimSlots                             : Number of sim slots. 
memoryInGb                               : Size of memory in GB
brochurePath                             : Brochure Path for specification
comments                                 : Comments on FP device for any type of suggestion
status                                   : Association status with system i. e. BankMade,BankApproved,BankRejected,Ineditable,Inactive, Active, Close, Delete,Damaged
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftClientDeviceModel
(
oid                                      varchar(128)                                                not null,
clientDeviceModelId                      varchar(128)                                                not null,
mnemonic                                 varchar(64),
make                                     varchar(256),
model                                    varchar(256),
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64),
deviceType                               varchar(32),
operatingSystem                          varchar(64),
osVersion                                varchar(64),
screenResolution                         varchar(64),
screenSizeInInches                       numeric(6,2),
cameraType                               varchar(32),
cameraAutoFocus                          varchar(32),
cameraResolution                         numeric(4,0),
noOfSimSlots                             numeric(4,0),
memoryInGb                               numeric(8,0),
brochurePath                             varchar(1024),
comments                                 text,
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftClientDeviceModel                                   primary key    (oid),
constraint                               ck_cameraAutoFocus_DraftClientDeviceModel                   check          (cameraAutoFocus = 'Yes' or cameraAutoFocus = 'No'),
constraint                               ck_status_DraftClientDeviceModel                            check          (status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated unauth client device model information
oid                                      : Surrogate primary key
clientDeviceModelId                      : Reference of under which ClientDeviceModel
mnemonic                                 : Unique information of device
make                                     : Maker of client device
model                                    : Model of client device
manufacturer                             : Name of manufacturer from where client device has made
description                              : Description of client device
countryOfOrigin                          : Name of country from where device has made
deviceType                               : Type of device
operatingSystem                          : Name of operating system.
osVersion                                : Version of Operating system, If android version whould be lolipop, kitkat etc
screenResolution                         : Device's Screen Resolution
screenSizeInInches                       : Size of screen 
cameraType                               : Mode of camera
cameraAutoFocus                          : Whether there is auto focus or not
cameraResolution                         : Resolution of camera 
noOfSimSlots                             : Number of sim slots. 
memoryInGb                               : Size of ram. Ex: 1 GB, 2GB ....
brochurePath                             : Brochure Path for specification
comments                                 : Comments on FP device for any type of suggestion
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
create table                             UnauthClientDeviceModel
(
oid                                      varchar(128)                                                not null,
clientDeviceModelId                      varchar(128)                                                not null,
mnemonic                                 varchar(64),
make                                     varchar(256),
model                                    varchar(256),
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64),
deviceType                               varchar(32),
operatingSystem                          varchar(64),
osVersion                                varchar(64),
screenResolution                         varchar(64),
screenSizeInInches                       numeric(6,2),
cameraType                               varchar(32),
cameraAutoFocus                          varchar(32),
cameraResolution                         numeric(4,0),
noOfSimSlots                             numeric(4,0),
memoryInGb                               numeric(8,0),
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
constraint                               pk_UnauthClientDeviceModel                                  primary key    (oid),
constraint                               ck_cameraAutoFocus_UnauthClientDeviceModel                  check          (cameraAutoFocus = 'Yes' or cameraAutoFocus = 'No'),
constraint                               ck_status_UnauthClientDeviceModel                           check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthClientDeviceModel                       check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthClientDeviceModel                check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthClientDeviceModel                      check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated client device model
oid                                      : Surrogate primary key
clientDeviceModelId                      : Reference of under which ClientDeviceModel
mnemonic                                 : Unique information of device
make                                     : Maker of client device
model                                    : Model of client device
manufacturer                             : Name of manufacturer from where client device has made
description                              : Description of client device
countryOfOrigin                          : Name of country from where device has made
deviceType                               : Type of device
operatingSystem                          : Name of operating system.
osVersion                                : Version of Operating system, If android version whould be lolipop, kitkat etc
screenResolution                         : Device's Screen Resolution
screenSizeInInches                       : Size of screen 
cameraType                               : Mode of camera
cameraAutoFocus                          : Whether there is auto focus or not
cameraResolution                         : Resolution of camera 
noOfSimSlots                             : Number of sim slots. 
memoryInGb                               : Size of ram. Ex: 1 GB, 2GB ....
brochurePath                             : Brochure Path for specification
comments                                 : Comments on Client device model for any type of suggestion
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
create table                             ClientDeviceModel
(
oid                                      varchar(128)                                                not null,
clientDeviceModelId                      varchar(128)                                                not null,
mnemonic                                 varchar(64),
make                                     varchar(256),
model                                    varchar(256),
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64),
deviceType                               varchar(32),
operatingSystem                          varchar(64),
osVersion                                varchar(64),
screenResolution                         varchar(64),
screenSizeInInches                       numeric(6,2),
cameraType                               varchar(32),
cameraAutoFocus                          varchar(32),
cameraResolution                         numeric(4,0),
noOfSimSlots                             numeric(4,0),
memoryInGb                               numeric(8,0),
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
constraint                               pk_ClientDeviceModel                                        primary key    (oid),
constraint                               ck_cameraAutoFocus_ClientDeviceModel                        check          (cameraAutoFocus = 'Yes' or cameraAutoFocus = 'No'),
constraint                               ck_status_ClientDeviceModel                                 check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_ClientDeviceModel                      check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_ClientDeviceModel                            check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated client device model information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
clientDeviceModelId                      : Reference of under which ClientDeviceModel
mnemonic                                 : Unique information of device
make                                     : Maker of client device
model                                    : Model of client device
manufacturer                             : Name of manufacturer from where client device has made
description                              : Description of client device
countryOfOrigin                          : Name of country from where device has made
deviceType                               : Type of device
operatingSystem                          : Name of operating system.
osVersion                                : Version of Operating system, If android version whould be lolipop, kitkat etc
screenResolution                         : Device's Screen Resolution
screenSizeInInches                       : Size of screen 
cameraType                               : Mode of camera
cameraAutoFocus                          : Whether there is auto focus or not
cameraResolution                         : Resolution of camera 
noOfSimSlots                             : Number of sim slots. 
memoryInGb                               : Size of ram. Ex: 1 GB, 2GB ....
brochurePath                             : Brochure Path for specification
comments                                 : Comments on Client device model for any type of suggestion
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
create table                             ClientDeviceModelHistory
(
oid                                      varchar(128)                                                not null,
clientDeviceModelId                      varchar(128)                                                not null,
mnemonic                                 varchar(64),
make                                     varchar(256),
model                                    varchar(256),
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64),
deviceType                               varchar(32),
operatingSystem                          varchar(64),
osVersion                                varchar(64),
screenResolution                         varchar(64),
screenSizeInInches                       numeric(6,2),
cameraType                               varchar(32),
cameraAutoFocus                          varchar(32),
cameraResolution                         numeric(4,0),
noOfSimSlots                             numeric(4,0),
memoryInGb                               numeric(8,0),
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
This table to be used to store associated draft client device information
oid                                      : Surrogate primary key
clientDeviceId                           : Client device Id, it should be unique
identifier                               : Unique information of device
optionalIdentifier                       : Unique information of device (optional) 
clientDeviceModelOid                     : Reference of under which ClientDeviceModel
deviceStatus                             : Current status of device
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of client device
comments                                 : Comments on Client device model for any type of suggestion
status                                   : Association status with system i. e. BankMade,BankApproved,BankRejected,Ineditable,Inactive, Active, Close, Delete,Damaged
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftClientDevice
(
oid                                      varchar(128)                                                not null,
clientDeviceId                           varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
optionalIdentifier                       varchar(128)                                                not null,
clientDeviceModelOid                     varchar(128)                                                not null,
deviceStatus                             varchar(32)                                                 not null,
deviceStatusUpdatedOn                    timestamp,
description                              text,
comments                                 text,
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftClientDevice                                        primary key    (oid),
constraint                               ck_deviceStatus_DraftClientDevice                           check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_DraftClientDevice                                 check          (status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated unauth client device information
oid                                      : Surrogate primary key
clientDeviceId                           : Client device Id, it should be unique
identifier                               : Unique information of device
optionalIdentifier                       : Unique information of device (optional) 
clientDeviceModelOid                     : Reference of under which ClientDeviceModel
deviceStatus                             : Current status of device
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of client device
comments                                 : Comments on Client device model for any type of suggestion
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
create table                             UnauthClientDevice
(
oid                                      varchar(128)                                                not null,
clientDeviceId                           varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
optionalIdentifier                       varchar(128)                                                not null,
clientDeviceModelOid                     varchar(128)                                                not null,
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
constraint                               pk_UnauthClientDevice                                       primary key    (oid),
constraint                               ck_deviceStatus_UnauthClientDevice                          check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_UnauthClientDevice                                check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthClientDevice                            check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthClientDevice                     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthClientDevice                           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated client device information
oid                                      : Surrogate primary key
clientDeviceId                           : Unique identification of device
identifier                               : Unique information of device. Usually IMEI or MAC
optionalIdentifier                       : Unique information of device (optional). Usually IMEI or MAC 
clientDeviceModelOid                     : Reference of under which ClientDeviceModel
deviceStatus                             : Current status of device
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of client device
comments                                 : Comments on Client device model for any type of suggestion
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
create table                             ClientDevice
(
oid                                      varchar(128)                                                not null,
clientDeviceId                           varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
optionalIdentifier                       varchar(128)                                                not null,
clientDeviceModelOid                     varchar(128)                                                not null,
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
constraint                               pk_ClientDevice                                             primary key    (oid),
constraint                               fk_clientDeviceModelOid_ClientDevice                        foreign key    (clientDeviceModelOid)
                                                                                                     references     ClientDeviceModel(oid),
constraint                               ck_deviceStatus_ClientDevice                                check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_ClientDevice                                      check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_ClientDevice                           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_ClientDevice                                 check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated client device history information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
clientDeviceId                           : Unique identification of device
identifier                               : Unique information of device
optionalIdentifier                       : Unique information of device (optional) 
clientDeviceModelOid                     : Reference of under which ClientDeviceModel
deviceStatus                             : Current status of device
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of client device
comments                                 : Comments on Client device model for any type of suggestion
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
create table                             ClientDeviceHistory
(
oid                                      varchar(128)                                                not null,
clientDeviceId                           varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
optionalIdentifier                       varchar(128)                                                not null,
clientDeviceModelOid                     varchar(128)                                                not null,
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
constraint                               pk_ClientDeviceHistory                                      primary key    (oid)
);


