#!/bin/bash
echo	\
"	\
registry ansible_host=$1 ansible_port=22 ansible_user=root ansible_password=
" \
>/home/stanley/inventory
echo    \
"       \
registry ansible_host=$2 ansible_port=22 ansible_user=root ansible_password=
"       \
>>/home/stanley/inventory
