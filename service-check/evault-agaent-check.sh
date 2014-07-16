#!/bin/bash
#Author:Jobin Joseph
#JobNix.in

# Script to Check Availability of Evault Agent on Linux Servers and restart if the service went down.
# logs wil be available at /var/log/messages

jemail=youremailid@example.com

ps aux|grep -v grep |grep buagent

if [ $? -ne 0 ] ; then
/etc/init.d/vvagent restart
echo "buagent was not running-restarted on server `hostname`" | mail -s "[INFO] buagent Restarted" $jemail
logger "buagent was not running-restarted"
else
echo "buagent is running properly"
fi
exit 0
