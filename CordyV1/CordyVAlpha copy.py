import speech_recognition as sr
listener = sr.Recognizer()
import pyttsx3
from Comandos import *
#import verbos
import string 
#def EhVerbos(palavra):

def Analisador(frase,oracao,res):
    
    if "Saudacoes" in oracao:
        for n in range(len(oracao)):
            if oracao[n] == "Saudacoes":
                break
        res.append(str(Saudar(frase[n])))
        frase.remove(frase[n])
        oracao.remove("Saudacoes")
        
    if "PInterrogativos" in oracao:
        for n in range(len(oracao)):
            if oracao[n] == "PInterrogativos":
                break
        aux = frase[n]
        frase.remove(frase[n])
        oracao.remove("PInterrogativos")
        res.append(str(Pergunta(aux,frase,oracao)))
        res = str(res)
        
        
        
        



def Tipo_de_palavra(palavra):
    for opcao in palavras:
        #print(opcao)
        if palavra in palavras[opcao]:
            return opcao
    
    return "none"
  



def Remv_pon(oracao,arquivo):
    for i1 in range(len(oracao)):
        #print(i1)
        for i in range(len(list(arquivo.keys()))):
            for n in arquivo[list(arquivo.keys())[i]]:
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

def Remv_Space(frase):
    for vazio in frase:
        if vazio == "":
            frase.remove(vazio)
    while frase[len(frase)-1] == "":
        frase.pop(len(frase)-1)
    U = 0
    while U < len(frase):
        if frase[U] == "":
            while frase[U] == "":
                frase.pop(U)
        U+=1


def Detectarpontos(palavra):
    n = 0
    #npontos = 0
    posicao = []
    while n < len(palavra):
        U = 0
        while U < len(palavra[n])-1:
            p = 0
            #print(palavra[n])
            if palavra[n][U] in string.punctuation   :
                #npontos+=1
                posicao += [n]
                '''
                posicao.append(n)
                ponto = palavra[n][U]
                '''
                p +=1
                #print(ponto)
                #print("teste")
            #else:
                #print("nada")
            U+=1
        n+=1
    posicao += [len(palavra)-1]
    #posicao.append(len(palavra)-1)
    #print(posicao,"teste1")
   
    return posicao

def Gramaticar_Oracao(frase,Pposicao):
    oracao = []
    inicio = 0 
    pos = 0
    
    while inicio < len(Pposicao):
        
        while pos <= Pposicao[inicio]:
            
            oracao += [Tipo_de_palavra(frase[pos])]
            if oracao[pos] == "none":
                print(frase[pos]," eh uma palavra desconhecida")

            pos+=1
        inicio+=1
    
        
            
    return oracao
    


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
    Ppos += Detectarpontos(f)
#print(Ppos)
    Remv_pon(f,palavras)
    Oracoes= Gramaticar_Oracao(f,Ppos)
    resposta = []
    print(Oracoes)
    Analisador(f,Oracoes,resposta)
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

    
