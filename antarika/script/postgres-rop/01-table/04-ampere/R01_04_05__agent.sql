/*
This table to be used to store associated Agent information with system. An Agent can perform its operation from multiple bank and with a single branch of respective bank
oid                                      : Surrogate primary key
agentId                                  : An agent associated with System to be Identified by agentId
bankOid                                  : Bankoid indicates an agent is associated with this bank
branchOid                                : Branchoid indicates an agent is associated respective bank branch
loginId                                  : Agent has own loginId.
parentAgentId                            : Indicates the agent is a SubAgent
agentType                                : Agent Type: Agent, Sub-Agent, Branch-Agent
bankAccountNo                            : Agent's A/C No
status                                   : Association status with system i. e. Active, Inactive, Draft, Delete, Made, Approved, Rejected, Closed
agentCategoryOid                         : Reference column of AgentCategory
tagDictionaryOid                         : Reference column of TagDictionary table
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftAgent
(
oid                                      varchar(128)                                                not null,
agentId                                  varchar(128),
bankOid                                  varchar(128),
branchOid                                varchar(128),
loginId                                  varchar(128),
parentAgentId                            varchar(128),
agentType                                varchar(32),
bankAccountNo                            varchar(64),
status                                   varchar(32),
agentCategoryOid                         varchar(128),
tagDictionaryOid                         text,
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftAgent                                               primary key    (oid),
constraint                               fk_bankOid_DraftAgent                                       foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_DraftAgent                                     foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               ck_agentType_DraftAgent                                     check          (agentType = 'Agent' or agentType = 'SubAgent' or agentType = 'BranchAgent'),
constraint                               ck_status_DraftAgent                                        check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted')
);

/*
This table to be used to store associated Agent information with system. An Agent can perform its operation from multiple bank and with a single branch of respective bank
oid                                      : Surrogate primary key
agentId                                  : An agent associated with System to be Identified by agentId
bankOid                                  : Bankoid indicates an agent is associated with this bank
branchOid                                : Branchoid indicates an agent is associated respective bank branch
personOid                                : Personoid indicates an agent is associated respective person
loginId                                  : Agent has own loginId.
parentAgentId                            : Indicates the agent is a SubAgent
agentType                                : Agent Type: Agent, Sub-Agent, Branch-Agent
agentCategoryOid                         : Reference column of AgentCategory
tagDictionaryOid                         : Reference column of TagDictionary table
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
create table                             UnauthAgent
(
oid                                      varchar(128)                                                not null,
agentId                                  varchar(128)                                                not null,
bankOid                                  varchar(128),
branchOid                                varchar(128),
personOid                                varchar(128),
loginId                                  varchar(128),
parentAgentId                            varchar(128),
agentType                                varchar(32),
agentCategoryOid                         varchar(128)                                                not null,
tagDictionaryOid                         text,
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
constraint                               pk_UnauthAgent                                              primary key    (oid),
constraint                               fk_bankOid_UnauthAgent                                      foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_UnauthAgent                                    foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_personOid_UnauthAgent                                    foreign key    (personOid)
                                                                                                     references     UnauthPerson(oid),
constraint                               ck_agentType_UnauthAgent                                    check          (agentType = 'Agent' or agentType = 'SubAgent' or agentType = 'BranchAgent'),
constraint                               ck_status_UnauthAgent                                       check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthAgent                                   check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthAgent                            check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthAgent                                  check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Agent information with system. An Agent can perform its operation from multiple bank and with a single branch of respective bank
oid                                      : Surrogate primary key
agentId                                  : An agent associated with System to be Identified by agentId
bankOid                                  : Bankoid indicates an agent is associated with this bank
branchOid                                : Branchoid indicates an agent is associated respective bank branch
personOid                                : Personoid indicates an agent is associated respective person
loginId                                  : Agent has own loginId.
parentAgentId                            : Indicates the agent is a SubAgent
agentType                                : Agent Type: Agent, SubAgent, BranchAgent
bankAccountNo                            : Agent's A/C No
agentCategoryOid                         : Reference column of AgentCategory
tagDictionaryOid                         : Reference column of TagDictionary table
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
create table                             Agent
(
oid                                      varchar(128)                                                not null,
agentId                                  varchar(128)                                                not null,
bankOid                                  varchar(128),
branchOid                                varchar(128),
personOid                                varchar(128),
loginId                                  varchar(128),
parentAgentId                            varchar(128),
agentType                                varchar(32)                                                 not null,
bankAccountNo                            text,
agentCategoryOid                         varchar(128)                                                not null,
tagDictionaryOid                         text,
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
constraint                               pk_Agent                                                    primary key    (oid),
constraint                               fk_bankOid_Agent                                            foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_Agent                                          foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_personOid_Agent                                          foreign key    (personOid)
                                                                                                     references     Person(oid),
constraint                               ck_agentType_Agent                                          check          (agentType = 'Agent' or agentType = 'SubAgent' or agentType = 'BranchAgent'),
constraint                               ck_status_Agent                                             check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_Agent                                  check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_Agent                                        check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Agent information with system. An Agent can perform its operation from multiple bank and with a single branch of respective bank
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
agentId                                  : An agent associated with System to be Identified by agentId
bankOid                                  : Bankoid indicates an agent is associated with this bank
branchOid                                : Branchoid indicates an agent is associated respective bank branch
personOid                                : Personoid indicates an agent is associated respective person
loginId                                  : Agent has own loginId.
parentAgentId                            : Indicates the agent is a SubAgent
agentType                                : Agent Type: Agent, Sub-Agent, Branch-Agent
bankAccountNo                            : Agent's A/C No
agentCategoryOid                         : Reference column of AgentCategory
tagDictionaryOid                         : Reference column of TagDictionary table
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
create table                             AgentHistory
(
oid                                      varchar(128)                                                not null,
agentId                                  varchar(128)                                                not null,
bankOid                                  varchar(128),
branchOid                                varchar(128),
personOid                                varchar(128),
loginId                                  varchar(128),
parentAgentId                            varchar(128),
agentType                                varchar(32),
bankAccountNo                            varchar(64),
agentCategoryOid                         varchar(128)                                                not null,
tagDictionaryOid                         text,
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
constraint                               pk_AgentHistory                                             primary key    (oid)
);

/*
This table to be used to store associated Agent Category information with system
oid                                      : Surrogate primary key
agentCategoryId                          : An agent category associated with system to be identified by agentCategoryId
name                                     : Name of agent category
description                              : Description of agent category
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last edited the record
updatedOn                                : When the record was last edited
*/
create table                             AgentCategory
(
oid                                      varchar(128)                                                not null,
agentCategoryId                          varchar(128)                                                not null,
name                                     varchar(256)                                                not null,
description                              text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_AgentCategory                                            primary key    (oid)
);

