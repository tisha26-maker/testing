
-- partition
create table AntarikaRequestLog_y2018m01 partition of AntarikaRequestLog for values from ('2018-01-01') TO ('2018-02-01') tablespace logtbs_y2018m01;
create table AntarikaRequestLog_y2018m02 partition of AntarikaRequestLog for values from ('2018-02-01') TO ('2018-03-01') tablespace logtbs_y2018m02;
create table AntarikaRequestLog_y2018m03 partition of AntarikaRequestLog for values from ('2018-03-01') TO ('2018-04-01') tablespace logtbs_y2018m03;
create table AntarikaRequestLog_y2018m04 partition of AntarikaRequestLog for values from ('2018-04-01') TO ('2018-05-01') tablespace logtbs_y2018m04;
create table AntarikaRequestLog_y2018m05 partition of AntarikaRequestLog for values from ('2018-05-01') TO ('2018-06-01') tablespace logtbs_y2018m05;
create table AntarikaRequestLog_y2018m06 partition of AntarikaRequestLog for values from ('2018-06-01') TO ('2018-07-01') tablespace logtbs_y2018m06;
create table AntarikaRequestLog_y2018m07 partition of AntarikaRequestLog for values from ('2018-07-01') TO ('2018-08-01') tablespace logtbs_y2018m07;
create table AntarikaRequestLog_y2018m08 partition of AntarikaRequestLog for values from ('2018-08-01') TO ('2018-09-01') tablespace logtbs_y2018m08;
create table AntarikaRequestLog_y2018m09 partition of AntarikaRequestLog for values from ('2018-09-01') TO ('2018-10-01') tablespace logtbs_y2018m09;
create table AntarikaRequestLog_y2018m10 partition of AntarikaRequestLog for values from ('2018-10-01') TO ('2018-11-01') tablespace logtbs_y2018m10;
create table AntarikaRequestLog_y2018m11 partition of AntarikaRequestLog for values from ('2018-11-01') TO ('2018-12-01') tablespace logtbs_y2018m11;
create table AntarikaRequestLog_y2018m12 partition of AntarikaRequestLog for values from ('2018-12-01') TO ('2019-01-01') tablespace logtbs_y2018m12;
create table AntarikaRequestLog_y2019m01 partition of AntarikaRequestLog for values from ('2019-01-01') TO ('2019-02-01') tablespace logtbs_y2019m01;
create table AntarikaRequestLog_y2019m02 partition of AntarikaRequestLog for values from ('2019-02-01') TO ('2019-03-01') tablespace logtbs_y2019m02;
create table AntarikaRequestLog_y2019m03 partition of AntarikaRequestLog for values from ('2019-03-01') TO ('2019-04-01') tablespace logtbs_y2019m03;
create table AntarikaRequestLog_y2019m04 partition of AntarikaRequestLog for values from ('2019-04-01') TO ('2019-05-01') tablespace logtbs_y2019m04;
create table AntarikaRequestLog_y2019m05 partition of AntarikaRequestLog for values from ('2019-05-01') TO ('2019-06-01') tablespace logtbs_y2019m05;
create table AntarikaRequestLog_y2019m06 partition of AntarikaRequestLog for values from ('2019-06-01') TO ('2019-07-01') tablespace logtbs_y2019m06;
create table AntarikaRequestLog_y2019m07 partition of AntarikaRequestLog for values from ('2019-07-01') TO ('2019-08-01') tablespace logtbs_y2019m07;
create table AntarikaRequestLog_y2019m08 partition of AntarikaRequestLog for values from ('2019-08-01') TO ('2019-09-01') tablespace logtbs_y2019m08;
create table AntarikaRequestLog_y2019m09 partition of AntarikaRequestLog for values from ('2019-09-01') TO ('2019-10-01') tablespace logtbs_y2019m09;
create table AntarikaRequestLog_y2019m10 partition of AntarikaRequestLog for values from ('2019-10-01') TO ('2019-11-01') tablespace logtbs_y2019m10;
create table AntarikaRequestLog_y2019m11 partition of AntarikaRequestLog for values from ('2019-11-01') TO ('2019-12-01') tablespace logtbs_y2019m11;
create table AntarikaRequestLog_y2019m12 partition of AntarikaRequestLog for values from ('2019-12-01') TO ('2020-01-01') tablespace logtbs_y2019m12;

