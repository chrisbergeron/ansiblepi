#!/bin/bash
/usr/local/bin/prowl.pl -apikeyfile=/home/cbergeron/prowl_key.txt -event="$HOSTNAME" -notification="$1"
