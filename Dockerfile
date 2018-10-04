FROM java:latest
ARG NEWRELIC_LICENSE=default
ENV NEWRELIC_LICENSE=$NEWRELIC_LICENSE
RUN echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list
RUN wget -O- https://download.newrelic.com/548C16BF.gpg --no-check-certificate | apt-key add -
RUN apt-get update
RUN apt-get install newrelic-sysmond
RUN nrsysmond-config --set license_key=${NEWRELIC_LICENSE}
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade awscli