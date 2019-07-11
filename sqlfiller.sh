#!/bin/bash

#ADP automation - wednesday script
#this script records the data points that will be loaded into the sql template

#configs
. ./sqlfiller.config

#add error checking
echo -e  "Enter the ${YELLOW}batch id#${NC}"
read -p "> " batch_id
echo -e ${GREEN}"The batch id# is $batch_id${NC}"
date=$(date +%m-%d)
echo -e ${GREEN}"Today's date is: $date${NC}"
echo -e "${YELLOW}Press enter to record Zip Time:${NC}"
read -p "> " pause
zip_start=$(date +%T)
zip_finish=$(date -v "+1S" +%T)
echo -e ${GREEN}"Zip start time: $zip_start${NC}"
echo -e ${GREEN}"Zip finish time: $zip_finish${NC}"
echo -e "${YELLOW}Press enter to record Zip Time:${NC}"
read -p "> " pause
sftp_start=$(date +%T)
sftp_finish=$(date -v "+1S" +%T)
echo -e ${GREEN}"sftp start time: $sftp_start${NC}"
echo -e ${GREEN}"sftp finish time: $sftp_finish${NC}"

#make this filepath flexible
filename=adp_production_run_updates_$batch_id.sql

cp -i $TEMPLATE "$filename"
sed -i.'bak' -e "s/batch_id_/$batch_id/g" \
    -e "s/MM-DD/$date/g" \
    -e "s/_zip_start_time_/$zip_start/g" \
    -e "s/_zip_finish_time_/$zip_finish/g" \
    -e "s/_sftp_start_time_/$sftp_start/g" \
    -e "s/_sftp_finish_time_/$sftp_finish/g" "$filename"

rm $filename.bak
echo Finished. Filename is $filename
