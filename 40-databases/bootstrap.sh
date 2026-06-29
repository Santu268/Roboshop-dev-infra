#!/bin/bash
component=$1
env=$2
dnf install ansible -y

mkdir -p /var/log/roboshop
chown -R ec2-user:ec2-user /var/log/roboshop
chmod -R 755 /var/log/roboshop
touch /var/log/roboshop/ansible.log

cd /home/ec2-user
git clone https://github.com/Santu268/ansible-01-v2.git
cd ansible-01-v2
git pull

ansible-playbook -e component=$component -e env=$env roboshop-roles.yaml