FROM centos:7

# get epel, install golang
RUN yum -y update && yum clean all
RUN yum install -y epel-release
RUN yum install -y go

# setup golang env
RUN mkdir -p /opt/go && chmod -R 777 /opt/go
ENV GOPATH=/opt/go
RUN echo 'export GOPATH=/opt/go' >> $HOME/.bashrc

# install development dependencies
# download zabbix source
# download zabbix-get binary, for demo purposes 
RUN yum install -y gcc zlib-devel pcre-devel make
RUN yum group install -y "Development Tools"
RUN curl -O -L https://sourceforge.net/projects/zabbix/files/ZABBIX%20Latest%20Stable/4.4.0/zabbix-4.4.0.tar.gz
RUN tar xvf zabbix-4.4.0.tar.gz -C /opt/
RUN rpm -Uvh https://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/zabbix-get-4.4.0-1.el7.x86_64.rpm

# create zhttp plugin folder
# create zhttp.go plugin (where your logic goes)
# import the plugin so that the agent is built with it
RUN mkdir -p /opt/zabbix-4.4.0/go/src/zabbix/plugins/zhttp/
COPY zhttp.go /opt/zabbix-4.4.0/go/src/zabbix/plugins/zhttp/zhttp.go
COPY plugins.go /opt/zabbix-4.4.0/go/src/zabbix/plugins/plugins.go
WORKDIR /opt/zabbix-4.4.0/

# configure to build the next generation golang zabbix agent, agent2
# build the binary with make install
# test that it built
RUN ./configure --enable-agent2
RUN make install
RUN ls /usr/local/sbin/ | grep -q zabbix_agent2

#bash history
RUN echo "make install" >> ~/.bash_history
RUN echo "ls /usr/local/sbin/ | grep -q zabbix_agent2" >> ~/.bash_history
RUN echo "cd /usr/local/sbin/" >> ~/.bash_history
RUN echo "./zabbix_agent2 -c /usr/local/etc/zabbix_agent2.conf &" >> ~/.bash_history
RUN echo "zabbix_get -s 127.0.0.1 -k myip" >> ~/.bash_history
