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
    if request.args and 'message' in request.args:

        logging.info('1. Downloding data')
        
        transfer = ClassFTP(getHostName(), getUserName(), getPassword())

        list_of_files = transfer.moveFilesFromFTP()
        
        if list_of_files:
            logging.info('2. Load files to the cloud')
            list(map(partial(to_gcs_bucket, prefix='saputo'), list_of_files))

            logging.info('3. Creating RelationalTable instance')
            rt = RelationalTable('TableSaputo.xlsx')

            for file in list_of_files:
                if 'work' in basename(file).strip().lower():
                    obj = WorkOrders(basename(file))
                    obj.loadDataFrame()
                    obj.cleanDataFrame()
                    obj.joinWithRelationalTable(rt)
                    obj.toCSV()

                # else:
                #     obj = Incidents(basename(file))

            transfer.moveFilesToFTP(list(map(transformToPath, getFilesOutput())))
        else:
            return f'No message Found'
    
        return dumps({'success': True}), 200, {'ContentType': 'application/json'}