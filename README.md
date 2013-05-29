mystique
========

*Reddit-based Wallpaper Changer for Ubuntu 12.04*

mystique grabs all image files from the top 25 of your chosen subreddits (specified in 'sublist'). It then randomly chooses your wallpaper, and is programmed never to chose the same wallpaper twice in a row.

Installation
-----------

The only dependency/requirement of mystique is to put it in /home/username/. If you don't want to put it there, edit the `$HOMEDIR` variable in wallpaper.sh.

Other dependencies will be installed automatically when first run, and it will break if you do not have `apt-get` as a package manager, or `sudo` access.

mystique can also easily be configured to be used with crontab, if set up. Simply run `crontab -e` to start editing your crontab configuration, and add the following line:

    */X * * * * DISPLAY=:0 GSETTINGS_BACKED=dconf /bin/sh /home/username/Documents/Misc/mystique/wallpaper.sh > /home/username/mystique.log

Be sure to leave a newline at the end of your crontab.

Customization
-------------

By default, mystique is configured to grab images from `r/wallpapers`

Mystique grabs subreddits chosen from `sublist` which must have no added whitespace. If you wanted top pictures from `r/wallpapers`, your sublist would read:

    wallpapers

Mystique supports multiple subreddits, just add a newline between each. `sublist` must be formatted like this:

    subreddit 1
    subreddit 2
    subreddit 3

Mystique will *automatically* grab only wallpapers that fit your native resolution.

Known Issues
-------------

Mystique isn't very intelligent, and only grabs top links that end in `.jpg`. It doesn't append them to imgur links, and it doesn't go through albums. 

If you have any other issues, or the famous "blue screen of death", look at your `mystique.log` file, which is by default stored in `/home/username/mystique.log`

*Warning:* mystique has only been tested on one 12.04 Ubuntu box, and hasn't led to any problems so far. *`mystique` automatically filters out NSFW images, but that doesn't mean you can't be surprised, so choose subreddits carefully*. This author personally experienced the surprise of seeing a Nazi rally on his screen after adding `r/historyporn` to his sublist. No warranty, get in trouble at work at your own risk. 
