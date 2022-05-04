#!/usr/bin/env bash

SCAN_DIR="/home/vsko"
MALWARE_DIR="/home/vsko/fucker/"
REPORT_LOG="/home/vsko/malware.log"

echo "Scanning directory: ${SCAN_DIR}"
echo "Malware directory: ${MALWARE_DIR}"
echo "Reporting log: ${REPORT_LOG}"

#echo
#echo "Cleaning log ${REPORT_LOG}"
cat /dev/null > ${REPORT_LOG}

echo

echo "* clamscan"
clamscan -r -l ${REPORT_LOG} --move=${MALWARE_DIR} ${SCAN_DIR}

echo "* chkrootkit"
chkrootkit -q -r ${SCAN_DIR} > ${REPORT_LOG}

echo "* rkhunter"
#rkhunter --logfile ${REPORT_LOG} --update
#rkhunter --sk --report-warnings-only --logfile ${REPORT_LOG} --check
rkhunter --sk --logfile ${REPORT_LOG} --append-log --check

