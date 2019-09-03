/*

traceId                                  : Trace Id of this record
currentVersion                           : Count of how many times a record is being approved. Each count is treated as a new version. Ex: 1,2,......
editCommit                               : Record will show up new for a specific time. Its will be Yes or No
lockedBy                                 : Who (which login) locked the record
lockedOn                                 : When the record was locked
status                                   : Status of PBS Zone Outlet
editedBy                                 : Who (which login) last edited the record
editedOn                                 : When the record was last edited
approvedBy                               : Who (which login) approved the record
approvedOn                               : When the record was approved
remarkedBy                               : Who (which login) remarked the record
remarkedOn                               : When the record was remarked
isApproverRemarks                        : Status if approver add any remarks. It will be Yes or No
approverRemarks                          : Approver remarks for further action
isNewRecord                              : Record will show up new for a specific time. It will be Yes or No
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
activatedBy                              : Who (which login) activated the record
activatedOn                              : When the record was activated
closedBy                                 : Who (which login) closed the record
closedOn                                 : When the record was closed
closingRemark                            : Closing Remarks
deletedBy                                : Who (which login) deleted the record
deletedOn                                : When the record was deleted
*/
create table                             UnAuthOutletTransactionProfile
(
traceId                                  varchar(128),
currentVersion                           varchar(32)                                                 not null,
editCommit                               varchar(32)                                                 not null,
lockedBy                                 varchar(128),
lockedOn                                 timestamp,
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
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
activatedBy                              varchar(128),
activatedOn                              timestamp,
closedBy                                 varchar(128),
closedOn                                 timestamp,
closingRemark                            text,
deletedBy                                varchar(128),
deletedOn                                timestamp,
constraint                               ck_editCommit_UnAuthOutletTransactionProfile                check          (editCommit = 'Yes' or editCommit = 'No'),
constraint                               ck_status_UnAuthOutletTransactionProfile                    check          (status = 'Active' or status = 'Inactive' or status = 'Closed' or status = 'Deleted'),
constraint                               ck_isApproverRemarks_UnAuthOutletTransactionProfile         check          (isApproverRemarks = 'Yes' or isApproverRemarks = 'No'),
constraint                               ck_isNewRecord_UnAuthOutletTransactionProfile               check          (isNewRecord = 'Yes' or isNewRecord = 'No')
);


