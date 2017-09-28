#!/bin/bash

# Chris Bergeron - 2017

# Takes a master list of hostnames to patch and reboot and separates it into a separate file for each node number:
# ex. 
#  list1.txt = rentals-01.atl.primedia.com
#  list2.txt = rentals-02.atl.primedia.com
#  list3.txt = rentals-03.atl.primedia.com
#  etc...

# the highest node number we want to go up to (ex. xdb-mysql-07.atl.primedia.com)
numlists=7

# some random string we know wont be in the input file
str="xandercooley";

# temp file name
tmpfile="/tmp/tmp8675309.tmp"

# ansible hosts filename
ah="hosts.txt"

# ansible username to put in hosts file
username="cbergeron"

# create an ansible hosts file
echo -e "[production]\n\n" > $ah

if [ $# -ne 1 ]; then
    echo -e "\nUsage: $0 <hostname_list.txt>\n"
    echo -e "hostname_list.txt is a text file containing only hostnames that need to be patched and rebooted."
  exit
fi

# parse out any comments or ansible brackets
egrep -v "^#|^\[" $1 > $tmpfile

# create X lists
for i in `seq 1 $numlists`; do
  echo "[list$i]" >> $ah
    grep --color=never "0$i" $tmpfile > /tmp/list$i.txt
    for j in `cat /tmp/list$i.txt | cut -f1 -d "."`; do
        hostname=`grep --color=never "^$j" $1`
        echo "$j ansible_ssh_host=$hostname ansible_ssh_user=$username host_key_checking=false" >> $ah
    done
    #grep --color=never "0$i" $tmpfile >> $ah
    str=$str"|0$i"
    echo -e "\n" >> $ah
done

# put any remaining hosts into a remainder file
egrep -v "$str" $tmpfile > /tmp/list_remainder.txt

# put any remaining hosts into a remainder file
echo "[list_remainder]" >> $ah
egrep -v "$str" $tmpfile > /tmp/list_remainder.txt
for j in `cat /tmp/list_remainder.txt | cut -f1 -d "."`; do
        hostname=`grep --color=never "^$j" $1`
        echo "$j ansible_ssh_host=$hostname ansible_ssh_user=$username host_key_checking=false" >> $ah
    done

# show what we created
echo -e "\nCreated the following files: "
\ls /tmp/list*.txt
\ls $ah

# clean up after ourselves
rm -f $tmpfile
