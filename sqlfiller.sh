#!/bin/bash

#ADP automation - wednesday script
#this script records the data points that will be loaded into the sql template

#configs
. ./sqlfiller.config

#add error checking, formatting checking, +1s logic
#add config file for directory paths
echo -e  "Enter the ${YELLOW}batch id#${NC}"
read -p "> " batch_id
echo -e ${GREEN}"The batch id# is $batch_id${NC}"
echo "***************************"
echo -e "Enter todays date: ${YELLOW}(MM-DD)${NC}"
read -p "> " date
echo -e ${GREEN}"Today's date is: $date${NC}"
echo "***************************"
echo -e "Enter zip start time ${YELLOW}(HH:MM:SS)${NC}"
read -p "> " zip_start
echo -e ${GREEN}"Zip start time: $zip_start${NC}"
echo "***************************"
echo -e "Enter zip finish time ${YELLOW}(HH:MM:SS)${NC}"
read -p "> " zip_finish
echo -e ${GREEN}"Zip finish time: $zip_finish${NC}"
echo "***************************"
echo -e "Enter sftpstart time: ${YELLOW}(HH:MM:SS)${NC}"
read -p "> " sftp_start
echo -e ${GREEN}"sftp start time: $sftp_start${NC}"
echo "***************************"
echo -e "Enter sftpfinish time: ${YELLOW}(HH:MM:SS)${NC}"
read -p "> " sftp_finish
echo -e ${GREEN}"sftp finish time: $sftp_finish${NC}"
echo "***************************"

#make this filepath flexible
filename=adp_production_run_updates_$batch_id.sql
echo filename is $filename

cp -n $TEMPLATE "$filename"
echo
sed -i.'bak' -e "s/batch_id_/$batch_id/g" \
    -e "s/MM-DD/$date/g" \
    -e "s/_zip_start_time_/$zip_start/g" \
    -e "s/_zip_finish_time_/$zip_finish/g" \
    -e "s/_sftp_start_time_/$sftp_start/g" \
    -e "s/_sftp_finish_time_/$sftp_finish/g" "$filename"
