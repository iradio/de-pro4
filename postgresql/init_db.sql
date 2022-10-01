CREATE SCHEMA IF NOT EXISTS stg;
CREATE SCHEMA IF NOT EXISTS ods;
CREATE SCHEMA IF NOT EXISTS dds;
CREATE SCHEMA IF NOT EXISTS cdm;

create table if not exists stg.logs (
   id varchar primary key,
   create_ts timestamp,
   value text
);
