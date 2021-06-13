#!/usr/local/bin/bash

export GUEST_IP
export HOST_IP
export LSG_DIR
export BA_CFG_DIR
export SFS_DIR

BA_CFG_DIR=/var/www/config
LSG_DIR=~/Documents/WorkWork/LuckyStrikeGames
SFS_DIR=/mnt/hgfs/C/Users/Santosh/SmartFoxServer_2X/SFS2X
Utils_dir="$LSG_DIR"/BingoAdventure_Utilities/scripts/shell
BA_CONFIG_FILE="$BA_CFG_DIR/bingo_adventure_config.ini"
BA_OPS_CONFIG_FILE="$BA_CFG_DIR/bingo_adventure_ops_config.ini"
BA_UPLOAD_SFS_JARS_SCRIPT="$LSG_DIR/BingoAdventure_Utilities/scripts/shell/upload_sfs_jars.sh"

declare -a LSGCONFIGFILES=("$Utils_dir"/persistentvars.sh "$Utils_dir"/bash_lsg.sh)
for file1 in ${LSGCONFIGFILES[@]}; do
	if [ -r $file1 ]; then
	  # Read the configfile if it's existing and readable
	  source $file1
	  echo "sourced file: $file1"
	fi
done

updips() {
	GUEST_IP=$(ifconfig ens33| sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
	OLDIFS=$IFS
	IFS='.'
  read -r -a arr <<< "$GUEST_IP"
	HOST_IP=${arr[0]}.${arr[1]}.${arr[2]}.1
	IFS=$OLDIFS
}

function vmmnt {
	echo "Mounting guest OS shared folders..."
	sudo mount -t fuse.vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other
	echo "Mounted at /mnt/hgfs"
}

function mylocalip {
	echo "$GUEST_IP"
}

function myhostip {
	echo "$HOST_IP"
}

check_and_mnt_shared() {
	DIR="/mnt/hgfs"
	if ! [ "$(ls -A $DIR)" ]; then
		echo "$DIR is Empty"
		vmmnt
	fi
}
export -f check_and_mnt_shared

function runbaapiserver {
	python manage.py runserver $GUEST_IP:8000
}

function updbaapicfg {
	echo "Guest ip: " $GUEST_IP
	echo "Host ip: " $HOST_IP
	#
	sed -i -e "s+^.*app_master_host.*$+app_master_host=$HOST_IP+g" \
		-i -e "s+^.*app_slave_host.*$+app_slave_host=$HOST_IP+g" \
		-i -e "s+^.*analytics_master_host.*$+analytics_master_host=$HOST_IP+g" \
		-i -e "s+^.*analytics_slave_host.*$+analytics_slave_host=$HOST_IP+g" \
		-i -r -e "s+^\bip=.*\b.*$+ip=$HOST_IP+g" \
		-i -e "s+^.*app_location.*$+app_location=$GUEST_IP+g" \
		-i -e "s+^.*user_log_host.*$+user_log_host=$GUEST_IP+g" \
		-i -e "s+^.*system_log_host.*$+system_log_host=$GUEST_IP+g" \
		-i -e "s+^.*allowed_hosts.*$+allowed_hosts=$GUEST_IP,$HOST_IP+g" \
		-i -r -e "s+^\bhost=.*\b.*$+host=$GUEST_IP+g" \
		-i -e "s+^.*website_url.*$+website_url=http://$GUEST_IP/+g" \
		-i -e "s+^.*privacy_policy_url.*$+privacy_policy_url=http://$GUEST_IP/+g" \
		-i -e "s+^.*terms_of_service_url.*$+terms_of_service_url=http://$GUEST_IP/+g" \
		-i -e "s+^.*support_url.*$+support_url=http://$GUEST_IP/+g" ${BA_CONFIG_FILE}
	#
	echo "Changed IP addresses in '${BA_CONFIG_FILE}' to $HOST_IP and $GUEST_IP"
}

function updbaopscfg {
	sed -i -r -e "1,120s%^.*host.*$%host=$HOST_IP%g" \
		-i -r -e "124s%^.*host.*$%host=$GUEST_IP%g" ${BA_OPS_CONFIG_FILE}
	echo "Updated IP addresses in '${BA_OPS_CONFIG_FILE}' to $HOST_IP and $GUEST_IP"
}

function ulsfsjars {
	$BA_UPLOAD_SFS_JARS_SCRIPT "$@"
}

function startlogcollectors {
	cd "$LSG_DIR/BingoAdventure_Ops/misc/scripts/emitter/"
	bash $PWD/start_api_log_collector.sh &
	bash $PWD/start_sfs_log_collector.sh &
	bash $PWD/start_user_log_collector.sh &
}

function setupba {
	updips
	updbaapicfg
	updbaopscfg
	startlogcollectors
	cd ~
}

sfs_restart() {
	#ssh -i $IDENTITY "$USRNAME@$IP" -t 'bash -ic "sfs_restart;bash"'
	env=`get_env_long "$1"`
	echo "RESTARTING SFS: $env"
	ssh $env -t 'bash -ic "sfs_restart;bash"'
}

process_sfs_logs() {
	echo "Processing SFS logs"
	OLDIFS=$IFS
	while IFS=""; read -r data; do
		echo "$data"
		
		if grep -qi "(error)|(exception)" <<< $data; then
			printf "FOUND ERROR\n"
			break
		fi
		if grep -qi 'BlueBox-2X Service.*ready' <<< $data; then
			printf "SUCCESSFULLY RESTARTED SFS\n"
			break
		fi
	done
	IFS=$OLDIFS
	exit
}

sfs_restart_check() {
	sfs_restart $1 | process_sfs_logs
}

get_env_long() {
	len=${#1}
	long_from=$1
	if [ $len -eq 1 ]; then
		case "$1" in
			[dD]) long_from="dev" ;;
			[qQ]) long_from="qa" ;;
			[sS]) long_from="stage" ;;
			[oO0]) long_from="ops" ;;
			[pPlL]) long_from="prod" ;;
			*) echo "Invalid environment parameter: $1" ;;
		esac
	fi
	printf '%s' "$long_from"
}

export -f sfs_restart
export -f sfs_restart_check
export -f process_sfs_logs
export -f get_env_long
