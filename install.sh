# Install the color schemes

cd
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-light
mv dircolors.ansi-dark .dircolors
mv dircolors.ansi-light .dircolors
eval `dircolors ~/.dircolors`

