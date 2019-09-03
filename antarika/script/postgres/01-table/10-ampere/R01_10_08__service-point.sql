/*
Associated ServicePoint draft information to be stored here
oid                                      : Surrogate primary key
servicePointId                           : A ServicePoint associated with system to be identified by servicePointId
servicePointName                         : Name of the service point
bankAccountNo                            : Agent bank account no
locationType                             : Location type: Urban or Rural
tagDictionaryOid                         : Reference column of TagDictionary table
longitude                                : Service point longitude
latitude                                 : Service point latitude
mobileNo                                 : Mobile number
additionalMobileNo                       : Additional mobile number
email                                    : Email address
photoPath                                : Service point photo location
documentPathJson                         : Store more document path related information
tin                                      : Service point associated agent tin
tradeLicenceNo                           : Service point associated agent tradeLicenceNo
status                                   : Association status with system i. e. Active, Inactive, Closed, Deleted
isFingerprintRequired                    : Fingerprint required or not for Service point to be stored here
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : Parent table Agent oid
outletZoneOid                            : Parent table OutletZone oid
outletTpOid                              : Parent table OutletTransactionProfile oid
address                                  : Service point location address
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftServicePoint
(
oid                                      varchar(128)                                                not null,
servicePointId                           varchar(128),
servicePointName                         varchar(256),
bankAccountNo                            varchar(64),
locationType                             varchar(32)                                                 not null,
tagDictionaryOid                         text,
longitude                                numeric(20,8),
latitude                                 numeric(20,8),
mobileNo                                 varchar(64),
additionalMobileNo                       varchar(64),
email                                    varchar(128),
photoPath                                varchar(1024),
documentPathJson                         text,
tin                                      varchar(256),
tradeLicenceNo                           varchar(256),
status                                   varchar(32),
isFingerprintRequired                    varchar(32)                                                                default 'No',
bankOid                                  varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
outletZoneOid                            varchar(128),
outletTpOid                              varchar(128),
address                                  varchar(256),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftServicePoint                                        primary key    (oid),
constraint                               ck_locationType_DraftServicePoint                           check          (locationType = 'Urban' or locationType = 'Rural'),
constraint                               ck_status_DraftServicePoint                                 check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isFingerprintRequired_DraftServicePoint                  check          (isFingerprintRequired = 'Yes' or isFingerprintRequired = 'No'),
constraint                               fk_bankOid_DraftServicePoint                                foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_DraftServicePoint                              foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentOid_DraftServicePoint                               foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_outletZoneOid_DraftServicePoint                          foreign key    (outletZoneOid)
                                                                                                     references     OutletZone(oid),
constraint                               fk_outletTpOid_DraftServicePoint                            foreign key    (outletTpOid)
                                                                                                     references     OutletTransactionProfile(oid)
);

/*
Associated Unauth ServicePoint information to be stored here
oid                                      : Surrogate primary key
servicePointId                           : A ServicePoint associated with system to be identified by servicePointId
servicePointName                         : Name of the service point
doerAgencyCode                           : Doer agency code, 8 digits
bankZonalOffice                          : Bank zonal office name of service point
bankAccountNo                            : Agent bank account no
locationType                             : Location type: Urban or Rural
tagDictionaryOid                         : Reference column of TagDictionary table
longitude                                : Service point longitude
latitude                                 : Service point latitude
mobileNo                                 : Mobile number
additionalMobileNo                       : Additional mobile number
email                                    : Email address
photoPath                                : Service point photo location
documentPathJson                         : Store more document path related information
tin                                      : Service point associated agent tin
tradeLicenceNo                           : Service point associated agent tradeLicenceNo
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : Parent table Agent oid
outletZoneOid                            : Parent table OutletZone oid
outletTpOid                              : Parent table OutletTransactionProfile oid
address                                  : Service point location address
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
isFingerprintRequired                    : Fingerprint required or not for Service point to be stored here
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
create table                             UnauthServicePoint
(
oid                                      varchar(128)                                                not null,
servicePointId                           varchar(128),
servicePointName                         varchar(256),
doerAgencyCode                           varchar(64),
bankZonalOffice                          varchar(256),
bankAccountNo                            varchar(64),
locationType                             varchar(32)                                                 not null,
tagDictionaryOid                         text,
longitude                                numeric(20,8),
latitude                                 numeric(20,8),
mobileNo                                 varchar(64),
additionalMobileNo                       varchar(64),
email                                    varchar(128),
photoPath                                varchar(1024),
documentPathJson                         text,
tin                                      varchar(256),
tradeLicenceNo                           varchar(256)                                                not null,
bankOid                                  varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
outletZoneOid                            varchar(128),
outletTpOid                              varchar(128),
address                                  text,
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
isFingerprintRequired                    varchar(32)                                                 not null       default 'No',
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
constraint                               pk_UnauthServicePoint                                       primary key    (oid),
constraint                               ck_locationType_UnauthServicePoint                          check          (locationType = 'Urban' or locationType = 'Rural'),
constraint                               fk_bankOid_UnauthServicePoint                               foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_UnauthServicePoint                             foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentOid_UnauthServicePoint                              foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_outletZoneOid_UnauthServicePoint                         foreign key    (outletZoneOid)
                                                                                                     references     OutletZone(oid),
constraint                               fk_outletTpOid_UnauthServicePoint                           foreign key    (outletTpOid)
                                                                                                     references     OutletTransactionProfile(oid),
constraint                               ck_status_UnauthServicePoint                                check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isFingerprintRequired_UnauthServicePoint                 check          (isFingerprintRequired = 'Yes' or isFingerprintRequired = 'No'),
constraint                               ck_editcommit_UnauthServicePoint                            check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthServicePoint                     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthServicePoint                           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Associated ServicePoint information to be stored here
oid                                      : Surrogate primary key
servicePointId                           : A ServicePoint associated with system to be identified by servicePointId
doerAgencyCode                           : Doer agency code, 8 digits
bankZonalOffice                          : Bank zonal office name of service point
servicePointName                         : Name of the service point
bankAccountNo                            : Agent bank account no
locationType                             : Location type: Urban or Rural
tagDictionaryOid                         : Reference column of TagDictionary table
longitude                                : Service point longitude
latitude                                 : Service point latitude
mobileNo                                 : Mobile number
additionalMobileNo                       : Additional mobile number
email                                    : Email address
photoPath                                : Service point photo location
documentPathJson                         : Store more document path related information
tin                                      : Service point associated agent tin
tradeLicenceNo                           : Service point associated agent tradeLicenceNo
isFingerprintRequired                    : Fingerprint required or not for Service point to be stored here
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : Parent table Agent oid
outletZoneOid                            : Parent table OutletZone oid
outletTpOid                              : Parent table OutletTransactionProfile oid
address                                  : Service point location address
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
create table                             ServicePoint
(
oid                                      varchar(128)                                                not null,
servicePointId                           varchar(128),
doerAgencyCode                           varchar(64),
bankZonalOffice                          varchar(256),
servicePointName                         varchar(256),
bankAccountNo                            varchar(64),
locationType                             varchar(32)                                                 not null,
tagDictionaryOid                         text,
longitude                                numeric(20,8),
latitude                                 numeric(20,8),
mobileNo                                 varchar(64),
additionalMobileNo                       varchar(64),
email                                    varchar(128),
photoPath                                varchar(1024),
documentPathJson                         text,
tin                                      varchar(256),
tradeLicenceNo                           varchar(256)                                                not null,
isFingerprintRequired                    varchar(32)                                                 not null       default 'No',
bankOid                                  varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
outletZoneOid                            varchar(128),
outletTpOid                              varchar(128),
address                                  text,
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
constraint                               pk_ServicePoint                                             primary key    (oid),
constraint                               ck_locationType_ServicePoint                                check          (locationType = 'Urban' or locationType = 'Rural'),
constraint                               ck_isFingerprintRequired_ServicePoint                       check          (isFingerprintRequired = 'Yes' or isFingerprintRequired = 'No'),
constraint                               fk_bankOid_ServicePoint                                     foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_ServicePoint                                   foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentOid_ServicePoint                                    foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_outletZoneOid_ServicePoint                               foreign key    (outletZoneOid)
                                                                                                     references     OutletZone(oid),
constraint                               fk_outletTpOid_ServicePoint                                 foreign key    (outletTpOid)
                                                                                                     references     OutletTransactionProfile(oid),
constraint                               ck_status_ServicePoint                                      check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_ServicePoint                           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_ServicePoint                                 check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Associated ServicePoint information to be stored here
oid                                      : Surrogate primary key
servicePointId                           : A ServicePoint associated with system to be identified by servicePointId
servicePointName                         : Name of the service point
doerAgencyCode                           : Doer agency code, 8 digits
bankZonalOffice                          : Bank zonal office name of service point
bankAccountNo                            : Agent bank account no
locationType                             : Location type: Urban or Rural
tagDictionaryOid                         : Reference column of TagDictionary table
longitude                                : Service point longitude
latitude                                 : Service point latitude
mobileNo                                 : Mobile number
additionalMobileNo                       : Additional mobile number
email                                    : Email address
photoPath                                : Service point photo location
documentPathJson                         : Store more document path related information
tin                                      : Service point associated agent tin
tradeLicenceNo                           : Service point associated agent tradeLicenceNo
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentOid                                 : Parent table Agent oid
outletZoneOid                            : Parent table OutletZone oid
outletTpOid                              : Parent table OutletTransactionProfile oid
address                                  : Service point location address
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of PBS Zone Outlet
isFingerprintRequired                    : Fingerprint required or not for Service point to be stored here
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
create table                             ServicePointHistory
(
oid                                      varchar(128)                                                not null,
servicePointId                           varchar(128),
servicePointName                         varchar(256),
doerAgencyCode                           varchar(64),
bankZonalOffice                          varchar(256),
bankAccountNo                            varchar(64),
locationType                             varchar(32)                                                 not null,
tagDictionaryOid                         text,
longitude                                numeric(20,8),
latitude                                 numeric(20,8),
mobileNo                                 varchar(64),
additionalMobileNo                       varchar(64),
email                                    varchar(128),
photoPath                                varchar(1024),
documentPathJson                         text,
tin                                      varchar(256),
tradeLicenceNo                           varchar(256),
bankOid                                  varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
outletZoneOid                            varchar(128),
outletTpOid                              varchar(128),
address                                  text,
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
isFingerprintRequired                    varchar(32)                                                                default 'No',
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
constraint                               pk_ServicePointHistory                                      primary key    (oid),
constraint                               ck_status_ServicePointHistory                               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isFingerprintRequired_ServicePointHistory                check          (isFingerprintRequired = 'Yes' or isFingerprintRequired = 'No')
);


