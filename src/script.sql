UPDATE mysql.user SET authentication_string=PASSWORD(''), plugin='mysql_native_password' WHERE User='root' AND Host='localhost';
FLUSH privileges;
