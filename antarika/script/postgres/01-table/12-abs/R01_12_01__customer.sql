/*
This table is used to store customer's corporate information
oid                                      : Surrogate primary key
customerType                             : Type of customer
typedCustomerOid                         : Inputed customer id
applicant                                : Applicant information in json
introducerBankAccountNo                  : Bank account number of introducer
introducerCustomerId                     : Customer id of introducer
isIntroducerAgent                        : Is introducer agent
customerQrCode                           : Customer Qr card info
enrollmentType                           : Type of enrollment
additionalCustomerDetailJson             : Additional customer detail json
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent table ServiceTerminal oid
bankOid                                  : Parent table Bankoid
branchOid                                : Parent table Branch oid
agentStaffOid                            : Parent table Teller oid
traceId                                  : Unique id to trace record
status                                   : Customer status
applicationDate                          : Application date
draftSavedBy                             : who (which login) drafted the record
draftSavedOn                             : when the record was drafted
*/
create table                             DraftCustomer
(
oid                                      varchar(128)                                                not null,
customerType                             varchar(32),
typedCustomerOid                         varchar(128),
applicant                                text,
introducerBankAccountNo                  varchar(64),
introducerCustomerId                     varchar(128),
isIntroducerAgent                        varchar(32),
customerQrCode                           varchar(64),
enrollmentType                           varchar(32),
additionalCustomerDetailJson             text,
agentOid                                 varchar(128),
servicePointOid                          varchar(128),
serviceTerminalOid                       varchar(128),
bankOid                                  varchar(128),
branchOid                                varchar(128),
agentStaffOid                            varchar(128),
traceId                                  varchar(128),
status                                   varchar(32),
applicationDate                          date,
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftCustomer                                            primary key    (oid),
constraint                               ck_isIntroducerAgent_DraftCustomer                          check          (isIntroducerAgent = 'Yes' or isIntroducerAgent = 'No'),
constraint                               ck_enrollmentType_DraftCustomer                             check          (enrollmentType = 'CSB' or enrollmentType = 'CBS'),
constraint                               ck_status_DraftCustomer                                     check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationRejected' or status = 'ApplicationReceived')
);

