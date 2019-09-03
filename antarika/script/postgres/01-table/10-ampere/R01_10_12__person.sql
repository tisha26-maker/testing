/*
Store doer staff information who login in agent banking system
oid                                      : Surrogate primary key
bankStaffId                              : Bank staff Id
bankOid                                  : Staff Bank oid from bank table
branchOid                                : Staff Branch oid from branch table
employeeId                               : employee Id number
personOid                                : Staff Person oid from person table
userType                                 : User Type e.g. BankStaff
joiningDate                              : Staff Joining Date
placeOfPosting                           : Where the bank staff pasting
designation                              : Staff Designation
supervisorName                           : Staff supervisor name
locationType                             : Location Type
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Bank staff
tagDictionaryOid                         : TagDictionary table relation
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
activatedBy                              : Who (which login) active the record
activatedOn                              : When the record was active
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             BankStaff
(
oid                                      varchar(128)                                                not null,
bankStaffId                              varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128),
employeeId                               varchar(128)                                                not null,
personOid                                varchar(128),
userType                                 varchar(64)                                                 not null,
joiningDate                              date,
placeOfPosting                           text,
designation                              varchar(128),
supervisorName                           varchar(128),
locationType                             varchar(128),
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(2)                                                  not null,
status                                   varchar(128)                                                not null,
tagDictionaryOid                         varchar(128),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_BankStaff                                                primary key    (oid),
constraint                               u_bankStaffId_BankStaff                                     unique         (bankStaffId),
constraint                               ck_isApproverRemarks_BankStaff                              check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_BankStaff                                    check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Store doer staff information who login in agent banking system
oid                                      : Surrogate primary key
bankStaffId                              : Bank staff Id
bankOid                                  : Staff Bank oid from bank table
branchOid                                : Staff Branch oid from branch table
personOid                                : Staff Person oid from person table
employeeId                               : employee Id number
userType                                 : User Type e.g. BankStaff
joiningDate                              : Staff Joining Date
placeOfPosting                           : Where the bank staff pasting
designation                              : Staff Designation
supervisorName                           : Staff supervisor name
locationType                             : Location Type
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Bank staff
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When locked the record
tagDictionaryOid                         : TagDictionary table relation
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
activatedBy                              : Who (which login) active the record
activatedOn                              : When the record was active
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthBankStaff
(
oid                                      varchar(128)                                                not null,
bankStaffId                              varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128),
personOid                                varchar(128),
employeeId                               varchar(128)                                                not null,
userType                                 varchar(64)                                                 not null,
joiningDate                              date,
placeOfPosting                           text                                                                       default '',
designation                              varchar(128),
supervisorName                           varchar(128),
locationType                             varchar(128),
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(2)                                                  not null,
status                                   varchar(128)                                                not null,
editCommit                               varchar(32),
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
tagDictionaryOid                         varchar(128),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthBankStaff                                          primary key    (oid),
constraint                               u_bankStaffId_UnauthBankStaff                               unique         (bankStaffId),
constraint                               u_bankStaffId_UnauthBankStaff                               unique         (bankStaffId),
constraint                               ck_editCommit_UnauthBankStaff                               check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthBankStaff                        check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthBankStaff                              check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Store doer staff information who login in agent banking system
oid                                      : Surrogate primary key
bankStaffId                              : Bank staff Id
bankOid                                  : Staff Bank oid from bank table
branchOid                                : Staff Branch oid from branch table
branchOid                                : employee Id number
personOid                                : Staff Person oid from person table
userType                                 : User Type e.g. BankStaff
joiningDate                              : Staff Joining Date
placeOfPosting                           : Where the bank staff pasting
designation                              : Staff Designation
supervisorName                           : Staff supervisor name
locationType                             : Location Type
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Bank staff
tagDictionaryOid                         : TagDictionaryoid from tagdictionary table
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
activatedBy                              : Who (which login) active the record
activatedOn                              : When the record was active
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             BankStaffHistory
(
oid                                      varchar(128)                                                not null,
bankStaffId                              varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128),
branchOid                                varchar(128)                                                not null,
personOid                                varchar(128),
userType                                 varchar(64)                                                 not null,
joiningDate                              date,
placeOfPosting                           text                                                                       default '',
designation                              varchar(128),
supervisorName                           varchar(128),
locationType                             varchar(128),
traceId                                  varchar(128)                                                not null,
version                                  varchar(2)                                                  not null,
status                                   varchar(128)                                                not null,
tagDictionaryOid                         varchar(128),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_BankStaffHistory                                         primary key    (oid),
constraint                               pk_BankStaffHistory                                         primary key    (oid),
constraint                               ck_isApproverRemarks_BankStaffHistory                       check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_BankStaffHistory                             check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Store doer staff information who login in agent banking system
oid                                      : Surrogate primary key
doerStaffId                              : Doer staff Id
bankOid                                  : Staff Bank oid from bank table
branchOid                                : Staff Branch oid from branch table
personOid                                : Staff Person oid from person table
userType                                 : User Type e.g. BankStaff
placeOfPosting                           : Staff Joining Date
joiningDate                              : Where the bank staff pasting
designation                              : Staff Designation
supervisorName                           : Staff supervisor name
locationType                             : Location Type
tagdictionaryoid                         : TagDictionaryoid from tagdictionary table
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Bank staff
createdby                                : Who (which login) created the record
createdon                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
activatedBy                              : When the record was approved
activatedOn                              : Who (which login) active the record
approvedOn                               : When the record was active
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
closedby                                 : Who (which login) closed the record
closedon                                 : When the record was closed
closingremark                            : Closing Remarks
deletedby                                : Who (which login) deleted the record
deletedon                                : When the record was deleted
deletionremark                           : Delition remarks
*/
create table                             DoerStaff
(
oid                                      varchar(128)                                                not null,
doerStaffId                              varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128),
personOid                                varchar(128),
userType                                 varchar(64)                                                 not null,
placeOfPosting                           text                                                                       default '',
joiningDate                              date,
designation                              varchar(128),
supervisorName                           varchar(128),
locationType                             varchar(128),
tagdictionaryoid                         varchar(128),
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(2)                                                  not null,
status                                   varchar(128)                                                not null,
createdby                                varchar                                                     not null       default 'System',
createdon                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
activatedBy                              timestamp,
activatedOn                              varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(16),
approverRemarks                          text,
isNewRecord                              varchar(16)                                                 not null,
closedby                                 varchar(128),
closedon                                 timestamp,
closingremark                            text,
deletedby                                varchar(128),
deletedon                                timestamp,
deletionremark                           text,
constraint                               pk_DoerStaff                                                primary key    (oid),
constraint                               u_doerStaffId_DoerStaff                                     unique         (doerStaffId),
constraint                               u_doerStaffId_DoerStaff                                     unique         (doerStaffId),
constraint                               ck_isNewRecord_DoerStaff                                    check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Store doer staff information who login in agent banking system
oid                                      : Surrogate primary key
doerstaffid                              : Doer staff Id
bankoid                                  : Staff Bank oid from bank table
branchoid                                : Staff Branch oid from branch table
personoid                                : Staff Person oid from person table
usertype                                 : User Type e.g. BankStaff
placeOfPosting                           : Staff Joining Date
joiningDate                              : Where the bank staff pasting
designation                              : Staff Designation
supervisorname                           : Staff supervisor name
locationtype                             : Location Type
tagdictionaryoid                         : TagDictionaryoid from tagdictionary table
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Bank staff
createdby                                : Who (which login) created the record
createdon                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
activatedBy                              : Who (which login) active the record
activatedOn                              : When the record was active
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
closedby                                 : Who (which login) closed the record
closedon                                 : When the record was closed
closingremark                            : Closing Remarks
deletedby                                : Who (which login) deleted the record
deletedon                                : When the record was deleted
deletionremark                           : Delition remarks
*/
create table                             DoerStaffHistory
(
oid                                      varchar(128)                                                not null,
doerstaffid                              varchar(128)                                                not null,
bankoid                                  varchar(128)                                                not null,
branchoid                                varchar(128),
personoid                                varchar(128),
usertype                                 varchar(64)                                                 not null,
placeOfPosting                           text                                                                       default '',
joiningDate                              date,
designation                              varchar(128),
supervisorname                           varchar(128),
locationtype                             varchar(128),
tagdictionaryoid                         varchar(128),
traceId                                  varchar(128)                                                not null,
version                                  varchar(2)                                                  not null,
status                                   varchar(128)                                                not null,
createdby                                varchar                                                     not null,
createdon                                timestamp                                                   not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(16),
approverRemarks                          text,
isNewRecord                              varchar(16)                                                 not null,
closedby                                 varchar(128),
closedon                                 timestamp,
closingremark                            text,
deletedby                                varchar(128),
deletedon                                timestamp,
deletionremark                           text,
constraint                               pk_DoerStaffHistory                                         primary key    (oid),
constraint                               pk_DoerStaffHistory                                         primary key    (oid),
constraint                               ck_isNewRecord_DoerStaffHistory                             check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Store doer staff information who login in agent banking system
oid                                      : Surrogate primary key
doerstaffid                              : Doer staff Id
bankoid                                  : Staff Bank oid from bank table
branchoid                                : Staff Branch oid from branch table
personoid                                : Staff Person oid from person table
usertype                                 : User Type e.g. BankStaff
placeOfPosting                           : Staff Joining Date
joiningDate                              : Where the bank staff pasting
designation                              : Staff Designation
supervisorname                           : Staff supervisor name
locationtype                             : Location Type
tagdictionaryoid                         : TagDictionaryoid from tagdictionary table
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Bank staff
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When locked the record
createdby                                : Who (which login) created the record
createdon                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
activatedBy                              : Who (which login) active the record
activatedOn                              : When the record was active
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
closedby                                 : Who (which login) closed the record
closedon                                 : When the record was closed
closingremark                            : Closing Remarks
deletedby                                : Who (which login) deleted the record
deletedon                                : When the record was deleted
deletionremark                           : Delition remarks
*/
create table                             UnauthDoerStaff
(
oid                                      varchar(128)                                                not null,
doerstaffid                              varchar(128)                                                not null,
bankoid                                  varchar(128)                                                not null,
branchoid                                varchar(128),
personoid                                varchar(128),
usertype                                 varchar(64)                                                 not null,
placeOfPosting                           text                                                                       default '',
joiningDate                              date,
designation                              varchar(128),
supervisorname                           varchar(128),
locationtype                             varchar(128),
tagdictionaryoid                         varchar(128),
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(2)                                                  not null,
status                                   varchar(128)                                                not null,
editCommit                               varchar(32),
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
createdby                                varchar                                                     not null,
createdon                                timestamp                                                   not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(16),
approverRemarks                          text,
isNewRecord                              varchar(16)                                                 not null,
closedby                                 varchar(128),
closedon                                 timestamp,
closingremark                            text,
deletedby                                varchar(128),
deletedon                                timestamp,
deletionremark                           text,
constraint                               pk_UnauthDoerStaff                                          primary key    (oid),
constraint                               u_doerstaffid_UnauthDoerStaff                               unique         (doerstaffid),
constraint                               u_doerstaffid_UnauthDoerStaff                               unique         (doerstaffid),
constraint                               ck_editCommit_UnauthDoerStaff                               check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isNewRecord_UnauthDoerStaff                              check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);


