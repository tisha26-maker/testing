/*
This table is used to store person information
oid                                      : Surrogate primary key
businessType                             : Type of business
fullName                                 : Business full name
shortName                                : Business short name
dateOfIncorporation                      : Date of incorporation of business
legalIdType                              : Business legal id type like trade license
legalIdNo                                : Business legal id no like trade license number
legalIdIssuanceDate                      : Business legal id issue date like trade license issue date
legalIdExpirationDate                    : Business legal Id expiration date like trade license expiration date
otherLegalIdJson                         : Other Legal Id Json
businessAddressLine                      : Address of office
mobileNo                                 : Office mobile number
officePhoneNo                            : Office phone number
email                                    : Business email id
traceId                                  : Unique id to trace request
draftSavedBy                             : Who (which login) save the record
draftSavedOn                             : When save the record
businessphotopath                        : When save the record
legalidpathback                          : When save the record
legalidpathfront                         : When save the record
*/
create table                             DraftBusiness
(
oid                                      varchar(128)                                                not null,
businessType                             varchar(32),
fullName                                 varchar(256),
shortName                                varchar(256),
dateOfIncorporation                      date,
legalIdType                              varchar(128),
legalIdNo                                varchar(64),
legalIdIssuanceDate                      date,
legalIdExpirationDate                    date,
otherLegalIdJson                         text,
businessAddressLine                      text,
mobileNo                                 varchar(64),
officePhoneNo                            varchar(64),
email                                    varchar(256),
traceId                                  varchar(128),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
businessphotopath                        varchar(1024),
legalidpathback                          varchar(1024),
legalidpathfront                         varchar(1024),
constraint                               pk_DraftBusiness                                            primary key    (oid)
);

