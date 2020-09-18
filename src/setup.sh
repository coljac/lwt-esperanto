#!/bin/bash

/bin/bash -c "/usr/bin/mysqld_safe > /dev/null &"                                                                
sleep 5                                                                                                          
mysql -u debian-sys-maint -p$(cat pw) < script.sql
mysql -u root < /src/lwt.sql

