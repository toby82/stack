#!/bin/bash
http="http://192.168.253.129:35357/v2.0/"
keystone --token ADMIN --endpoint ${http} service-create --name=keystone --type=identity --description="Keystone Identity Service"
keystone --token ADMIN --endpoint ${http} service-create --name=nova --type=compute --description="Nova Compute Service"
keystone --token ADMIN --endpoint ${http} service-create --name=volume --type=volume --description="Nova Volume Service"
keystone --token ADMIN --endpoint ${http} service-create --name=glance --type=image --description="Glance Image Service"
keystone  --token ADMIN --endpoint ${http} service-create --name=ec2 --type=ec2 --description="EC2 Compatibility Layer"
