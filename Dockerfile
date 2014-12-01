FROM centos:centos7

RUN yum -y update
RUN yum -y install http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm
RUN yum -y install postgresql93 postgresql93-server postgresql93-contib
RUN yum -y install epel-release
RUN yum -y install redis
RUN yum -y install supervisor
RUN yum -y install golang

ADD ./scripts/start.sh /start.sh

CMD ["/bin/bash", "start.sh"]
