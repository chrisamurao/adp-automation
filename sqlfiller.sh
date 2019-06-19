#!/bin/bash

#ADP automation - wednesday script
#this script records the data points that will be loaded into the sql template

#add error checking, formatting checking, +1s logic
echo Enter the batch id#
read batch_id
echo The batch id# is $batch_id
echo "***************************"
echo Enter todays date: (MM-DD)
read date
echo Today\'s date is: $date
echo "***************************"
echo Enter zip start time (HH:MM:SS)
read zip_start
echo Zip start time: $zip_start
echo "***************************"
echo Enter zip finish time (HH:MM:SS)
read zip_finish
echo Zip start time: $zip_finish
echo "***************************"
echo Enter sftpstart time: (HH:MM:SS)
read sftp_start
echo sftp start time: $sftp_start
echo "***************************"
echo Enter sftpfinish time: (HH:MM:SS)
read sftp_finish
echo sftp start time: $sftp_finish
echo "***************************"

#change this to template name
filename=script_number_$batch_id.sql
echo filename is $filename

cp test.sql "$filename"
read noop
sed -i -e "s/batch_id_/$batch_id/g" \
    -e "s/MM-DD/$date/g" \
    -e "s/_zip_start_time_/$zip_start/g" \
    -e "s/_zip_finish_time_/$zip_finish/g" \
    -e "s/_sftp_start_time_/$sftp_start/g" \
    -e "s/_sftp_finish_time_/$sftp_finish/g" \
    "$filename"