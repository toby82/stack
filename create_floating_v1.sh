#!/usr/bin/python
import sys
import MySQLdb as my
import os
from time import gmtime,time,strftime
conn = my.connect(user='root',passwd='8782',db='test')
cur = conn.cursor()
ipaddr = str(raw_input('input ipaddress example(192.168.5.): '))
x,y = str(raw_input('input range example(3 5): ')).split()
for i in range(int(x),int(y)):
    curdate =  strftime("%Y-%m-%d %H:%M:%S",gmtime(time()+28800))
    sql = "insert into floating_ips(created_at,updated_at,deleted,id,address,auto_assigned,pool,interface) values" + "(" + "'" + str(curdate)+"'," + "'" + str(curdate) +"'," + "0" + "," + str(i) + "," + "'" +  ipaddr + str(i) + "'" + ",0," + "'" + "nova" +"'," + "'" +"eth0" + "'" + ")"
    cur.execute(sql)

conn.commit()
cur.execute('select * from floating_ips;')
data = cur.fetchall()
for d in data:
    print d[:]

cur.close()
conn.close()
#if os.system(conn) == 0:
#    print "success..."
#else:
#    print "failed..."
