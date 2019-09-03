/*
This table to be used to store associated person information
oid                                      : Surrogate primary key
title                                    : Title of person
fullName                                 : Person full name
firstName                                : Person first name
middleName                               : Person middle name
lastName                                 : Person last name
gender                                   : Gender of person. eg. Male, Female, Others
dateOfBirth                              : Person date of birth
placeOfBirth                             : Person birth place
countryOfBirth                           : Person birth country
fatherName                               : Person father name
motherName                               : Person mother name
spouseName                               : Person spouse name
maritalStatus                            : Marital status - MARRIED, SINGLE, DIVORCED, WIDOWED, OTHER, PARTNER 
nationality                              : Nationality of person
residentStatus                           : Where person live.
occupation                               : Person occupation
monthlyIncome                            : Income of a month
photoIdType                              : Photo Id type means - NID, Passport, Birth Certificate
photoIdNo                                : Number of photo id
photoIdIssuanceDate                      : Issue date of photo id
photoIdExpirationDate                    : Expire date of photo id
otherPhotoIdJson                         : If extra photo id provide
eTin                                     : Etin number
presentAddress                           : Person present address
proofOfAddress                           : Proof of address
permanentAddress                         : Person pernament address
isMobileNoVerified                       : Dose mobile number verified by sending sms
mobileNo                                 : Person mobile no
officePhoneNo                            : Person office phone number
residencePhoneNo                         : Person residence phone number
email                                    : Person email id
emergencyContactJson                     : If in emergency need to contact
reverseRelation                          : if a person have multiple relation like customer, agent ..will store the relation
photoPath                                : Where image will be saved
photoIdPathFront                         : Where image will be saved
photoIdPathBack                          : Where image will be saved
proofOfAddressPhotoPath                  : Where image will be saved
socialMediaLink                          : Person's social media link
traceId                                  : Unique id to trace this request
fingerprintJson                          : Json with person fingerprint info
imageDataFlag                            : This an flag for image is saved or not
fpDataFlag                               : This an flag fingerprint is saved or not
personDataFlag                           : This an flag person information is saved or not
draftSavedBy                             : who (which login) drafted the record
draftSavedOn                             : when the record was drafted
*/
create table                             DraftPerson
(
oid                                      varchar(128)                                                not null,
title                                    varchar(256),
fullName                                 varchar(256),
firstName                                varchar(256),
middleName                               varchar(256),
lastName                                 varchar(256),
gender                                   varchar(32),
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
photoIdType                              varchar(32),
photoIdNo                                varchar(128),
photoIdIssuanceDate                      date,
photoIdExpirationDate                    date,
otherPhotoIdJson                         text,
eTin                                     varchar(128),
presentAddress                           text,
proofOfAddress                           varchar(64),
permanentAddress                         text,
isMobileNoVerified                       varchar(32),
mobileNo                                 varchar(64),
officePhoneNo                            varchar(64),
residencePhoneNo                         varchar(64),
email                                    varchar(128),
emergencyContactJson                     text,
reverseRelation                          text,
photoPath                                varchar(1024),
photoIdPathFront                         varchar(1024),
photoIdPathBack                          varchar(1024),
proofOfAddressPhotoPath                  varchar(1024),
socialMediaLink                          text,
traceId                                  varchar(128),
fingerprintJson                          text,
imageDataFlag                            varchar(32),
fpDataFlag                               varchar(32),
personDataFlag                           varchar(32),
draftSavedBy                             varchar(128)                                                not null       default 'System',
draftSavedOn                             timestamp                                                   not null       default current_timestamp,
constraint                               pk_DraftPerson                                              primary key    (oid),
constraint                               ck_gender_DraftPerson                                       check          (gender = 'Male' or gender = 'Female' or gender = 'Other'),
constraint                               ck_maritalStatus_DraftPerson                                check          (maritalStatus = 'Married' or maritalStatus = 'Single' or maritalStatus = 'Divorced' or maritalStatus = 'Widowed' or maritalStatus = 'Other' or maritalStatus = 'Partner'),
constraint                               ck_photoIdType_DraftPerson                                  check          (photoIdType = 'NID' or photoIdType = 'PassportNo' or photoIdType = 'BirthCertificate' or photoIdType = 'DrivingLicense' or photoIdType = 'VoterId'),
constraint                               ck_isMobileNoVerified_DraftPerson                           check          (isMobileNoVerified = 'Yes' or isMobileNoVerified = 'No'),
constraint                               ck_imageDataFlag_DraftPerson                                check          (imageDataFlag = 'Yes' or imageDataFlag = 'No'),
constraint                               ck_fpDataFlag_DraftPerson                                   check          (fpDataFlag = 'Yes' or fpDataFlag = 'No'),
constraint                               ck_personDataFlag_DraftPerson                               check          (personDataFlag = 'Yes' or personDataFlag = 'No')
);

