#FROM registry.access.redhat.com/rhel7
FROM centos

ARG TEST

RUN yum install -y audit

#ADD ./configs/supervisord.conf /etc/supervisord.conf

#RUN echo "127.0.0.1 $HOSTNAME" > /etc/hosts

#Clean image
RUN yum clean all
RUN echo "127.0.0.1 auditd" > /etc/hosts

#VOLUME [ "/etc/origin/node", "/var/lib/origin" ]


#EXPOSE 8000
#RUN sleep 10000
ADD scripts/run.sh /
ENTRYPOINT ["/run.sh"]
