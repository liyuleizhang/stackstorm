#!/usr/bin/env bash

node01_1_ansible_hosts=$1
node01_2_ansible_port=$2
node01_3_ansible_user=$3
node01_4_ansible_password=$4

cat > /tmp/inventory_test <<- EOF
node01 ansible_host=${node01_1_ansible_hosts} ansible_port=${node01_2_ansible_port} ansible_user=${node01_3_ansible_user} ansible_password=${node01_4_ansible_password}
EOF

docker cp /tmp/inventory_test astrolabe:/etc/ansible/stage/test/inventory

docker exec astrolabe cat /etc/ansible/stage/test/inventory
