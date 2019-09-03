/*
This table associated to hold cusotmer customer monthly bill information
oid                                      : PRimary key (customerCode + billMonth + billYear)
customerCode                             : Customer identification code
billMonth                                : Month of bill
billYear                                 : Year of bill
issueDate                                : In which date bill created
lastDateOfPayment                        : After which date surcharge will be applicable
vat                                      : Vat on bill
vatTopay                                 : Vat has to pay
monthlyBillTopay                         : Bill amount need to pay by customer
monthlySurchargeTopay                    : Surchage amount need to pay by customer after last payment date 
monthlyBillPaid                          : Paid bill amount
monthlySurchargePaid                     : Paid surcharge amount
dateOfPayment                            : Payment date
bankCode                                 : Third paryt code. Like Doer, South East bank.
connectionStatusId                       : -
billStatus                               : Status of Bill. When paid status will be "P"
description                              : -
meterType                                : -
meterNumber                              : -
scrollNo                                 : -
billNo                                   : -
customerType                             : wheather customer is metered or non-metered. Value  metered, non-metered
csbrequestId                             : CSB request id
cbsReferenceno                           : CBS transaction reference no
traceId                                  : Trace id
paymentDate                              : Date of payment
customerMobileNo                         : Mobile number of a customer
absChargeAmount                          : Charge amount from abs
absVatAmount                             : Vat amount from abs
debitedAccount                           : From which account amount will be transfer
creditedAccount                          : To which account amount will be transfer
makerId                                  : Who made this bill
absBillStatus                            : ABS bill status
agentOid                                 : Oid of agent
servicepointOid                          : Oid of servicepoint
serviceterminalOid                       : Oid of serviceterminal
branchOid                                : Oid of branch
bankOid                                  : Oid of bank
transactionDate                          : Date of bill transaction
createdBy                                : Who created
createdOn                                : When created
updatedBy                                : Who updated
updatedOn                                : When updated
bgdclSchemaName                          : From which schema this data pick
*/
create table                             BgdclCustomerLedger
(
oid                                      varchar(128)                                                not null,
customerCode                             varchar(15),
billMonth                                char,
billYear                                 varchar(4),
issueDate                                date,
lastDateOfPayment                        date,
vat                                      numeric(142,2),
vatTopay                                 numeric(142,2),
monthlyBillTopay                         numeric(142,2),
monthlySurchargeTopay                    numeric(142,2),
monthlyBillPaid                          numeric(142,2),
monthlySurchargePaid                     numeric(142,2),
dateOfPayment                            date,
bankCode                                 varchar(8),
connectionStatusId                       char,
billStatus                               varchar(2),
description                              varchar(100),
meterType                                varchar(30),
meterNumber                              varchar(20),
scrollNo                                 varchar(20),
billNo                                   bigint,
customerType                             varchar(14),
csbrequestId                             varchar(128),
cbsReferenceno                           varchar(128),
traceId                                  varchar(128),
paymentDate                              varchar(128),
customerMobileNo                         varchar(128),
absChargeAmount                          numeric(20,6),
absVatAmount                             numeric(20,6),
debitedAccount                           varchar(128),
creditedAccount                          varchar(128),
makerId                                  varchar(128),
absBillStatus                            varchar(32),
agentOid                                 varchar(128),
servicepointOid                          varchar(128),
serviceterminalOid                       varchar(128),
branchOid                                varchar(128),
bankOid                                  varchar(128),
transactionDate                          date,
createdBy                                varchar(128),
createdOn                                timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
bgdclSchemaName                          varchar(128),
constraint                               pk_BgdclCustomerLedger                                      primary key    (oid),
constraint                               ck_absBillStatus_BgdclCustomerLedger                        check          (absBillStatus = 'Success' or absBillStatus = 'Failed' or absBillStatus = 'Pending' or absBillStatus = 'OK' or absBillStatus = 'Approved' or absBillStatus = 'PaidRequestSent' or absBillStatus = 'PaidRequestSent')
);

/*
This table associated to hold data migration history
oid                                      : Surrogate primary key
dateTime                                 : Data migration time
sourceTableName                          : Source table
destinationTableName                     : destination table
sourceRowCount                           : Source table data count
destinationRowCount                      : destination table data count
status                                   : Status of migration
executionTime                            : Migration time
bgdclSchemaName                          : From which schema this data pick
*/
create table                             BgdclMigrationLog
(
oid                                      varchar(128),
dateTime                                 timestamp,
sourceTableName                          varchar(128),
destinationTableName                     varchar(128),
sourceRowCount                           numeric(128),
destinationRowCount                      numeric(128),
status                                   varchar(32),
executionTime                            numeric(128),
bgdclSchemaName                          varchar(128),
constraint                               pk_BgdclMigrationLog                                        primary key    (oid)
);


