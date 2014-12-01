FROM centos:centos7

#################INSTALL#################
RUN yum -y update
RUN yum -y install http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm
RUN yum -y install postgresql93 postgresql93-server postgresql93-contrib
RUN yum -y install epel-release
RUN yum -y install redis
RUN yum -y install supervisor
RUN yum -y install golang
RUN yum -y install sudo
RUN yum -y install make
RUN yum -y install git
RUN yum -y install vim

RUN useradd -s /bin/bash -m -d /var/lib/modip modip

#################CREATE DB#################
#Sudo requires a tty. fix that.
RUN sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers

ADD ./scripts/create_db.sh /root/create_db.sh

RUN chmod +x /root/create_db.sh
RUN /root/create_db.sh

#################INSTALL MODIP#############
ADD ./scripts/install_modip.sh /root/install_modip.sh
RUN chmod +x /root/install_modip.sh
RUN /root/install_modip.sh

#################START SUPERVISOR##########
ADD ./configs/supervisord.conf /etc/supervisord.conf

ADD ./scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD ["/root/start.sh"]
