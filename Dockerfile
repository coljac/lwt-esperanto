FROM ubuntu:18.04
MAINTAINER coljac

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y file libargon2-0 libedit2 libexpat1 libgdbm5 libicu60 libmagic-mgc libmagic1 libnuma1 libsqlite3-0 libssl1.1 libxml2 mime-support netbase openssl psmisc tzdata ucf xz-utils
RUN apt-get install -y apache2 apache2-bin apache2-data apache2-utils file libaio1 libapache2-mod-php libapache2-mod-php7.2 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libargon2-0 libasn1-8-heimdal libcgi-fast-perl libcgi-pm-perl libedit2 libencode-locale-perl libevent-core-2.1-6 libexpat1 libfcgi-perl libgdbm-compat4 libgdbm5 libgssapi3-heimdal libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhtml-parser-perl libhtml-tagset-perl libhtml-template-perl libhttp-date-perl libhttp-message-perl libhx509-5-heimdal libicu60 libio-html-perl libkrb5-26-heimdal libldap-2.4-2 libldap-common liblua5.2-0 liblwp-mediatypes-perl libmagic-mgc libmagic1 libnghttp2-14 libnuma1 libperl5.26 libroken18-heimdal libsasl2-2 libsasl2-modules libsasl2-modules-db libsodium23 libsqlite3-0 libssl1.1 libtimedate-perl liburi-perl libwind0-heimdal libwrap0 libxml2 mime-support mysql-client-5.7 mysql-client-core-5.7 mysql-common mysql-server mysql-server-5.7 mysql-server-core-5.7 netbase openssl perl perl-modules-5.26 php-common php-mysql php7.2-cli php7.2-common php7.2-json php7.2-mysql php7.2-opcache php7.2-readline psmisc ssl-cert tzdata ucf xz-utils
RUN apt-get install -y php-mbstring
RUN apt-get install -y python3 python3-pip
RUN pip3 install pandas
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld
RUN cat /etc/mysql/debian.cnf | grep password | awk '{print $3}' | head -1 > pw
COPY src/script.sql script.sql
COPY src/setup.sh setup.sh
COPY src/go.sh /go.sh
COPY src /src
RUN /bin/bash setup.sh

COPY lwt /var/www/html/lwt
RUN chmod -R 755 /var/www/html/lwt                                                                              
RUN rm /var/www/html/index.html                                                                                 

CMD ["/bin/bash", "/go.sh"]

