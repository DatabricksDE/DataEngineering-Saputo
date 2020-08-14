# -*- coding: utf-8 -*-
# Luis Enrique Fuentes Plata

# Importing global lib
import logging
from typing import Optional
import paramiko

class ClassFTP:
    def __init__(self, host_name:str, user_name:str, password:str):
        self.__HOSTNAME = host_name
        self.__USERNAME = user_name
        self.__PASSWORD = password
        self.__ssh_client = self.__setClient()

    def __setClient(self)->paramiko.SSHClient:
        """This private methods returns the client

        Returns:
            paramiko.SSHClient: [description]
        """
        logging.info('Starting Paramikio client')
        ssh_client = paramiko.SSHClient()
        ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        return ssh_client
    
    def moveFilesFromFTP(self)->list:
        """Downloads files from FTP Saputo, locally and returns a list of files donwloaded

        Returns:
            list: List of files donwloaded
        """
        from os import getcwd
        from etl.GeneralFunctions import getPath

        try:
            
            self.__ssh_client.connect(hostname=self.__HOSTNAME, username=self.__USERNAME, password=self.__PASSWORD, allow_agent=False, look_for_keys=False)
            
            with self.__ssh_client.open_sftp() as ftp:

                files_out = []
            
                for file in ftp.listdir(f'Inbound/Saputo/'):
                    local_file = getPath(file)
                    ftp.get(f'Inbound/Saputo/{file}', local_file) # (remote path, local path)
                    files_out.append(local_file)
                    #ftp.remove(file)
            
                ftp.close() # sometimes with does not close the connection, therefore connection is explicitly closed

                return files_out
        except Exception as e:
            logging.error(e)

    def moveFilesToFTP(self, file_list:list):
        """Upload files in Output to FTP Saputo

        Args:
            file_list (list): List of files in Output
        """
        from os.path import basename
        try:
            self.__ssh_client.connect(hostname=self.__HOSTNAME, username=self.__USERNAME, password=self.__PASSWORD, allow_agent=False, look_for_keys=False)
            
            with self.__ssh_client.open_sftp() as ftp:

                for file in file_list:
                
                    ftp.put(file, f'Outbound/Saputo/{basename(file)}') # remote path, local path
            
                ftp.close() # sometimes with does not close the connection, therefore connection is explicitly closed

        except Exception as e:
            logging.error(e)
    
    def __del__(self):
        self.__ssh_client.close()
        logging.info("Client FTP Connection deleted")