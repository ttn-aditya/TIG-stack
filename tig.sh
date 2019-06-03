#########################
##      TELEGRAF       ##
#########################
#Download the deb package from the official website
 wget https://dl.influxdata.com/telegraf/releases/telegraf_1.10.4-1_amd64.deb
#Installing telegraf from deb package
 sudo dpkg -i telegraf_1.10.4-1_amd64.deb
#Configuring Telegraf
 cd /etc/telegraf
 mv telegraf.conf telegraf.conf.default
#make some changes in telegraf.conf
 vim telegraf.conf
#Copy and paste the following configurations below
 # Global Agent Configuration
###################################################### 
[agent]
  hostname = "hakase-tig"
  flush_interval = "15s"
  interval = "15s"


# Input Plugins
[[inputs.cpu]]
    percpu = true
    totalcpu = true
    collect_cpu_time = false
    report_active = false
[[inputs.disk]]
    ignore_fs = ["tmpfs", "devtmpfs", "devfs"]
[[inputs.io]]
[[inputs.mem]]
[[inputs.net]]
[[inputs.system]]
[[inputs.swap]]
[[inputs.netstat]]
[[inputs.processes]]
[[inputs.kernel]]

# Output Plugin InfluxDB
[[outputs.influxdb]]
  database = "telegraf"
  urls = [ "http://127.0.0.1:8086" ]
  username = "telegraf"
  password = "password"
########################################################
#########################
##      INFULX DB      ##
#########################
#Download the deb package from the official website
 wget https://dl.influxdata.com/influxdb/releases/influxdb_1.7.6_amd64.deb
#Installing influxdb from deb package
 sudo dpkg -i influxdb_1.7.6_amd64.deb
#Creating user in influx db
#type comaands 
 influx
 create database telegraf
 create user telegraf with password 'password'
 show databases
 show users
#########################
##       GRAFANA       ##   
#Download the deb package from the official website
 wget https://dl.grafana.com/oss/release/grafana_6.2.1_amd64.deb 
#Installing grafana from deb package
 sudo dpkg -i grafana_6.2.1_amd64.deb 
 
