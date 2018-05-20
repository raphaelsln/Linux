#!/bin/sh

#Instalação do oracle cliente e odbc no zabbix server

#Instalar o oracle instantclient basiclite
rpm -Uvh oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm

#Instalar o oracle instantclient odbc
rpm -Uvh oracle-instantclient12.2-odbc-12.2.0.1.0-2.x86_64.rpm

#Instalar o driver unixodbc
yum install -y unixODBC.x86_64 unixODBC-devel.x86_64

#Configuracao das variaveis de ambiete
export ORACLE_HOME=/usr/lib/oracle/12.2/client64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib
mkdir /etc/zabbix/odbc
touch /etc/zabbix/odbc/tnsnames.ora
export TNS_ADMIN=/etc/zabbix/odbc
echo "" > /etc/odbcinst.ini 
echo "[Oracle]" >> /etc/odbcinst.ini
echo "Description     = Oracle ODBC" >> /etc/odbcinst.ini
echo "Driver          = /usr/lib/oracle/12.2/client64/lib/libsqora.so.12.1" >> /etc/odbcinst.ini
echo "FileUsage       = 1" >> /etc/odbcinst.ini
echo "Driver Logging  = 7" >> /etc/odbcinst.ini
touch /etc/odbc.ini
echo "[odbcoracle]" >> /etc/odbc.ini
echo "Description     = Oracle" >> /etc/odbc.ini
echo "Driver          = Oracle" >> /etc/odbc.ini
echo "ServerName      = ERP" >> /etc/odbc.ini
echo "UserID          = UZABBIX" >> /etc/odbc.ini
echo "Password        = UZABBIX" >> /etc/odbc.ini
