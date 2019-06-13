@echo off
chcp 65001
set truncate="C:\distrib\set script\cascade_scale_tables.sql"
set backup=C:\backup_db\scale_reset\

%set_postgres_bin%\pg_dump.exe -U postgres -Fc -d set > %backup%\set%date%.sql
%set_postgres_bin%\psql.exe -U postgres -d set -f %truncate%
%set_postgres_bin%\vacuumdb.exe -U postgres -f -z set
echo теперь Вам необходимо выгрузить справочник весовых товаров из 1с (1с - номенклатура - весовой товар - выгрузить в SR10)

timeout /t 10 

