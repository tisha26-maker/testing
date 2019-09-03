/*
This table to be used to store Utility Bill Collection data
oid                                      : Bill Collection oid generated by system
csbRequestId                             : Request Id for csb system
cbsReferanceId                           : CBS response Id.
traceId                                  : CSB trace Id
utilityProviderClassOid                  : Oid of UtilityProviderClass table
utilityProviderOid                       : Oid of UtilityProvider table
utilityProviderAreaOid                   : Oid of UtilityProviderArea table
utilityProviderZoneOid                   : Oid of UtilityProviderZone table
utilityCustomerOid                       : Id of UtilityProvider Customer
utilityCustomerType                      : Type of UtilityProvider Customer
utilityBillDepositorOid                  : Bill Depositor Id
utilityBillDepositorMobileNo             : Customer Mobile Number
billReferenceNumber                      : Trace ID for bill reference number at agent point.
billDetailsJson                          : Bill details in json
netBillAmount                            : Net bill amount
paymentType                              : Payment Type Cash (CASH) , Account (ACCOUNT) 
paymentBankAccountNo                     : Customer account number provided by utility company
status                                   : Status showing active for active UtilityBillCollection, inactive for inactive UtilityBillCollection, ApplicationSubmitted for ApplicationSubmitted UtilityBillCollection, BankMade for BankMade UtilityBillCollection,  BankApproved for BankApproved UtilityBillCollection,  Cancel for Cancel UtilityBillCollection,  ApplicationRjected for ApplicationRjected UtilityBillCollection,  InEditable for InEditable UtilityBillCollection, of this record
submitterId                              : User id, who submited this bill from mobile app
agentOid                                 : Parent table Agent oid
servicePointOid                          : Parent table ServicePoint  oid
branchOid                                : Parent table Branch oid
bankOid                                  : Parent table Bank oid
submittedOn                              : In which date bill submitted
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             UtilityBillCollection
(
oid                                      varchar(128)                                                not null,
csbRequestId                             varchar(128),
cbsReferanceId                           varchar(128),
traceId                                  varchar(128)                                                not null,
utilityProviderClassOid                  varchar(128)                                                not null,
utilityProviderOid                       varchar(128)                                                not null,
utilityProviderAreaOid                   varchar(128)                                                not null,
utilityProviderZoneOid                   varchar(128)                                                not null,
utilityCustomerOid                       varchar(128)                                                not null,
utilityCustomerType                      varchar(32),
utilityBillDepositorOid                  varchar(128),
utilityBillDepositorMobileNo             varchar(64),
billReferenceNumber                      varchar(128),
billDetailsJson                          text                                                        not null,
netBillAmount                            numeric(20,6)                                               not null,
paymentType                              varchar(32)                                                 not null,
paymentBankAccountNo                     varchar(64),
status                                   varchar(32),
submitterId                              varchar(128)                                                not null,
agentOid                                 varchar(128)                                                not null,
servicePointOid                          varchar(128)                                                not null,
branchOid                                varchar(128)                                                not null,
bankOid                                  varchar(128)                                                not null,
submittedOn                              timestamp                                                   not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_UtilityBillCollection                                    primary key    (oid),
constraint                               fk_utilityProviderClassOid_UtilityBillCollection            foreign key    (utilityProviderClassOid)
                                                                                                     references     UtilityProviderClass(oid),
constraint                               fk_utilityProviderOid_UtilityBillCollection                 foreign key    (utilityProviderOid)
                                                                                                     references     UtilityProvider(oid),
constraint                               fk_utilityProviderAreaOid_UtilityBillCollection             foreign key    (utilityProviderAreaOid)
                                                                                                     references     UtilityProviderArea(oid),
constraint                               fk_utilityProviderZoneOid_UtilityBillCollection             foreign key    (utilityProviderZoneOid)
                                                                                                     references     UtilityProviderZone(oid),
constraint                               fk_utilityCustomerOid_UtilityBillCollection                 foreign key    (utilityCustomerOid)
                                                                                                     references     UtilityAccount(oid),
constraint                               ck_utilityCustomerType_UtilityBillCollection                check          (utilityCustomerType = 'Unenrolled' or utilityCustomerType = 'Enrolled'),
constraint                               fk_utilityBillDepositorOid_UtilityBillCollection            foreign key    (utilityBillDepositorOid)
                                                                                                     references     UtilityBillDepositor(oid),
constraint                               ck_paymentType_UtilityBillCollection                        check          (paymentType = 'Cash' or paymentType = 'Account' or paymentType = 'Check'),
constraint                               ck_status_UtilityBillCollection                             check          (status = 'Inactive' or status = 'Active' or status = 'ApplicationSubmitted' or status = 'BankMade' or status = 'BankApproved' or status = 'Cancel' or status = 'ApplicationRjected' or status = 'InEditable'),
constraint                               fk_agentOid_UtilityBillCollection                           foreign key    (agentOid)
                                                                                                     references     Agent(oid)
);


