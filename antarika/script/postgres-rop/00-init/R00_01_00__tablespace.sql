
-- tablespace of rop
create tablespace roptbs owner postgres location '/opt/PostgreSQL/10/rop/roptbs';

-- tablespace of log
create tablespace logtbs_y2016m01 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2016m01';
create tablespace logtbs_y2018m01 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m01';
create tablespace logtbs_y2018m02 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m02';
create tablespace logtbs_y2018m03 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m03';
create tablespace logtbs_y2018m04 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m04';
create tablespace logtbs_y2018m05 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m05';
create tablespace logtbs_y2018m06 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m06';
create tablespace logtbs_y2018m07 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m07';
create tablespace logtbs_y2018m08 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m08';
create tablespace logtbs_y2018m09 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m09';
create tablespace logtbs_y2018m10 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m10';
create tablespace logtbs_y2018m11 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m11';
create tablespace logtbs_y2018m12 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2018m12';
create tablespace logtbs_y2019m01 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m01';
create tablespace logtbs_y2019m02 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m02';
create tablespace logtbs_y2019m03 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m03';
create tablespace logtbs_y2019m04 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m04';
create tablespace logtbs_y2019m05 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m05';
create tablespace logtbs_y2019m06 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m06';
create tablespace logtbs_y2019m07 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m07';
create tablespace logtbs_y2019m08 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m08';
create tablespace logtbs_y2019m09 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m09';
create tablespace logtbs_y2019m10 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m10';
create tablespace logtbs_y2019m11 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m11';
create tablespace logtbs_y2019m12 owner postgres location '/opt/PostgreSQL/10/rop/logtbs_y2019m12';

sudo mkdir -p /opt/PostgreSQL/10/rop/roptbs
sudo chown postgres:postgres  rop/roptbs


cd /opt/PostgreSQL/10/rop/

sudo mkdir logtbs_y2016m01
sudo mkdir logtbs_y2018m01
sudo mkdir logtbs_y2018m02
sudo mkdir logtbs_y2018m03
sudo mkdir logtbs_y2018m04
sudo mkdir logtbs_y2018m05
sudo mkdir logtbs_y2018m06
sudo mkdir logtbs_y2018m07
sudo mkdir logtbs_y2018m08
sudo mkdir logtbs_y2018m09
sudo mkdir logtbs_y2018m10
sudo mkdir logtbs_y2018m11
sudo mkdir logtbs_y2018m12
sudo mkdir logtbs_y2019m01
sudo mkdir logtbs_y2019m02
sudo mkdir logtbs_y2019m03
sudo mkdir logtbs_y2019m04
sudo mkdir logtbs_y2019m05
sudo mkdir logtbs_y2019m06
sudo mkdir logtbs_y2019m07
sudo mkdir logtbs_y2019m08
sudo mkdir logtbs_y2019m09
sudo mkdir logtbs_y2019m10
sudo mkdir logtbs_y2019m11
sudo mkdir logtbs_y2019m12

sudo chown postgres:postgres logtbs_y2016m01
sudo chown postgres:postgres logtbs_y2018m01
sudo chown postgres:postgres logtbs_y2018m02
sudo chown postgres:postgres logtbs_y2018m03
sudo chown postgres:postgres logtbs_y2018m04
sudo chown postgres:postgres logtbs_y2018m05
sudo chown postgres:postgres logtbs_y2018m06
sudo chown postgres:postgres logtbs_y2018m07
sudo chown postgres:postgres logtbs_y2018m08
sudo chown postgres:postgres logtbs_y2018m09
sudo chown postgres:postgres logtbs_y2018m10
sudo chown postgres:postgres logtbs_y2018m11
sudo chown postgres:postgres logtbs_y2018m12
sudo chown postgres:postgres logtbs_y2019m01
sudo chown postgres:postgres logtbs_y2019m02
sudo chown postgres:postgres logtbs_y2019m03
sudo chown postgres:postgres logtbs_y2019m04
sudo chown postgres:postgres logtbs_y2019m05
sudo chown postgres:postgres logtbs_y2019m06
sudo chown postgres:postgres logtbs_y2019m07
sudo chown postgres:postgres logtbs_y2019m08
sudo chown postgres:postgres logtbs_y2019m09
sudo chown postgres:postgres logtbs_y2019m10
sudo chown postgres:postgres logtbs_y2019m11
sudo chown postgres:postgres logtbs_y2019m12
