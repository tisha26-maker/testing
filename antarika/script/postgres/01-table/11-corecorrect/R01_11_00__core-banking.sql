/*
This table to be used to store request sent by client like abs-service to corecorrect.
oid                                      : Surrogate primary key
requestId                                : Request Id sent to service
requestType                              : Cbs request source constraint
requestTime                              : Timestamp of request
requestDetail                            : Details of the request in Json
requestStatus                            : Association status with system i. e. requestStatus showing for Received  , Processed, FailedProcessed
traceId                                  : Trace Id
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
*/
create table                             CbsRequestLog
(
oid                                      varchar(128)                                                not null,
requestId                                varchar(128)                                                not null,
requestType                              varchar(32)                                                 not null,
requestTime                              timestamp                                                   not null,
requestDetail                            text                                                        not null,
requestStatus                            varchar(32)                                                 not null,
traceId                                  varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
constraint                               ck_requestStatus_CbsRequestLog                              check          (requestStatus = 'Received' or requestStatus = 'Processed' or requestStatus = 'FailedProcessed')
);

/*
This table to be used to store response sent to client like corecorrect to abs-service.
oid                                      : Surrogate primary key
requestId                                : Request Id sent to service
responseTime                             : Timestamp of response
responseDetail                           : Details of the response in Json
responseStatus                           : Association status with system i. e. when responseStatus is received  showing status is  Received,  when responseStatus is Processed  showing status is  Processed, when responseStatus is FailedProcessed  showing status is FailedProcessed
traceId                                  : Trace Id
createdBy                                : Who (which login) created the record
createdOn                                : When the record was created
*/
create table                             CbsResponseLog
(
oid                                      varchar(128)                                                not null,
requestId                                varchar(128)                                                not null,
responseTime                             timestamp,
responseDetail                           text,
responseStatus                           varchar(32)                                                 not null,
traceId                                  varchar(128)                                                not null,
createdBy                                varchar(128)                                                not null       default 'System',
createdOn                                timestamp                                                   not null       default current_timestamp,
constraint                               ck_responseStatus_CbsResponseLog                            check          (responseStatus = 'Received' or responseStatus = 'Processed' or responseStatus = 'FailedProcessed')
);


