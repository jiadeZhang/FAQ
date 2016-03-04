#!/bin/sh
FILES=(server_trunk/bin/GateServerD server_trunk/bin/DBServerD server_trunk/sharedata)
TARGETPATH=/tmp/server
DEST=(111.111.111.111)
USER=root
PASSWORD=*****
EXCEPT=.svn

RSYNC_FLAG=rzvI

for IP in ${DEST[@]}
do
	echo -e "$IP:$TARGETPATH\n"
	for i in ${FILES[@]}
	do 
		if [ -d $i ]; then
			echo -e "\n\033[34m******sync $i -->>  $IP$TARGETPATH/$i\033[0m"
			ssh $USER@$IP mkdir -p $TARGETPATH/$i 
			rsync -$RSYNC_FLAG --exclude "$EXCEPT" $i $USER@$IP:$TARGETPATH/$i
		else
			echo -e  "\n\033[34m******sync $i  -->>  $DEST$TARGETPATH/$i\033[0m"
			DIR=$TARGETPATH/$i
			ssh $USER@$IP mkdir -p ${DIR%/*}
 			rsync -$RSYNC_FLAG $i $USER@$IP:$TARGETPATH/$i
		fi
	done
done

echo -e "complete!\n";


