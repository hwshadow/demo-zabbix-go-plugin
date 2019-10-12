FROM centos:7

RUN yum -y update && yum clean all
RUN yum install -y epel-release
RUN yum install -y go

RUN mkdir -p /go && chmod -R 777 /go
ENV GOPATH=/go
WORKDIR /go

RUN mkdir -p /opt/go
RUN echo 'export GOPATH=/opt/go' >> $HOME/.bashrc

RUN yum install -y gcc zlib-devel pcre-devel make
RUN yum group install -y "Development Tools"
RUN curl -O -L https://sourceforge.net/projects/zabbix/files/ZABBIX%20Latest%20Stable/4.4.0/zabbix-4.4.0.tar.gz
RUN tar xvf zabbix-4.4.0.tar.gz -C /opt/

RUN mkdir -p /opt/zabbix-4.4.0/go/src/zabbix/plugins/zhttp/
COPY zhttp.go /opt/zabbix-4.4.0/go/src/zabbix/plugins/zhttp/zhttp.go
COPY plugins.go /opt/zabbix-4.4.0/go/src/zabbix/plugins/plugins.go
WORKDIR /opt/zabbix-4.4.0/

RUN ./configure --enable-agent2
RUN rpm -Uvh https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/zabbix-get-4.4.0-1.el7.x86_64.rpm

RUN make install
RUN ls /usr/local/sbin/ | grep -q zabbix_agent2

#bash history
RUN echo "make install" >> ~/.bash_history
RUN echo "ls /usr/local/sbin/ | grep -q zabbix_agent2" >> ~/.bash_history
RUN echo "cd /usr/local/sbin/" >> ~/.bash_history
RUN echo "./zabbix_agent2 -c /usr/local/etc/zabbix_agent2.conf &" >> ~/.bash_history
RUN echo "zabbix_get -s 127.0.0.1 -k myip" >> ~/.bash_history