/*
This table is used to store customer's corporate information
oid                                      : Surrogate primary key
customerId                               : Generated customer id
customerType                             : Type of customer
typedCustomerOid                         : Inputed customer id
bankCustomerId                           : Customer id in cbs
mnemonic                                 : Short customer id
applicant                                : Applicant information in json
sector                                   : Cbs sector code
target                                   : Cbs field
cbsCustomerStatus                        : Customer status in cbs
nationality                              : Customer nationality
residence                                : Cbs field
language                                 : Cbs field
introducerBankAccountNo                  : Bank account number of introducer
introducerCustomerId                     : Customer id of introducer
isIntroducerAgent                        : Is introducer agent
enrollmentType                           : Type of enrollment
ecoPurposeCode                           : Cbs field
cbSectorCode                             : Cbs field
cbIndustryCode                           : Cbs field
customerQrCode                           : Customer Qr card info
cbsFailureReason                         : If failed in cbs to process request then put reason
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent table ServiceTerminal oid
bankOid                                  : Parent table Bankoid
branchOid                                : Parent table Branch oid
agentStaffOid                            : Parent table AgentStaff oid
traceId                                  : Unique id to trace record
currentVersion                           : Current version of record
cbsCurrentVersion                        : Curent cbs version of record
status                                   : Customer status
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. Its will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. Its will be Yes or No
applicationDate                          : Application date
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
bankCustomerIdCreateRef                  : Will store bank customer id create reference
bankCustomerIdCreateOn                   : Will store bank customer id creation time
bankCustomerIdUpdateRef                  : Will store bank customer id update reference
bankCustomerIdUpdateOn                   : Will store bank customer id updated time
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
applicationRejectionReason               : Will store rejection reason reason
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Will store closing reason
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Wiil store deletion reason
*/
create table                             UnauthCustomer
(
oid                                      varchar(128)                                                not null,
customerId                               varchar(128)                                                not null,
customerType                             varchar(32),
typedCustomerOid                         varchar(128)                                                not null,
bankCustomerId                           varchar(128),
mnemonic                                 varchar(128)                                                not null,
applicant                                text                                                        not null,
sector                                   varchar(32),
target                                   varchar(32),
cbsCustomerStatus                        varchar(32),
nationality                              varchar(128),
residence                                varchar(128),
language                                 varchar(128),
introducerBankAccountNo                  varchar(128)                                                not null,
introducerCustomerId                     varchar(128)                                                not null,
isIntroducerAgent                        varchar(32)                                                 not null,
enrollmentType                           varchar(32)                                                 not null,
ecoPurposeCode                           varchar(32),
cbSectorCode                             varchar(32),
cbIndustryCode                           varchar(32),
customerQrCode                           varchar(64),
cbsFailureReason                         text,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
serviceTerminalOid                       varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentStaffOid                            varchar(128),
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(32)                                                 not null,
cbsCurrentVersion                        varchar(32),
status                                   varchar(32)                                                 not null,
editCommit                               varchar(32),
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
editedBy                                 varchar(128),
editedOn                                 timestamp,
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
bankCustomerIdCreateRef                  varchar(256),
bankCustomerIdCreateOn                   timestamp,
bankCustomerIdUpdateRef                  varchar(256),
bankCustomerIdUpdateOn                   timestamp,
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
constraint                               pk_UnauthCustomer                                           primary key    (oid),
constraint                               u_customerId_UnauthCustomer                                 unique         (customerId),
constraint                               ck_isIntroducerAgent_UnauthCustomer                         check          (isIntroducerAgent = 'Yes' or isIntroducerAgent = 'No'),
constraint                               ck_enrollmentType_UnauthCustomer                            check          (enrollmentType = 'CSB' or enrollmentType = 'CBS'),
constraint                               fk_agentOid_UnauthCustomer                                  foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_servicePointOid_UnauthCustomer                           foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_serviceTerminalOid_UnauthCustomer                        foreign key    (serviceTerminalOid)
                                                                                                     references     ServiceTerminal(oid),
constraint                               fk_bankOid_UnauthCustomer                                   foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_UnauthCustomer                                 foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentStaffOid_UnauthCustomer                             foreign key    (agentStaffOid)
                                                                                                     references     AgentStaff(oid),
constraint                               ck_status_UnauthCustomer                                    check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationRejected'),
constraint                               ck_editCommit_UnauthCustomer                                check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthCustomer                         check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthCustomer                               check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Here customer detail to be stored
oid                                      : Surrogate primary key
customerId                               : Customer Unique id
bankCustomerId                           : Customer Bank Account No
mnemonic                                 : Customer short code
applicant                                : Asscociated customer(s) person oid(s)
typedCustomerOid                         : Business or person table oid
ecoPurposeCode                           : Associated customer eco purpose code
language                                 : Associated customer langulage code 
nationality                              : Associated customer nationality eg. BD
cbSectorCode                             : Associated customer cb  sector code
cbIndustryCode                           : Associated customer cb industry code
residence                                : Associated customer residence code
sector                                   : Associated customer sector code
target                                   : Associated customer target code
dataUpdateApprovedBy                     : Who (which login) last approved the record
dataUpdateApprovedOn                     : When the record was last approved
customerType                             : Type of customer e.g. Personal or Joint
enrollmentType                           : Customer enrollment type e.g. csb or cbs
introducerBankaccountNo                  : Customer account introducer bank account no
introducerCustomerId                     : Customer account introducer bank customer id
isIntroducerAgent                        : Introducer agent or not
cbsCustomerStatus                        : Customer status in CBS
customerQrCode                           : Customer Qr card info
cbsFailureReason                         : CBS request failure reason
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent tabel ServiceTermianl oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentStaffOid                            : Parent table AgentStaff oid
traceId                                  : Unique id for trace 
currentVersion                           : Current version of customer information
cbsCurrentVersion                        : Current version of customer information in CBS
status                                   : Associated status of customer
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
applicationDate                          : Customer account opening application submition date
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
bankCustomerIdCreateRef                  : Will store bank customer id create reference
bankCustomerIdCreateOn                   : Will store bank customer id creation time
bankCustomerIdUpdateRef                  : Will store bank customer id update reference
bankCustomerIdUpdateOn                   : Will store bank customer id updated time
dataUpdatedBy                            : Who (which login) dataUpdated the record
dataUpdatedOn                            : When the record was dataUpdated
bankApprovalAuthorizedBy                 : Who (which login) dataUpdateApproved the record
bankApprovalAuthorizedOn                 : When the record was dataUpdateApproved
bankApprovedBy                           : Who (which login) bankapproved the record
bankApprovedOn                           : When the record was bankapproved
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
applicationRejectedBy                    : Who (which login) applicationRejected the record
applicationRejectedOn                    : When the record was applicationRejected
applicationRejectionReason               : Customer rejection remark
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Customer closing remark
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Customer deletion remark
*/
create table                             Customer
(
oid                                      varchar(128)                                                not null,
customerId                               varchar(128)                                                not null,
bankCustomerId                           varchar(128),
mnemonic                                 varchar(128)                                                not null,
applicant                                text                                                        not null,
typedCustomerOid                         varchar(128)                                                not null,
ecoPurposeCode                           varchar(32),
language                                 varchar(32),
nationality                              varchar(32),
cbSectorCode                             varchar(32),
cbIndustryCode                           varchar(32),
residence                                varchar(32),
sector                                   varchar(32),
target                                   varchar(32),
dataUpdateApprovedBy                     varchar(128),
dataUpdateApprovedOn                     timestamp,
customerType                             varchar(32)                                                 not null,
enrollmentType                           varchar(32)                                                 not null,
introducerBankaccountNo                  varchar(128),
introducerCustomerId                     varchar(128),
isIntroducerAgent                        varchar(32)                                                 not null,
cbsCustomerStatus                        varchar(32),
customerQrCode                           varchar(64),
cbsFailureReason                         text,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
serviceTerminalOid                       varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentStaffOid                            varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32),
cbsCurrentVersion                        varchar(32),
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
applicationDate                          date,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
bankCustomerIdCreateRef                  varchar(128),
bankCustomerIdCreateOn                   timestamp,
bankCustomerIdUpdateRef                  varchar(128),
bankCustomerIdUpdateOn                   timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
bankApprovalAuthorizedBy                 varchar(128),
bankApprovalAuthorizedOn                 timestamp,
bankApprovedBy                           varchar(128),
bankApprovedOn                           timestamp,
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
constraint                               pk_Customer                                                 primary key    (oid),
constraint                               u_customerId_Customer                                       unique         (customerId),
constraint                               ck_enrollmentType_Customer                                  check          (enrollmentType = 'CSB' or enrollmentType = 'CBS'),
constraint                               ck_isIntroducerAgent_Customer                               check          (isIntroducerAgent = 'Yes' or isIntroducerAgent = 'No'),
constraint                               fk_agentOid_Customer                                        foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_servicePointOid_Customer                                 foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_serviceTerminalOid_Customer                              foreign key    (serviceTerminalOid)
                                                                                                     references     ServiceTerminal(oid),
constraint                               fk_bankOid_Customer                                         foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_Customer                                       foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentStaffOid_Customer                                   foreign key    (agentStaffOid)
                                                                                                     references     AgentStaff(oid),
constraint                               ck_status_Customer                                          check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationRejected' or status = 'ApplicationReceived'),
constraint                               ck_isApproverRemarks_Customer                               check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_Customer                                     check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Here customer history detail to be stored
oid                                      : Surrogate primary key
customerId                               : Customer Unique id
bankCustomerId                           : Customer Bank Account No
mnemonic                                 : Customer short code
applicant                                : Asscociated customer(s) person oid(s)
typedCustomerOid                         : Business or person table oid
ecoPurposeCode                           : Associated customer eco purpose code
language                                 : Associated customer langulage code 
nationality                              : Associated customer nationality eg. BD
cbSectorCode                             : Associated customer cb  sector code
cbIndustryCode                           : Associated customer cb industry code
residence                                : Associated customer residence code
sector                                   : Associated customer sector code
target                                   : Associated customer target code
dataUpdateApprovedBy                     : Who (which login) last approved the record
dataUpdateApprovedOn                     : When the record was last approved
customerType                             : Type of customer e.g. Personal or Joint
enrollmentType                           : Customer enrollment type e.g. csb or cbs
introducerBankaccountNo                  : Customer account introducer bank account no
introducerCustomerId                     : Customer account introducer bank customer id
isIntroducerAgent                        : Introducer agent or not
cbsCustomerStatus                        : Customer status in CBS
customerQrCode                           : Customer Qr card info
cbsFailureReason                         : CBS request failure reason
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent tabel ServiceTermianl oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentStaffOid                            : Parent table AgentStaff oid
traceId                                  : Unique id for trace 
version                                  : Current version of customer information
cbsCurrentVersion                        : Current version of customer information in CBS
status                                   : Associated status of customer
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
applicationDate                          : Customer account opening application submition date
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
bankCustomerIdCreateRef                  : Will store bank customer id create reference
bankCustomerIdCreateOn                   : Will store bank customer id creation time
bankCustomerIdUpdateRef                  : Will store bank customer id update reference
bankCustomerIdUpdateOn                   : Will store bank customer id updated time
dataUpdatedBy                            : Who (which login) dataUpdated the record
dataUpdatedOn                            : When the record was dataUpdated
bankApprovalAuthorizedBy                 : Who (which login) dataUpdateApproved the record
bankApprovalAuthorizedOn                 : When the record was dataUpdateApproved
bankApprovedBy                           : Who (which login) bankapproved the record
bankApprovedOn                           : When the record was bankapproved
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
applicationRejectedBy                    : Who (which login) applicationRejected the record
applicationRejectedOn                    : When the record was applicationRejected
applicationRejectionReason               : Customer rejection remark
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Customer closing remark
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Customer deletion remark
*/
create table                             CustomerHistory
(
oid                                      varchar(128)                                                not null,
customerId                               varchar(128)                                                not null,
bankCustomerId                           varchar(128)                                                not null,
mnemonic                                 varchar(128)                                                not null,
applicant                                text                                                        not null,
typedCustomerOid                         varchar(128)                                                not null,
ecoPurposeCode                           varchar(32),
language                                 varchar(32),
nationality                              varchar(32),
cbSectorCode                             varchar(32),
cbIndustryCode                           varchar(32),
residence                                varchar(32),
sector                                   varchar(32),
target                                   varchar(32),
dataUpdateApprovedBy                     varchar(128),
dataUpdateApprovedOn                     timestamp,
customerType                             varchar(32)                                                 not null,
enrollmentType                           varchar(32)                                                 not null,
introducerBankaccountNo                  varchar(128)                                                not null,
introducerCustomerId                     varchar(128),
isIntroducerAgent                        varchar(32)                                                 not null,
cbsCustomerStatus                        varchar(32),
customerQrCode                           varchar(64),
cbsFailureReason                         text,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
serviceTerminalOid                       varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentStaffOid                            varchar(128),
traceId                                  varchar(128),
version                                  varchar(32),
cbsCurrentVersion                        varchar(32),
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
applicationDate                          date,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
bankCustomerIdCreateRef                  varchar(128),
bankCustomerIdCreateOn                   timestamp,
bankCustomerIdUpdateRef                  varchar(128),
bankCustomerIdUpdateOn                   timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
bankApprovalAuthorizedBy                 varchar(128),
bankApprovalAuthorizedOn                 timestamp,
bankApprovedBy                           varchar(128),
bankApprovedOn                           timestamp,
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
constraint                               pk_CustomerHistory                                          primary key    (oid),
constraint                               ck_enrollmentType_CustomerHistory                           check          (enrollmentType = 'CSB' or enrollmentType = 'CBS'),
constraint                               ck_isIntroducerAgent_CustomerHistory                        check          (isIntroducerAgent = 'Yes' or isIntroducerAgent = 'No'),
constraint                               fk_agentOid_CustomerHistory                                 foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_servicePointOid_CustomerHistory                          foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_bankOid_CustomerHistory                                  foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_CustomerHistory                                foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentStaffOid_CustomerHistory                            foreign key    (agentStaffOid)
                                                                                                     references     AgentStaff(oid),
constraint                               ck_status_CustomerHistory                                   check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationRejected'),
constraint                               ck_isApproverRemarks_CustomerHistory                        check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_CustomerHistory                              check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Here customer and person relation to be stored
oid                                      : Surrogate primary key
customerOid                              : Parent table customer oid
personOid                                : Parent table person oid
*/
create table                             CustomerPerson
(
oid                                      varchar(128)                                                not null,
customerOid                              varchar(128)                                                not null,
personOid                                varchar(128)                                                not null,
constraint                               pk_CustomerPerson                                           primary key    (oid),
constraint                               fk_customerOid_CustomerPerson                               foreign key    (customerOid)
                                                                                                     references     Customer(oid),
constraint                               fk_personOid_CustomerPerson                                 foreign key    (personOid)
                                                                                                     references     Person(oid)
);


