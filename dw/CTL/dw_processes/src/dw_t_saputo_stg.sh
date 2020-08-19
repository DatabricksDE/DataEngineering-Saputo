#!/usr/bin/ksh -x
#. ~/.profile
#################################################
#
#  dw_t_saputo_stg.sh
#
#  Change History
#  Historic Info:
#  Name:              Date:        Brief Description:
#  -----------------------------------------------------------------------------
#  Luis Fuentes       08/14/2020   Initial Creation
#  -----------------------------------------------------------------------------
#  
#################################################

# Declaring variables
BASE_DIR=/APPS/dw/base/dw_processes/pidgeon
DATA_DIR_TMP=$BASE_DIR/tmp
DATA_DIR=$BASE_DIR/data
FNAME=*.csv
TMP_FILE=/tmp/t_saputo_stg.log
TRGT_DIR=/xfer/DW/data
TRGTFILE=t_saputo_stg.dat

# This funtion gets the credentials that connect to the ftp server
getcredentials()
{
    FTP_CC=''
    FTP_CC_USER=''
    FTP_CC_PASS=''
    FTP_CC_MODE='asc'
    FTP_CC_DIR='Outbound/Saputo'
}

# Start FTP to the CC FTP site
getfiles()
{
 ( 
	/usr/bin/sftp ${FTP_CC_USER}@${FTP_CC} > ${TMP_FILE} 2>&1 <<-EOF
	cd ${FTP_CC_DIR}
	lcd ${DATA_DIR_TMP}
	mget ${FNAME}
    rm ${FNAME}
	bye
	EOF
 ) 
}

# Creates a .dat file and puts it in the DATA_DIR dir
transform_data()
{
    cd ${DATA_DIR_TMP}

    FILECNTR=0
    for FILE in `ls Extract*.csv`
    do
        FILECNTR=$((FILECNTR+1))
        if [ $FILECNTR -eq 1 ] ; then
            cat $FILE > ${DATA_DIR}/$TRGTFILE
            rm $FILE
        else
            sed '1'd $FILE >> ${DATA_DIR}/$TRGTFILE
            rm $FILE
       fi    
    done
}

#Send .dat file to xfer/DW
move_datafile()
{
    cd ${DATA_DIR}

    if [ -f ${TRGTFILE} ]; then
        mv ${TRGTFILE} ${TRGT_DIR}
        chmod 777 ${TRGT_DIR}/${TRGTFILE}
    fi 
}

# Main Function
cd $BASE_DIR
getcredentials
getfiles
transform_data
move_datafile