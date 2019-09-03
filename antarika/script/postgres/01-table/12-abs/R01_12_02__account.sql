/*
Here DraftAccount detail to be stored
oid                                      : Surrogate primary key
accountId                                : CSB account id
bankCustomerId                           : CSB customer id
bankAccountNo                            : CBS bank account number
mnemonic                                 : Account short name
accountTitle                             : Account title
mobileNo                                 : Mobile no
accountType                              : Account type
enrollmentType                           : Type of enrollment
productOid                               : Parent table Product oid
productName                              : Product name
productType                              : Type of product
currency                                 : Currency of the amount
initialDeposit                           : Initial deposit amount
initialDepositRef                        : Reference of initial deposit transaction
nomineeJson                              : Nominee information
jointHolderJson                          : Joint account holder information
minorDateOfBirth                         : Birth date of minor
minorRelationWithCustomer                : Relation between minor and customer
additionalAccountDetailJson              : Additional account details infromation
fdrStartDate                             : FDR (Fixed Deposit Receipt) start date
fdrMaturityDate                          : FDR (Fixed Deposit Receipt) maturity date
fdrReceiptNo                             : FDR (Fixed Deposit Receipt) receipt no
fdrPeriod                                : FDR (Fixed Deposit Receipt) preiod
fdrCreditLiquidationAccountNo            : FDR (Fixed Deposit Receipt) credit liquidation account no
fdrDebitLiquidationAccountNo             : FDR (Fixed Deposit Receipt) debit liquidation account no
fdrInterestLiquidationAccountNo          : FDR (Fixed Deposit Receipt) interest liquidation account no 
fdrTenureInMonths                        : FDR (Fixed Deposit Receipt) tenure in month
fdrRenewPrincipalFlag                    : FDR (Fixed Deposit Receipt) principal renew flag
fdrRenewPrincipalAndInterestFlag         : FDR (Fixed Deposit Receipt) principal and interest renew flag
rdOneTimeDeposit                         : DPS initial deposit
rdInstallmentAmount                      : DPS Installment amount
rdNumberOfInstallment                    : DPS no of installment
rdStartDate                              : DPS start date
rdMaturityDate                           : DPS maturity date
cbsAccountStatus                         : CBS account status
cbsFailureReason                         : CBS failure reason
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent ServicePoint oid
serviceTerminalOid                       : Parent ServiceTerminal oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentStaffOid                            : Parent table AgentStaff oid
traceId                                  : Request trace id
currentVersion                           : CSB current version no
cbsCurrentVersion                        : CBS current version no
status                                   : Status of account
applicationDate                          : Date of application
draftSavedBy                             : Who (which login) drafted the record
draftSavedOn                             : When the record was drafted
*/
create table                             DraftAccount
(
oid                                      varchar(128)                                                not null,
accountId                                varchar(128),
bankCustomerId                           varchar(128),
bankAccountNo                            varchar(64),
mnemonic                                 varchar(64),
accountTitle                             varchar(256),
mobileNo                                 varchar(32),
accountType                              varchar(32),
enrollmentType                           varchar(32),
productOid                               varchar(128),
productName                              varchar(256),
productType                              varchar(32),
currency                                 varchar(16),
initialDeposit                           numeric(20,6),
initialDepositRef                        varchar(128),
nomineeJson                              text,
jointHolderJson                          text,
minorDateOfBirth                         date,
minorRelationWithCustomer                varchar(32),
additionalAccountDetailJson              text,
fdrStartDate                             date,
fdrMaturityDate                          date,
fdrReceiptNo                             varchar(64),
fdrPeriod                                varchar(256),
fdrCreditLiquidationAccountNo            varchar(64),
fdrDebitLiquidationAccountNo             varchar(64),
fdrInterestLiquidationAccountNo          varchar(64),
fdrTenureInMonths                        numeric(4,0),
fdrRenewPrincipalFlag                    varchar(32),
fdrRenewPrincipalAndInterestFlag         varchar(32),
rdOneTimeDeposit                         numeric(20,6),
rdInstallmentAmount                      numeric(20,6),
rdNumberOfInstallment                    varchar(32),
rdStartDate                              date,
rdMaturityDate                           date,
cbsAccountStatus                         varchar(32),
cbsFailureReason                         text,
agentOid                                 varchar(128),
servicePointOid                          varchar(128),
serviceTerminalOid                       varchar(128),
bankOid                                  varchar(128),
branchOid                                varchar(128),
agentStaffOid                            varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32),
cbsCurrentVersion                        varchar(32),
status                                   varchar(32),
applicationDate                          date,
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftAccount                                             primary key    (oid),
constraint                               ck_status_DraftAccount                                      check          (status = 'Draft' or status = 'Closed' or status = 'Delete' or status = 'DataUpdated')
);

