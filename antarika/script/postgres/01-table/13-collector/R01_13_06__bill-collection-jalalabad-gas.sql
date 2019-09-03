/*
This table to be used to store Gas Bill Collection
oid                                      : Surrogate primary key
csbRequestId                             : Request id of csb
cbsReferenceNo                           : CbsReferanceNo from cbs
traceId                                  : Tracking number
entryDate                                :  Bill entry date
paymentMonth                             : Payment month (ex. January, February etc.) 
customerCode                             : Jalalabad gas bill customer Code
customerName                             : Name of customer
customerMobileNo                         : Customer MobileNo
billReferenceNumber                      : Bill Number
billAmount                               : Actual bill amount
vatAmount                                : Vat amount
chargeAmount                             : Charge amount
billType                                 : Type of bill
debitAccount                             : From which account amount will transfer
creditAccount                            : To which account amount will transfer
submittedBy                              : Who (which login) created the record
makerId                                  : Who (which login) make the record
checkerId                                : Who (which login) check the record
approverId                               : Who (which login) approve the record
status                                   : Status of bill
rejectionCause                           : Why reject it
agentOid                                 : A audit specific column, a foreign key which refers to the primary key of agent table
servicePointOid                          : A audit specific column, a foreign key which refers to the primary key of servicePoint table
serviceTerminalOid                       : A audit specific column, a foreign key which refers to the primary key of serviceTerminal table
branchOid                                : A audit specific column, a foreign key which refers to the primary key of branch table
bankOid                                  : A audit specific column, a foreign key which refers to the primary key of bank table
transactionDate                          : Transaction perform date
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             GasBillCollection
(
oid                                      varchar(128)                                                not null,
csbRequestId                             varchar(128),
cbsReferenceNo                           varchar(128),
traceId                                  varchar(128),
entryDate                                date                                                        not null,
paymentMonth                             varchar(256),
customerCode                             varchar(128)                                                not null,
customerName                             varchar(256),
customerMobileNo                         varchar(64)                                                 not null,
billReferenceNumber                      varchar(128),
billAmount                               numeric(20,6)                                               not null,
vatAmount                                numeric(20,6),
chargeAmount                             numeric(20,6),
billType                                 varchar(128),
debitAccount                             varchar(64),
creditAccount                            varchar(64),
submittedBy                              varchar(128),
makerId                                  varchar(128),
checkerId                                varchar(128),
approverId                               varchar(128),
status                                   varchar(32),
rejectionCause                           text,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
serviceTerminalOid                       varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
transactionDate                          date,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_GasBillCollection                                        primary key    (oid),
constraint                               ck_status_GasBillCollection                                 check          (status = 'Failed' or status = 'OK' or status = 'Pending'),
constraint                               fk_agentOid_GasBillCollection                               foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               fk_servicePointOid_GasBillCollection                        foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_serviceTerminalOid_GasBillCollection                     foreign key    (serviceTerminalOid)
                                                                                                     references     ServiceTerminal(oid),
constraint                               fk_branchOid_GasBillCollection                              foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_bankOid_GasBillCollection                                foreign key    (bankOid)
                                                                                                     references     Bank(oid)
);

/*
This table to be used to store GasJalalabad Charge details
oid                                      : Surrogate primary key
gasJalalabadChargeModelId                : Charge model id
servicePointOid                          : A audit specific column, a foreign key which refers to the primary key of servicepoint table
gasChargeJson                            : GasChargeJson contain the time wise charge
createdAccount                           : CreatedAccount use for collected charge and bill 
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             GasJalalabadChargeModel
(
oid                                      varchar(128)                                                not null,
gasJalalabadChargeModelId                varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
gasChargeJson                            text                                                        not null,
createdAccount                           varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_GasJalalabadChargeModel                                  primary key    (oid),
constraint                               fk_servicePointOid_GasJalalabadChargeModel                  foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid)
);