/*
This table is used to store person information
oid                                      : Surrogate primary key
businessId                               : Generated unique id
businessType                             : Type of business
fullName                                 : Business full name
shortName                                : Business short name
dateOfIncorporation                      : Incorporation date of business
legalIdType                              : Business legal id type like trade license
legalIdNo                                : Business legal id no like trade license number
legalIdIssuanceDate                      : Business legal id issue date like trade license issue date
legalIdExpirationDate                    : Business legal id expiration date like trade license expiration date
otherLegalIdJson                         : Other legal id json
businessAddressLine                      : Address of office
mobileNo                                 : Office mobile number
officePhoneNo                            : Office phone number
email                                    : Business email id
traceId                                  : Unique id to trace request
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
cbsCurrentVersion                        : Cbs current version of record
status                                   : Status of record
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When locked the record
editedBy                                 : Who (which login) edited the record
editedOn                                 : When edited the record
approvedBy                               : Who (which login) approved the record
approvedOn                               : When approved the record
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When remarked the record
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
applicationDate                          : Application date
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
dataUpdatedBy                            : Who (which login) dataUpdated the record
dataUpdatedOn                            : When the record was dataUpdated
dataUpdateApprovedBy                     : Who (which login) dataUpdateApproved the record
dataUpdateApprovedOn                     : When the record was dataUpdateApproved
bankApprovedBy                           : Who (which login) bankapproved the record
bankApprovedOn                           : When the record was bankapproved
bankApprovalAuthorizedBy                 : Who (which login) bankApprovalAuthorized the record
bankApprovalAuthorizedOn                 : When the record was bankApprovalAuthorized
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
applicationRejectedBy                    : Who (which login) applicationRejected the record
applicationRejectedOn                    : When the record was applicationRejected
applicationRejectionReason               : Rejection remark
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing remark
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion remark
businessphotopath                        : Deletion remark
legalidpathback                          : When save the record
legalidpathfront                         : When save the record
*/
create table                             UnauthBusiness
(
oid                                      varchar(128)                                                not null,
businessId                               varchar(128)                                                not null,
businessType                             varchar(32)                                                 not null,
fullName                                 varchar(256)                                                not null,
shortName                                varchar(256)                                                not null,
dateOfIncorporation                      date                                                        not null,
legalIdType                              varchar(128)                                                not null,
legalIdNo                                varchar(64)                                                 not null,
legalIdIssuanceDate                      date                                                        not null,
legalIdExpirationDate                    date,
otherLegalIdJson                         text,
businessAddressLine                      text,
mobileNo                                 varchar(64),
officePhoneNo                            varchar(64),
email                                    varchar(256),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
cbsCurrentVersion                        varchar(32),
status                                   varchar(32)                                                 not null,
editCommit                               varchar(32),
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
editedBy                                 varchar(128)                                                not null,
editedOn                                 timestamp                                                   not null,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32)                                                 not null,
applicationDate                          date                                                        not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
dataUpdateApprovedBy                     varchar(128),
dataUpdateApprovedOn                     timestamp,
bankApprovedBy                           varchar(128),
bankApprovedOn                           timestamp,
bankApprovalAuthorizedBy                 varchar(128),
bankApprovalAuthorizedOn                 timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
applicationRejectedBy                    varchar(128),
applicationRejectedOn                    timestamp,
applicationRejectionReason               text,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
businessphotopath                        varchar(1024),
legalidpathback                          varchar(1024),
legalidpathfront                         varchar(1024),
constraint                               pk_UnauthBusiness                                           primary key    (oid),
constraint                               u_businessId_UnauthBusiness                                 unique         (businessId),
constraint                               ck_status_UnauthBusiness                                    check          (status = 'Active' or status = 'Inactive' or status = 'Delete' or status = 'Close'),
constraint                               ck_editCommit_UnauthBusiness                                check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthBusiness                         check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthBusiness                               check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to store business information
oid                                      : Surrogate primary key
businessId                               : Generated unique id
businessType                             : Type of business
fullName                                 : Business full name
shortName                                : Business short name
dateOfIncorporation                      : Starting date of business
legalIdType                              : Business legal id type like trade license
legalIdNo                                : Business legal id no like trade license number
legalIdIssuanceDate                      : Business legal id issue date like trade license issue date
legalIdExpirationDate                    : Business legal id expiration date like trade license expiration date
otherLegalIdJson                         : Business otherLegalIdJson
businessAddressLine                      : Address of office
mobileNo                                 : Office mobile number
officePhoneNo                            : Office phone number
email                                    : Business email id
traceId                                  : Unique id to trace request
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
cbsCurrentVersion                        : Cbs current version of record
status                                   : Status of record
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
applicationDate                          : Application date
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
dataUpdatedBy                            : Who (which login) updated the record
dataUpdatedOn                            : When the record was updated
dataUpdateApprovedBy                     : Who (which login) approved the updated record
dataUpdateApprovedOn                     : When the updated record was approved
bankApprovedBy                           : Who (which login) approved the bank record
bankApprovedOn                           : When the bank record was approved
bankApprovalAuthorizedBy                 : Who (which login) authorized the bank approved record
bankApprovalAuthorizedOn                 : When the bank approved record was authorized
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
applicationRejectedBy                    : Who (which login) rejected the application
applicationRejectedOn                    : When the application was rejected
applicationRejectionReason               : Rejection remark
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing remark
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion remark
*/
create table                             Business
(
oid                                      varchar(128)                                                not null,
businessId                               varchar(128)                                                not null,
businessType                             varchar(32)                                                 not null,
fullName                                 varchar(256)                                                not null,
shortName                                varchar(256)                                                not null,
dateOfIncorporation                      date                                                        not null,
legalIdType                              varchar(32)                                                 not null,
legalIdNo                                varchar(128)                                                not null,
legalIdIssuanceDate                      date                                                        not null,
legalIdExpirationDate                    date,
otherLegalIdJson                         text,
businessAddressLine                      text,
mobileNo                                 varchar(32)                                                 not null,
officePhoneNo                            varchar(32),
email                                    varchar(128),
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(32)                                                 not null,
cbsCurrentVersion                        varchar(32),
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128)                                                not null,
editedOn                                 timestamp                                                   not null,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32)                                                 not null,
applicationDate                          date                                                        not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
dataUpdateApprovedBy                     varchar(128),
dataUpdateApprovedOn                     timestamp,
bankApprovedBy                           varchar(128),
bankApprovedOn                           timestamp,
bankApprovalAuthorizedBy                 varchar(128),
bankApprovalAuthorizedOn                 timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
applicationRejectedBy                    varchar(128),
applicationRejectedOn                    timestamp,
applicationRejectionReason               text,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_Business                                                 primary key    (oid),
constraint                               u_businessId_Business                                       unique         (businessId),
constraint                               ck_status_Business                                          check          (status = 'Active' or status = 'Inactive' or status = 'Delete' or status = 'Close'),
constraint                               ck_isApproverRemarks_Business                               check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_Business                                     check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to store business history information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
businessId                               : Generated unique id
businessType                             : Type of business
fullName                                 : Business full name
shortName                                : Business short name
dateOfIncorporation                      : Starting date of business
legalIdType                              : Business legal id type like trade license
legalIdNo                                : Business legal id no like trade license number
legalIdIssuanceDate                      : Business legal id issue date like trade license issue date
legalIdExpirationDate                    : Business legal id expiration date like trade license expiration date
otherLegalIdJson                         : Business otherLegalIdJson
businessAddressLine                      : Address of office
mobileNo                                 : Office mobile number
officePhoneNo                            : Office phone number
email                                    : Business email id
traceId                                  : Unique id to trace request
version                                  : Current version of record
cbsCurrentVersion                        : Cbs current version of record
status                                   : Status of record
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
applicationDate                          : Application date
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
dataUpdatedBy                            : Who (which login) updated the record
dataUpdatedOn                            : When the record was updated
dataUpdateApprovedBy                     : Who (which login) approved the record
dataUpdateApprovedOn                     : When the record was approved
bankApprovedBy                           : Who (which login) approved the bank record
bankApprovedOn                           : When the bank record was approved
bankApprovalAuthorizedBy                 : Who (which login) authorized the bank approved record
bankApprovalAuthorizedOn                 : When the bank approved record was authorized 
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
applicationRejectedBy                    : Who (which login) rejected the application
applicationRejectedOn                    : When the application was rejected
applicationRejectionReason               : Rejection remark
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing remark
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion remark
*/
create table                             BusinessHistory
(
oid                                      varchar(128)                                                not null,
businessId                               varchar(128)                                                not null,
businessType                             varchar(32)                                                 not null,
fullName                                 varchar(256)                                                not null,
shortName                                varchar(256)                                                not null,
dateOfIncorporation                      date                                                        not null,
legalIdType                              varchar(32)                                                 not null,
legalIdNo                                varchar(128)                                                not null,
legalIdIssuanceDate                      date                                                        not null,
legalIdExpirationDate                    date,
otherLegalIdJson                         text,
businessAddressLine                      text,
mobileNo                                 varchar(32)                                                 not null,
officePhoneNo                            varchar(32),
email                                    varchar(128),
traceId                                  varchar(128)                                                not null,
version                                  varchar(32)                                                 not null,
cbsCurrentVersion                        varchar(32),
status                                   varchar(32)                                                 not null,
editedBy                                 varchar(128)                                                not null,
editedOn                                 timestamp                                                   not null,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
applicationDate                          date,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
dataUpdateApprovedBy                     varchar(128),
dataUpdateApprovedOn                     timestamp,
bankApprovedBy                           varchar(128),
bankApprovedOn                           timestamp,
bankApprovalAuthorizedBy                 varchar(128),
bankApprovalAuthorizedOn                 timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
applicationRejectedBy                    varchar(128),
applicationRejectedOn                    timestamp,
applicationRejectionReason               text,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_BusinessHistory                                          primary key    (oid),
constraint                               ck_status_BusinessHistory                                   check          (status = 'Active' or status = 'Inactive' or status = 'Delete' or status = 'Close'),
constraint                               ck_isNewRecord_BusinessHistory                              check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);


