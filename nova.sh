#!/bin/bash

service libvirt-bin $1
service rabbitmq-server $1
novavar=$(cd /etc/init.d && ls | grep nova)
for i in $novavar
do
service $i $1
sleep 1
if [ "$?" == 0 ]
then
echo "service $i $1 :-):-):-):-):-):-):-):-):-):-):-)."
else
echo "service $i $1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx."
fi
done
