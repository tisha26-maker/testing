/*
This table to be used to store associated person information
oid                                      : Surrogate primary key
personId                                 : Id of person
title                                    : Title of person
fullName                                 : Person full name
firstName                                : Person first name
middleName                               : Person middle name
lastName                                 : Person last name
gender                                   : Gender of person. eg. MALE, FEMALE, OTHERS
dateOfBirth                              : Person date of birth
placeOfBirth                             : Person birth place
countryOfBirth                           : Person birth country
fatherName                               : Person father name
motherName                               : Person mother name
spouseName                               : Person spouse name
maritalStatus                            : Marital status of person
nationality                              : Nationality of person
residentStatus                           : resident of person i.e: BD
occupation                               : Person occupation
monthlyIncome                            : Income of a month
photoId                                  : Number of photo id
eTin                                     : Electronic Tax Identification Number
presentAddress                           : Person present address
proofOfAddress                           : PersonProof of address
permanentAddress                         : Person permanent address
mobileNo                                 : Person mobile no
officePhoneNo                            : Person office phone number
residencePhoneNo                         : Person residence phone number
email                                    : Person email id
emergencyContactJson                     : If in emergency need to contact
reverseRelation                          : if a person have multiple relation like customer, agent ..will store the relation
photoPath                                : Where image will be saved
proofOfAddressPhotoPath                  : Where image will be saved
traceId                                  : Unique id to trace this request
currentVersion                           : Contain current live version number
cbsCurrentVersion                        : CBS current version of data
status                                   : Status of person
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. Its will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. Its will be Yes or No
applicationDate                          : Request Date of application 
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
dataUpdatedBy                            : Who (which login) Update the record
dataUpdatedOn                            : When the record was update
dataUpdateApprovedBy                     : Who (which login) approved the record for data updating
dataUpdateApprovedOn                     : When data updating was approved
bankApprovedBy                           : Who (which login) approved the record
bankApprovedOn                           : When the record was approved
bankApprovalAuthorizedBy                 : Who (which login) Authorized the record
bankApprovalAuthorizedOn                 : When the record was bank Approval Authorized
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
applicationRejectedBy                    : Who (which login) reject the application the record
applicationRejectedOn                    : When the record was application Rejected
applicationRejectionReason               : Will store the rejection reason
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Store the closing reason
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Store the deletion reason
*/
create table                             OtcPerson
(
oid                                      varchar(128)                                                not null,
personId                                 varchar(128)                                                not null,
title                                    varchar(256)                                                not null,
fullName                                 varchar(256)                                                not null,
firstName                                varchar(256)                                                not null,
middleName                               varchar(256),
lastName                                 varchar(256)                                                not null,
gender                                   varchar(32)                                                 not null,
dateOfBirth                              date,
placeOfBirth                             varchar(64),
countryOfBirth                           varchar(64),
fatherName                               varchar(256),
motherName                               varchar(256),
spouseName                               varchar(256),
maritalStatus                            varchar(32),
nationality                              varchar(64),
residentStatus                           varchar(32),
occupation                               varchar(128),
monthlyIncome                            numeric(20,6),
photoId                                  jsonb                                                       not null,
eTin                                     varchar(128),
presentAddress                           text,
proofOfAddress                           varchar(64),
permanentAddress                         text,
mobileNo                                 text                                                        not null,
officePhoneNo                            varchar(64),
residencePhoneNo                         varchar(64),
email                                    varchar(128),
emergencyContactJson                     text,
reverseRelation                          text,
photoPath                                varchar(1024)                                               not null,
proofOfAddressPhotoPath                  varchar(1024),
traceId                                  varchar(128)                                                not null,
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
applicationDate                          date,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
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
constraint                               pk_OtcPerson                                                primary key    (oid),
constraint                               u_personId_OtcPerson                                        unique         (personId),
constraint                               ck_gender_OtcPerson                                         check          (gender = 'Male' or gender = 'Female' or gender = 'Other'),
constraint                               ck_status_OtcPerson                                         check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationReceived' or status = 'ApplicationRejected'),
constraint                               ck_isApproverRemarks_OtcPerson                              check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_OtcPerson                                    check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated person information
oid                                      : Surrogate primary key
senderId                                 : Id of person
personOid                                : Id of person
title                                    : Title of person
fullName                                 : Person full name
firstName                                : Person first name
middleName                               : Person middle name
lastName                                 : Person last name
gender                                   : Gender of person. eg. MALE, FEMALE, OTHERS
dateOfBirth                              : Person date of birth
placeOfBirth                             : Person birth place
countryOfBirth                           : Person birth country
fatherName                               : Person father name
motherName                               : Person mother name
spouseName                               : Person spouse name
maritalStatus                            : Marital status of person
nationality                              : Nationality of person
residentStatus                           : resident of person i.e: BD
residenceCountry                         : Person occupation
residenceCity                            : Income of a month
occupation                               : Photo Id type means - NID, PassportNo, BirthCertificate, DrivingLicense
monthlyIncome                            : Number of photo id
photoIdType                              : Issue date of photo id
photoIdNo                                : Expire date of photo id
photoIdIssuanceDate                      : If extra photo id provide
photoIdExpirationDate                    : Electronic Tax Identification Number
otherPhotoIdJson                         : Person present address
eTin                                     : PersonProof of address
presentAddress                           : PersonProof of address
permanentAddress                         : Person permanent address
isMobileNoVerified                       : Dose mobile number verified by sending sms
mobileNo                                 : Person mobile no
otherMobileNo                            : Person office phone number
officePhoneNo                            : Person residence phone number
residencePhoneNo                         : Person email id
email                                    : If in emergency need to contact
emergencyContactJson                     : 
photoPath                                : Where image will be saved
photoIdPathFront                         : Where image will be saved
photoIdPathBack                          : Where image will be saved
presentAddressOverseas                   : Person present Address Overseas
mobileNoOverseas                         : Person present Address Overseas
traceId                                  : Unique id to trace this request
currentVersion                           : Contain current live version number
cbsCurrentVersion                        : CBS current version of data
status                                   : Status of person
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. Its will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. Its will be Yes or No
applicationDate                          : Request Date of application 
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
dataUpdatedBy                            : Who (which login) Update the record
dataUpdatedOn                            : When the record was update
dataUpdateApprovedBy                     : Who (which login) approved the record for data updating
dataUpdateApprovedOn                     : When data updating was approved
bankApprovedBy                           : Who (which login) approved the record
bankApprovedOn                           : When the record was approved
bankApprovalAuthorizedBy                 : Who (which login) Authorized the record
bankApprovalAuthorizedOn                 : When the record was bank Approval Authorized
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
applicationRejectedBy                    : Who (which login) reject the application the record
applicationRejectedOn                    : When the record was application Rejected
applicationRejectionReason               : Will store the rejection reason
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Store the closing reason
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Store the deletion reason
*/
create table                             RemittanceSender
(
oid                                      varchar(128)                                                not null,
senderId                                 varchar(128)                                                not null,
personOid                                varchar(128)                                                not null,
title                                    varchar(256)                                                not null,
fullName                                 varchar(256)                                                not null,
firstName                                varchar(256),
middleName                               varchar(256),
lastName                                 varchar(256),
gender                                   varchar(32)                                                 not null,
dateOfBirth                              date,
placeOfBirth                             varchar(64),
countryOfBirth                           varchar(64),
fatherName                               varchar(64),
motherName                               varchar(64),
spouseName                               varchar(256),
maritalStatus                            varchar(256),
nationality                              varchar(256),
residentStatus                           varchar(32),
residenceCountry                         varchar(256),
residenceCity                            varchar(256),
occupation                               varchar(256),
monthlyIncome                            numeric(8,2),
photoIdType                              varchar(128),
photoIdNo                                varchar(128),
photoIdIssuanceDate                      date,
photoIdExpirationDate                    date,
otherPhotoIdJson                         text,
eTin                                     varchar(128),
presentAddress                           text,
permanentAddress                         varchar,
isMobileNoVerified                       varchar(16),
mobileNo                                 varchar(128),
otherMobileNo                            text,
officePhoneNo                            varchar(128),
residencePhoneNo                         varchar(128),
email                                    varchar(128),
emergencyContactJson                     text,
photoPath                                varchar(512),
photoIdPathFront                         varchar(512),
photoIdPathBack                          varchar(512),
presentAddressOverseas                   text,
mobileNoOverseas                         varchar(512),
traceId                                  varchar(128)                                                not null,
currentVersion                           numeric(8,0),
cbsCurrentVersion                        numeric(8,0),
status                                   varchar(128),
editedBy                                 varchar(128),
editedOn                                 timestamp,
approvedBy                               varchar(128),
approvedOn                               timestamp,
remarkedBy                               varchar(128),
remarkedOn                               timestamp,
isApproverRemarks                        varchar(64),
approverRemarks                          text,
isNewRecord                              varchar(64),
applicationDate                          date,
createdBy                                varchar(128)                                                not null,
createdOn                                timestamp                                                   not null,
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
constraint                               pk_RemittanceSender                                         primary key    (oid),
constraint                               u_senderId_RemittanceSender                                 unique         (senderId),
constraint                               ck_gender_RemittanceSender                                  check          (gender = 'Male' or gender = 'Female' or gender = 'Other'),
constraint                               ck_residentStatus_RemittanceSender                          check          (residentStatus = 'Yes' or residentStatus = 'No')
);


