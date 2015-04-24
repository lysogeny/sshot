#!/bin/bash
# Take a file and upload it to a server via ssh
server=jooa.me
remoteuser=jooa
wwwdir=/var/www/
target=u/
scp $@ $remoteuser@$server:$wwwdir$target$name

remotefile='http://'$server'/'$target$@
echo $remotefile | xsel -bi
notify-send $remotefile

