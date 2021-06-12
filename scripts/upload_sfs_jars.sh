#!/bin/bash
declare -a JARS=("$SFS_DIR/extensions/__lib__/Bingo_Adventure_Core.jar;~/SFS2X/extensions/__lib__"
	"$SFS_DIR/extensions/BingoAdventureApp/Bingo_Adventure_App.jar;~/SFS2X/extensions/BingoAdventureApp")
$ENVNAME
$IP
$USRNAME
$IDENTITY

set_dev() {
	ENVNAME='dev'
	IP='ba-dev.luckystrikestudios.com'
	USRNAME='ubuntu'
	IDENTITY="~/.ssh/dev1.luckystrikestudios.com.pem"
}

set_qa() {
	ENVNAME='qa'
	IP='ba-qa.luckystrikestudios.com'
	USRNAME='ubuntu'
	IDENTITY='~/.ssh/dev1.luckystrikestudios.com.pem'
}

set_stage() {
	ENVNAME='stage'
	IP='ba-stage.luckystrikestudios.com'
	USRNAME='ubuntu'
	IDENTITY='~/.ssh/lsg-prod-aws.pem'
}

set_ops() {
	ENVNAME='ops'
	IP='ba-ops.luckystrikestudios.com'
	USRNAME='ubuntu'
	IDENTITY='~/.ssh/lsg-prod-aws.pem'
}

set_prod() {
	ENVNAME='prod'
	IP='ba-app.luckystrikestudios.com'
	USRNAME='ubuntu'
	IDENTITY='~/.ssh/lsg-prod-aws.pem'
}

check_args() {
	if [ $# -ne 1 ]; then
		echo "Usage: $0 d/q/s/p"
		exit
	fi
}

set_vars() {
	case "$1" in
		[dD]) set_dev
			;;
		[qQ]) set_qa
			;;
		[sS]) set_stage
			;;
		[oO0]) set_ops
			;;
		[pPlL]) set_prod
			;;
		*) echo "Invalid environment parameter: $1"
			exit
			;;
	esac
	echo "Environment: $ENVNAME"
}

process() {
	OIFS=$IFS
	IFS=';'
	for STR in "${JARS[@]}"; do
		read -ra ARR <<< "$STR"
		FILE=$(basename -- "${ARR[0]}")
		DIR_LOCAL=$(dirname -- "${ARR[0]}")
		DIR_REMOTE="${ARR[1]}"
		upload_file $FILE $DIR_LOCAL $DIR_REMOTE
	done
	IFS=$OIFS
	echo "FILES UPLOADED"
	sfs_restart_check $ENVNAME
}

upload_file() {
	echo "File: $2/$1, to: $USRNAME@$IP:$3"
	scp -i $IDENTITY "$2/$1" "$USRNAME@$IP:$3" 2>&1
}

echo "Uploading SFS jars"
check_args $@
set_vars $1
check_and_mnt_shared
process