#!/usr/bin/python
from datetime import datetime
import commands
import sys

unixsecs=str(sys.argv[1])

utc = commands.getoutput(unixsecs)
a_date=datetime.fromtimestamp(float(int(unixsecs))).strftime('%Y-%m-%d %H:%M:%S')
print('Normal time:'+a_date)
