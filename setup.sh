#!/bin/sh

echo "This is the setup script for sshot"
echo "I am going to prompt you for a couple of things now:"
echo "Remote Address?"
read REMOTE
echo "Remote user?"
read USER

if [ -d ~/bin ];
then
	cp sshot.sh ~/bin/sshot
else
	echo "No ~/bin exists. Create ~/bin [y/N]?"
	read bins
	if (bins == 'y') | (bins == 'Y');
	then
		mkdir ~/bin
		cp sshot.sh ~/bin/sshot
		echo "While you now have a ~/bin, it may not be in your PATH"
	else
		echo 'Aborting'
		exit 1
	fi
fi
if [ -f ~/.ssh/id_rsa.pub ]
	echo "Copying ssh key to server"
	scp ~/.ssh/id_rsa.pub $REMOTE:/tmp/userpub.pub
	ssh $USER@$REMOTE 'cat /tmp/userpub.pub >> ~/.ssh/authorized_keys'
else
	echo "No public ssh key found. Generate key [y/N]?"
	read keygen
	if (keygen == 'y') | (keygen == 'Y');
	then
		ssh-keygen
		echo "Copying ssh key to server"
		scp ~/.ssh/id_rsa.pub$REMOTE:/tmp/userpub.pub
		ssh $USER@$REMOTE 'cat /tmp/userpub.pub >> ~/.ssh/authorized_keys'
	else
		echo 'Aborting'
		exit 1
	fi
fi

echo 'Please also install xsel and scrot if you do not already have them.'

