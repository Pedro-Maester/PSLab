import speech_recognition as sr
listener = sr.Recognizer()
import pyttsx3
from Comandos import *
#import verbos

#def EhVerbos(palavra):


    


'''with open('Dados_Palavras.json') as  O_arquivo:
    palavras=json.load(O_arquivo)
'''    '''
try:
    with sr.Microphone() as source:
        print("escutando...")
        voice = listener.listen(source)
        command = listener.recognize_google(voice)
        print(command)

except:
    pass        
'''
f = str(input("frase: "))
with open("jafeitas.json") as jafeitas:
    Jperguntas = json.load(jafeitas)
         
if f.lower() in Jperguntas :
    print(Jperguntas[f.lower()]) 
else:
#Comandos_Base(f)
#print(f)
    f = f.split(" ")
#print(f)

    Remv_Space(f)
    Ppos = []
    Detectarpontos(f,Ppos)
    print("aqui abaixo")
    print(Ppos)
    Remv_pon(f,palavras)
    Oracoes= Gramaticar_Oracao(f,Ppos)
    resposta = []
    print(Oracoes)
    Analisador(f,Oracoes,Ppos,resposta)
#print(Ppos)
#print(Oracoes)
    for a in range(len(resposta)): 
        print(resposta[a],end=" ")
    print("")
    print(cordy.alegria)

'''
for i1 in range(len(f)):
    print(i1)
    for i in range(len(list(palavras.keys()))):
        for n in palavras[list(palavras.keys())[i]]:
            #print(n)
            if f[i1][len(f[i1])-1] in string.punctuation:
                #print("foi3")
                f[i1] = f[i1].replace(str(f[i1][len(f[i1])-1]), "")
                #print(f[i1])
                #print("foi4")
            
            if f[i1] == n:
                #print(f[i1])
                #print("foi")
                break
            #else:
                #print(n)
                #print("falhou")
        if f[i1] == n :
            #print("foi2")
            break
        #print("teste")
    
        
        #print("oi")
#print(f)'''
'''
posicaoI = 0
for PosA in range(len(Ppos)):
    Ordenar_Oracao(f,posicaoI,Ppos[PosA])
    posicaoI = Ppos[PosA]
    print("foi")'''
#if f[0] in palavras
'''
chaves = palavras.keys()
print(list(chaves)[1])
pronomes = list(chaves)[1]
#print(palavras[pronomes])
Relativos = list(palavras[pronomes])[0]
print(palavras[pronomes][Relativos][0])
#print(palavras[palavras[list(chaves)[1]]][1])
if f[0] in  palavras["Verbos"]["funcao"]:
    print(palavras["Verbos"]["funcao"][f[0]][0])
    print("teste")
else:
    print("falhou")
    print(f[0])

#print(R.replace(' ',''))'''
'''
U = 0
while U < len(f):
    #s = f[U].split(",")
    #print(s)
    print(f[U])
    f[U] =f[U].replace(",","")
    print(f[U])
    U+=1'''
    

    

'''
P = palavras["Interjeicoes"]
g = ""
h = 0
for c in P:
    for d in P[c]:
        
        for i in d: 

            g = i
            if str(g) == R:
                print("A palavra esta no vocabulario")
                break 

                
            
        if str(g) == R:
            break
    if str(g) == R:
        break 
    h += 1
if h == len(P.keys()):
    print("a palavra nao esta no vocabulario")
    '''



    

            
           

            

            


        
        

     



'''
F = palavras["Interjeicoes"]'''
'''
print(F)'''
'''
print(F[0]["funcao"])

T = F[0]["funcao"]

print(T[0]["testar"][0])'''

    
