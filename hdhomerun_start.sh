#!/bin/bash

if [ "$SAMBA" != "false" ] && [ "$SAMBA" != "FALSE" ] && [ "$SAMBA" != "off" ] && [ "$SAMBA" != "OFF" ];then
	echo "hello" > /tmp/samba_test.txt
	/usr/sbin/smbd -D -d1 --option=workgroup=${workgroup:-workgroup}
fi
/hdhomerun/bin/hdhomerun_record_linux_20150821atest2 foreground --conf /hdhomerun/etc/hdhomerun.conf
