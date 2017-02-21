#!/bin/bash

if [ "$#" -eq 0 ]; then 
	echo -e "\nUsage:\n$0 hostname(s) command\n";
	echo -en "Ansible hosts:\n"
	for i in `cat hosts | grep -v '^\[' | grep -v "^#" | cut -f2 -d":" | cut -f1 -d" "`; do echo -n "$i "; done
	echo
	echo
fi

for i in `cat hosts | grep -v '^\[' | grep -v "^#" | cut -f2 -d":" | cut -f1 -d" "`; do echo "ssh $i: "; ssh $i "$1"; done


#for i in {1..5}; do echo "Pizero$i:"; ssh pizero$i "sudo netstat -tpl | grep -v Local | grep -v Active | grep -v '::' | grep -v smtp | grep -v ssh"; done
