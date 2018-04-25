#!/bin/sh
mount -t tmpfs -o size=1000M,mode=0755 tmpfs /var/spool/postfixmulti/
for i in /etc/postfix_*
do
        dir=$(echo $i | awk 'BEGIN {FS="/" }{ print $3  }')
        mkdir /var/spool/postfixmulti/$dir;
        /usr/sbin/postfix -c $i start;
done
