1. install docker https://docs.docker.com/docker-for-mac/install/
2. cd to project root folder
3. 
```
docker build . -t demo-zabbix-go-plugin
```
4. 
```
docker run -it demo-zabbix-go-plugin bash
```
5. scroll through bash history 
```
#navigate to directory containing the bin
cd /usr/local/sbin/
#run your custom zabbix agent in the background
./zabbix_agent2 -c /usr/local/etc/zabbix_agent2.conf &
#test your custom plugin
zabbix_get -s 127.0.0.1 -k myip
```
