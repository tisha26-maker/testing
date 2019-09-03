/*
Password Policy is the table for storing all password validation rule and policy.
oid                                      : Surrogate primary key
passwordPolicyId                         : Key for the PasswordPolicy
passwordPolicyName                       : Name of the policy
status                                   : Status of PasswordPolicy Active, Inactive
effectiveFrom                            : From which date it will be effective
effectiveTo                              : Upto which date it will be continue
description                              : Description about password validation rule and policy
policyJson                               : This column contains validity and validation of password eg. {"validity":{"passwordWillRemainValidFor":30,"lastNoPasswordNotUsedAgain":4},"validation":{"leastCharacters":{"ruleNumber":"1","text":"Must have at least number of characters","value":"3","regex":"XXXXX","enable":"Y"},"mostCharacters":{"ruleNumber":"2","text":"Must have at most no. of characters","value":"5","regex":"XXXXX","enable":"Y"},"leastNumbers":{"ruleNumber":"3","text":"Must have at least no. of numbers","value":"2","regex":"XXXXX","enable":"Y"},"mostNumbers":{"ruleNumber":"4","text":"Must have at most no. of numbers","value":"4","regex":"XXXXX"},"leastSpecialCharacters":{"ruleNumber":"5","text":"Must have at least no. of special characters","value":"1","regex":"XXXXX","enable":"Y"},"mostSpecialCharaccters":{"ruleNumber":"6","text":"Must have at most on. of special characters","value":"2","regex":"XXXXX"},"leaseUpperCaseletters":{"ruleNumber":"7","text":"Must have at least no. of upper-case letters","value":"1","regex":"XXXXX","enable":"Y"},"mostUpperCaseletters":{"ruleNumber":"8","text":"Must have at most []upper-case letters","value":"2","regex":"XXXXX","enable":"N"},"leastLowerCaseLetter":{"ruleNumber":"9","text":"Must have at least no. of lower-case letters","value":"2","regex":"XXXXX","enable":"Y"},"mostLowerCaseLetter":{"ruleNumber":"10","text":"Must have at most no. of lower-case letters","value":"2","regex":"XXXXX","enable":"N"},"notContaintheseCharacters":{"ruleNumber":"11","text":"Must not contain any of these characters","value":"$&","regex":"XXXXX","enable":"N"}}}
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             PasswordPolicy
(
oid                                      varchar(128)                                                not null,
passwordPolicyId                         varchar(128)                                                not null,
passwordPolicyName                       varchar(256)                                                not null,
status                                   varchar(32)                                                 not null,
effectiveFrom                            date,
effectiveTo                              date,
description                              text,
policyJson                               text                                                        not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_PasswordPolicy                                           primary key    (oid),
constraint                               ck_status_PasswordPolicy                                    check          (status = 'Active' or status = 'Inactive')
);

/*
PasswordHistory is the table for storing all changes on password.
oid                                      : Surrogate primary key
passHistoryId                            : Key for the password history
loginId                                  : User login Id. Comes from login table.
oldPassword                              : Previous password
newPassword                              : Changed password (Current Passowrd) .
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             PasswordHistory
(
oid                                      varchar(128)                                                not null,
passHistoryId                            varchar(128)                                                not null,
loginId                                  varchar(128)                                                not null,
oldPassword                              varchar(128),
newPassword                              varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_PasswordHistory                                          primary key    (oid)
);


