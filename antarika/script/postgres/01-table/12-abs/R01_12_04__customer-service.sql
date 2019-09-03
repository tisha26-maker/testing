/*
This table to be used to store cheque collection information
oid                                      : Surrogate primary key
requestId                                : Id for cheque request
trackingId                               : Tracking number
chequeFrontPhotoPath                     : Photo path for front cheque
chequeBackPhotoPath                      : Photo path for back cheque
bearerPhotoPath                          : Photo path for bearer
retryCount                               : Count for number of retryCount
requestType                              : Type of request
makerId                                  : Maker id
chequeDetail                             : Details information of cheque
requestTime                              : Date of submit request
receiptTime                              : Date of recipient
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
servicePointOid                          : Parent table ServicePoint oid
agentOid                                 : Parent table Agent oid
rejectionCause                           : Cause for rejection
status                                   : Associate with current status, allowed values: Application-Submitted, Rejected
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ChequeCollection
(
oid                                      varchar(128)                                                not null,
requestId                                varchar(128)                                                not null,
trackingId                               varchar(128)                                                not null,
chequeFrontPhotoPath                     varchar(1024)                                               not null,
chequeBackPhotoPath                      varchar(1024)                                               not null,
bearerPhotoPath                          varchar(1024)                                               not null,
retryCount                               numeric(4,0),
requestType                              varchar(32)                                                 not null,
makerId                                  varchar(128),
chequeDetail                             text                                                        not null,
requestTime                              timestamp,
receiptTime                              timestamp,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
rejectionCause                           text,
status                                   varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ChequeCollection                                         primary key    (oid),
constraint                               u_trackingId_ChequeCollection                               unique         (trackingId),
constraint                               fk_bankOid_ChequeCollection                                 foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_ChequeCollection                               foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_servicePointOid_ChequeCollection                         foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_agentOid_ChequeCollection                                foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               ck_status_ChequeCollection                                  check          (status = 'Application-Submitted' or status = 'Rejected')
);

/*
This table to be used to store cheque detail information
oid                                      : Surrogate primary key
chequeDetailId                           : A unique key for the table
chequeCollectionOid                      : Tracking number
recipientAccountNo                       : Account id of cheque recipient
recipientName                            : Name of cheque recipient
amount                                   : Amount mentioned in cheque
dateOnCheque                             : Date on which cheque signatured
chequeSequence                           : Cheque sequence number
bankAccountNo                            : Account number with which the cheque is tagged
payerName                                : Name of payee
issuingBank                              : Bank name issuing the cheque
issuingBankBranch                        : Branch name of the bank issuing the cheque
bearerName                               : Name of bearer
bearerPhoneNumber                        : Bearer phone number
bearerNationalId                         : Bearer national id
bearerAddress                            : Bearer address
bearerRelationship                       : Relation between payee and bearer
bankOid                                  : Parent table Bank oid
branchOid                                : Parent table Branch oid
servicePointOid                          : Parent table ServicePoint oid
agentOid                                 : Parent table Agent oid
status                                   : Associated status: Submitted, Issued, Rejected
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ChequeDetail
(
oid                                      varchar(128)                                                not null,
chequeDetailId                           varchar(128)                                                not null,
chequeCollectionOid                      varchar(128)                                                not null,
recipientAccountNo                       varchar(128)                                                not null,
recipientName                            varchar(256)                                                not null,
amount                                   numeric(20,6)                                               not null,
dateOnCheque                             date                                                        not null,
chequeSequence                           numeric(4,0),
bankAccountNo                            varchar(64),
payerName                                varchar(256),
issuingBank                              varchar(256),
issuingBankBranch                        varchar(256),
bearerName                               varchar(256),
bearerPhoneNumber                        varchar(32),
bearerNationalId                         varchar(128),
bearerAddress                            text,
bearerRelationship                       varchar(32),
bankOid                                  varchar(128),
branchOid                                varchar(128),
servicePointOid                          varchar(128),
agentOid                                 varchar(128),
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ChequeDetail                                             primary key    (oid),
constraint                               fk_chequeCollectionOid_ChequeDetail                         foreign key    (chequeCollectionOid)
                                                                                                     references     ChequeCollection(oid),
constraint                               fk_bankOid_ChequeDetail                                     foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_ChequeDetail                                   foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               fk_servicePointOid_ChequeDetail                             foreign key    (servicePointOid)
                                                                                                     references     ServicePoint(oid),
constraint                               fk_agentOid_ChequeDetail                                    foreign key    (agentOid)
                                                                                                     references     Agent(oid),
constraint                               ck_status_ChequeDetail                                      check          (status = 'Submitted' or status = 'Issued' or status = 'Rejected')
);