/*
This table to be used to store associated agent account draft information with system
oid                                      : Surrogate primary key
agentAccountId                           : An agent account associated with system to be identified by agentAccountId
bankAccountNo                            : Agent bank account number
accountType                              : Type of account
agentOid                                 : Foreign key from agent table
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftAgentAccount
(
oid                                      varchar(128)                                                not null,
agentAccountId                           varchar(128),
bankAccountNo                            varchar(64),
accountType                              varchar(32),
agentOid                                 varchar(128),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftAgentAccount                                        primary key    (oid),
constraint                               fk_agentOid_DraftAgentAccount                               foreign key    (agentOid)
                                                                                                     references     Agent(oid)
);

/*
This table to be used to store associated Agent Account information with system.
oid                                      : Surrogate primary key
agentAccountId                           : An agent account associated with system to be identified by agentAccountId
bankAccountNo                            : Agent bank account number
accountType                              : Type of account: Operational, Transactional
agentOid                                 : Foreign key from UnauthAgent table
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Agent account
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
create table                             UnauthAgentAccount
(
oid                                      varchar(128)                                                not null,
agentAccountId                           varchar(128)                                                not null,
bankAccountNo                            varchar(64)                                                 not null,
accountType                              varchar(32),
agentOid                                 varchar(128)                                                not null,
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
constraint                               pk_UnauthAgentAccount                                       primary key    (oid),
constraint                               ck_accountType_UnauthAgentAccount                           check          (accountType = 'Operational' or accountType = 'Transactional'),
constraint                               fk_agentOid_UnauthAgentAccount                              foreign key    (agentOid)
                                                                                                     references     UnauthAgent(oid),
constraint                               ck_status_UnauthAgentAccount                                check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_editcommit_UnauthAgentAccount                            check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthAgentAccount                     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthAgentAccount                           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Agent Account information with system.
oid                                      : Surrogate primary key
agentAccountId                           : An agent account associated with system to be identified by agentAccountId
bankAccountNo                            : Agent bank account number
accountType                              : Type of account: Operational, Transactional
agentOid                                 : Foreign key from agent table
traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Agent account
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
create table                             AgentAccount
(
oid                                      varchar(128)                                                not null,
agentAccountId                           varchar(128)                                                not null,
bankAccountNo                            varchar(64)                                                 not null,
accountType                              varchar(32),
agentOid                                 varchar(128)                                                not null,
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
constraint                               pk_AgentAccount                                             primary key    (oid),
constraint                               ck_accountType_AgentAccount                                 check          (accountType = 'Operational' or accountType = 'Transactional'),
constraint                               fk_agentOid_AgentAccount                                    foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               ck_status_AgentAccount                                      check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_AgentAccount                           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_AgentAccount                                 check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated Agent Account information with system.
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
agentAccountId                           : An agent account associated with system to be identified by agentAccountId
bankAccountNo                            : Agent bank account number
accountType                              : Type of account: Operational, Transactional
agentOid                                 : Foreign key from agent table
traceId                                  : Trace Id of this record
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
status                                   : Status of Agent account
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
create table                             AgentAccountHistory
(
oid                                      varchar(128)                                                not null,
agentAccountId                           varchar(128)                                                not null,
bankAccountNo                            varchar(64)                                                 not null,
accountType                              varchar(32),
agentOid                                 varchar(128)                                                not null,
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
constraint                               pk_AgentAccountHistory                                      primary key    (oid),
constraint                               ck_status_AgentAccountHistory                               check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted')
);


