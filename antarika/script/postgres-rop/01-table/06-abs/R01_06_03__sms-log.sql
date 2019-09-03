/*
This table is used to store sms sending information
oid                                      : Surrogate primary key
requestId                                : Id of this request
accountOid                               : Parent table Account oid
bankAccountNo                            : Customer bank account number
transId                                  : Transaction id provided by CBS
referenceNo                              : SMS sending reference number
transType                                : Type of transaction
mobileNo                                 : Where sms will be send
sms                                      : SMS text
sendDate                                 : SMS sending date
processCode                              : Process code
status                                   : Status of this record
traceId                                  : Trace Id of this record
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Brnach oid
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
*/
create table                             SmsLog
(
oid                                      varchar(128)                                                not null,
requestId                                varchar(128)                                                not null,
accountOid                               varchar(128),
bankAccountNo                            varchar(128),
transId                                  varchar(128),
referenceNo                              varchar(128),
transType                                varchar(64),
mobileNo                                 varchar(64)                                                 not null,
sms                                      text                                                        not null,
sendDate                                 date,
processCode                              varchar(64),
status                                   varchar(32)                                                 not null,
traceId                                  varchar(128),
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp
) partition by range (createdOn);


