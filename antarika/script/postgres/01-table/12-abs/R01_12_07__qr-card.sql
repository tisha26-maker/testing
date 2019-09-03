/*
This table to be used to store Customer QR card information history/log with system.
oid                                      : Surrogate primary key
accountId                                : Customer Account Id
requestDate                              : Request date for Card
pdfFileName                              : Card file Name
pdfGenerationDate                        : Card Generation Date
pdfGeneratedBy                           : Generation user Id
pdfDownloadedOn                          : Card downloaded Date
pdfDownloadedBy                          : Card downloaded User Id
accountStatus                            : Customer Account status during card generation
generatedAs                              : Card generation type like batch or single
remarks                                  : Remarks if any
cardStatus                               : Card status 
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             CustomerQrCard
(
oid                                      varchar(128)                                                not null,
accountId                                varchar(128)                                                not null,
requestDate                              date                                                        not null,
pdfFileName                              varchar(256)                                                not null,
pdfGenerationDate                        date                                                        not null,
pdfGeneratedBy                           varchar(128)                                                not null,
pdfDownloadedOn                          timestamp,
pdfDownloadedBy                          varchar(128),
accountStatus                            varchar(32)                                                 not null,
generatedAs                              varchar(32)                                                 not null,
remarks                                  text,
cardStatus                               varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_CustomerQrCard                                           primary key    (oid),
constraint                               ck_accountStatus_CustomerQrCard                             check          (accountStatus = 'ApplicationSubmitted' or accountStatus = 'DataUpdated' or accountStatus = 'BankApproved' or accountStatus = 'Inactive' or accountStatus = 'Active' or accountStatus = 'Closed' or accountStatus = 'Deleted' or accountStatus = 'Hold' or accountStatus = 'ApplicationRejected' or accountStatus = 'InEditable'),
constraint                               ck_generatedAs_CustomerQrCard                               check          (generatedAs = 'Batch' or generatedAs = 'Single'),
constraint                               ck_cardStatus_CustomerQrCard                                check          (cardStatus = 'Generated' or cardStatus = 'Downloaded')
);

/*
This table to be used to store Customer QR card information history/log with system.
oid                                      : Surrogate primary key
accountId                                : Customer account Id
changeType                               : Card change type will be: Demage, Lost
cardLostDate                             : Card Lost date
remark                                   : Comments for changes
applyDate                                : Date of application
approveOn                                : Date of approval
approveBy                                : User id of approver
status                                   : Status Submitted, Approved, Generaged
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             CustomerQrCardLog
(
oid                                      varchar(128)                                                not null,
accountId                                varchar(128)                                                not null,
changeType                               varchar(32)                                                 not null,
cardLostDate                             date,
remark                                   text                                                        not null,
applyDate                                date                                                        not null,
approveOn                                timestamp,
approveBy                                varchar(128),
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               ck_changeType_CustomerQrCardLog                             check          (changeType = 'Demage' or changeType = 'Lost'),
constraint                               ck_status_CustomerQrCardLog                                 check          (status = 'Submitted' or status = 'Approved' or status = 'Generaged')
);


