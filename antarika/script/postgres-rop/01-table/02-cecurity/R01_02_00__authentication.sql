/*
This table to be used to store user Login information.
oid                                      : Surrogate primary key
loginId                                  : Login Id
password                                 : Password
email                                    : Email id
mobileNo                                 : Mobile no
bankOid                                  : Bank Id
branchOid                                : Branch Id
userName                                 : name of user
lastLoginTime                            : last login time for specific user
lastLoginoutTime                         : last logout time for specific user
roleJson                                 : user role json
blockStatus                              : user block status
blockTime                                : user block time
fingerprintRequiredForLogin              : is fingerprint required 
loginPeriodStartTime                     : Designation of user
loginPeriodEndTime                       : Name of supervisor. Supervisor of this user.
loginDisableStartDate                    : In which location user photo saved
loginDisableEndDate                      : Creator of this user. And that creator loginid will be inserted here.
tempLoginDisableStartDate                : By which role this user is created.
tempLoginDisableEndDate                  : Who approved this user.
resetRequired                            : By which role this approved
userType                                 : Timestamp when the record was approved
typeOid                                  : User (Login) who activated the record
userPhotoPath                            : user Photo path
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
traceId                                  : By which role this user activated
currentVersion                           : When activated
status                                   : Who deactivated
editedBy                                 : By which role this user deactivated
editedOn                                 : When deactivated
approvedBy                               : Who blocked
approvedOn                               : By which role blocked this user
remarkedBy                               : When blocked
remarkedOn                               : Who make this editable
isApproverRemarks                        : Which role make this editable
approverRemarks                          : Who rejected
isNewRecord                              : By which role this user rejected
createdby                                : When rejected
createdon                                : Who closed
activatedby                              : By which role this user closed
activatedon                              : -
applicationrejectedby                    : -
applicationrejectedon                    : -
applicationrejectionreason               : -
closedby                                 : When closed
closedon                                 : Who created
closingremark                            : closing remark
deletedby                                : Who deleted
deletedon                                : When deleted
deletionremark                           : deletion reason
*/
create table                             UnauthLogin
(
oid                                      varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
password                                 varchar(512)                                                not null,
email                                    varchar(256),
mobileNo                                 varchar(64),
bankOid                                  varchar(128),
branchOid                                varchar(128),
userName                                 varchar(128)                                                not null,
lastLoginTime                            timestamp,
lastLoginoutTime                         timestamp,
roleJson                                 text,
blockStatus                              varchar(128),
blockTime                                timestamp,
fingerprintRequiredForLogin              varchar(16)                                                                default 'No',
loginPeriodStartTime                     varchar(32),
loginPeriodEndTime                       varchar(32),
loginDisableStartDate                    date,
loginDisableEndDate                      date,
tempLoginDisableStartDate                date,
tempLoginDisableEndDate                  date,
resetRequired                            varchar(16),
userType                                 varchar(64),
typeOid                                  varchar(128),
userPhotoPath                            varchar(512),
editcommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
traceId                                  varchar(128),
currentVersion                           varchar(2),
status                                   varchar(128),
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(16),
approverRemarks                          text,
isNewRecord                              varchar(16),
createdby                                varchar,
createdon                                timestamp,
activatedby                              varchar(128),
activatedon                              timestamp,
applicationrejectedby                    varchar(128),
applicationrejectedon                    timestamp,
applicationrejectionreason               text,
closedby                                 varchar(128),
closedon                                 timestamp,
closingremark                            text,
deletedby                                varchar(128),
deletedon                                timestamp,
deletionremark                           text,
constraint                               pk_UnauthLogin                                              primary key    (oid),
constraint                               ck_fingerprintRequiredForLogin_UnauthLogin                  check          (fingerprintRequiredForLogin = 'Yes' or fingerprintRequiredForLogin = 'No'),
constraint                               ck_resetRequired_UnauthLogin                                check          (resetRequired = 'Yes' or resetRequired = 'No'),
constraint                               ck_editcommit_UnauthLogin                                   check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_status_UnauthLogin                                       check          (status = 'Active' or status = 'Inactive' or status = 'BankMade' or status = 'Canceled' or status = 'BankApproved'),
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
userName                                 : name of user
lastLoginTime                            : last login time for specific user
lastLoginoutTime                         : last logout time for specific user
roleJson                                 : user role json
blockStatus                              : user block status
blockTime                                : user block time
fingerprintRequiredForLogin              : is fingerprint required 
loginPeriodStartTime                     : Designation of user
loginPeriodEndTime                       : Name of supervisor. Supervisor of this user.
loginDisableStartDate                    : In which location user photo saved
loginDisableEndDate                      : Creator of this user. And that creator loginid will be inserted here.
tempLoginDisableStartDate                : By which role this user is created.
tempLoginDisableEndDate                  : Who approved this user.
resetRequired                            : By which role this approved
userType                                 : Timestamp when the record was approved
typeOid                                  : User (Login) who activated the record
userPhotoPath                            : user Photo path
traceId                                  : By which role this user activated
currentVersion                           : When activated
status                                   : Who deactivated
editedBy                                 : By which role this user deactivated
editedOn                                 : When deactivated
approvedBy                               : Who blocked
approvedOn                               : By which role blocked this user
remarkedBy                               : When blocked
remarkedOn                               : Who make this editable
isApproverRemarks                        : Which role make this editable
approverRemarks                          : Who rejected
isNewRecord                              : By which role this user rejected
createdby                                : When rejected
createdon                                : Who closed
activatedby                              : By which role this user closed
activatedon                              : -
applicationrejectedby                    : -
applicationrejectedon                    : -
applicationrejectionreason               : -
closedby                                 : When closed
closedon                                 : Who created
closingremark                            : closing remark
deletedby                                : Who deleted
deletedon                                : When deleted
deletionremark                           : deletion reason
*/
create table                             Login
(
oid                                      varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
password                                 varchar(512)                                                not null,
email                                    varchar(256),
mobileNo                                 varchar(64),
bankOid                                  varchar(128),
branchOid                                varchar(128),
userName                                 varchar(128)                                                not null,
lastLoginTime                            timestamp,
lastLoginoutTime                         timestamp,
roleJson                                 text,
blockStatus                              varchar(128),
blockTime                                timestamp,
fingerprintRequiredForLogin              varchar(16)                                                                default 'No',
loginPeriodStartTime                     varchar(32),
loginPeriodEndTime                       varchar(32),
loginDisableStartDate                    date,
loginDisableEndDate                      date,
tempLoginDisableStartDate                date,
tempLoginDisableEndDate                  date,
resetRequired                            varchar(16),
userType                                 varchar(64),
typeOid                                  varchar(128),
userPhotoPath                            varchar(512),
traceId                                  varchar(128),
currentVersion                           varchar(2),
status                                   varchar(128),
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(16),
approverRemarks                          text,
isNewRecord                              varchar(16),
createdby                                varchar,
createdon                                timestamp,
activatedby                              varchar(128),
activatedon                              timestamp,
applicationrejectedby                    varchar(128),
applicationrejectedon                    timestamp,
applicationrejectionreason               text,
closedby                                 varchar(128),
closedon                                 timestamp,
closingremark                            text,
deletedby                                varchar(128),
deletedon                                timestamp,
deletionremark                           text,
constraint                               pk_Login                                                    primary key    (oid),
constraint                               ck_fingerprintRequiredForLogin_Login                        check          (fingerprintRequiredForLogin = 'Yes' or fingerprintRequiredForLogin = 'No'),
constraint                               ck_resetRequired_Login                                      check          (resetRequired = 'Yes' or resetRequired = 'No'),
constraint                               ck_status_Login                                             check          (status = 'Active' or status = 'Inactive' or status = 'BankMade' or status = 'Canceled' or status = 'BankApproved'),
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
userName                                 : name of user
lastLoginTime                            : last login time for specific user
lastLoginoutTime                         : last logout time for specific user
roleJson                                 : user role json
blockStatus                              : user block status
blockTime                                : user block time
fingerprintRequiredForLogin              : is fingerprint required 
loginPeriodStartTime                     : Designation of user
loginPeriodEndTime                       : Name of supervisor. Supervisor of this user.
loginDisableStartDate                    : In which location user photo saved
loginDisableEndDate                      : Creator of this user. And that creator loginid will be inserted here.
tempLoginDisableStartDate                : By which role this user is created.
tempLoginDisableEndDate                  : Who approved this user.
resetRequired                            : By which role this approved
userType                                 : Timestamp when the record was approved
typeOid                                  : User (Login) who activated the record
userPhotoPath                            : user photopasth
traceId                                  : By which role this user activated
version                                  : When activated
status                                   : Who deactivated
editedBy                                 : By which role this user deactivated
editedOn                                 : When deactivated
approvedBy                               : Who blocked
approvedOn                               : By which role blocked this user
remarkedBy                               : When blocked
remarkedOn                               : Who make this editable
isApproverRemarks                        : Which role make this editable
approverRemarks                          : Who rejected
isNewRecord                              : By which role this user rejected
createdby                                : When rejected
createdon                                : Who closed
activatedby                              : By which role this user closed
activatedon                              : -
applicationrejectedby                    : -
applicationrejectedon                    : -
applicationrejectionreason               : -
closedby                                 : When closed
closedon                                 : Who created
closingremark                            : closing remark
deletedby                                : Who deleted
deletedon                                : When deleted
deletionremark                           : deletion reason
*/
create table                             LoginHistory
(
oid                                      varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
password                                 varchar(512)                                                not null,
email                                    varchar(256),
mobileNo                                 varchar(64),
bankOid                                  varchar(128),
branchOid                                varchar(128),
userName                                 varchar(128)                                                not null,
lastLoginTime                            timestamp,
lastLoginoutTime                         timestamp,
roleJson                                 text,
blockStatus                              varchar(128),
blockTime                                timestamp,
fingerprintRequiredForLogin              varchar(16)                                                                default 'No',
loginPeriodStartTime                     varchar(32),
loginPeriodEndTime                       varchar(32),
loginDisableStartDate                    date,
loginDisableEndDate                      date,
tempLoginDisableStartDate                date,
tempLoginDisableEndDate                  date,
resetRequired                            varchar(16),
userType                                 varchar(64),
typeOid                                  varchar(128),
userPhotoPath                            varchar(512),
traceId                                  varchar(128),
version                                  varchar(2),
status                                   varchar(128),
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(16),
approverRemarks                          text,
isNewRecord                              varchar(16),
createdby                                varchar,
createdon                                timestamp,
activatedby                              varchar(128),
activatedon                              timestamp,
applicationrejectedby                    varchar(128),
applicationrejectedon                    timestamp,
applicationrejectionreason               text,
closedby                                 varchar(128),
closedon                                 timestamp,
closingremark                            text,
deletedby                                varchar(128),
deletedon                                timestamp,
deletionremark                           text,
constraint                               pk_LoginHistory                                             primary key    (oid),
constraint                               ck_fingerprintRequiredForLogin_LoginHistory                 check          (fingerprintRequiredForLogin = 'Yes' or fingerprintRequiredForLogin = 'No'),
constraint                               ck_resetRequired_LoginHistory                               check          (resetRequired = 'Yes' or resetRequired = 'No'),
constraint                               ck_status_LoginHistory                                      check          (status = 'Active' or status = 'Inactive' or status = 'BankMade' or status = 'Canceled' or status = 'BankApproved'),
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
) partition by range (createdOn);

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
) partition by range (signInTime);


