# -*- coding: utf-8 -*-
# Luis Enrique Fuentes Plata

from typing import Optional
from pathlib import Path

def decoratorGetPath(function):
    def wrapper(file_name:str):
        return Path('/tmp', file_name)
    return wrapper
@decoratorGetPath
def getPath(file_name:str):
    """Getting the local Path, deactivate decorator for local testing
    Arguments:
        file_name {str} -- my_file.csv
    Returns:
        Path
    """
    from os import getcwd
    return Path(getcwd(), 'input', file_name)

def decoratorGetHostName(function):
    def wrapper():
        from os import environ
        return environ['HOSTNAME']
    return wrapper
@decoratorGetHostName
def getHostName()->str:
    """Returns a string for the FTP Hostname, deactivate decorator for local testing
    Returns:
        str -- HOSTNAME
    """
    return '' # Add your hostname

def decoratorGetUserName(function):
    def wrapper():
        from os import environ
        return environ['USERNAME']
    return wrapper
@decoratorGetUserName
def getUserName()->str:
    """Returns a string for the FTP UserName, deactivate decorator for local testing
    Returns:
        str -- USERNAME
    """
    return '' # Add your username

def decoratorGetPassword(function):
    def wrapper():
        from os import environ
        return environ['PASSWORD']
    return wrapper
@decoratorGetPassword
def getPassword()->str:
    """Returns a string for the FTP Password, deactivate decorator for local testing
    Returns:
        str -- PASSWORD
    """
    return '' # Add your password

def to_gcs_bucket(file_path:Path, prefix:str='saputo')->None:
    """Uploads a file (blob object) to a GCP bucket.

    Args:
        file_path (Path): This is where the file is located once is downloaded from FTP
        prefix (str, optional): Specific bucket prefix. Defaults to 'saputo'.
    
    Returns: 
        None
    """
    from os.path import basename
    from google.cloud import storage
    from datetime import datetime
    from pytz import timezone

    time = datetime.now(timezone('US/Eastern')).strftime('%Y%m%d')

    dictionary = {'bucketName': 'app-dataengineering',
                  'destination_blob_name': "{prefix}/{year}/{month}/{day}/{name}".format(prefix=prefix, year=time[0:4], month=time[4:6], day=time[6:], name=basename(file_path)),
                  'source_file_name': file_path}

    storage_client = storage.Client()
    storage_client.get_bucket(dictionary['bucketName']).blob(dictionary['destination_blob_name'])\
        .upload_from_filename(dictionary['source_file_name'])

def fixColumns(column_name:str)->str:
    """Transforms a string to be trimed, lower and it replaces white spaces.

    Args:
        column_name (str)

    Returns:
        [str]: clean string
    """
    return column_name.strip().lower().replace(' ','_')