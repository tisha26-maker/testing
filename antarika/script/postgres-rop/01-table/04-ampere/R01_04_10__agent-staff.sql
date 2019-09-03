/*
Associated Agent Service Staff draft information to be stored here
oid                                      : Surrogate primary key
agentStaffId                             : A AgentStaff associated with system to be identified by AgentStaff. Note: assId start from AGS1000001
servicePointOid                          : Agent owner place
tagDictionaryOid                         : Reference column of TagDictionary table
agentOid                                 : Associated Agent oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
loginId                                  : Agent Staff has own loginId
status                                   : BankMade, BankApproved, Active, Inactive,Close, Delete, Draft, BankRejected, InEditable
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftAgentStaff
(
oid                                      varchar(128)                                                not null,
agentStaffId                             varchar(128),
servicePointOid                          varchar(128),
tagDictionaryOid                         text,
agentOid                                 varchar(128),
bankOid                                  varchar(128),
branchOid                                varchar(128),
loginId                                  varchar(128),
status                                   varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftAgentStaff                                          primary key    (oid),
constraint                               ck_status_DraftAgentStaff                                   check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted')
);

/*
Associated Agent Service Staff's unauthorized information to be stored here
oid                                      : Surrogate primary key
agentStaffId                             : A AgentStaff associated with system to be identified by AgentStaff. Note: assId start from AGS1000001
servicePointOid                          : Agent owner place
tagDictionaryOid                         : Reference column of TagDictionary table
agentOid                                 : Parent table Agent oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
personOid                                : Personoid indicates an agent is associated respective person
loginId                                  : Agent Staff has own loginId
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
create table                             UnauthAgentStaff
(
oid                                      varchar(128)                                                not null,
agentStaffId                             varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
tagDictionaryOid                         text,
agentOid                                 varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
personOid                                varchar(128),
loginId                                  varchar(128),
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
constraint                               pk_UnauthAgentStaff                                         primary key    (oid),
constraint                               fk_servicePointOid_UnauthAgentStaff                         foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_agentOid_UnauthAgentStaff                                foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_bankOid_UnauthAgentStaff                                 foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_UnauthAgentStaff                               foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_personOid_UnauthAgentStaff                               foreign key    (personOid)
                                                                                                     references     UnauthPerson(oid),
constraint                               ck_status_UnauthAgentStaff                                  check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthAgentStaff                              check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthAgentStaff                       check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthAgentStaff                             check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Associated Agent Service Staff information to be stored here
oid                                      : Surrogate primary key
agentStaffId                             : A AgentStaff associated with system to be identified by AgentStaff. Note: assId start from AGS1000001
servicePointOid                          : Agent owner place
tagDictionaryOid                         : Reference column of TagDictionary table
agentOid                                 : Associated agent loginId
bankOid                                  : Parent table bank oid
branchOid                                : Parent table branch oid
personOid                                : Personoid indicates an agent is associated respective person
loginId                                  : Agent Staff has own loginId
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of agent staff
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
create table                             AgentStaff
(
oid                                      varchar(128)                                                not null,
agentStaffId                             varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
tagDictionaryOid                         text,
agentOid                                 varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
personOid                                varchar(128),
loginId                                  varchar(128),
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
constraint                               pk_AgentStaff                                               primary key    (oid),
constraint                               fk_servicePointOid_AgentStaff                               foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_bankOid_AgentStaff                                       foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_AgentStaff                                     foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_personOid_AgentStaff                                     foreign key    (personOid)
                                                                                                     references     Person(oid),
constraint                               ck_status_AgentStaff                                        check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_AgentStaff                             check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_AgentStaff                                   check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Associated Agent Service Staff history information to be stored here
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
agentStaffId                             : A AgentStaff associated with system to be identified by AgentStaff. Note: assId start from AGS1000001
servicePointOid                          : Agent owner place
tagDictionaryOid                         : Reference column of TagDictionary table
agentOid                                 : Associated agent loginId
bankOid                                  : Parent table bank oid
branchOid                                : Parent table branch oid
personOid                                : Personoid indicates an agent is associated respective person
loginId                                  : Agent Staff has own loginId
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
create table                             AgentStaffHistory
(
oid                                      varchar(128)                                                not null,
agentStaffId                             varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
tagDictionaryOid                         text,
agentOid                                 varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
personOid                                varchar(128),
loginId                                  varchar(128),
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
constraint                               pk_AgentStaffHistory                                        primary key    (oid)
);


