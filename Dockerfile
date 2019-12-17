FROM centos:centos7

ENV AIRFLOW_HOME /airflow

RUN mkdir /airflow

RUN yum install -y python3-devel \
        python3-pip \
        gcc

RUN pip3 install 'apache-airflow[postgres,doc,azure,datadog,slack,snowflake]==1.10.5'

USER 1001

