#!/bin/bash
PATH=$PATH:/bin:/usr/bin:/bin:/usr/bin:/usr/lib/lightdm/lightdm:/bin:/opt/intellij:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/jdk1.7.0_03/bin:/home/site/trsrc-MAINLINE/scripts:/usr/jdk1.7.0_03/bin:/home/site/trsrc-MAINLINE/scripts

# Set the wallpaper to the current top of /r/wallpapers
# James Roseman

CURR=`shuf -i 0-25 -n 1`
NEXT=`echo $(($CURR + 1))`
USR=`whoami`
HOMEDIR="/home/$USR/Documents/Misc/wall/"
PYSCRAPE=$HOMEDIR
SUBLIST=`cat $HOMEDIR/sublist`
IMGURL=`$PYSCRAPE/img_scrape.py $SUBLIST $CURR`
PICDIRPATH="/home/$USR/Pictures/wallpapers/"
ARCHIVEPATH="/home/$USR/Pictures/warchive/"
TMPPATH="/tmp/wall"

mkdir -p $TMPPATH
echo $IMGURL

cd $TMPPATH; 
mv * $ARCHIVEPATH;
curl -O $IMGURL; 
IMGNAME=`ls`
IMGPATH=$PICDIRPATH$IMGNAME

# If it's already the current wallpaper, grab a new one
if [ -a $IMGPATH ]; 
    then
        echo "Trying second..."
        cd $HOMEDIR
        IMGURL=`$PYSCRAPE/img_scrape.py $SUBLIST $NEXT`
        cd $TMPPATH
        mv * $ARCHIVEPATH
        curl -O $IMGURL
        IMGNAME=`ls`
        IMGPATH=$PICDIRPATH$IMGNAME
fi

mv $PICDIRPATH* $ARCHIVEPATH
mv $IMGNAME $PICDIRPATH

gsettings set org.gnome.desktop.background picture-uri "file://$IMGPATH"
echo $IMGNAME
