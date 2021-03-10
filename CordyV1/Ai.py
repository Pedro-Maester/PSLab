import json

class Ai:
    def __init__(self,arquivo):
        with open(arquivo) as  Artificial:
            InfoArti=json.load(Artificial)
        self.Linfo = list(InfoArti)
        self.info = [InfoArti]
        self.Place_info = InfoArti
        self.alegria = InfoArti["alegria"]
        self.raiva = InfoArti["raiva"]
        
    
    pass

cordy = Ai("Cordelia_AI.json")
#pedro = Ai("Pedro")


      