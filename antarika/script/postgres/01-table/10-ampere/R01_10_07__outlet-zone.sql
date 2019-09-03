/*
Associated draft outlet zone information to be stored here
oid                                      : Surrogate primary key
outletZoneId                             : An outlet zone associated with System to be Identified by agentId
name                                     : Name of outlet zone
description                              : Description of outlet zone
outletAreaOid                            : An outlet area associated with System to be Identified by agentId
status                                   : Association status with system i. e. Inactive,Active, Closed, Deleted
draftSavedBy                             : Who (which login) last drafted the record
draftSavedOn                             : When the record was last drafted
*/
create table                             DraftOutletZone
(
oid                                      varchar(128)                                                not null,
outletZoneId                             varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
description                              text,
outletAreaOid                            varchar(128)                                                not null,
status                                   varchar(32)                                                 not null,
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftOutletZone                                          primary key    (oid),
constraint                               ck_status_DraftOutletZone                                   check          (status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated Un auth Outlet zone information with system
oid                                      : Surrogate primary key
outletZoneId                             : An outlet zone associated with system to be identified by outletZoneId
name                                     : Name of outlet zone
description                              : Description of outlet zone
outletAreaOid                            : An outlet area associated with System to be Identified by agentId
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
create table                             UnauthOutletZone
(
oid                                      varchar(128)                                                not null,
outletZoneId                             varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
description                              text,
outletAreaOid                            varchar(128),
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
constraint                               pk_UnauthOutletZone                                         primary key    (oid),
constraint                               ck_status_UnauthOutletZone                                  check          (status = 'Active' or status = 'Inactive' or status = 'Cancel' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthOutletZone                              check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthOutletZone                       check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthOutletZone                             check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Outlet zone information with system
oid                                      : Surrogate primary key
outletZoneId                             : An outlet zone associated with system to be identified by outletZoneId
name                                     : Name of outlet zone
description                              : Description of outlet zone
outletAreaOid                            : An outlet area associated with system to be identified by outletZoneId
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
create table                             OutletZone
(
oid                                      varchar(128)                                                not null,
outletZoneId                             varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
description                              text,
outletAreaOid                            varchar(128)                                                not null,
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
constraint                               pk_OutletZone                                               primary key    (oid),
constraint                               fk_outletAreaOid_OutletZone                                 foreign key    (outletAreaOid)
                                                                                                     references     OutletArea(oid),
constraint                               ck_status_OutletZone                                        check          (status = 'Active' or status = 'Inactive' or status = 'Cancel' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_OutletZone                             check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_OutletZone                                   check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Outlet zone History information with system
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
outletZoneId                             : An outlet zone associated with system to be identified by outletZoneId
name                                     : Name of outlet zone
description                              : Description of outlet zone
outletAreaOid                            : An outlet area associated with system to be identified by outletZoneId
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
create table                             OutletZoneHistory
(
oid                                      varchar(128)                                                not null,
outletZoneId                             varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
description                              text,
outletAreaOid                            varchar(128)                                                not null,
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


