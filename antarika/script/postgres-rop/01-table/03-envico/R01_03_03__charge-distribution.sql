/*
SegmentDef is for defining master segments for various types of items (category/dimension) based on what a Charge Model might be defined
For example a charge model may have three different criteria or dimensions like
1. Service Category
2. Agent Outlet Location (Home Agent or Away Agent) 
3. Banking Product

For example a few rules of the charge model may be like this
a) For Fund Transfer through Home agent, no charge will be applicable for Savings Account
b) For Fund Transfer through Away agent, a flat 10 Tk. charge will be applicable for Savings Account
c) For Fund Transfer through Away agent, a flat 0.25% charge will be applicable for Current Account etc.

Here there are three implicit criteria/dimensions Fund Transfer (Service Category) , Current/Savings Account (Product) and Home/Away Agent (Agent Location) 

For each criteria and dimensions there is a SegmentDef. A SegmentDef is essentially denoted by a fixed length number that will actually form part of a resultant key or flex-field

For example if we now define the segments like this
1. Agent Location is a 2 length Segment where 00 means does not matter (catch all) , 01 means Home and 02 means Away
2. Service category is a 4 length Segment where 0000 means does not matter (catch all) , 0001 means Fund Transfer, 0002 means Balance Inquiry
2. Service category is a 3 length Segment where 000 means does not matter (catch all) , 001 means Savings account and 002 means Current account
and we define the SegmentDef order the way it is described, then Charge code/key for the above mentioned charge rules are

a) 01-0001-001: "Fund Transfer through Home agent, no charge will be applicable for Savings Account"
b) 02-0001-001: "Fund Transfer through Away agent, a flat 10 Tk. charge will be applicable for Savings Account"
c) 02-0001-002: "Fund Transfer through Away agent, a flat 0.25% charge will be applicable for Current Account"
oid                                      : Surrogated primary key
segmentId                                : Key for the property
mnemonic                                 : Short name, which will be available to UI and Log stream. Viewer can recognize.
description                              : Details of the Segment Definition
isApplicable                             : Whether this segment is in use or applicable for charge code/key generation
codeLength                               : Fixed length of the geneated code/key for this segment's item. If 2 that means this segment may contain upto 100 items, if 3, then it means that the segment may contain upto 1000 items
orderInCode                              : When generating charge key/code in which order this segment's code will appear in the final resultant key.
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             SegmentDef
(
oid                                      varchar(128)                                                not null,
segmentId                                varchar(128)                                                not null,
mnemonic                                 varchar(256)                                                not null,
description                              text,
isApplicable                             varchar(32)                                                 not null,
codeLength                               numeric(1,0)                                                not null,
orderInCode                              numeric(3,0)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_SegmentDef                                               primary key    (oid),
constraint                               ck_isApplicable_SegmentDef                                  check          (isApplicable = 'Yes' or isApplicable = 'No')
);

/*
SegmentItem are items under each SegmentDef, they are numeric (char-numeric) codes that are constituent items of a SegmentDef
oid                                      : Surrogate primary key - concatenation of segmentDefOid and itemId of this table
segmentDefOid                            : Parent SegmentDef Id
itemId                                   : Char-numeric code of the item - eg. 0, 1, .., 9 ..... 00, 01, .., 99 ..... 000, 001, .., 999 .....
mnemonic                                 : Short name, which will be available to UI and Log stream. Viewer can recognize.
description                              : Details of the Segment Item
isApplicable                             : Whether this item is in use or applicable for charge code/key generation or UI lookup
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             SegmentItem
(
oid                                      varchar(128)                                                not null,
segmentDefOid                            varchar(128)                                                not null,
itemId                                   varchar(128)                                                not null,
mnemonic                                 varchar(256)                                                not null,
description                              text,
isApplicable                             varchar(32)                                                 not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_SegmentItem                                              primary key    (oid),
constraint                               fk_segmentDefOid_SegmentItem                                foreign key    (segmentDefOid)
                                                                                                     references     SegmentDef(oid),
constraint                               ck_isApplicable_SegmentItem                                 check          (isApplicable = 'Yes' or isApplicable = 'No')
);

/*
ChargeModelDef defines a Charge Model, at any point of time one ChargeModel should be active/effective
oid                                      : Surrogate primary key
chargeModelDefName                       : Name of the Charge Model
description                              : Details of the Charge Model
status                                   : Status of this record - Active, Inactive
effectiveFrom                            : Date from which the Charge Model is effective, 2016-01-01 means >= 2016-01-01
effectiveTo                              : Date till which the Charge Model is effective, 2016-01-01 means < 2016-01-01
isDefault                                : Is this model default
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ChargeModelDef
(
oid                                      varchar(128)                                                not null,
chargeModelDefName                       varchar(256)                                                not null,
description                              text,
status                                   varchar(32)                                                 not null,
effectiveFrom                            date                                                        not null,
effectiveTo                              date                                                        not null,
isDefault                                varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ChargeModelDef                                           primary key    (oid),
constraint                               ck_status_ChargeModelDef                                    check          (status = 'Active' or status = 'Inactive'),
constraint                               ck_isDefault_ChargeModelDef                                 check          (isDefault = 'Yes' or isDefault = 'No')
);

/*
ChargeModelItem defines a Charge ModelItem, at any point of time one Charge ModelItem can be active
oid                                      : Surrogate primary key
chargeKey                                : Resultant key generated from segments used to generate this charge item.
chargeModelDefOid                        : Parent Charge Model
valueJson                                : Charge logic in Json schema
rejectionCause                           : Will put a note why reject it
status                                   : Active, Inactive
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ChargeModelItem
(
oid                                      varchar(128)                                                not null,
chargeKey                                varchar(128)                                                not null,
chargeModelDefOid                        varchar(128)                                                not null,
valueJson                                text                                                        not null,
rejectionCause                           text,
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ChargeModelItem                                          primary key    (oid),
constraint                               fk_chargeModelDefOid_ChargeModelItem                        foreign key    (chargeModelDefOid)
                                                                                                     references     ChargeModelDef(oid),
constraint                               ck_status_ChargeModelItem                                   check          (status = 'Active' or status = 'Inactive')
);

/*
ChargeModelItemHistory defines a Charge ModelItem Delete/Close/Cancel History, at any point of time one Charge Model Item can be Delete/Close/Cancel
oid                                      : Surrogate primary key
chargeKey                                : Resultant key generated from segments used to generate this charge item.
chargeModelDefOid                        : Parent Charge Model def Id
chargeModelItemOid                       : Parent Charge Model Item Id
valueJson                                : Charge logic in JSON schema
remarks                                  : Reason of Inactivated, Deleted, Closed, Cancel
status                                   : Status of ChargeModelItem Created, Activated, Inactivated, Deleted, Closed
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
updatedBy                                : Who (which login) last updated the record
updatedOn                                : When the record was last updated
*/
create table                             ChargeModelItemHistory
(
oid                                      varchar(128)                                                not null,
chargeKey                                varchar(128)                                                not null,
chargeModelDefOid                        varchar(128)                                                not null,
chargeModelItemOid                       varchar(128)                                                not null,
valueJson                                text                                                        not null,
remarks                                  text,
status                                   varchar(32),
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
updatedBy                                varchar(128),
updatedOn                                timestamp,
constraint                               pk_ChargeModelItemHistory                                   primary key    (oid),
constraint                               ck_status_ChargeModelItemHistory                            check          (status = 'Active' or status = 'Inactive')
);


