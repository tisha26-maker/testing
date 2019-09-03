--DB Migration
------------
-- Take back up of live database
pg_dump -h localhost -U postgres --schema=absnew agrani > /opt/csb/services/db-migration/agraninew.sql

-- find and replace
sed -i 's/search_path = public/search_path = absold/g' agraniold.sql

-- open terminal login as postgres in operation system
vagrant ssh postgres
sudo su
su - postgres

-- to create data directory for each tablespace
mkdir -p /var/lib/pgsql/10/abs/abstbs
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2017m01
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m01
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m02
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m03
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m04
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m05
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m06
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m07
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m08
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m09
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m10
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m11
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2018m12
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m01
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m02
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m03
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m04
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m05
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m06
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m07
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m08
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m09
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m10
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m11
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2019m12

-- login database of postgres using postgres user
vagrant ssh postgres
sudo -u postgres psql -U postgres
-- or
psql -h localhost -U postgres -d postgres


-- Create User
create user absprod password 'absprod';

-- Create Database
create database agrani WITH owner=absprod encoding='UTF8' tablespace = abstbs;

-- grant user permission to database
GRANT all PRIVILEGES on DATABASE agrani to absprod;
ALTER USER absprod with superuser;

-- create two schemas absold and absnew under above database
\q
psql -h localhost -U antarika -d agrani
--need to login new created database
\c agrani
-- Create Schema absnew as default, absold
create schema if not exists absnew authorization absprod;
create schema if not exists absold authorization absprod;
--alter schema absold owner to absprod;

-- copy agraniold.sql from local to server
sudo scp agraniold.sql csb@172.16.110.20:/home/csb/software/db-migration/
ssh csb@172.16.110.20
cd /home/csb/software/db-migration/
sudo scp agraniold.sql vagrant@10.10.0.51:/opt/csb/services/db-migration/


--load back up database to old abs
 \i /opt/csb/services/db-migration/agrani-2018-01-31-000102.sql

-- check flyway.conf
cat flyway.conf
-- check 08-alter all file
-- zip postgres folder
zip -r postgres.zip postgres/*

-- copy postgres.zip from local to server
sudo scp postgres.zip csb@172.16.110.20:/home/csb/software/db-migration/
unzip -d postgres postgres.zip
cd postgres

-- run flyway
flyway clean
flyway migrate

--move migration file from host to guest
ssh csb@172.16.110.20
cd /home/csb/software/db-migration/

sudo scp R08_00_0* vagrant@10.10.0.51:/opt/csb/services/db-migration/


---------------------------------------------------Login in in vm from host machine

[csb@abs ~]$ cd vagrant/
[csb@abs vagrant]$ ssh vagrant@10.10.0.51
[vagrant@abs-prod-postgres-0 ~]$ 
[vagrant@abs-prod-postgres-0 ~]$ cd /opt/csb/services/db-migration/
[vagrant@abs-prod-postgres-0 services]$ ll
sudo su
su - postgres

sudo -u postgres psql -U postgres
total 208
-rw-rw-r--. 1 vagrant vagrant  7437 Jan 25 13:01 R08_00_00__masterData.sql
-rw-rw-r--. 1 vagrant vagrant 30505 Jan 25 13:01 R08_00_01__dbMigration.sql
-rw-rw-r--. 1 vagrant vagrant 43650 Jan 25 13:01 R08_00_02__dbMigration.sql
-rw-rw-r--. 1 vagrant vagrant 53024 Jan 25 13:01 R08_00_03__dbMigration.sql
-rw-rw-r--. 1 vagrant vagrant 37461 Jan 25 13:01 R08_00_04__dbMigration.sql
-rw-rw-r--. 1 vagrant vagrant  8052 Jan 25 13:01 R08_00_05__dbMigration.sql
-rw-rw-r--. 1 vagrant vagrant  9503 Jan 25 13:01 R08_00_06__dbMigration.sql
-rw-rw-r--. 1 vagrant vagrant 11392 Jan 25 13:01 R08_00_07__countQuery.sql

===========Need to change onwership vagrant to postgres=======================

[vagrant@abs-prod-postgres-0 services]$ sudo chown -R postgres:postgres R08_00_0*
[vagrant@abs-prod-postgres-0 services]$ ll
total 208
-rw-rw-r--. 1 postgres postgres  7437 Jan 25 13:01 R08_00_00__masterData.sql
-rw-rw-r--. 1 postgres postgres 30505 Jan 25 13:01 R08_00_01__dbMigration.sql
-rw-rw-r--. 1 postgres postgres 43650 Jan 25 13:01 R08_00_02__dbMigration.sql
-rw-rw-r--. 1 postgres postgres 53024 Jan 25 13:01 R08_00_03__dbMigration.sql
-rw-rw-r--. 1 postgres postgres 37461 Jan 25 13:01 R08_00_04__dbMigration.sql
-rw-rw-r--. 1 postgres postgres  8052 Jan 25 13:01 R08_00_05__dbMigration.sql
-rw-rw-r--. 1 postgres postgres  9503 Jan 25 13:01 R08_00_06__dbMigration.sql

[vagrant@abs-prod-postgres-0 services]$ sudo -u postgres psql -U postgres
psql (10.1)
Type "help" for help.

postgres=# \dn
  List of schemas
  Name  |  Owner   
--------+----------
 public | postgres
(1 row)

postgres=# \c absprod
You are now connected to database "absprod" as user "postgres".
absprod=# \dn
  List of schemas
  Name   |  Owner   
---------+----------
 absdata | absprod
 absnew  | absprod
 absold  | absprod
 abstest | absprod
 public  | postgres
(5 rows)

absprod=# \i /opt/csb/services/db-migration/R08_00_00__masterData.sql 

absprod=# \i /opt/csb/services/db-migration/R08_00_01__dbMigration.sql

absprod=# \i /opt/csb/services/db-migration/R08_00_02__dbMigration.sql

absprod=# \i /opt/csb/services/db-migration/R08_00_03__dbMigration.sql

absprod=# \i /opt/csb/services/db-migration/R08_00_04__dbMigration.sql

absprod=# \i /opt/csb/services/db-migration/R08_00_05__dbMigration.sql

absprod=# \i /opt/csb/services/db-migration/R08_00_06__dbMigration.sql

absprod=# \i /opt/csb/services/db-migration/R08_00_07__countQuery.sql

--



