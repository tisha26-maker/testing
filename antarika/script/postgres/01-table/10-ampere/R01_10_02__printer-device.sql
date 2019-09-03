/*
 This table to be used to store associated printer device draft information
oid                                      : Surrogate primary key
printerDeviceModelId                     : Reference of under which printer DeviceModel
make                                     : Maker of printer device
model                                    : Model of printer device
manufacturer                             : Name of manufacturer from where printer device has made
description                              : Description of printer device
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
printerType                              : Type of printing system
mnemonic                                 : Unique information of device
emulation                                : Emulation of printer device model
printingWidth                            : Width of printing 
banglaFontSupport                        : Bangla font supportted or not
qrCodeSupport                            : QR code supportted or not
brochurePath                             : Brochure Path for specification
comments                                 : Comments on Printer device for any type of suggestion
status                                   : Association status with system i. e. BankMade,BankApproved,BankRejected,Ineditable,Inactive, Active, Close, Delete,Damaged
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftPrinterDeviceModel
(
oid                                      varchar(128)                                                not null,
printerDeviceModelId                     varchar(128)                                                not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64),
connectivityType                         varchar(32),
printerType                              varchar(32),
mnemonic                                 varchar(64),
emulation                                varchar(32),
printingWidth                            varchar(32),
banglaFontSupport                        varchar(32),
qrCodeSupport                            varchar(32),
brochurePath                             varchar(1024),
comments                                 text,
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftPrinterDeviceModel                                  primary key    (oid),
constraint                               ck_emulation_DraftPrinterDeviceModel                        check          (emulation = 'ESC' or emulation = 'POS'),
constraint                               ck_banglaFontSupport_DraftPrinterDeviceModel                check          (banglaFontSupport = 'Yes' or banglaFontSupport = 'No'),
constraint                               ck_qrCodeSupport_DraftPrinterDeviceModel                    check          (qrCodeSupport = 'Yes' or qrCodeSupport = 'No'),
constraint                               ck_status_DraftPrinterDeviceModel                           check          (status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted')
);

/*
 This table to be used to store associated printer device draft information
oid                                      : Surrogate primary key
printerDeviceModelId                     : Reference of under which printer DeviceModel
make                                     : Maker of printer device
model                                    : Model of printer device
manufacturer                             : Name of manufacturer from where printer device has made
description                              : Description of category
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
printerType                              : Type of printing system
mnemonic                                 : Unique information of device
emulation                                : Emulation of printer device model
printingWidth                            : Width of printing 
banglaFontSupport                        : Bangla font supportted or not
qrCodeSupport                            : QR code supportted or not
brochurePath                             : Brochure Path for specification
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
create table                             UnauthPrinterDeviceModel
(
oid                                      varchar(128)                                                not null,
printerDeviceModelId                     varchar(128)                                                not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64),
connectivityType                         varchar(32),
printerType                              varchar(32),
mnemonic                                 varchar(64),
emulation                                varchar(32),
printingWidth                            varchar(32),
banglaFontSupport                        varchar(32),
qrCodeSupport                            varchar(32),
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
constraint                               pk_UnauthPrinterDeviceModel                                 primary key    (oid),
constraint                               ck_emulation_UnauthPrinterDeviceModel                       check          (emulation = 'ESC' or emulation = 'POS'),
constraint                               ck_banglaFontSupport_UnauthPrinterDeviceModel               check          (banglaFontSupport = 'Yes' or banglaFontSupport = 'No'),
constraint                               ck_qrCodeSupport_UnauthPrinterDeviceModel                   check          (qrCodeSupport = 'Yes' or qrCodeSupport = 'No'),
constraint                               ck_status_UnauthPrinterDeviceModel                          check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthPrinterDeviceModel                      check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthPrinterDeviceModel               check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthPrinterDeviceModel                     check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated printer device model
oid                                      : Surrogate primary key
printerDeviceModelId                     : Reference of under which printer DeviceModel
make                                     : Maker of printer device
model                                    : Model of printer device
manufacturer                             : Name of manufacturer from where printer device has made
description                              : Description of printer device
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
printerType                              : Type of printing system
mnemonic                                 : Unique information of device
emulation                                : Emulation of printer device model
printingWidth                            : Width of printing 
banglaFontSupport                        : Bangla font supportted or not
qrCodeSupport                            : QR code supportted or not
brochurePath                             : Brochure Path for specification
comments                                 : Comments on service terminal for any type of suggestion
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
create table                             PrinterDeviceModel
(
oid                                      varchar(128)                                                not null,
printerDeviceModelId                     varchar(128)                                                not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64),
connectivityType                         varchar(32),
printerType                              varchar(32),
mnemonic                                 varchar(64),
emulation                                varchar(32),
printingWidth                            varchar(32),
banglaFontSupport                        varchar(32),
qrCodeSupport                            varchar(32),
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
constraint                               pk_PrinterDeviceModel                                       primary key    (oid),
constraint                               u_mnemonic_PrinterDeviceModel                               unique         (mnemonic),
constraint                               ck_emulation_PrinterDeviceModel                             check          (emulation = 'ESC/POS' or emulation = 'Proprietory'),
constraint                               ck_banglaFontSupport_PrinterDeviceModel                     check          (banglaFontSupport = 'Yes' or banglaFontSupport = 'No'),
constraint                               ck_qrCodeSupport_PrinterDeviceModel                         check          (qrCodeSupport = 'Yes' or qrCodeSupport = 'No'),
constraint                               ck_status_PrinterDeviceModel                                check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_PrinterDeviceModel                     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_PrinterDeviceModel                           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated printer device model history information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
printerDeviceModelId                     : Reference of under which printer DeviceModel
make                                     : Maker of printer device
model                                    : Model of printer device
manufacturer                             : Name of manufacturer from where printer device has made
description                              : Description of printer device
countryOfOrigin                          : Name of country from where device has made
connectivityType                         : Type of connectivity with other device
printerType                              : Type of printer
mnemonic                                 : Unique information of device
emulation                                : Emulation of printer device model
printingWidth                            : Width of printing 
banglaFontSupport                        : Bangla font supportted or not
qrCodeSupport                            : QR code supportted or not
brochurePath                             : Brochure Path for specification
comments                                 : Comments on Printer device model for any type of suggestion
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
create table                             PrinterDeviceModelHistory
(
oid                                      varchar(128)                                                not null,
printerDeviceModelId                     varchar(128)                                                not null,
make                                     varchar(256)                                                not null,
model                                    varchar(256)                                                not null,
manufacturer                             varchar(256),
description                              text,
countryOfOrigin                          varchar(64),
connectivityType                         varchar(32),
printerType                              varchar(32),
mnemonic                                 varchar(64),
emulation                                varchar(32),
printingWidth                            varchar(32),
banglaFontSupport                        varchar(32),
qrCodeSupport                            varchar(32),
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
constraint                               pk_PrinterDeviceModelHistory                                primary key    (oid)
);

/*
This table to be used to store associated printer device draft information
oid                                      : Surrogate primary key
printerDeviceId                          : Unique identification of device
identifier                               : Unique information of device
printerDeviceModelOid                    : Reference of under which printer DeviceModel
deviceStatus                             : Current status of device
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of printer device
comments                                 : Comments on Printer device model for any type of suggestion
status                                   : Association status with system i. e. BankMade,BankApproved,BankRejected,Ineditable,Inactive, Active, Close, Delete,Damaged
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftPrinterDevice
(
oid                                      varchar(128)                                                not null,
printerDeviceId                          varchar(128),
identifier                               varchar(128),
printerDeviceModelOid                    varchar(128),
deviceStatus                             varchar(32),
deviceStatusUpdatedOn                    timestamp,
description                              text,
comments                                 text,
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftPrinterDevice                                       primary key    (oid),
constraint                               ck_deviceStatus_DraftPrinterDevice                          check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_DraftPrinterDevice                                check          (status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated unauth printer device information
oid                                      : Surrogate primary key
printerDeviceId                          : Unique identification of device
identifier                               : Unique information of device
printerDeviceModelOid                    : Reference of under which printer DeviceModel
deviceStatus                             : Current status of device
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of printer device
comments                                 : Comments on Printer device model for any type of suggestion
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
create table                             UnauthPrinterDevice
(
oid                                      varchar(128)                                                not null,
printerDeviceId                          varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
printerDeviceModelOid                    varchar(128)                                                not null,
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
constraint                               pk_UnauthPrinterDevice                                      primary key    (oid),
constraint                               ck_deviceStatus_UnauthPrinterDevice                         check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_UnauthPrinterDevice                               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthPrinterDevice                           check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthPrinterDevice                    check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthPrinterDevice                          check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated printer device information
oid                                      : Surrogate primary key
printerDeviceId                          : Unique identification of device
identifier                               : Unique information of device
printerDeviceModelOid                    : Reference of under which printer DeviceModel
deviceStatus                             : Current status of device
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of printer device
comments                                 : Comments on Printer device for any type of suggestion
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
create table                             PrinterDevice
(
oid                                      varchar(128)                                                not null,
printerDeviceId                          varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
printerDeviceModelOid                    varchar(128)                                                not null,
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
constraint                               pk_PrinterDevice                                            primary key    (oid),
constraint                               fk_printerDeviceModelOid_PrinterDevice                      foreign key    (printerDeviceModelOid)
                                                                                                     references     PrinterDeviceModel(oid),
constraint                               ck_deviceStatus_PrinterDevice                               check          (deviceStatus = 'Assigned' or deviceStatus = 'Unassigned' or deviceStatus = 'Damaged'),
constraint                               ck_status_PrinterDevice                                     check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_PrinterDevice                          check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_PrinterDevice                                check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated printer device history information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
printerDeviceId                          : Unique identification of device
identifier                               : Unique information of device
printerDeviceModelOid                    : Reference of under which printer DeviceModel
deviceStatus                             : Current status of device
deviceStatusUpdatedOn                    : Reference of when status updated
description                              : Description of printer device
comments                                 : Comments on Printer device for any type of suggestion
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
create table                             PrinterDeviceHistory
(
oid                                      varchar(128)                                                not null,
printerDeviceId                          varchar(128)                                                not null,
identifier                               varchar(128)                                                not null,
printerDeviceModelOid                    varchar(128)                                                not null,
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
constraint                               pk_PrinterDeviceHistory                                     primary key    (oid)
);


