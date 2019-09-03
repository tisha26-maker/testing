/*
This table to be used to store user Login information.
oid                                      : Surrogate primary key
loginId                                  : Login Id
password                                 : Password
email                                    : Email id
mobileNo                                 : Mobile no
bankOid                                  : Bank Id
branchOid                                : Branch Id
resetRequired                            : Dose password need to reset
roleJson                                 : Which menu are permitted to access
blockTime                                : User block upto when
blockStatus                              : User block status
userName                                 : Name of user
userPhotoPath                            : In which location user photo saved
blockedBy                                : Who blocked
blockerRole                              : By which role blocked this user
blockedOn                                : When blocked
fingerPrintRequiredForLogin              : 
loginPeriodStartTime                     : 
loginPeriodEndTime                       : 
loginDisableStartDate                    : 
loginDisableEndDate                      : 
tempLoginDisableStartDate                : 
tempLoginDisableEndDate                  : 
lastLoginTime                            : 
lastLogoutTime                           : 
userType                                 : 
typeOid                                  : 
traceId                                  : 
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             UnauthLogin
(
oid                                      varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
password                                 varchar(128)                                                not null,
email                                    varchar(256),
mobileNo                                 varchar(64),
bankOid                                  varchar(128),
branchOid                                varchar(128),
resetRequired                            varchar(32)                                                 not null,
roleJson                                 text,
blockTime                                timestamp,
blockStatus                              varchar(32),
userName                                 varchar(256),
userPhotoPath                            varchar(1024),
blockedBy                                varchar(128),
blockerRole                              varchar(128),
blockedOn                                timestamp,
fingerPrintRequiredForLogin              varchar(16)                                                                default 'No',
loginPeriodStartTime                     varchar(32),
loginPeriodEndTime                       varchar(32),
loginDisableStartDate                    timestamp,
loginDisableEndDate                      timestamp,
tempLoginDisableStartDate                timestamp,
tempLoginDisableEndDate                  timestamp,
lastLoginTime                            timestamp,
lastLogoutTime                           timestamp,
userType                                 varchar(64),
typeOid                                  varchar(128),
traceId                                  varchar(128),
editCommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_UnauthLogin                                              primary key    (oid),
constraint                               ck_resetRequired_UnauthLogin                                check          (resetRequired = 'Yes' or resetRequired = 'No'),
constraint                               ck_editCommit_UnauthLogin                                   check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_status_UnauthLogin                                       check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_UnauthLogin                            check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthLogin                                  check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store user Login information.
oid                                      : Surrogate primary key
loginId                                  : Login Id
password                                 : Password
email                                    : Email id
mobileNo                                 : Mobile no
bankOid                                  : Bank Id
branchOid                                : Branch Id
resetRequired                            : Does password need to reset
roleJson                                 : Which menu are permitted to access
blockTime                                : User block upto when
blockStatus                              : User block status
userName                                 : Name of user
userPhotoPath                            : In which location user photo saved
blockedBy                                : Who blocked
blockerRole                              : By which role blocked this user
blockedOn                                : When blocked
fingerPrintRequiredForLogin              : 
loginPeriodStartTime                     : 
loginPeriodEndTime                       : 
loginDisableStartDate                    : 
loginDisableEndDate                      : 
tempLoginDisableStartDate                : 
tempLoginDisableEndDate                  : 
lastLoginTime                            : 
lastLogoutTime                           : 
userType                                 : 
typeOid                                  : 
traceId                                  : 
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             Login
(
oid                                      varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
password                                 varchar(128)                                                not null,
email                                    varchar(256),
mobileNo                                 varchar(64),
bankOid                                  varchar(128),
branchOid                                varchar(128),
resetRequired                            varchar(32)                                                 not null,
roleJson                                 text,
blockTime                                timestamp,
blockStatus                              varchar(32),
userName                                 varchar(256),
userPhotoPath                            varchar(1024),
blockedBy                                varchar(128),
blockerRole                              varchar(128),
blockedOn                                timestamp,
fingerPrintRequiredForLogin              varchar(16)                                                                default 'No',
loginPeriodStartTime                     varchar(32),
loginPeriodEndTime                       varchar(32),
loginDisableStartDate                    timestamp,
loginDisableEndDate                      timestamp,
tempLoginDisableStartDate                timestamp,
tempLoginDisableEndDate                  timestamp,
lastLoginTime                            timestamp,
lastLogoutTime                           timestamp,
userType                                 varchar(64),
typeOid                                  varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_Login                                                    primary key    (oid),
constraint                               ck_resetRequired_Login                                      check          (resetRequired = 'Yes' or resetRequired = 'No'),
constraint                               ck_resetRequired_Login                                      check          (resetRequired = 'Yes' or resetRequired = 'No'),
constraint                               ck_status_Login                                             check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_Login                                  check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_Login                                        check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store user Login information.
oid                                      : Surrogate primary key
loginId                                  : Login Id
password                                 : Password
email                                    : Email id
mobileNo                                 : Mobile no
bankOid                                  : Bank Id
branchOid                                : Branch Id
resetRequired                            : Dose password need to reset
roleJson                                 : Which menu are permitted to access
blockTime                                : User block upto when
blockStatus                              : User block status
userName                                 : Name of user
userPhotoPath                            : In which location user photo saved
blockedBy                                : Who blocked
blockerRole                              : By which role blocked this user
blockedOn                                : When blocked
fingerPrintRequiredForLogin              : 
loginPeriodStartTime                     : 
loginPeriodEndTime                       : 
loginDisableStartDate                    : 
loginDisableEndDate                      : 
tempLoginDisableStartDate                : 
tempLoginDisableEndDate                  : 
lastLoginTime                            : 
lastLogoutTime                           : 
userType                                 : 
typeOid                                  : 
traceId                                  : 
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of record
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
*/
create table                             LoginHistory
(
oid                                      varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
password                                 varchar(128)                                                not null,
email                                    varchar(256),
mobileNo                                 varchar(64),
bankOid                                  varchar(128),
branchOid                                varchar(128),
resetRequired                            varchar(32)                                                 not null,
roleJson                                 text,
blockTime                                timestamp,
blockStatus                              varchar(32),
userName                                 varchar(256),
userPhotoPath                            varchar(1024),
blockedBy                                varchar(128),
blockerRole                              varchar(128),
blockedOn                                timestamp,
fingerPrintRequiredForLogin              varchar(16)                                                                default 'No',
loginPeriodStartTime                     varchar(32),
loginPeriodEndTime                       varchar(32),
loginDisableStartDate                    timestamp,
loginDisableEndDate                      timestamp,
tempLoginDisableStartDate                timestamp,
tempLoginDisableEndDate                  timestamp,
lastLoginTime                            timestamp,
lastLogoutTime                           timestamp,
userType                                 varchar(64),
typeOid                                  varchar(128),
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_LoginHistory                                             primary key    (oid),
constraint                               ck_resetRequired_LoginHistory                               check          (resetRequired = 'Yes' or resetRequired = 'No'),
constraint                               ck_status_LoginHistory                                      check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_LoginHistory                           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_LoginHistory                                 check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is for storing password reset history
oid                                      : Surrogate primary key
loginId                                  : User Login Id
oldPassword                              : User old password
newPassword                              : User new password
makerId                                  : Who (which Login) made the record. This is the Id of the Login, not Oid
checkerId                                : Who (which Login) checked the record. This is the Id of the Login, not Oid
approverId                               : Who (which Login) approved the record. This is the Id of the Login, not Oid
approvedOn                               : When approved
resetStatus                              : Password reset status
createdBy                                : Who (which login) created the record
createdOn                                : When created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When updated
*/
create table                             PasswordResetLog
(
oid                                      varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
oldPassword                              varchar(128)                                                not null,
newPassword                              varchar(128)                                                not null,
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
approvedOn                               timestamp,
resetStatus                              varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               ck_resetStatus_PasswordResetLog                             check          (resetStatus = 'BankMade' or resetStatus = 'BankCreated' or resetStatus = 'BankApproved' or resetStatus = 'BankRejected' or resetStatus = 'Cancel' or resetStatus = 'Inactive' or resetStatus = 'Active' or resetStatus = 'Closed' or resetStatus = 'Deleted')
);

/*
This table is for storing user login history
oid                                      : Surrogate primary key
loginId                                  : User Login Id
roleId                                   : User role Id
signInTime                               : When user sign in
signOutTime                              : When user sign out
machineIp                                : From which machine login
loginStatus                              : Status for login OK, Logout, Failed, ALREADY_ID_BLOCK, BLOCK_ID
*/
create table                             LoginTrail
(
oid                                      varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
roleId                                   varchar(128),
signInTime                               timestamp,
signOutTime                              timestamp,
machineIp                                varchar(32),
loginStatus                              varchar(32),
constraint                               ck_loginStatus_LoginTrail                                   check          (loginStatus = 'OK' or loginStatus = 'Logout' or loginStatus = 'Failed' or loginStatus = 'ALREADY_ID_BLOCK' or loginStatus = 'BLOCK_ID' or loginStatus = 'UNBLOCK_IP' or loginStatus = 'BLOCK_IP' or loginStatus = 'ALREADY_IP_BLOCK')
);


