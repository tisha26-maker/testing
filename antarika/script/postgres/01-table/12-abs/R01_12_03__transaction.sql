/*
Customer account operation instraction to be stored
oid                                      : Surrogate Primary key
requestId                                : RequestId sent from app for this transaction, primary key
transType                                : Transaction type
transAmount                              : Original transation amount
chargeAmount                             : Amount of Charge dedcuted
vatAmount                                : Amount of VAT/TAX (on charge) 
transTime                                : Transaction date
transStatus                              : Transaction status
cbsStatus                                : Will contain the CBS transaction status
ackMethod                                : Will store the acknowledgement method
printStatus                              : Will contain the print status
accountOid                               : Id of credited account
creditedAccount                          : Credited account no
debitedAccount                           : Debited account no
transId                                  : Transaction id
referenceNo                              : Reference no for transaction
narration                                : Short description for transaction
bankOid                                  : Parent table Banki oid
branchOid                                : Parent table Branch oid
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint oid
serviceTerminalOid                       : Parent table ServiceTerminal oid
processCode                              : Service process code
reverseRefNo                             : Short description for transaction
reverseType                              : Type of reverse transaction
reverseTime                              : Date of reversal
reverserId                               : Id of reverser
reverseStatus                            : Status of reversal
reverseStatusNote                        : Status note of reversal
transStatusNote                          : Short note for transaction status
ackStatus                                : Acknowledgement status
ackStatusNote                            :  Short note for acknowledgement
makerId                                  : Id of maker user
chargedParty                             : Name of party who is charged for transaction
chargingParty                            : Who is charging
traceId                                  : Trace Id no
errorSource                              : If error, where the error occurred
errorCode                                : If error, what was the error code
errorSubcode                             : If error, what was the error sub-code
errorText                                : If error, the error message
creditedAccountCustomerId                : Customer id of credited A/c
creditedAccountCbsCustomerId             : Cbs customer id of credited A/c
creditedAccountBranchId                  : Branch id of credited A/c
creditedAccountAgentId                   : Agent id of credited A/c
debitedAccountCustomerId                 : Customer id for debited A/C
debitedAccountCbsCustomerId              : Cbs customer id of debited A/c
debitedAccountBranchId                   : Branch id of debited A/c
debitedAccountAgentId                    : Agent id of debited A/c
transOutletAreaId                        : Area id of the outlet where transaction occurs
transOutletZoneId                        : Zone id of the outlet where transaction occurs
transServicePointId                      : Service point id of the outlet where transaction occurs
transAgentId                             : Agent id by whom transaction occurs
transAgentCbsAccountId                   : Agent cbs A/c Id by whom transaction occurs
transAgentCbsCustomerId                  : Agent cbs CustomerId by whom transaction occurs
transAgentBranchId                       : Agent Branch Id by whom transaction occurs
transAgentStaffId                        : Agent Staff Id by whom transaction occurs
transAgentCaoId                          : Agent Cao (Compliance Advisor/Ombudsman) Id by whom transaction occurs
transTerminalId                          : Transaction terminal Id
transTerminalModel                       :  Transaction terminal model
transFpDeviceId                          : Transaction Fp Device Id
transFpDeviceModel                       : Transaction Fp Device model
transPrinterId                           : Transaction printer Id
transPrinterModel                        : Transaction printer model
transRetryCount                          : Transaction retry count no
transEntryStartTime                      : Start time when transaction entry was started in app
transEntryEndTime                        : End time when transaction entry was completed in app
transEntrySeconds                        : Duration of transaction entry
transBbsCode                             : BBS code (GeoCode) of the transaction
lattitude                                : Sent by app
longitude                                : Sent by app
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             TransLog
(
oid                                      varchar(128)                                                not null,
requestId                                varchar(128)                                                not null,
transType                                varchar(32)                                                 not null,
transAmount                              numeric(20,6)                                               not null,
chargeAmount                             numeric(20,6),
vatAmount                                numeric(20,6),
transTime                                timestamp,
transStatus                              varchar(32),
cbsStatus                                varchar(32),
ackMethod                                varchar(32),
printStatus                              varchar(32),
accountOid                               varchar(128),
creditedAccount                          varchar(64),
debitedAccount                           varchar(64),
transId                                  varchar(128),
referenceNo                              varchar(64),
narration                                varchar(256),
bankOid                                  varchar(128),
branchOid                                varchar(128),
agentOid                                 varchar(128),
servicePointOid                          varchar(128),
serviceTerminalOid                       varchar(128),
processCode                              varchar(6),
reverseRefNo                             varchar(64),
reverseType                              varchar(32),
reverseTime                              timestamp,
reverserId                               varchar(128),
reverseStatus                            varchar(32),
reverseStatusNote                        text,
transStatusNote                          varchar(256),
ackStatus                                varchar(32),
ackStatusNote                            text,
makerId                                  varchar(128),
chargedParty                             varchar(256),
chargingParty                            varchar(256),
traceId                                  varchar(128),
errorSource                              varchar(64),
errorCode                                varchar(64),
errorSubcode                             varchar(64),
errorText                                text,
creditedAccountCustomerId                varchar(128),
creditedAccountCbsCustomerId             varchar(128),
creditedAccountBranchId                  varchar(128),
creditedAccountAgentId                   varchar(128),
debitedAccountCustomerId                 varchar(128),
debitedAccountCbsCustomerId              varchar(128),
debitedAccountBranchId                   varchar(128),
debitedAccountAgentId                    varchar(128),
transOutletAreaId                        varchar(128),
transOutletZoneId                        varchar(128),
transServicePointId                      varchar(128),
transAgentId                             varchar(128),
transAgentCbsAccountId                   varchar(128),
transAgentCbsCustomerId                  varchar(128),
transAgentBranchId                       varchar(128),
transAgentStaffId                        varchar(128),
transAgentCaoId                          varchar(128),
transTerminalId                          varchar(128),
transTerminalModel                       varchar(128),
transFpDeviceId                          varchar(128),
transFpDeviceModel                       varchar(128),
transPrinterId                           varchar(128),
transPrinterModel                        varchar(128),
transRetryCount                          numeric(4,0),
transEntryStartTime                      timestamp,
transEntryEndTime                        timestamp,
transEntrySeconds                        numeric(8,0),
transBbsCode                             varchar(64),
lattitude                                numeric(20,8),
longitude                                numeric(20,8),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               ck_transStatus_TransLog                                     check          (transStatus = 'RequestReceived' or transStatus = 'OK' or transStatus = 'Pending' or transStatus = 'Failed' or transStatus = 'Reversed'),
constraint                               ck_cbsStatus_TransLog                                       check          (cbsStatus = 'RequestSent' or cbsStatus = 'RequestNotSent' or cbsStatus = 'RequestReceived' or cbsStatus = 'OK' or cbsStatus = 'Pending' or cbsStatus = 'Failed'),
constraint                               ck_ackMethod_TransLog                                       check          (ackMethod = 'App' or ackMethod = 'Manual'),
constraint                               ck_printStatus_TransLog                                     check          (printStatus = 'RequestReceived' or printStatus = 'RequestNotReceived' or printStatus = 'Printed' or printStatus = 'PaperPrinted')
);

/*
This table to be used to settle pending transaction
oid                                      : Surrogate primary key
transLogOid                              : Parent table Translog oid
status                                   : Transaction Settelment status
markAs                                   : Transaction Settelment mark as
reverseStatus                            : Transaction reverse status
remarks                                  : Transaction Settelment remarks
madeBy                                   : Who (which login) made the record
madeOn                                   : When the record was made
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
rejectedBy                               : Who (which login) rejected the record
rejectedOn                               : When the record was rejected
lockedby                                 : When the record was locked by user
lockedon                                 : When the record was locked.
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
rejectionCause                           : Rejection reason
isApproverRemarks                        : If approver adds any remarks it is Yes. if approver does not add any remarks, It will be No
*/
create table                             TransactionSettlement
(
oid                                      varchar(128)                                                not null,
transLogOid                              varchar(128)                                                not null,
status                                   varchar(32),
markAs                                   varchar(32),
reverseStatus                            varchar(32),
remarks                                  text,
madeBy                                   varchar(128)                                                               default 'System',
madeOn                                   timestamp                                                                  default current_timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
rejectedBy                               varchar(128),
rejectedOn                               timestamp,
lockedby                                 varchar(128)                                                               default '',
lockedon                                 timestamp                                                                  default ,
editcommit                               varchar(32)                                                 not null,
rejectionCause                           text,
isApproverRemarks                        varchar(32),
constraint                               pk_TransactionSettlement                                    primary key    (oid),
constraint                               u_transLogOid_TransactionSettlement                         unique         (transLogOid),
constraint                               ck_status_TransactionSettlement                             check          (status = 'BankMade' or status = 'BankApproved' or status = 'BankRejected'),
constraint                               ck_markAs_TransactionSettlement                             check          (markAs = 'OK' or markAs = 'Failed' or markAs = 'Reverse'),
constraint                               ck_reverseStatus_TransactionSettlement                      check          (reverseStatus = 'OK' or reverseStatus = 'Failed'),
constraint                               ck_reverseStatus_TransactionSettlement                      check          (reverseStatus = 'OK' or reverseStatus = 'Failed'),
constraint                               ck_reverseStatus_TransactionSettlement                      check          (reverseStatus = 'OK' or reverseStatus = 'Failed'),
constraint                               ck_editcommit_TransactionSettlement                         check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_TransactionSettlement                  check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No')
);