-- index on requestReceivedOn
create index AntarikaRequestLog_y2018m01_requestReceivedOn on AntarikaRequestLog_y2018m01 (requestReceivedOn);
create index AntarikaRequestLog_y2018m02_requestReceivedOn on AntarikaRequestLog_y2018m02 (requestReceivedOn);
create index AntarikaRequestLog_y2018m03_requestReceivedOn on AntarikaRequestLog_y2018m03 (requestReceivedOn);
create index AntarikaRequestLog_y2018m04_requestReceivedOn on AntarikaRequestLog_y2018m04 (requestReceivedOn);
create index AntarikaRequestLog_y2018m05_requestReceivedOn on AntarikaRequestLog_y2018m05 (requestReceivedOn);
create index AntarikaRequestLog_y2018m06_requestReceivedOn on AntarikaRequestLog_y2018m06 (requestReceivedOn);
create index AntarikaRequestLog_y2018m07_requestReceivedOn on AntarikaRequestLog_y2018m07 (requestReceivedOn);
create index AntarikaRequestLog_y2018m08_requestReceivedOn on AntarikaRequestLog_y2018m08 (requestReceivedOn);
create index AntarikaRequestLog_y2018m09_requestReceivedOn on AntarikaRequestLog_y2018m09 (requestReceivedOn);
create index AntarikaRequestLog_y2018m10_requestReceivedOn on AntarikaRequestLog_y2018m10 (requestReceivedOn);
create index AntarikaRequestLog_y2018m11_requestReceivedOn on AntarikaRequestLog_y2018m11 (requestReceivedOn);
create index AntarikaRequestLog_y2018m12_requestReceivedOn on AntarikaRequestLog_y2018m12 (requestReceivedOn);
create index AntarikaRequestLog_y2019m01_requestReceivedOn on AntarikaRequestLog_y2019m01 (requestReceivedOn);
create index AntarikaRequestLog_y2019m02_requestReceivedOn on AntarikaRequestLog_y2019m02 (requestReceivedOn);
create index AntarikaRequestLog_y2019m03_requestReceivedOn on AntarikaRequestLog_y2019m03 (requestReceivedOn);
create index AntarikaRequestLog_y2019m04_requestReceivedOn on AntarikaRequestLog_y2019m04 (requestReceivedOn);
create index AntarikaRequestLog_y2019m05_requestReceivedOn on AntarikaRequestLog_y2019m05 (requestReceivedOn);
create index AntarikaRequestLog_y2019m06_requestReceivedOn on AntarikaRequestLog_y2019m06 (requestReceivedOn);
create index AntarikaRequestLog_y2019m07_requestReceivedOn on AntarikaRequestLog_y2019m07 (requestReceivedOn);
create index AntarikaRequestLog_y2019m08_requestReceivedOn on AntarikaRequestLog_y2019m08 (requestReceivedOn);
create index AntarikaRequestLog_y2019m09_requestReceivedOn on AntarikaRequestLog_y2019m09 (requestReceivedOn);
create index AntarikaRequestLog_y2019m10_requestReceivedOn on AntarikaRequestLog_y2019m10 (requestReceivedOn);
create index AntarikaRequestLog_y2019m11_requestReceivedOn on AntarikaRequestLog_y2019m11 (requestReceivedOn);
create index AntarikaRequestLog_y2019m12_requestReceivedOn on AntarikaRequestLog_y2019m12 (requestReceivedOn);

-- index on oid
create index AntarikaRequestLog_y2018m01_oid on AntarikaRequestLog_y2018m01 (oid);
create index AntarikaRequestLog_y2018m02_oid on AntarikaRequestLog_y2018m02 (oid);
create index AntarikaRequestLog_y2018m03_oid on AntarikaRequestLog_y2018m03 (oid);
create index AntarikaRequestLog_y2018m04_oid on AntarikaRequestLog_y2018m04 (oid);
create index AntarikaRequestLog_y2018m05_oid on AntarikaRequestLog_y2018m05 (oid);
create index AntarikaRequestLog_y2018m06_oid on AntarikaRequestLog_y2018m06 (oid);
create index AntarikaRequestLog_y2018m07_oid on AntarikaRequestLog_y2018m07 (oid);
create index AntarikaRequestLog_y2018m08_oid on AntarikaRequestLog_y2018m08 (oid);
create index AntarikaRequestLog_y2018m09_oid on AntarikaRequestLog_y2018m09 (oid);
create index AntarikaRequestLog_y2018m10_oid on AntarikaRequestLog_y2018m10 (oid);
create index AntarikaRequestLog_y2018m11_oid on AntarikaRequestLog_y2018m11 (oid);
create index AntarikaRequestLog_y2018m12_oid on AntarikaRequestLog_y2018m12 (oid);
create index AntarikaRequestLog_y2019m01_oid on AntarikaRequestLog_y2019m01 (oid);
create index AntarikaRequestLog_y2019m02_oid on AntarikaRequestLog_y2019m02 (oid);
create index AntarikaRequestLog_y2019m03_oid on AntarikaRequestLog_y2019m03 (oid);
create index AntarikaRequestLog_y2019m04_oid on AntarikaRequestLog_y2019m04 (oid);
create index AntarikaRequestLog_y2019m05_oid on AntarikaRequestLog_y2019m05 (oid);
create index AntarikaRequestLog_y2019m06_oid on AntarikaRequestLog_y2019m06 (oid);
create index AntarikaRequestLog_y2019m07_oid on AntarikaRequestLog_y2019m07 (oid);
create index AntarikaRequestLog_y2019m08_oid on AntarikaRequestLog_y2019m08 (oid);
create index AntarikaRequestLog_y2019m09_oid on AntarikaRequestLog_y2019m09 (oid);
create index AntarikaRequestLog_y2019m10_oid on AntarikaRequestLog_y2019m10 (oid);
create index AntarikaRequestLog_y2019m11_oid on AntarikaRequestLog_y2019m11 (oid);
create index AntarikaRequestLog_y2019m12_oid on AntarikaRequestLog_y2019m12 (oid);