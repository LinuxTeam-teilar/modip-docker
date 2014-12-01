FROM centos:centos7

#################INSTALL#################
RUN yum -y update
RUN yum -y install http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm
RUN yum -y install postgresql93 postgresql93-server postgresql93-contib
RUN yum -y install epel-release
RUN yum -y install redis
RUN yum -y install supervisor
RUN yum -y install golang
RUN yum -y install sudo

#################CREATE DB#################
#Sudo requires a tty. fix that.
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

ADD ./scripts/create_db.sh /root/create_db.sh

RUN chmod +x /root/create_db.sh
RUN /root/create_db.sh

#################CONFIGURE DB#################
ADD ./scripts/configure_db.sh /root/configure_db.sh
RUN chmod +x /root/configure_db.sh

#################INSTALL MODIP#############

#################START SUPERVISOR##########
ADD ./configs/supervisord.conf /etc/supervisord.conf

ADD ./scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD ["/root/start.sh"]