/*
Here Unauth Account detail to be stored
oid                                      : Surrogate primary key
accountId                                : CSB account id
bankCustomerId                           : CBS customer id
bankAccountNo                            : CBS bank account number
mnemonic                                 : Account short name
accountTitle                             : Account title
mobileNo                                 : Mobile no
accountType                              : Account type
enrollmentType                           : Type of enrollment
productOid                               : Parent table Product oid
productName                              : Product name
productType                              : Type of product
currency                                 : Currency for the account
initialDeposit                           : Initial deposit amount
initialDepositRef                        : Reference of initial deposit transaction.
nomineeJson                              : Nominee information
jointHolderJson                          : Joint account holder information
minorDateOfBirth                         : Birth date of minor
minorRelationWithCustomer                : Relation between minor and customer
additionalAccountDetailJson              : Additional account details infromation
fdrStartDate                             : FDR start date
fdrMaturityDate                          : FDR maturity date
fdrReceiptNo                             : FDR (Fixed Deposit Receipt) receipt no
fdrPeriod                                : FDR (Fixed Deposit Receipt) period
fdrCreditLiquidationAccountNo            : FDR (Fixed Deposit Receipt) credit liquidation account no
fdrDebitLiquidationAccountNo             : FDR (Fixed Deposit Receipt) debit liquidation account no
fdrInterestLiquidationAccountNo          : FDR (Fixed Deposit Receipt) interest liquidation account no 
fdrTenureInMonths                        : FDR (Fixed Deposit Receipt) tenure in month
fdrRenewPrincipalFlag                    : FDR (Fixed Deposit Receipt) principal renew flag
fdrRenewPrincipalAndInterestFlag         : FDR (Fixed Deposit Receipt) principal and interest renew flag
rdOneTimeDeposit                         : DPS initial deposit
rdInstallmentAmount                      : DPS Installment amount
rdNumberOfInstallment                    : DPS no of installment
rdStartDate                              : DPS start date
rdMaturityDate                           : DPS maturity date
fdrLinkAccountNo                         : FDR Link account number
cbsAccountStatus                         : CBS account status
cbsFailureReason                         : CBS failure reason
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent table ServiceTerminal oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentStaffOid                            : Parent table AgentStaff oid
traceId                                  : Request trace id
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
cbsCurrentVersion                        : CBS current version no
status                                   : Status of account
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
applicationDate                          : Date of application
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
bankAccountNoCreateRef                   : Reference of bank account creation
bankAccountNoCreatedOn                   : Time of when created account on cbs
bankAccountNoUpdateOn                    : Time of when update account on cbs
bankAccountNoUpdateRef                   : Reference of bank account no updated on cbs
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
applicationRejectionReason               : Will store the why application were rejected
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion remarks
fdrReceiptFlag                           : Fdr Receipt Flag
actualLoanAmount                         : Actual Loan Amount
*/
create table                             UnauthAccount
(
oid                                      varchar(128)                                                not null,
accountId                                varchar(128)                                                not null,
bankCustomerId                           varchar(128),
bankAccountNo                            varchar(64),
mnemonic                                 varchar(64)                                                 not null,
accountTitle                             varchar(256)                                                not null,
mobileNo                                 varchar(32)                                                 not null,
accountType                              varchar(32)                                                 not null,
enrollmentType                           varchar(32)                                                 not null,
productOid                               varchar(128),
productName                              varchar(256),
productType                              varchar(32),
currency                                 varchar(16),
initialDeposit                           numeric(20,6),
initialDepositRef                        varchar(128),
nomineeJson                              text,
jointHolderJson                          text,
minorDateOfBirth                         date,
minorRelationWithCustomer                varchar(32),
additionalAccountDetailJson              text,
fdrStartDate                             date,
fdrMaturityDate                          date,
fdrReceiptNo                             varchar(64),
fdrPeriod                                varchar(256),
fdrCreditLiquidationAccountNo            varchar(64),
fdrDebitLiquidationAccountNo             varchar(64),
fdrInterestLiquidationAccountNo          varchar(64),
fdrTenureInMonths                        numeric(4,0),
fdrRenewPrincipalFlag                    varchar(32),
fdrRenewPrincipalAndInterestFlag         varchar(32),
rdOneTimeDeposit                         numeric(20,6),
rdInstallmentAmount                      numeric(20,6),
rdNumberOfInstallment                    varchar(32),
rdStartDate                              date,
rdMaturityDate                           date,
fdrLinkAccountNo                         varchar(64),
cbsAccountStatus                         varchar(32),
cbsFailureReason                         text,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
serviceTerminalOid                       varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentStaffOid                            varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
cbsCurrentVersion                        varchar(32),
status                                   varchar(32)                                                 not null,
editCommit                               varchar(32)                                                 not null,
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
applicationDate                          date                                                        not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
bankAccountNoCreateRef                   varchar(256),
bankAccountNoCreatedOn                   timestamp,
bankAccountNoUpdateOn                    timestamp,
bankAccountNoUpdateRef                   varchar(256),
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
fdrReceiptFlag                           varchar(32),
actualLoanAmount                         numeric(20,6),
constraint                               pk_UnauthAccount                                            primary key    (oid),
constraint                               fk_productOid_UnauthAccount                                 foreign key    (productOid)
                                                                                                     references     Product(oid),
constraint                               ck_fdrRenewPrincipalFlag_UnauthAccount                      check          (fdrRenewPrincipalFlag = 'Yes' or fdrRenewPrincipalFlag = 'No'),
constraint                               ck_fdrRenewPrincipalAndInterestFlag_UnauthAccount           check          (fdrRenewPrincipalAndInterestFlag = 'Yes' or fdrRenewPrincipalAndInterestFlag = 'No'),
constraint                               ck_cbsAccountStatus_UnauthAccount                           check          (cbsAccountStatus = 'ApplicationSubmitted' or cbsAccountStatus = 'DataUpdated' or cbsAccountStatus = 'BankApproved' or cbsAccountStatus = 'Inactive' or cbsAccountStatus = 'Active' or cbsAccountStatus = 'Closed' or cbsAccountStatus = 'Deleted' or cbsAccountStatus = 'Hold' or cbsAccountStatus = 'ApplicationRejected'),
constraint                               fk_agentOid_UnauthAccount                                   foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_servicePointOid_UnauthAccount                            foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_serviceTerminalOid_UnauthAccount                         foreign key    (serviceTerminalOid)
                                                                                                     references     ServiceTerminal(oid),
constraint                               fk_bankOid_UnauthAccount                                    foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_UnauthAccount                                  foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentStaffOid_UnauthAccount                              foreign key    (agentStaffOid)
                                                                                                     references     AgentStaff(oid),
constraint                               ck_status_UnauthAccount                                     check          (status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationRejected' or status = 'ApplicationSubmitted'),
constraint                               ck_editCommit_UnauthAccount                                 check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthAccount                          check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthAccount                                check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Here Account detail to be stored of end client
oid                                      : Surrogate primary key
accountId                                : CSB account id
bankCustomerId                           : CBS customer id
bankAccountNo                            : CBS bank account number
mnemonic                                 : Account short name
accountTitle                             : Account title
mobileNo                                 : Mobile number of account holder
accountType                              : Type of account
enrollmentType                           : Type of enrollemnt
productOid                               : Parent table Product oid
productName                              : Product name
productType                              : Type of product
currency                                 : Amount currency
initialDeposit                           : Initial deposit amount
initialDepositRef                        : Reference of initial deposit transaction
nomineeJson                              : Nominee information
jointHolderJson                          : Joint account holder infromation
minorDateOfBirth                         : Birth date of minor
minorRelationWithCustomer                : Relation between minor and customer
additionalAccountDetailJson              : Additional account detail json
fdrStartDate                             : FDR start date
fdrMaturityDate                          : FDR maturity date
fdrReceiptNo                             : FDR receipt no
fdrPeriod                                : FDR preiod
fdrCreditLiquidationAccountNo            : FDR credit liquidation account no
fdrDebitLiquidationAccountNo             : FDR debit liquidation account no
fdrInterestLiquidationAccountNo          : FDR interest liquidation account no 
fdrTenureInMonths                        : FDR tenure in month
fdrRenewPrincipalFlag                    : FDR principal renew flag
fdrRenewPrincipalAndInterestFlag         : FDR principal and interest renew flag
fdrLinkAccountNo                         : FDR Link account number
rdOneTimeDeposit                         : DPS initial deposit
rdInstallmentAmount                      : DPS Installment amount
rdNumberOfInstallment                    : DPS no of installment
rdStartDate                              : DPS start date
rdMaturityDate                           : DPS maturity date
cbsAccountStatus                         : CBS account status
cbsFailureReason                         : Failure reason of CBS
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent table ServiceTerminal oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentStaffOid                            : Parent table AgentStaff oid
traceId                                  : Request trace id
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
cbsCurrentVersion                        : CBS current version no
status                                   : Status of account
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
bankAccountNoCreateRef                   : Account creation reference no
bankAccountNoCreatedOn                   : Account creation time in csb
bankAccountNoUpdateOn                    : Time of when update account on cbs
bankAccountNoUpdateRef                   : Reference of bank account no updated on cbs
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
applicationRejectionReason               : ApplicationRejection Remarks
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion Remarks
fdrReceiptFlag                           : Fdr Receipt Flag
actualLoanAmount                         : Actual Loan Amount
promoCode                                : Promo Code as incentive
*/
create table                             Account
(
oid                                      varchar(128)                                                not null,
accountId                                varchar(128)                                                not null,
bankCustomerId                           varchar(128),
bankAccountNo                            varchar(64),
mnemonic                                 varchar(64),
accountTitle                             varchar(256)                                                not null,
mobileNo                                 varchar(32)                                                 not null,
accountType                              varchar(32)                                                 not null,
enrollmentType                           varchar(32)                                                 not null,
productOid                               varchar(128),
productName                              varchar(256),
productType                              varchar(32),
currency                                 varchar(16)                                                 not null,
initialDeposit                           numeric(20,6),
initialDepositRef                        varchar(128),
nomineeJson                              text,
jointHolderJson                          text,
minorDateOfBirth                         date,
minorRelationWithCustomer                varchar(32),
additionalAccountDetailJson              text,
fdrStartDate                             date,
fdrMaturityDate                          date,
fdrReceiptNo                             varchar(64),
fdrPeriod                                varchar(256),
fdrCreditLiquidationAccountNo            varchar(64),
fdrDebitLiquidationAccountNo             varchar(64),
fdrInterestLiquidationAccountNo          varchar(64),
fdrTenureInMonths                        numeric(4,0),
fdrRenewPrincipalFlag                    varchar(32),
fdrRenewPrincipalAndInterestFlag         varchar(32),
fdrLinkAccountNo                         varchar(64),
rdOneTimeDeposit                         numeric(20,6),
rdInstallmentAmount                      numeric(20,6),
rdNumberOfInstallment                    varchar(32),
rdStartDate                              date,
rdMaturityDate                           date,
cbsAccountStatus                         varchar(32),
cbsFailureReason                         text,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
serviceTerminalOid                       varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentStaffOid                            varchar(128),
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
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
applicationDate                          date                                                        not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
bankAccountNoCreateRef                   varchar(256),
bankAccountNoCreatedOn                   timestamp,
bankAccountNoUpdateOn                    timestamp,
bankAccountNoUpdateRef                   varchar(256),
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
fdrReceiptFlag                           varchar(32),
actualLoanAmount                         numeric(20,6),
promoCode                                varchar(64),
constraint                               pk_Account                                                  primary key    (oid),
constraint                               fk_productOid_Account                                       foreign key    (productOid)
                                                                                                     references     Product(oid),
constraint                               ck_fdrRenewPrincipalFlag_Account                            check          (fdrRenewPrincipalFlag = 'Yes' or fdrRenewPrincipalFlag = 'No'),
constraint                               ck_fdrRenewPrincipalAndInterestFlag_Account                 check          (fdrRenewPrincipalAndInterestFlag = 'Yes' or fdrRenewPrincipalAndInterestFlag = 'No'),
constraint                               fk_agentOid_Account                                         foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_servicePointOid_Account                                  foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_serviceTerminalOid_Account                               foreign key    (serviceTerminalOid)
                                                                                                     references     ServiceTerminal(oid),
constraint                               fk_bankOid_Account                                          foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_Account                                        foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentStaffOid_Account                                    foreign key    (agentStaffOid)
                                                                                                     references     AgentStaff(oid),
constraint                               ck_status_Account                                           check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationRejected'),
constraint                               ck_isApproverRemarks_Account                                check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_Account                                      check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Here Account History detail to be stored
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
accountId                                : Id of Account
bankCustomerId                           : Cbs customer id
bankAccountNo                            : Cbs account number
mnemonic                                 : Short account name
accountTitle                             : Title of account
mobileNo                                 : Customer mobile no
accountType                              : Type of account
enrollmentType                           : Type of enrolment
productOid                               : Parent table Product oid
productName                              : Name of product
productType                              : Type of product
currency                                 : Money currency
initialDeposit                           : Deposit amount during account opening
initialDepositRef                        : CBS reference no of initial deposit
nomineeJson                              : Nominee's informaiton
jointHolderJson                          : Joint holder informantion
minorDateOfBirth                         : Birth date of minor
minorRelationWithCustomer                : Relation between minor and customer
additionalAccountDetailJson              : Additional account details json
fdrStartDate                             : Start date of FDR
fdrMaturityDate                          : Maturity date of FDR
fdrReceiptNo                             : FDR reciept no
fdrPeriod                                : FDR period
fdrCreditLiquidationAccountNo            : FDR credit liquidation acction no
fdrDebitLiquidationAccountNo             : FDR debit liquidation account number 
fdrInterestLiquidationAccountNo          : FDR interest Liquidation Accuont number
fdrTenureInMonths                        : FDR tenure in month
fdrRenewPrincipalFlag                    : Will fdr renew
fdrRenewPrincipalAndInterestFlag         : Wil fdr and interest renew
fdrLinkAccountNo                         : FDR Link account number
rdOneTimeDeposit                         : DPS initial deposit
rdInstallmentAmount                      : DPS Installment amount
rdNumberOfInstallment                    : DPS no of installment
rdStartDate                              : DPS start date
rdMaturityDate                           : DPS maturity date
cbsAccountStatus                         : CBS account status
cbsFailureReason                         : CBS failure resason
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent table ServiceTerminal oid
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
agentStaffOid                            : Parent table AgentStaff oid
traceId                                  : Request trace id
version                                  : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
cbsCurrentVersion                        : CBS current version no
status                                   : Status of account
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
applicationDate                          : Date of application
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
bankAccountNoCreateRef                   : Reference number of account creation
bankAccountNoCreatedOn                   : When account created
bankAccountNoUpdateOn                    : Time of when update account on cbs
bankAccountNoUpdateRef                   : Reference of bank account no updated on cbs
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
applicationRejectionReason               : Application rejection remarks
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Delition remarks
fdrReceiptFlag                           : Fdr Receipt Flag
actualLoanAmount                         : Actual Loan Amount
*/
create table                             AccountHistory
(
oid                                      varchar(128)                                                not null,
accountId                                varchar(128)                                                not null,
bankCustomerId                           varchar(128),
bankAccountNo                            varchar(64),
mnemonic                                 varchar(64)                                                 not null,
accountTitle                             varchar(256)                                                not null,
mobileNo                                 varchar(32)                                                 not null,
accountType                              varchar(32)                                                 not null,
enrollmentType                           varchar(32)                                                 not null,
productOid                               varchar(128),
productName                              varchar(256),
productType                              varchar(32),
currency                                 varchar(16)                                                 not null,
initialDeposit                           numeric(20,6),
initialDepositRef                        varchar(128),
nomineeJson                              text,
jointHolderJson                          text,
minorDateOfBirth                         date,
minorRelationWithCustomer                varchar(32),
additionalAccountDetailJson              text,
fdrStartDate                             date,
fdrMaturityDate                          date,
fdrReceiptNo                             varchar(64),
fdrPeriod                                varchar(256),
fdrCreditLiquidationAccountNo            varchar(64),
fdrDebitLiquidationAccountNo             varchar(64),
fdrInterestLiquidationAccountNo          varchar(64),
fdrTenureInMonths                        numeric(4,0),
fdrRenewPrincipalFlag                    varchar(32),
fdrRenewPrincipalAndInterestFlag         varchar(32),
fdrLinkAccountNo                         varchar(64),
rdOneTimeDeposit                         numeric(20,6),
rdInstallmentAmount                      numeric(20,6),
rdNumberOfInstallment                    varchar(32),
rdStartDate                              date,
rdMaturityDate                           date,
cbsAccountStatus                         varchar(32),
cbsFailureReason                         text,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
serviceTerminalOid                       varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentStaffOid                            varchar(128),
traceId                                  varchar(128),
version                                  varchar(32)                                                 not null,
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
applicationDate                          date                                                        not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
bankAccountNoCreateRef                   varchar(256),
bankAccountNoCreatedOn                   timestamp,
bankAccountNoUpdateOn                    timestamp,
bankAccountNoUpdateRef                   varchar(256),
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
fdrReceiptFlag                           varchar(32),
actualLoanAmount                         numeric(20,6),
constraint                               pk_AccountHistory                                           primary key    (oid),
constraint                               fk_productOid_AccountHistory                                foreign key    (productOid)
                                                                                                     references     Product(oid),
constraint                               ck_fdrRenewPrincipalFlag_AccountHistory                     check          (fdrRenewPrincipalFlag = 'Yes' or fdrRenewPrincipalFlag = 'No'),
constraint                               ck_fdrRenewPrincipalAndInterestFlag_AccountHistory          check          (fdrRenewPrincipalAndInterestFlag = 'Yes' or fdrRenewPrincipalAndInterestFlag = 'No'),
constraint                               ck_cbsAccountStatus_AccountHistory                          check          (cbsAccountStatus = 'ApplicationSubmitted' or cbsAccountStatus = 'DataUpdated' or cbsAccountStatus = 'BankApproved' or cbsAccountStatus = 'Inactive' or cbsAccountStatus = 'Active' or cbsAccountStatus = 'Closed' or cbsAccountStatus = 'Deleted' or cbsAccountStatus = 'Hold' or cbsAccountStatus = 'ApplicationRejected'),
constraint                               fk_agentOid_AccountHistory                                  foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_servicePointOid_AccountHistory                           foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_serviceTerminalOid_AccountHistory                        foreign key    (serviceTerminalOid)
                                                                                                     references     ServiceTerminal(oid),
constraint                               fk_bankOid_AccountHistory                                   foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_AccountHistory                                 foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_agentStaffOid_AccountHistory                             foreign key    (agentStaffOid)
                                                                                                     references     AgentStaff(oid),
constraint                               ck_status_AccountHistory                                    check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationRejected'),
constraint                               ck_isApproverRemarks_AccountHistory                         check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_AccountHistory                               check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Here CustomerAccount join information to be stored of end client
oid                                      : Surrogate Primary key
customerOid                              : Is a foreign key that refers to customerId column of Customer table
accountOid                               : Is a foreign key that refers to accountId column of Account table
customerAccountRelation                  : Relation between customer and account
isMandatoryBiometric                     : Is this customer biometric mandatory for this account
isBiometricEnable                        : Is this customer can use his biometric for this account
*/
create table                             CustomerAccount
(
oid                                      varchar(128)                                                not null,
customerOid                              varchar(128)                                                not null,
accountOid                               varchar(128)                                                not null,
customerAccountRelation                  varchar(32)                                                 not null,
isMandatoryBiometric                     varchar(32)                                                 not null,
isBiometricEnable                        varchar(32)                                                 not null,
constraint                               pk_CustomerAccount                                          primary key    (oid),
constraint                               fk_customerOid_CustomerAccount                              foreign key    (customerOid)
                                                                                                     references     Customer(oid),
constraint                               fk_accountOid_CustomerAccount                               foreign key    (accountOid)
                                                                                                     references     Account(oid),
constraint                               ck_isMandatoryBiometric_CustomerAccount                     check          (isMandatoryBiometric = 'Yes' or isMandatoryBiometric = 'No'),
constraint                               ck_isBiometricEnable_CustomerAccount                        check          (isBiometricEnable = 'Yes' or isBiometricEnable = 'No')
);

/*
Here SignatoryInfo detail to be stored
oid                                      : Surrogate primary key
signatoryInfoId                          : Auto generated
accountOid                               : Customer account id
mandatoryBioAuthCustomerJson             : Json: Hold customer Ids whose biometric are mandatory. i.e. [customerId1, customerId2, ..... customerIdn]
bioAuthCustomerJson                      : Json: Hold customer Ids whose biometric are optional. i.e. [customerId1, customerId2, ..... customerIdn]
mandatoryBioAuthCustomerCount            : Number of mandatory biometric
bioAuthCustomerCount                     : Number of biometric taken
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             SignatoryInfo
(
oid                                      varchar(128)                                                not null,
signatoryInfoId                          varchar(128)                                                not null,
accountOid                               varchar(128)                                                not null,
mandatoryBioAuthCustomerJson             text                                                        not null,
bioAuthCustomerJson                      text                                                        not null,
mandatoryBioAuthCustomerCount            numeric(4,0)                                                not null,
bioAuthCustomerCount                     numeric(4,0)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_SignatoryInfo                                            primary key    (oid),
constraint                               u_signatoryInfoId_SignatoryInfo                             unique         (signatoryInfoId),
constraint                               fk_accountOid_SignatoryInfo                                 foreign key    (accountOid)
                                                                                                     references     Account(oid)
);

/*
Here Account Balance History table info
oid                                      : Surrogate primary key
accountBalanceHistoryId                  : Account balance history id
accountNo                                : Account Holder Bank A/C no
accountOid                               : Account Holder Bank account id
endDate                                  : Date of end of the day
accountBalance                           : last balance of account
productOid                               : Parent table product oid
agentCode                                : Code of agent
status                                   : Associated status. allowed values: Active, Inactive
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             AccountBalanceHistory
(
oid                                      varchar(128)                                                not null,
accountBalanceHistoryId                  varchar(128)                                                not null,
accountNo                                varchar(64)                                                 not null,
accountOid                               varchar(128)                                                not null,
endDate                                  timestamp                                                   not null,
accountBalance                           numeric(20,6)                                               not null,
productOid                               varchar(128)                                                not null,
agentCode                                varchar(128)                                                not null,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_AccountBalanceHistory                                    primary key    (oid),
constraint                               fk_accountOid_AccountBalanceHistory                         foreign key    (accountOid)
                                                                                                     references     Account(oid),
constraint                               fk_productOid_AccountBalanceHistory                         foreign key    (productOid)
                                                                                                     references     Product(oid),
constraint                               ck_status_AccountBalanceHistory                             check          (status = 'Active' or status = 'Inactive')
);

/*
Customer account operation instraction to be stored
oid                                      : Surrogate Primary key
accountOid                               : Parent table account oid
status                                   : Associated status. allowed values: Active, Inactive
aoiJson                                  : Account operation instraction detail in json schema
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
remarkedBy                               : Who (which login) remarked for the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
canceledBy                               : Who (which login) canceled the record
canceledOn                               : When the record was canceled
cancelingRemark                          : Canceling remarks
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
dataUpdatedBy                            : Who (which login) Update the record
dataUpdatedOn                            : When the record was update
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion remarks
*/
create table                             DraftAccountOperationInstruction
(
oid                                      varchar(128)                                                not null,
accountOid                               varchar(128)                                                not null,
status                                   varchar(32)                                                 not null,
aoiJson                                  text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
currentVersion                           varchar(32)                                                 not null,
editCommit                               varchar(32)                                                 not null,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
canceledBy                               varchar(128),
canceledOn                               timestamp,
cancelingRemark                          text,
approvedBy                               varchar(128),
approvedOn                               timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_DraftAccountOperationInstruction                         primary key    (oid),
constraint                               fk_accountOid_DraftAccountOperationInstruction              foreign key    (accountOid)
                                                                                                     references     Account(oid),
constraint                               ck_status_DraftAccountOperationInstruction                  check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Canceled'),
constraint                               ck_editCommit_DraftAccountOperationInstruction              check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isApproverRemarks_DraftAccountOperationInstruction       check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_DraftAccountOperationInstruction             check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Customer account operation instraction to be stored
oid                                      : Surrogate Primary key
accountOid                               : Parent table account oid
status                                   : Associated status. allowed values: Active, Inactive
aoiJson                                  : Account operation instraction detail in json schema
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
remarkedBy                               : Who (which login) remarked for the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
canceledBy                               : Who (which login) canceled the record
canceledOn                               : When the record was canceled
cancelingRemark                          : Canceling remarks
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
dataUpdatedBy                            : Who (which login) Update the record
dataUpdatedOn                            : When the record was update
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion remarks
*/
create table                             AccountOperationInstruction
(
oid                                      varchar(128)                                                not null,
accountOid                               varchar(128)                                                not null,
status                                   varchar(32)                                                 not null,
aoiJson                                  text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
currentVersion                           varchar(32)                                                 not null,
editCommit                               varchar(32)                                                 not null,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
canceledBy                               varchar(128),
canceledOn                               timestamp,
cancelingRemark                          text,
approvedBy                               varchar(128),
approvedOn                               timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_AccountOperationInstruction                              primary key    (oid),
constraint                               fk_accountOid_AccountOperationInstruction                   foreign key    (accountOid)
                                                                                                     references     Account(oid),
constraint                               ck_status_AccountOperationInstruction                       check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Canceled'),
constraint                               ck_editCommit_AccountOperationInstruction                   check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isApproverRemarks_AccountOperationInstruction            check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_AccountOperationInstruction                  check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
Customer account operation instraction to be stored
oid                                      : Surrogate Primary key
accountOid                               : Parent table account oid
status                                   : Associated status. allowed values: Active, Inactive
aoiJson                                  : Account operation instraction detail in json schema
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
remarkedBy                               : Who (which login) remarked for the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
canceledBy                               : Who (which login) canceled the record
canceledOn                               : When the record was canceled
cancelingRemark                          : Canceling remarks
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
dataUpdatedBy                            : Who (which login) Update the record
dataUpdatedOn                            : When the record was update
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion remarks
*/
create table                             AccountOperationInstructionHistory
(
oid                                      varchar(128)                                                not null,
accountOid                               varchar(128)                                                not null,
status                                   varchar(32)                                                 not null,
aoiJson                                  text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
currentVersion                           varchar(32)                                                 not null,
editCommit                               varchar(32)                                                 not null,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
isNewRecord                              varchar(32),
canceledBy                               varchar(128),
canceledOn                               timestamp,
cancelingRemark                          text,
approvedBy                               varchar(128),
approvedOn                               timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_AccountOperationInstructionHistory                       primary key    (oid),
constraint                               fk_accountOid_AccountOperationInstructionHistory            foreign key    (accountOid)
                                                                                                     references     Account(oid),
constraint                               ck_status_AccountOperationInstructionHistory                check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Canceled'),
constraint                               ck_editCommit_AccountOperationInstructionHistory            check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_isApproverRemarks_AccountOperationInstructionHistory     check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_AccountOperationInstructionHistory           check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);


