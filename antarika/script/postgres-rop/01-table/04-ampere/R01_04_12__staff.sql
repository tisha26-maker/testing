/*
Store bank staff information who login in agent banking system
oid                                      : Surrogate primary key
bankstaffid                              : Surrogate key
bankoid                                  : -
branchoid                                : -
personoid                                : -
fullname                                 : -
email                                    : -
mobileno                                 : -
usertype                                 : -
designation                              : -
supervisorname                           : -
locationtype                             : -
traceId                                  : -
currentVersion                           : -
status                                   : -
editedBy                                 : -
editedOn                                 : -
approvedBy                               : -
approvedOn                               : -
remarkedBy                               : -
remarkedOn                               : -
isApproverRemarks                        : -
approverRemarks                          : -
isNewRecord                              : -
createdby                                : -
createdon                                : -
activatedby                              : -
activatedon                              : -
applicationrejectedby                    : -
applicationrejectedon                    : -
applicationrejectionreason               : -
closedby                                 : -
closedon                                 : -
closingremark                            : -
deletedby                                : -
deletedon                                : -
deletionremark                           : -
*/
create table                             BankStaff
(
oid                                      varchar(128)                                                not null,
bankstaffid                              varchar(128)                                                not null,
bankoid                                  varchar(128)                                                not null,
branchoid                                varchar(128),
personoid                                varchar(128),
fullname                                 varchar(128)                                                not null,
email                                    varchar(128),
mobileno                                 varchar(128),
usertype                                 varchar(64)                                                 not null,
designation                              varchar(128),
supervisorname                           varchar(128),
locationtype                             varchar(128),
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(2)                                                  not null,
status                                   varchar(128)                                                not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(16),
approverRemarks                          text,
isNewRecord                              varchar(16)                                                 not null,
createdby                                varchar                                                     not null,
createdon                                timestamp                                                   not null,
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
constraint                               pk_BankStaff                                                primary key    (oid),
constraint                               ck_isNewRecord_BankStaff                                    check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Store doer staff information who login in agent banking system
oid                                      : -
doerstaffid                              : -
bankoid                                  : -
branchoid                                : -
personoid                                : -
fullname                                 : -
email                                    : -
mobileno                                 : -
usertype                                 : -
designation                              : -
supervisorname                           : -
locationtype                             : -
traceId                                  : -
currentVersion                           : -
status                                   : -
editedBy                                 : -
editedOn                                 : -
approvedBy                               : -
approvedOn                               : -
remarkedBy                               : -
remarkedOn                               : -
isApproverRemarks                        : -
approverRemarks                          : -
isNewRecord                              : -
createdby                                : -
createdon                                : -
activatedby                              : -
activatedon                              : -
applicationrejectedby                    : -
applicationrejectedon                    : -
applicationrejectionreason               : -
closedby                                 : -
closedon                                 : -
closingremark                            : -
deletedby                                : -
deletedon                                : -
deletionremark                           : -
*/
create table                             DoerStaff
(
oid                                      varchar(128)                                                not null,
doerstaffid                              varchar(128)                                                not null,
bankoid                                  varchar(128)                                                not null,
branchoid                                varchar(128),
personoid                                varchar(128),
fullname                                 varchar(128)                                                not null,
email                                    varchar(128),
mobileno                                 varchar(128),
usertype                                 varchar(64)                                                 not null,
designation                              varchar(128),
supervisorname                           varchar(128),
locationtype                             varchar(128),
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(2)                                                  not null,
status                                   varchar(128)                                                not null,
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(16),
approverRemarks                          text,
isNewRecord                              varchar(16)                                                 not null,
createdby                                varchar                                                     not null,
createdon                                timestamp                                                   not null,
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
constraint                               pk_DoerStaff                                                primary key    (oid),
constraint                               ck_isNewRecord_DoerStaff                                    check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);


