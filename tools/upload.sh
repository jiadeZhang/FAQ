#/usr/bin/sh
FILES=(server_trunk/bin/GateServerD server_trunk/bin/DBServerD server_trunk/sharedata)
TARGETPATH=/tmp/server
DEST=ty1
USER=root
PASSWORD=****
EXCEPT=.svn

#递归 压缩 显示信息  判断文件完整性
RSYNC_FLAG=rzvI

echo -e "同步文件至$DEST:$TARGETPATH\n"
for i in ${FILES[@]}
do 
	if [ -d $i ]; then
		echo -e "\n\033[34m******同步文件夹$i -->>  $DEST$TARGETPATH/$i\033[0m"
		ssh $USER@$DEST mkdir -p $TARGETPATH/$i 
		rsync -$RSYNC_FLAG --exclude "$EXCEPT" $i $USER@$DEST:$TARGETPATH/$i
	else
		echo -e  "\n\033[34m******同步文件$i  -->>  $DEST$TARGETPATH/$i\033[0m"
		DIR=$TARGETPATH/$i
		ssh $USER@$DEST mkdir -p ${DIR%/*}
 		rsync -$RSYNC_FLAG $i $USER@$DEST:$TARGETPATH/$i
	fi
done
echo -e "文件传输完毕!\n";


