#!/bin/bash
#for s in nova glance volume keystone ec2 swift
#do
http="http://127.0.0.1:35357/v2.0/"
#publicurl="http://192.168.253.129"
echo -n "input url(http://192.168.253.129):"
read publicurl
internalurl=${publicurl}
adminurl=${publicurl}


glance_id=$(keystone --token ADMIN --endpoint $http service-list | grep -i "\ glance\ " | awk '{print $2}')
if [ $? == 0 ]
then
#echo "success"
keystone --token ADMIN --endpoint ${http} endpoint-create --region RegionOne --service_id=${glance_id} --publicurl=${publicurl}:9292/v1 --internalurl=${internalurl}:9292/v1 --adminurl=${adminurl}:9292/v1
else
echo "error"
fi

nova_id=$(keystone --token ADMIN --endpoint $http service-list | grep -i "\ compute\ " | awk '{print $2}')
if [ $? == 0 ]
then
#echo "success"
keystone --token ADMIN --endpoint ${http} endpoint-create --region RegionOne --service_id=${nova_id} --publicurl="${publicurl}:8774/v2/%(tenant_id)s" --internalurl="${internalurl}:8774/v2/%(tenant_id)s" --adminurl="${adminurl}:8774/v2/%(tenant_id)s"
else
echo "error"

fi

volume_id=$(keystone --token ADMIN --endpoint ${http} service-list | grep -i "\ volume\ " | awk '{print $2}')
if [ $? == 0 ]
then
#echo "success"
keystone --token ADMIN --endpoint ${http} endpoint-create --region RegionOne --service_id=${volume_id} --publicurl="${publicurl}:8776/v1/%(tenant_id)s" --internalurl="${internalurl}:8776/v1/%(tenant_id)s" --adminurl="${adminurl}:8776/v1/%(tenant_id)s"
else
echo "error"
fi
keystone_id=$(keystone --token ADMIN --endpoint $http service-list | grep -i "\ keystone\ " | awk '{print $2}')
if [ $? == 0 ]
then
keystone --token ADMIN --endpoint ${http} endpoint-create --region RegionOne --service_id=${keystone_id} --publicurl=${publicurl}:5000/v2.0 --internalurl=${internalurl}:5000/v2.0 --adminurl=${adminurl}:35357/v2.0
else
echo "error...."
fi
