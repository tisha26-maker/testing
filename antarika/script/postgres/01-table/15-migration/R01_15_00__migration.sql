/*
This tabble used to validate migration data
sourceTable                              : Source table. From where data will get
targetTable                              : Target table. In which table data will be inserted
sourceTableCount                         : Source table row count
targetTableCount                         : Target table row count
insertTime                               : When data inserted
updateTime                               : When data updated
*/
create table                             DataValidation
(
sourceTable                              varchar,
targetTable                              varchar,
sourceTableCount                         numeric(20,0),
targetTableCount                         numeric(20,0),
insertTime                               timestamp                                                                  default current_timestamp,
updateTime                               timestamp
);


