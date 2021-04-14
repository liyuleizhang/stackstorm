#!/usr/bin/env bash

node1_1_ansible_hosts=$1
node1_2_ansible_port=$2
node1_3_ansible_user=$3
node1_4_ansible_password=$4

cat > /tmp/inventory_test <<- EOF
registry ansible_host=${node1_1_ansible_hosts} ansible_port=${node1_2_ansible_port} ansible_user=${node1_3_ansible_user} ansible_password=${node1_4_ansible_password}
EOF

docker cp /tmp/inventory_test astrolabe:/etc/ansible/stage/test/inventory

docker exec astrolabe cat /etc/ansible/stage/test/inventory
