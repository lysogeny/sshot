#!/bin/bash
# Take a screenshot and upload it to a server via ssh
server=jooa.me
remoteuser=jooa
wwwdir=/var/www/
target=u/

name=s`date +%Y%m%d%H%M%S`.png
scrot $name -sb 
mv $name /tmp/$name
scp /tmp/$name $remoteuser@$server:$wwwdir$target
rm /tmp/$name

remotefile=$server$target$name
echo $remotefile | xsel -bi
notify-send $remotefile

