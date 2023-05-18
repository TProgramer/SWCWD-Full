#!/bin/bash
REPOSITORY=/home/ec2-user/BE
cd $REPOSITORY
sudo su
nohup java -Dserver.port=80 -jar target/*.jar&
