FROM ubuntu

ENV ods_=$ods_ 
ENV country_=$country_
ENV property=$property

RUN apt-get -y update; \
    apt-get -y upgrade; \
    apt-get -y install git; \
    apt-get -y install python; \
    apt-get -y install python-pip; \
    apt-get -y install python-virtualenv; \
    apt-get -y install python-dev; \
    apt-get -y install build-essential; \
    apt-get -y install mysql-client; \
    apt-get -y install libmysqlclient-dev; \
    pip install --ignore-installed python-dateutil pandas; \
    pip install pyyaml; \
    pip install numpy; \
    pip install pandas; \
    pip install wheel; \
    pip install pymysql; \
    pip install mysqlclient; \
    pip install psycopg2; \
    pip install --upgrade google-api-python-client; \
    pip install --upgrade google-cloud-storage; \
    pip install --upgrade google-cloud-bigquery; \
    pip install --upgrade oauth2client; \
    pip install py2neo==3.1.2; \
    pip install boto3; \
    pip install redis



RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN chown -R root:root /root/.ssh
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
RUN git clone git@github.com:LinioIT/bi-2-0-process.git

CMD ["/bin/bash", "-c","/bi-2-0-process/BI_2_0/synchronizer.sh $ods_ $country_ $property"]

