/*
This Table to be used to store print receipt data, which are printed by app. Later this can be reprinted.
oid                                      : Surrogate primary key
traceId                                  : Receipt trace id
bankAccountNo                            : Customer bank account no
cbsRef                                   : Transaction reference no
mobileNo                                 : Account mobile no
amount                                   : Transaction amount
receiptData                              : Receipt data in json string
receiptType                              : Receipt type. eg - deposit, withdrawal, etc.
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
*/
create table                             CustomerReceipt
(
oid                                      varchar(128)                                                not null,
traceId                                  varchar(128)                                                not null,
bankAccountNo                            varchar(64),
cbsRef                                   varchar(128),
mobileNo                                 varchar(64),
amount                                   numeric(20,6),
receiptData                              text                                                        not null,
receiptType                              varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
constraint                               pk_CustomerReceipt                                          primary key    (oid)
);


