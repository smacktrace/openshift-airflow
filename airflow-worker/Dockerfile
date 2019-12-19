FROM centos:centos7

ENV AIRFLOW_HOME /airflow

RUN mkdir /airflow && mkdir /var/log/airflow

ADD docker-entrypoint.sh /sbin

RUN chmod +x /sbin/docker-entrypoint.sh

RUN yum install -y python3-devel \
        python3-pip \
        gcc

RUN pip3 install -no-cache-dir 'apache-airflow[celery]==1.10.5'

RUN chmod -R 770 /var/log/airflow && \
	chgrp -R 0 /airflow  && \
	chmod -R g=u /airflow && \
	chmod g=u /etc/passwd

EXPOSE 8080

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["airflow","worker"]

USER 1001

