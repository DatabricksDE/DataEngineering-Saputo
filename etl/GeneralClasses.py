# -*- coding: utf-8 -*-
# Luis Enrique Fuentes Plata

from typing import Optional
from pathlib import Path
from os import getcwd
import logging
import pandas as pd
import numpy as np
import re

from etl.GeneralFunctions import getPath, fixColumns

class RelationalTable:
  def __init__(self, file_name:str):
    self.file_path = Path(getcwd(), 'input', file_name)
    self.df = pd.read_excel(open(self.file_path, 'rb'))

class AbstractClass:
  # Class attribute
  list_output_files = []

  def __init__(self, file_path:Path):
    self.file_path = file_path
    self.df = None
  
  def loadDataFrame(self)->None:
    pass

  def cleanDataFrame(self)->None:
    pass
  
  def joinWithRelationalTable(self, rt:RelationalTable)->None:
    pass

  def toCSV(self)->None:
    """Transforms DataFrame to CSV file and saves Path class attribute list_output_files
    Args:
      None
    
    Returns:
      None
    """
    import csv
    from os import getcwd
    from os.path import basename
    from etl.GeneralFunctions import getPath
    
    file_base_name = basename(self.file_path)
    file_path = getPath("{file_base_name}.csv".format(file_base_name=file_base_name[0:file_base_name.find('.',0,len(file_base_name))]))
    
    #self.df.to_csv(Path(getcwd(), 'output', "{file_base_name}.csv".format(file_base_name=file_base_name[0:file_base_name.find('.',0,len(file_base_name))])),  encoding='utf-8', line_terminator='\n', quoting=csv.QUOTE_ALL, quotechar='"', index=False)
    self.df.to_csv(file_path,  encoding='utf-8', line_terminator='\n', quoting=csv.QUOTE_ALL, quotechar='"', index=False)
    
    # Append to list_output_files
    AbstractClass.list_output_files.append(file_path)

  def __del__(self):
    logging.info('Object Terminated')
    
class WorkOrders(AbstractClass):
  def __init__(self, file_path:Path):
    super(WorkOrders, self).__init__(file_path=file_path)

  def loadDataFrame(self)->None:
    """ Loading data effectively from a .xlsx to a DataFrame, reindexing rows.
    
    Returns: 
      None: This operation is inplace
    """
    # Loading few rows to find the SRID
    df = pd.read_excel(open(self.file_path, 'rb'), nrows=10)
    
    # Calculating rows to skip
    skiprows =  df[df[df.columns[0]]=='SRID'].index.to_list()[0] + 1
    
    # This is to get the columns
    df = pd.read_excel(open(self.file_path, 'rb'), skiprows=skiprows, nrows=10)

    # Reading the full data set with fixed columns
    self.df = pd.read_excel(open(self.file_path, 'rb'), names=list(map(fixColumns, list(df.columns))), skiprows=skiprows)
  
  def cleanDataFrame(self)->None:
    """ Cleaning columns of the self DataFrame

    Returns: 
      None: This operation is inplace
    """
    # Using Set Theory
    universe = set(self.df.columns)
    dates = set(['submit_date','actual_start_date','actual_end_date','completed_date','last_modified_date'])

    for column in (universe-dates):
      self.df[column].fillna("", inplace=True)
      self.df[column] = self.df[column].astype(str).str.strip()
      self.df[column].replace(to_replace=[r"\\t|\\n|\\r", "\t|\n|\r", '"', ",", '“','”'], value=[" "," ","'",";","'","'"], regex=True, inplace=True)

    for column in dates:
      self.df[column] = self.df[column].apply(lambda x: "" if pd.isna(x) else str(x).strip())
  
  def joinWithRelationalTable(self, rt:RelationalTable)->None:
    """ With Association, using the rt instance to get work_orders and db_table

    Args:
        rt (RelationalTable): This will provide a mapping based for the columns that are needed.
    """
    self.df = self.df.reindex(columns=list(rt.df['work_orders']), fill_value='')
    self.df.set_axis(list(rt.df['db_table']), axis=1, inplace=True)

class Incidents(AbstractClass):
  # ====================todo============================
  # Methods missing and docs missing todo
  def __init__(self, file_name:str):
    super(Incidents, self).__init__(file_path=getPath(file_name))
  
  def loadDataFrame(self)->None:
    # remove the line below in case you have implemented a solution
    raise NotImplementedError

  def cleanDataFrame(self)->None:
    # remove the line below in case you have implemented a solution
    raise NotImplementedError
  
  def joinWithRelationalTable(self, rt:RelationalTable)->None:
    # remove the line below in case you have implemented a solution
    raise NotImplementedError