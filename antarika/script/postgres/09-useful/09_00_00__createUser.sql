------------------------- Production DB Server -------------------------
-- open terminal login as postgres in operation system
vagrant ssh postgres
sudo su
su - postgres

-- to create data directory for each tablespace
mkdir -p /var/lib/pgsql/10/abs/abstbs
mkdir -p /var/lib/pgsql/10/abs/logtbs_y2016m01
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

-- Create User
create user absprod password 'absprod';
alter user absprod with superuser;

-- Create tablespace from 00-init/

-- Create Database
create database absprod WITH owner=absprod encoding='UTF8' tablespace = abstbs;

-- Create Schema absnew as default, absold
create schema if not exists absnew authorization absprod;
create schema if not exists absold authorization absprod;

-- Rename Schema
alter schema public rename to my_schema;
alter schema original_public rename to public;
