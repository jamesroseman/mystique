#!/bin/bash
PATH=$PATH:/bin:/usr/bin:/bin:/usr/bin:/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Set the wallpaper to random of top 25 of subreddits in sublist
# James Roseman

# Check dependencies
CURL=`which curl`
if [[ -z $CURL ]]; then
    sudo apt-get install curl
fi

GSET=`which gsettings`
if [[ -z $GSET ]]; then
    sudo apt-get install gsettings
fi

XRANDR=`which xrandr`
if [[ -z $XRANDR ]]; then
    sudo apt-get install xrandr
fi

GREP=`which grep`
if [[ -z $GREP ]]; then
    sudo apt-get install grep
fi

UNIQ=`which uniq`
if [[ -z $UNIQ ]]; then
    sudo apt-get install uniq
fi

AWK=`which awk`
if [[ -z $AWK ]]; then
    sudo apt-get install awk
fi

CUT=`which cut`
if [[ -z $CUT ]]; then
    sudo apt-get install cut
fi

# Configure resolution
X=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Y=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
RESOLUTION=$X"x"$Y

CURR=`shuf -i 0-25 -n 1`
NEXT=`echo $(($CURR + 1))`
USR=`whoami`
HOMEDIR="/home/$USR/mystique"
PYSCRAPE=$HOMEDIR
SUBS=`cat $HOMEDIR/sublist`
PRE="/search.json?q=%5B"
POS="%5D&restrict_sr=on&sort=relevance&t=all"
IMGURL=`$PYSCRAPE/img_scrape.py $SUBLIST $CURR`
PICDIRPATH="/home/$USR/Pictures/wallpapers/"
ARCHIVEPATH="/home/$USR/Pictures/warchive/"
TMPPATH="/tmp/myst"

SUBLIST=$SUBS$PRE$RESOLUTION$POS

mkdir -p $PICDIRPATH
mkdir -p $ARCHIVEPATH
mkdir -p $TMPPATH

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
echo $IMGURL
