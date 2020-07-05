
# Purpose

Trying to install newer mysql-connector-java in this test.

https://centos.pkgs.org/8/mysql-connectors-x86_64/mysql-connector-java-8.0.20-1.el8.noarch.rpm.html



# Error

Dockerfile
```
RUN  dnf -y update
RUN  dnf --enablerepo=mysql-connectors-communityinstall mysql-connector-java

```
Error
```
Step 3/3 : RUN  dnf --enablerepo=mysql-connectors-communityinstall mysql-connector-java
 ---> Running in 32658edbf4b9
No such command: mysql-connector-java. Please use /usr/bin/dnf --help
It could be a DNF plugin command, try: "dnf install 'dnf-command(mysql-connector-java)'"
ERROR: Service 'cent' failed to build: The command '/bin/sh -c dnf --enablerepo=mysql-connectors-communityinstall mysql-connector-java' returned a non-zero code: 1
albe@vamp398:/srv/dkr/472dkrcollection/centosb$
```


## Web search

No such command: mysql-connector-java. Please use /usr/bin/dnf --help It could be a DNF plugin command, try: dnf install dnf-command(mysql-connector-java)


# Ref Info

Symmetricds has mysql-connector-java 5.1.45. 
It won't work with mysql 5.7 or 8.0.
It does work with mysql 5.6.42.


https://sourceforge.net/p/symmetricds/discussion/739235/thread/91a740b532/


# 2.

worked.

    dnf install -y wget

    https://dev.mysql.com/doc/mysql-repo-excerpt/5.7/en/linux-installation-yum-repo.html

    https://dev.mysql.com/downloads/file/?id=489467

    cd
    wget https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm

    yum localinstall -y mysql80-community-release-el8-1.noarch.rpm

    dnf --enablerepo=mysql-connectors-community -y install mysql-connector-java


