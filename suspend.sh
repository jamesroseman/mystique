USER=`whoami`
HOME_DIR="/home/$USER/mystique"
CURRENT_STATUS=`cat $HOME_DIR/.suspend | head -1`

if [[ $CURRENT_STATUS -eq 0 ]]; then
    echo "1" > $HOME_DIR/.suspend
else
    echo "0" > $HOME_DIR/.suspend
fi

echo "# === 0 (TRUE) or 1 (FALSE) to suspend mystique === #" >> $HOME_DIR/.suspend
