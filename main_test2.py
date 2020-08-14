# -*- coding: utf-8 -*-
# Luis Enrique Fuentes Plata

class AbstractClass:

    list_output_files = []

    def __init__(self, file_name:str):
        self.file_name = file_name
    
    def toCSV(self):
        AbstractClass.list_output_files.append(self.file_name)
    
    def __del__(self):
        pass
        #print(f'I am gone {self.file_name}')

class WorkOrders(AbstractClass):
    def __init__(self, file_name:str):
        super(WorkOrders, self).__init__(file_name=file_name)

class Incidents(AbstractClass):
    def __init__(self, file_name:str):
        super(Incidents, self).__init__(file_name=file_name)

if __name__ == "__main__":
    
    for element in ['work', 'incident']:
        if element == 'work':
            obj = WorkOrders('WorkOrders.csv')
        else:
            obj = Incidents('Incident.csv')

        obj.toCSV()
    
    print(AbstractClass.list_output_files)