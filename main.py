# -*- coding: utf-8 -*-
# Luis Enrique Fuentes Plata
# export GOOGLE_APPLICATION_CREDENTIALS=/Users/domfp13/CloudKeys/luis-defaul-microstrategyit.json

from typing import Optional

import logging
from functools import partial
from os.path import basename
from json import dumps

from etl.FTP import ClassFTP
from etl.GeneralFunctions import to_gcs_bucket, getFilesOutput, transformToPath
from etl.GeneralClasses import RelationalTable, WorkOrders, Incidents
from etl.GeneralFunctions import getHostName, getUserName, getPassword

def saputoProcess(request):
    """Responds to any HTTP request
    Args:
        request: HTTP request object
    Returns:
        The response text or any set of values that can be turned into a
        Response object. 
    """
    
    request_json = request.get_json() # This object is just for API Gateway

    try:

        logging.info('1. Starting')

        logging.info('2. Creating FTP Instance')
        transfer = ClassFTP(getHostName(), getUserName(), getPassword())

        logging.info('3. Downloading Files From FTP')
        list_of_files = transfer.moveFilesFromFTP()

        if list_of_files:

            logging.info('4. Loading downloaded files to the cloud')
            list(map(partial(to_gcs_bucket, prefix='saputo'), list_of_files))

            logging.info('5. Creating RelationalTable instance')
            rt = RelationalTable('TableSaputo.xlsx')

            logging.info('6. Processing Files Downloaded')
            for file in list_of_files:
                logging.info(f'6.1. Processing {file}')

                if 'work' in basename(file).strip().lower():
                    obj = WorkOrders(basename(file))
                    obj.loadDataFrame()
                    obj.cleanDataFrame()
                    obj.joinWithRelationalTable(rt)
                    obj.toCSV()

                # else:
                #     obj = Incidents(basename(file))
            
            logging.info('7. Uploading files to FTP')
            transfer.moveFilesToFTP(list(map(transformToPath, getFilesOutput())))

        logging.info('8. Ending process')
        return dumps({'success': True}), 200, {'ContentType': 'application/json'}

    except Exception as e:
        logging.exception(e)
        return dumps({'success': False}), 400, {'ContentType': 'application/json'}