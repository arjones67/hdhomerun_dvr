#!/bin/bash
/usr/sbin/smbd -D -d1 --option=workgroup=${workgroup:-workgroup}
/hdhomerun/bin/hdhomerun_record_linux_20150821atest2 foreground --conf /hdhomerun/etc/hdhomerun.conf
