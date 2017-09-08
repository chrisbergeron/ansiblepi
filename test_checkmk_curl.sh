#!/bin/bash

omd="192.168.0.153"
site="monitoring"
user="grafana"
secret="UMKCXHTELTFCHEHAULOV"
hostname="pizero4.chrisbergeron.com"

# Activate changes:
curl -ks "http://192.168.0.153/monitoring/check_mk/webapi.py?action=activate_changes&_username=grafana&_secret=UMKCXHTELTFCHEHAULOV"
