#!/usr/local/bin/bash
TODAY_DATE=`date +%Y%m%d`
USER_ID=''
FROM_DATE=''
TO_DATE=''
LOG_LEVEL=''
KEYWORD=''
DURATION=''
CAT=''

while getopts "u:d:l:k:t:r:c:" OPTION; do
    case $OPTION in
        u ) USER_ID=$OPTARG;;
        d ) FROM_DATE=$OPTARG;;
        l ) LOG_LEVEL=$OPTARG;;
        k ) KEYWORD=$OPTARG;;
        t ) TO_DATE=$OPTARG;;
        r ) DURATION=$OPTARG;;
        c ) CAT=$OPTARG;;
    esac
done
#printf 'Parameters: u: %s, d: %s, l: %s, k: %s, t: %s, r: %d, c: %s\n' "$USER_ID" "$FROM_DATE" "$LOG_LEVEL" "$KEYWORD" "$TO_DATE" "$DURATION" "$CAT"
form_regex() {
    local regex=""
    for var in "$@"; do
        regex+="(?=.*$var)"
    done
    if [ ! -z "$regex" ]; then
        regex+="^.*$"
    fi
    printf '%s' "$regex"
}

filter_by_regex() {
    local rslt="No log file is found for $FROM_DATE"
    if [ -f "$IN_LOG_FILE_PATH" ]; then
        rslt="$("$FILE_READER" "$IN_LOG_FILE_PATH")"
        if [ ! -z "$1" ]; then
            rslt="$(grep -aP "$1" <<< "$rslt")"
        fi
        if [ ! -z "$2" ]; then
            rslt="$(grep -aFi "$2" <<< "$rslt")"
        fi
    fi
    printf '%s' "$rslt"
}

filter_by_duration() {
    awk -v ADURATION="$DURATION" 'BEGIN {
        FS = "[[]|[]]"
        CMD1 = "date +%s.%N"
        CMD1 | getline TNOW
        #CMD1 = "date -d \"20190917 06:38:14.0\" +%s.%N"
        #CMD1 | getline TNOW
        close(CMD1)
    }
    { 
        if ($4 != "") {
            CMD2 = "date -d \"" $4 "\" +\"%s.%N\""
            CMD2 | getline TIME1
            close(CMD2)
            if (TNOW - TIME1 < ADURATION) {
                printf("%s\n", $0)
            }
        }
    }'
}

generate_log_file_name() {
    if [ ! -z "$USER_ID" ]; then
        LOG_FILE_NAME=`echo -n "$USER_ID" | md5sum | cut -d" " -f1`
        LOG_FILE_NAME="$LOG_FILE_NAME"_"$FROM_DATE"_user.log
    else
        LOG_FILE_NAME=`echo -n "$FROM_DATE" | md5sum | cut -d " " -f1`
        LOG_FILE_NAME="$LOG_FILE_NAME"_sys_"$CAT".log
    fi
}

get_logs() {
    IS_TODAY=false
    if [ -z "$1" ] || [ "$1" = "$TODAY_DATE" ]; then
        IS_TODAY=true
    fi

    if $IS_TODAY; then
        FILE_READER="cat"
        IN_LOG_FILE_PATH="../../logs/$CAT.log"
    else
        FILE_READER="zcat"
        IN_LOG_FILE_PATH="../../logs/log_archive/$CAT.log.$1.gz"
    fi
    #echo "READING_FILE: $IN_LOG_FILE_PATH"
    OUTPUT=`filter_by_regex "$REGEX" "$KEYWORD"`

    if [[ $IS_TODAY == true && $DAY_DIFF == 0 ]]; then
        OUTPUT="$(filter_by_duration <<< "$OUTPUT")"
    fi
    #printf '%s' "$result" > "$OUT_LOG_FILE_PATH"
    printf '%s\n' "$OUTPUT" >> "$OUT_LOG_FILE_PATH"
}

# determine today log or older date and file name based on params
CATEGORY=''
if [ -z $CAT ]; then
    CAT='user'
elif [[ "$CAT" == 'api' ]]; then
    CATEGORY="\[API\]"
elif [[ "$CAT" == 'sfs' ]]; then
    CATEGORY="\[SFS\]"
fi

if [[ ! -z $USER_ID ]]; then
    CAT='user'
    if (( $USER_ID > -1 )); then
        USER_ID="\[$USER_ID\]"
    else
        USER_ID=''
    fi
fi

generate_log_file_name

if [[ "$CAT" == 'user' ]]; then
    OUT_LOG_FILE_PATH="../../logs/user/$LOG_FILE_NAME"
else
    OUT_LOG_FILE_PATH="../../logs/system/$LOG_FILE_NAME"
fi
#echo "Outputfile: $OUT_LOG_FILE_PATH"
echo -n > "$OUT_LOG_FILE_PATH"

declare -a parameters=()

for nzarg in $USER_ID $LOG_LEVEL $CATEGORY; do
    if [ ! -z $nzarg ]; then
        parameters+=("$nzarg")
    fi
done

REGEX=`form_regex "${parameters[@]}"`
#printf "Regex: %s\n" "$REGEX"

#printf 'Parameters: u: %s, d: %s, l: %s, k: %s, t: %s, r: %d, c: %s\n' "$USER_ID" "$FROM_DATE" "$LOG_LEVEL" "$KEYWORD" "$TO_DATE" "$DURATION" "$CAT" >> "$OUT_LOG_FILE_PATH"

DAY_DIFF=0
if [ ! -z "$TO_DATE" ]; then
    d_from=$(date -d $FROM_DATE "+%s")
    d_to=$(date -d $TO_DATE "+%s")
    if [[ "$d_from" > "$d_to" ]]; then
        temp="$FROM_DATE"
        FROM_DATE="$TO_DATE"
        TO_DATE="$temp"
    fi
    DAY_DIFF=`echo $(($(($(date -d $TO_DATE "+%s") - $(date -d $FROM_DATE "+%s"))) / 86400))`
fi

for day in `eval echo $(seq 0 1 $DAY_DIFF)`; do
    printf "\n===================================[%s]===================================\n" "$FROM_DATE" >> "$OUT_LOG_FILE_PATH"
    get_logs $FROM_DATE
    FROM_DATE=$(date -d "$FROM_DATE + 1 day" +%Y%m%d)
done
cat "$OUT_LOG_FILE_PATH"
rm -f "$OUT_LOG_FILE_PATH"
