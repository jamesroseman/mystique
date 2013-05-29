mystique
========

Reddit-based Wallpaper Changer

mystique grabs all image files from the top 25 of your chosen subreddits (specified in 'sublist'). It then randomly chooses your wallpaper, and is programmed never to chose the same wallpaper twice in a row.

Installation
-----------

The only dependency/requirement of mystique is to put it in /home/username/Documents/Misc . If you don't want to put it there, edit the Bash variables in wallpaper.sh.

mystique can also easily be configured to be used with crontab, if set up. Simply run:

    crontab -e

To start editing your crontab configuration, and add the following line:

    */X * * * * DISPLAY=:0 GSETTINGS_BACKED=dconf /bin/sh /home/username/Documents/Misc/mystique/wallpaper.sh > /home/username/mystique.log

Be sure to leave a newline at the end of your crontab.

Known Issues
-------------

Mystique isn't very intelligent, and only grabs top links that end in ".jpg". It doesn't append them to imgur links, and it doesn't go through albums. 

If you have any other issues, or the famous "blue screen of death", look at your mystique.log file, which is by default stored in `/home/username/mystique.log`
