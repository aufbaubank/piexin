# howto create the dump
```
docker-compose  exec phpipam-mariadb /usr/bin/mysqldump -u phpipam --password=phpipam phpipam > dump.sql
```