/*
This table to be used to store associated person information
oid                                      : Surrogate primary key
personId                                 : Id of person
title                                    : Title of person
fullName                                 : Person full name
firstName                                : Person first name
middleName                               : Person middle name
lastName                                 : Person last name
gender                                   : Gender of person. eg. Male, Female, Others
dateOfBirth                              : Person date of birth
placeOfBirth                             : Person birth place
countryOfBirth                           : Person birth country
fatherName                               : Person father name
motherName                               : Person mother name
spouseName                               : Person spouse name
maritalStatus                            : Marital status
nationality                              : Nationality of person
residentStatus                           : Resident of person
occupation                               : Person occupation
monthlyIncome                            : Income of a month
photoIdType                              : Photo Id type means - NID, Passport, Birth Certificate
photoIdNo                                : Number of photo id
photoIdIssuanceDate                      : Issue date of photo id
photoIdExpirationDate                    : Expire date of photo id
otherPhotoIdJson                         : If extra photo id provide
eTin                                     : Etin number
presentAddress                           : Person present address
proofOfAddress                           : Proof of address
permanentAddress                         : Person pernament address
isMobileNoVerified                       : Dose mobile number verified by sending sms
mobileNo                                 : Person mobile no
officePhoneNo                            : Person office phone number
residencePhoneNo                         : Person residence phone number
email                                    : Person email id
emergencyContactJson                     : If in emergency need to contact
reverseRelation                          : if a person have multiple relation like customer, agent ..will store the relation
photoPath                                : Where image will be saved
photoIdPathFront                         : Where image will be saved
photoIdPathBack                          : Where image will be saved
proofOfAddressPhotoPath                  : Where image will be saved
socialMediaLink                          : Person's social media link
traceId                                  : Unique id to trace this request
currentVersion                           : Json with person fingerprint info
cbsCurrentVersion                        : Current verson of data
status                                   : CBS current version of data
editcommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. Its will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. Its will be Yes or No
applicationDate                          : Date of application
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
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
applicationRejectionReason               : Will store rejection reason
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Will store closing reason
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Store deletion reason
*/
create table                             UnauthPerson
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
photoIdType                              varchar(32)                                                 not null,
photoIdNo                                varchar(128)                                                not null,
photoIdIssuanceDate                      date                                                        not null,
photoIdExpirationDate                    date,
otherPhotoIdJson                         text,
eTin                                     varchar(128),
presentAddress                           text,
proofOfAddress                           varchar(64),
permanentAddress                         text,
isMobileNoVerified                       varchar(32)                                                 not null,
mobileNo                                 varchar(64)                                                 not null,
officePhoneNo                            varchar(64),
residencePhoneNo                         varchar(64),
email                                    varchar(128),
emergencyContactJson                     text,
reverseRelation                          text,
photoPath                                varchar(1024)                                               not null,
photoIdPathFront                         varchar(1024)                                               not null,
photoIdPathBack                          varchar(1024)                                               not null,
proofOfAddressPhotoPath                  varchar(1024),
socialMediaLink                          text,
traceId                                  varchar(128)                                                not null,
currentVersion                           varchar(32)                                                 not null,
cbsCurrentVersion                        varchar(32),
status                                   varchar(32)                                                 not null,
editcommit                               varchar(32),
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
constraint                               pk_UnauthPerson                                             primary key    (oid),
constraint                               u_personId_UnauthPerson                                     unique         (personId),
constraint                               ck_gender_UnauthPerson                                      check          (gender = 'Male' or gender = 'Female' or gender = 'Other'),
constraint                               ck_maritalStatus_UnauthPerson                               check          (maritalStatus = 'Married' or maritalStatus = 'Single' or maritalStatus = 'Divorced' or maritalStatus = 'Widowed' or maritalStatus = 'Other' or maritalStatus = 'Partner'),
constraint                               ck_photoIdType_UnauthPerson                                 check          (photoIdType = 'NID' or photoIdType = 'PassportNo' or photoIdType = 'BirthCertificate' or photoIdType = 'DrivingLicense' or photoIdType = 'VoterId'),
constraint                               ck_isMobileNoVerified_UnauthPerson                          check          (isMobileNoVerified = 'Yes' or isMobileNoVerified = 'No'),
constraint                               ck_status_UnauthPerson                                      check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationReceived' or status = 'ApplicationRejected'),
constraint                               ck_editcommit_UnauthPerson                                  check          (editcommit = 'Yes' or editcommit = 'No'),
constraint                               ck_isApproverRemarks_UnauthPerson                           check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnauthPerson                                 check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

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
photoIdType                              : Photo Id type means - NID, PassportNo, BirthCertificate, DrivingLicense
photoIdNo                                : Number of photo id
photoIdIssuanceDate                      : Issue date of photo id
photoIdExpirationDate                    : Expire date of photo id
otherPhotoIdJson                         : If extra photo id provide
eTin                                     : Electronic Tax Identification Number
presentAddress                           : Person present address
proofOfAddress                           : PersonProof of address
permanentAddress                         : Person permanent address
isMobileNoVerified                       : Dose mobile number verified by sending sms
mobileNo                                 : Person mobile no
officePhoneNo                            : Person office phone number
residencePhoneNo                         : Person residence phone number
email                                    : Person email id
emergencyContactJson                     : If in emergency need to contact
reverseRelation                          : if a person have multiple relation like customer, agent ..will store the relation
photoPath                                : Where image will be saved
photoIdPathFront                         : Where image will be saved
photoIdPathBack                          : Where image will be saved
proofOfAddressPhotoPath                  : Where image will be saved
socialMediaLink                          : Person's social media link
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
create table                             Person
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
photoIdType                              varchar(32)                                                 not null,
photoIdNo                                varchar(128)                                                not null,
photoIdIssuanceDate                      date,
photoIdExpirationDate                    date,
otherPhotoIdJson                         text,
eTin                                     varchar(128),
presentAddress                           text,
proofOfAddress                           varchar(64),
permanentAddress                         text,
isMobileNoVerified                       varchar(32),
mobileNo                                 varchar(64)                                                 not null,
officePhoneNo                            varchar(64),
residencePhoneNo                         varchar(64),
email                                    varchar(128),
emergencyContactJson                     text,
reverseRelation                          text,
photoPath                                varchar(1024)                                               not null,
photoIdPathFront                         varchar(1024),
photoIdPathBack                          varchar(1024),
proofOfAddressPhotoPath                  varchar(1024),
socialMediaLink                          text,
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
constraint                               pk_Person                                                   primary key    (oid),
constraint                               u_personId_Person                                           unique         (personId),
constraint                               ck_gender_Person                                            check          (gender = 'Male' or gender = 'Female' or gender = 'Other'),
constraint                               ck_maritalStatus_Person                                     check          (maritalStatus = 'Married' or maritalStatus = 'Single' or maritalStatus = 'Divorced' or maritalStatus = 'Widowed' or maritalStatus = 'Other' or maritalStatus = 'Partner'),
constraint                               ck_photoIdType_Person                                       check          (photoIdType = 'NID' or photoIdType = 'PassportNo' or photoIdType = 'BirthCertificate' or photoIdType = 'DrivingLicense' or photoIdType = 'VoterId'),
constraint                               ck_isMobileNoVerified_Person                                check          (isMobileNoVerified = 'Yes' or isMobileNoVerified = 'No'),
constraint                               ck_status_Person                                            check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationReceived' or status = 'ApplicationRejected'),
constraint                               ck_isApproverRemarks_Person                                 check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_Person                                       check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table to be used to store associated person information
oid                                      : Surrogate primary key (Combination of liveTable's oid;currentVersion) 
personId                                 : Id of person
title                                    : Title of person
fullName                                 : Person full name
firstName                                : Person first name
middleName                               : Person middle name
lastName                                 : Person last name
gender                                   : Gender of person. eg. Male, Female, Others
dateOfBirth                              : Person date of birth
placeOfBirth                             : Person birth place
countryOfBirth                           : Person birth country
fatherName                               : Person father name
motherName                               : Person mother name
spouseName                               : Person spouse name
maritalStatus                            : Marital status
nationality                              : Nationality of person
residentStatus                           : Resident of person
occupation                               : Person occupation
monthlyIncome                            : Income of a month
photoIdType                              : Photo Id type means - NID, Passport, Birth Certificate
photoIdNo                                : Number of photo id
photoIdIssuanceDate                      : Issue date of photo id
photoIdExpirationDate                    : Expire date of photo id
otherPhotoIdJson                         : If extra photo id provide
eTin                                     : Etin number
presentAddress                           : Person present address
proofOfAddress                           : Proof of address
permanentAddress                         : Person pernament address
isMobileNoVerified                       : Dose mobile number verified by sending sms
mobileNo                                 : Person mobile no
officePhoneNo                            : Person office phone number
residencePhoneNo                         : Person residence phone number
email                                    : Person email id
emergencyContactJson                     : If in emergency need to contact
reverseRelation                          : if a person have multiple relation like customer, agent ..will store the relation
photoPath                                : Where image will be saved
photoIdPathFront                         : Where image will be saved
photoIdPathBack                          : Where image will be saved
proofOfAddressPhotoPath                  : Where image will be saved
socialMediaLink                          : Person's social media link
traceId                                  : Unique id to trace this request
version                                  : Current verson of data
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
applicationDate                          : Date of application
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
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
applicationRejectionreason               : Will store application rejection remarks for further action
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing remark
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
deletionRemark                           : Deletion remark
*/
create table                             PersonHistory
(
oid                                      varchar(128)                                                not null,
personId                                 varchar(128)                                                not null,
title                                    varchar(256)                                                not null,
fullName                                 varchar(256)                                                not null,
firstName                                varchar(256)                                                not null,
middleName                               varchar(256),
lastName                                 varchar(256)                                                not null,
gender                                   varchar(32)                                                 not null,
dateOfBirth                              timestamp,
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
photoIdType                              varchar(32)                                                 not null,
photoIdNo                                varchar(128)                                                not null,
photoIdIssuanceDate                      date                                                        not null,
photoIdExpirationDate                    date,
otherPhotoIdJson                         text,
eTin                                     varchar(128),
presentAddress                           text,
proofOfAddress                           varchar(64),
permanentAddress                         text,
isMobileNoVerified                       varchar(32)                                                 not null,
mobileNo                                 varchar(64)                                                 not null,
officePhoneNo                            varchar(64),
residencePhoneNo                         varchar(64),
email                                    varchar(128),
emergencyContactJson                     text,
reverseRelation                          text,
photoPath                                varchar(1024)                                               not null,
photoIdPathFront                         varchar(1024)                                               not null,
photoIdPathBack                          varchar(1024)                                               not null,
proofOfAddressPhotoPath                  varchar(1024),
socialMediaLink                          text,
traceId                                  varchar(128)                                                not null,
version                                  varchar(64)                                                 not null,
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
applicationRejectionreason               text,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
deletionRemark                           text,
constraint                               pk_PersonHistory                                            primary key    (oid),
constraint                               ck_gender_PersonHistory                                     check          (gender = 'Male' or gender = 'Female' or gender = 'Other'),
constraint                               ck_maritalStatus_PersonHistory                              check          (maritalStatus = 'Married' or maritalStatus = 'Single' or maritalStatus = 'Divorced' or maritalStatus = 'Widowed' or maritalStatus = 'Other' or maritalStatus = 'Partner'),
constraint                               ck_photoIdType_PersonHistory                                check          (photoIdType = 'NID' or photoIdType = 'PassportNo' or photoIdType = 'BirthCertificate' or photoIdType = 'DrivingLicense' or photoIdType = 'VoterId'),
constraint                               ck_isMobileNoVerified_PersonHistory                         check          (isMobileNoVerified = 'Yes' or isMobileNoVerified = 'No'),
constraint                               ck_status_PersonHistory                                     check          (status = 'ApplicationSubmitted' or status = 'DataUpdated' or status = 'BankApproved' or status = 'Inactive' or status = 'Active' or status = 'Closed' or status = 'Deleted' or status = 'Hold' or status = 'ApplicationReceived' or status = 'ApplicationRejected'),
constraint                               ck_isApproverRemarks_PersonHistory                          check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_PersonHistory                                check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);

/*
This table is used to store person fingerprint nformation
oid                                      : Surrogate primary key
identifiyerId                            : A PersonFingerprint associated with system to be identified by 
fpDeviceOid                              : Parent table FpDevice oid
fpDeviceModelOid                         : Parent table FpDeviceModel oid
fpDeviceMnemonic                         : Fingerprint device Mnemonic
clientSideSdk                            : Will store client side sdk version and name
serverSideSdk                            : Will store server side sdk version and name
defaultFinger                            : Will store default fingerprint for a person
fpDetails                                : Will store finger list with status - enrolled or not scanned or finger not present
ri                                       : Will store right index data
rm                                       : Will store right middle data
rt                                       : Will store right thumb data
rr                                       : Will store right ring data
rp                                       : Will store right pinky data
li                                       : Will store left index data
lm                                       : Will store left middle data
lt                                       : Will store left thumb data
lr                                       : Will store left ring data
lp                                       : Will store left pinky data
riMetaData                               : Will store json, metadata for right index like {"fpdQuality":2,"fpdScore":78}
rmMetaData                               : Will store json, metadata for right middle like {"fpdQuality":2,"fpdScore":78}
rtMetaData                               : Will store json, metadata for right thumb like {"fpdQuality":2,"fpdScore":78}
rrMetaData                               : Will store json, metadata for right ring like {"fpdQuality":2,"fpdScore":78}
rpMetaData                               : Will store json, metadata for right pinky like {"fpdQuality":2,"fpdScore":78}
liMetaData                               : Will store json, metadata for left index like {"fpdQuality":2,"fpdScore":78}
lmMetaData                               : Will store json, metadata for left middle like {"fpdQuality":2,"fpdScore":78}
ltMetaData                               : Will store json, metadata for left thumb like {"fpdQuality":2,"fpdScore":78}
lrMetaData                               : Will store json, metadata for left ring like {"fpdQuality":2,"fpdScore":78}
lpMetaData                               : Will store json, metadata for left pinky like {"fpdQuality":2,"fpdScore":78}
makerId                                  : Who (which login) made the record
checkerId                                : Who (which login) checked the record
approverId                               : Who (which login) approved the record
rejectionCause                           : Note for rejection reason
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             PersonFingerprint
(
oid                                      varchar(128)                                                not null,
identifiyerId                            varchar(128)                                                not null,
fpDeviceOid                              varchar(128)                                                not null,
fpDeviceModelOid                         varchar(128)                                                not null,
fpDeviceMnemonic                         varchar(64),
clientSideSdk                            varchar(256),
serverSideSdk                            varchar(256),
defaultFinger                            varchar(256),
fpDetails                                text                                                        not null,
ri                                       text                                                        not null,
rm                                       text                                                        not null,
rt                                       text                                                        not null,
rr                                       text                                                        not null,
rp                                       text                                                        not null,
li                                       text                                                        not null,
lm                                       text                                                        not null,
lt                                       text                                                        not null,
lr                                       text                                                        not null,
lp                                       text                                                        not null,
riMetaData                               text                                                        not null,
rmMetaData                               text                                                        not null,
rtMetaData                               text                                                        not null,
rrMetaData                               text                                                        not null,
rpMetaData                               text                                                        not null,
liMetaData                               text                                                        not null,
lmMetaData                               text                                                        not null,
ltMetaData                               text                                                        not null,
lrMetaData                               text                                                        not null,
lpMetaData                               text                                                        not null,
makerId                                  varchar(128)                                                not null,
checkerId                                varchar(128),
approverId                               varchar(128),
rejectionCause                           text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_PersonFingerprint                                        primary key    (oid),
constraint                               fk_fpDeviceOid_PersonFingerprint                            foreign key    (fpDeviceOid)
                                                                                                     references     FpDevice(oid),
constraint                               fk_fpDeviceModelOid_PersonFingerprint                       foreign key    (fpDeviceModelOid)
                                                                                                     references     FpDeviceModel(oid)
);

/*
This table is used to store otc custome fingerprint info
oid                                      : Surrogate primary key
identifiyerId                            : A PersonFingerprint associated with system to be identified by 
fpDeviceOid                              : Parent table FpDevice oid
fpDeviceModelOid                         : Parent table FpDeviceModel oid
fpDeviceMnemonic                         : Fingerprint device Mnemonic
clientSideSdk                            : Will store client side sdk version and name
serverSideSdk                            : Will store server side sdk version and name
defaultFinger                            : Will store default fingerprint for a person
fpDetails                                : Will store finger list with status - enrolled ro not scanned or finger not present
ri                                       : Will store right index data
rm                                       : Will store right middle data
rt                                       : Will store right thumb data
rr                                       : Will store right ring data
rp                                       : Will store right pinky data
li                                       : Will store left index data
lm                                       : Will store left middle data
lt                                       : Will store left thumb data
lr                                       : Will store left ring data
lp                                       : Will store left pinky data
riMetaData                               : Will store json, metadata for right index like {"fpdQuality":2,"fpdScore":78}
rmMetaData                               : Will store json, metadata for right middle like {"fpdQuality":2,"fpdScore":78}
rtMetaData                               : Will store json, metadata for right thumb like {"fpdQuality":2,"fpdScore":78}
rrMetaData                               : Will store json, metadata for right ring like {"fpdQuality":2,"fpdScore":78}
rpMetaData                               : Will store json, metadata for right pinky like {"fpdQuality":2,"fpdScore":78}
liMetaData                               : Will store json, metadata for left index like {"fpdQuality":2,"fpdScore":78}
lmMetaData                               : Will store json, metadata for left middle like {"fpdQuality":2,"fpdScore":78}
ltMetaData                               : Will store json, metadata for left thumb like {"fpdQuality":2,"fpdScore":78}
lrMetaData                               : Will store json, metadata for left ring like {"fpdQuality":2,"fpdScore":78}
lpMetaData                               : Will store json, metadata for left pinky like {"fpdQuality":2,"fpdScore":78}
makerId                                  : Who (which login) made the record
checkerId                                : Who (which login) checked the record
approverId                               : Who (which login) approved the record
rejectionCause                           : Rejection reason
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             OtcCustomerFingerprint
(
oid                                      varchar(128)                                                not null,
identifiyerId                            varchar(128)                                                not null,
fpDeviceOid                              varchar(128)                                                not null,
fpDeviceModelOid                         varchar(128)                                                not null,
fpDeviceMnemonic                         varchar(64),
clientSideSdk                            varchar(256),
serverSideSdk                            varchar(256),
defaultFinger                            varchar(16)                                                 not null,
fpDetails                                text                                                        not null,
ri                                       text                                                        not null,
rm                                       text                                                        not null,
rt                                       text                                                        not null,
rr                                       text                                                        not null,
rp                                       text                                                        not null,
li                                       text                                                        not null,
lm                                       text                                                        not null,
lt                                       text                                                        not null,
lr                                       text                                                        not null,
lp                                       text                                                        not null,
riMetaData                               text                                                        not null,
rmMetaData                               text                                                        not null,
rtMetaData                               text                                                        not null,
rrMetaData                               text                                                        not null,
rpMetaData                               text                                                        not null,
liMetaData                               text                                                        not null,
lmMetaData                               text                                                        not null,
ltMetaData                               text                                                        not null,
lrMetaData                               text                                                        not null,
lpMetaData                               text                                                        not null,
makerId                                  varchar(128)                                                not null,
checkerId                                varchar(128),
approverId                               varchar(128),
rejectionCause                           text,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_OtcCustomerFingerprint                                   primary key    (oid),
constraint                               fk_fpDeviceOid_OtcCustomerFingerprint                       foreign key    (fpDeviceOid)
                                                                                                     references     FpDevice(oid),
constraint                               fk_fpDeviceModelOid_OtcCustomerFingerprint                  foreign key    (fpDeviceModelOid)
                                                                                                     references     FpDeviceModel(oid)
);

/*
This table is used to store person fingerprint log info
oid                                      : Surrogate primary key
personFingerprintOid                     : A PersonFingerprintLog associated with system to be identified by 
identifiyerId                            : A PersonFingerprint associated with system to be identified by 
changeFromFinger                         : Changed from finger
changeToFinger                           : Changed to finger
changeReason                             : Reason for change
applyDate                                : Application date
changeDate                               : Date of change
status                                   : Associated status: Active, Inactive, Made, Approved, Edit, Rejected, Closed, Canceled
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             PersonFingerprintLog
(
oid                                      varchar(128)                                                not null,
personFingerprintOid                     varchar(128)                                                not null,
identifiyerId                            varchar(128),
changeFromFinger                         text                                                        not null,
changeToFinger                           text                                                        not null,
changeReason                             text                                                        not null,
applyDate                                date                                                        not null,
changeDate                               date,
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               ck_status_PersonFingerprintLog                              check          (status = 'Active' or status = 'Inactive' or status = 'Made' or status = 'Approved' or status = 'Edit' or status = 'Rejected' or status = 'Closed' or status = 'Canceled')
) partition by range (createdOn);


