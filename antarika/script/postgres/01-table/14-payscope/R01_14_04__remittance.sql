/*
Remittance information to be stored here
oid                                      : surrogate primary key
ifrId                                    : Key for the Remittance
pin                                      : Remittance indentification number
ttNumber                                 : Alternative pin for some country's
personOid                                : Receiver any indentification number like. nid or birth registration number number etc.
photoId                                  : PhotoId location
photoIdType                              : PhotoId location
photoIdFrontPath                         : Where image will be saved
photoIdBackPath                          : Where image will be saved
recipientPhotoPath                       : Where image will be saved
recipientName                            : Remittance receiver name
recipientMobileNo                        : Receiver mobile number
recipientEmail                           : Receiver email address
recipientGender                          : Receiver photo location
remittanceSenderOid                      : Receiver gender
senderName                               : Remittance sender name
senderCountry                            : Remittance sender county name
applicationDate                          : Remittance sending date
amount                                   : Amount
actualAmountInBdt                        : Approved amount by bank
exHouseOid                               : Parent table ExchangeHouse oid
branchExHouseOid                         : Parent table ExchangeHouse oid
disbursedOn                              : Date of Disbursement
creditedAccount                          : Which account should be credit
debitedAccount                           : Which account should be debit
csbRequestId                             : Transaction request id
cbsReferenceNo                           : Transaction refercence number
approvalAuthority                        : Request trace id
traceId                                  : Remark provided as justification for making the record editable
makeEditableRemarks                      : Remark provided as justification for canceling
closingRemarks                           : Remark provided when creating the record
remarks                                  : Who locked this particular record
otp                                      : One time password(otp) for remittance disburse
otpExpirationTime                        : OTP expiration time
otpRequestBy                             : Who (Which login) request for otp 
otpRequestOn                             : When sending requested otp
isPhotoRetakeRequired                    : If maker want to retake photo then it is Yes otherwise No
lockedBy                                 : Who (which login) closed the record
lockedOn                                 : Store locked time
closedBy                                 : When (which login) closed the record
closedOn                                 : Store close time 
status                                   : Lifecycle stage for this record like applicationSubmitted, dataUpdated, bankApproved, disbursed, close, oK, failed, cancel etc.
bankOid                                  : Parent table bankoid
branchOid                                : Parent table branch oid
agentOid                                 : Parent table agent oid
servicePointOid                          : Parent table service point oid
serviceTerminalOid                       : Parent table service terminal oid
backOfficeRemarkBy                       : Who (which login) add the remark
backOfficeRemarkOn                       : Store time
isBackOfficeRemark                       : If bakoffice user adds any remarks it is Yes. if back office user  does not add any remarks, It will be No
backOfficeRemarks                        : Back office  remarks for further action
isApproverRemarks                        : If approver adds any remarks it is Yes. if approver does not add any remarks, It will be No
approverRemarks                          : Approver remarks for further action
editedBy                                 : Who (which login) locked the record
editedOn                                 : When locked the record
dataUpdatedBy                            : Who (which login) dataupdate the record
dataUpdatedOn                            : Stroe the time 
updateActivityInSec                      : Seconds taken for this update activity
approvedBy                               : Who (which login) approved the record
approvedOn                               : Strore the time for approval
approvalActivityInSec                    : Seconds taken for this approval activity
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
promoCode                                : Promo Code as incentive
*/
create table                             Remittance
(
oid                                      varchar(128)                                                not null,
ifrId                                    varchar(128)                                                not null,
pin                                      varchar(128)                                                not null,
ttNumber                                 varchar(128),
personOid                                varchar(128)                                                not null,
photoId                                  varchar(128)                                                not null,
photoIdType                              varchar(128)                                                not null,
photoIdFrontPath                         varchar(1024),
photoIdBackPath                          varchar(1024),
recipientPhotoPath                       varchar(1024),
recipientName                            varchar(256)                                                not null,
recipientMobileNo                        varchar(32)                                                 not null,
recipientEmail                           varchar(128),
recipientGender                          varchar(128)                                                not null,
remittanceSenderOid                      varchar(128),
senderName                               varchar(256)                                                not null,
senderCountry                            varchar(256)                                                not null,
applicationDate                          date                                                        not null,
amount                                   numeric(20,6)                                               not null,
actualAmountInBdt                        numeric(20,6),
exHouseOid                               varchar(128)                                                not null,
branchExHouseOid                         varchar(128),
disbursedOn                              timestamp,
creditedAccount                          varchar(128),
debitedAccount                           varchar(128),
csbRequestId                             varchar(512),
cbsReferenceNo                           varchar(128),
approvalAuthority                        varchar(64),
traceId                                  varchar(128),
makeEditableRemarks                      text,
closingRemarks                           text,
remarks                                  text,
otp                                      varchar(16),
otpExpirationTime                        timestamp,
otpRequestBy                             varchar(128),
otpRequestOn                             timestamp,
isPhotoRetakeRequired                    varchar(32),
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
status                                   varchar(32)                                                 not null,
bankOid                                  varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
agentOid                                 varchar(128),
servicePointOid                          varchar(128),
serviceTerminalOid                       varchar(128),
backOfficeRemarkBy                       timestamp,
backOfficeRemarkOn                       timestamp,
isBackOfficeRemark                       varchar(64),
backOfficeRemarks                        text,
isApproverRemarks                        varchar(32),
approverRemarks                          text,
editedBy                                 varchar(128),
editedOn                                 timestamp,
dataUpdatedBy                            varchar(128),
dataUpdatedOn                            timestamp,
updateActivityInSec                      numeric(8,0),
approvedBy                               varchar(128),
approvedOn                               timestamp,
approvalActivityInSec                    numeric(8,0),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
promoCode                                varchar(64),
constraint                               pk_Remittance                                               primary key    (oid),
constraint                               fk_personOid_Remittance                                     foreign key    (personOid)
                                                                                                     references     OtcPerson(oid),
constraint                               ck_recipientGender_Remittance                               check          (recipientGender = 'Male' or recipientGender = 'Female' or recipientGender = 'Other'),
constraint                               fk_remittanceSenderOid_Remittance                           foreign key    (remittanceSenderOid)
                                                                                                     references     RemittanceSender(oid),
constraint                               fk_exHouseOid_Remittance                                    foreign key    (exHouseOid)
                                                                                                     references     ExchangeHouse(oid),
constraint                               fk_branchExHouseOid_Remittance                              foreign key    (branchExHouseOid)
                                                                                                     references     ExchangeHouse(oid),
constraint                               ck_isPhotoRetakeRequired_Remittance                         check          (isPhotoRetakeRequired = 'Yes' or isPhotoRetakeRequired = 'No'),
constraint                               ck_status_Remittance                                        check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'InEditable' or status = 'BankApproved' or status = 'ApplicationRejected' or status = 'BankMade' or status = 'Pending' or status = 'Disbursed' or status = 'Close' or status = 'OK' or status = 'Failed' or status = 'Cancel'),
constraint                               fk_bankOid_Remittance                                       foreign key    (bankOid)
                                                                                                     references     Bank(oid),
constraint                               fk_branchOid_Remittance                                     foreign key    (branchOid)
                                                                                                     references     Branch(oid),
constraint                               ck_isApproverRemarks_Remittance                             check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No')
);


