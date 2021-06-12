#!/bin/sh
# Run it at 00:
YEST_DATE=`date --date="1 days ago" +%Y%m%d`;
echo "Creating logs for $YEST_DATE";
#echo '[-] Generating Unique Errors';
#sh log_summary_email_coll_log.sh
#echo '[-] Generating Payout Summary';
#sh payout_summary_email_coll_log.sh
cd ../../logs/
echo '[-] Rotating API Logs';
cp api.log api.log.$YEST_DATE; echo -n '' > api.log;
echo '[-] Moving Files';
mv api.log.$YEST_DATE log_archive/
cd log_archive
echo '[-] Compressing File';
gzip api.log.$YEST_DATE