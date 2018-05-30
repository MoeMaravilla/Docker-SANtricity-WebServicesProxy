FROM centos:7.4.1708
MAINTAINER Moe Maravilla
WORKDIR /

RUN yum update -y
RUN yum install redhat-lsb-core -y
RUN yum install initscripts -y

#Install context files
COPY overlay /

RUN rpm -i santricity_webservices-02.12.7000.0002-1.x86_64.rpm
RUN mv /opt/netapp/santricity_web_services_proxy /opt/netapp/santricity_web_services_proxy.seed && \
    mkdir /opt/netapp/santricity_web_services_proxy

#VOLUME "/opt/netapp/santricity_web_services_proxy"

CMD [ "/start_santricity-webservices" ]
