#!/usr/bin/python
import MySQLdb as my
conn = my.connect(user='root',passwd='8782',db='test')
cursor = conn.cursor()
cursor.execute("call fl('192.168.2.',5,10)")
conn.commit()
cursor.execute('select * from floating_ips;')
data = cursor.fetchall()
for rec in data:
    print rec[:]
cursor.close()
conn.close()

