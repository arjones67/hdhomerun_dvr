#!/bin/bash

if [ "$SAMBA" != "false" ] && [ "$SAMBA" != "FALSE" ] && [ "$SAMBA" != "off" ] && [ "$SAMBA" != "OFF" ];then
	echo "Samba enabled" > /tmp/samba_status.txt
	/usr/sbin/smbd -D -d1 --option=workgroup=${workgroup:-workgroup}
else
	echo "Samba disabled" > /tmp/samba_status.txt
fi
/hdhomerun/bin/hdhomerun_record_linux foreground --conf /hdhomerun/etc/hdhomerun.conf
