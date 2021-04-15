#!/usr/bin/env bash

node_1_ansible_numbers=$1
node_2_ansible_hosts=$2
node_3_ansible_port=$3
node_4_ansible_user=$4
node_5_ansible_password=$5

cat >> /tmp/inventory_test <<- EOF
node${node_1_ansible_numbers} ansible_host=${node_2_ansible_hosts} ansible_port=${node_3_ansible_port} ansible_user=${node_4_ansible_user} ansible_password=${node_5_ansible_password}
EOF

docker cp /tmp/inventory_test astrolabe:/etc/ansible/stage/test/inventory

docker exec astrolabe cat /etc/ansible/stage/test/inventory
