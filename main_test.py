# -*- coding: utf-8 -*-
# Luis Enrique Fuentes Plata

from typing import Optional
from main import saputoProcess

# This is to simulate Cloud behavior
class Request:
    args = dict()

    def __init__(self, other:str):
        self.args['message'] = other
    
    def get_json(self):
        return 'Local Testing' 

request = Request('process')
saputoProcess(request)