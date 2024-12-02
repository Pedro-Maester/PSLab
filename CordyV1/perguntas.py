from Ai import *

with open('pessosdaspalavras.json') as  PP_lista:
    Pepalavras=json.load(PP_lista)
with open('listapalavras.json') as  P_lista:
    palavras=json.load(P_lista)
class Interrogativa:
    def __init__(self,Pi,phrase,orasion):
        self.Pi = Pi
        self.phrase = phrase
        self.orasion = orasion
    
    def TipodeVerbo(self):
        if "VerbosSertem" in self.orasion:
            for n in range(len(self.orasion)):
                if self.orasion[n] == "VerbosSertem":
                    break
            return "informativa"
        else:
            return 0
            
            
         





    def Referencial(self):
        print("foi aqui")
        if "PronomesPos" in self.orasion:
            for n in range(len(self.orasion)):
                if self.orasion[n] == "PronomesPos":
                    print("foi")
                    break
            if self.phrase[n] in Pepalavras["primeira"]:
                print("primeira")
                return 1
            if self.phrase[n] in Pepalavras["segunda"]:
                print("segunda")
                return 2
                

                

            print(self.orasion)
    def Informacao(self,refe,pessoa):
        print(pessoa)
        if pessoa == 2:
            for h in range(len(self.orasion)):
                print(h)
                if self.phrase[h] in refe.Linfo:
                    print("tem")
                    for n in range(len(self.orasion)):
                        if self.orasion[n] == "Info":
                            print("foi 2")
                            break
                    if self.orasion[n] == "Info":
                            print("foi 2")
                            break
                    
                    
            return refe.Place_info[str(self.phrase[h])]

            print(refe.info)
            print(refe.Linfo)
        return 0
        


        
        
            
    pass