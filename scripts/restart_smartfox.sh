#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd /opt/SmartFoxServer_2X/SFS2X
OLDIFS=$IFS
IFS=""
start_time=`date +%s`
while read -r data; do
        #printf "%s\n" "$data"
        echo $data
        if grep -qi "(error)|(exception)" <<< $data; then
                echo "FOUND ERROR"
                break
        elif grep -qi 'BlueBox-2X Service.*ready' <<< $data; then
                echo "SUCCESSFULLY RESTARTED SFS"
                break
        fi
        now_time=`date +%s`
        now_time=$((now_time - start_time))
        if [ "$now_time" -gt 100 ]; then
            break
        fi
done < <(./softrestart.sh 2>&1 &)
IFS=$OLDIFS
cd $SCRIPTPATH
exit
