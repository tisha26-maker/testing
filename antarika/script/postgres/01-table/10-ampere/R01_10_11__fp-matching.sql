/*
Matching threshold rule when matching from one capturing model to another verification model
oid                                      : Surrogate primary key, same as fpDeviceId
referenceFpDeviceModelId                 : Capturing device model
queryFpDeviceModelId                     : Verification device model
matchingThreshold                        : Matching threshold value for this reference/query model pair
comments                                 : Comments on reference FP device Model for any type of suggestion
status                                   : Association status with system i. e. Active, Inactive, Delete, Clos
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftFpMatchingThreshold
(
oid                                      varchar(128)                                                not null,
referenceFpDeviceModelId                 varchar(128)                                                not null,
queryFpDeviceModelId                     varchar(128)                                                not null,
matchingThreshold                        numeric(20,0)                                               not null,
comments                                 text,
status                                   varchar(32)                                                 not null,
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftFpMatchingThreshold                                 primary key    (oid),
constraint                               ck_status_DraftFpMatchingThreshold                          check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted')
);

/*
Matching threshold rule when matching from one capturing model to another verification model
oid                                      : Surrogate primary key, same as fpDeviceId
referenceFpDeviceModelId                 : Capturing device model
queryFpDeviceModelId                     : Verification device model
matchingThreshold                        : Matching threshold value for this reference/query model pair
comments                                 : Comments on reference FP device Model for any type of suggestion
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
create table                             UnauthFpMatchingThreshold
(
oid                                      varchar(128)                                                not null,
referenceFpDeviceModelId                 varchar(128)                                                not null,
queryFpDeviceModelId                     varchar(128)                                                not null,
matchingThreshold                        numeric(20,0)                                               not null,
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
constraint                               pk_UnauthFpMatchingThreshold                                primary key    (oid),
constraint                               ck_status_UnauthFpMatchingThreshold                         check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthFpMatchingThreshold                     check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthFpMatchingThreshold              check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthFpMatchingThreshold                    check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Matching threshold rule when matching from one capturing model to another verification model
oid                                      : Surrogate primary key, same as fpDeviceId
referenceFpDeviceModelId                 : Capturing device model
queryFpDeviceModelId                     : Verification device model
matchingThreshold                        : Matching threshold value for this reference/query model pair
comments                                 : Comments on reference FP device Model for any type of suggestion
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
create table                             FpMatchingThreshold
(
oid                                      varchar(128)                                                not null,
referenceFpDeviceModelId                 varchar(128)                                                not null,
queryFpDeviceModelId                     varchar(128)                                                not null,
matchingThreshold                        numeric(20,0)                                               not null,
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
constraint                               pk_FpMatchingThreshold                                      primary key    (oid),
constraint                               ck_status_FpMatchingThreshold                               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_FpMatchingThreshold                    check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_FpMatchingThreshold                          check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Matching threshold rule when matching from one capturing model to another verification model
oid                                      : Surrogate primary key, same as fpDeviceId
referenceFpDeviceModelId                 : Capturing device model
queryFpDeviceModelId                     : Verification device model
matchingThreshold                        : Matching threshold value for this reference/query model pair
comments                                 : Comments on reference FP device Model for any type of suggestion
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
create table                             FpMatchingThresholdHistory
(
oid                                      varchar(128)                                                not null,
referenceFpDeviceModelId                 varchar(128)                                                not null,
queryFpDeviceModelId                     varchar(128)                                                not null,
matchingThreshold                        numeric(20,0)                                               not null,
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
constraint                               pk_FpMatchingThresholdHistory                               primary key    (oid)
);


