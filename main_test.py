# -*- coding: utf-8 -*-
# Luis Enrique Fuentes Plata

from typing import Optional
from main import saputoProcess

class Request:
    args = dict()

    def __init__(self, other:str):
        self.args['message'] = other

request = Request('process')
saputoProcess(request)