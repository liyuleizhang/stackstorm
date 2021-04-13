#!/bin/bash
echo	\
"	\
registry ansible_host=$1 ansible_port=22 ansible_user=root ansible_password=huacloud
" \
>/home/stanley/inventory_test
