import os
import webbrowser
from perguntas import *
import string 
def Comandos_Base(frase):
    if frase == "abra o youtube" or frase =="abrir o youtube" or frase =="youtube" or frase == "poderia abrir o youtube?":
        webbrowser.open("https:\\www.youtube.com")
    elif frase == "abra o google" or frase =="abrir o google" or frase =="google" or frase =="poderia abrir o google?" or frase =="por favor poderia abrir o google?":
        webbrowser.open("https:\\www.google.com")

'''
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
'''        
def Analisador(frase,oracao,pontos,res):
    pos = 0
    for p in pontos:
        if  oracao[pos] == "Saudacoes"  :
            '''for n in range(len(oracao)):
                if oracao[n] == "Saudacoes":
                    break'''
            res.append(str(Saudar(frase[pos])))
            #frase.remove(frase[pos])
            #oracao.remove("Saudacoes")
            
        
        elif  oracao[pos] == "PInterrogativos"  :
            '''for n in range(len(oracao)):
                if oracao[n] == "PInterrogativos":
                    break'''
            aux = frase[pos]
            #frase.remove(frase[pos])
            #oracao.remove("PInterrogativos")
            res.append(str(Pergunta(aux,frase,oracao)))
            #res = str(res) 
        if p == pontos[len(pontos)-1]:
            break
        else:
            pos = p + 1       
        
        



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
                if oracao[i1][len(oracao[i1])-1] in string.punctuation:
                #print("foi3")
                    oracao[i1] = oracao[i1].replace(str(oracao[i1][len(oracao[i1])-1]), "")
                #print(f[i1])
                #print("foi4")
            
                if oracao[i1] == n:
                #print(f[i1])
                #print("foi")
                    break
            #else:
                #print(n)
                #print("falhou")
            if oracao[i1] == n :
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


def Detectarpontos(palavra,posicao):
    n = 0
    #npontos = 0
    
    while n < len(palavra)-1:
        U = 0
        while U < len(palavra[n]):
            p = 0
            #print(palavra[n])
            if palavra[n][U] in string.punctuation   :
                #npontos+=1
                posicao.append(n)
                print("sera?")
                p +=1
                #print(ponto)
                #print("teste")
            #else:
                #print("nada")
            U+=1
        n+=1
    #posicao += [len(palavra)-1]
    posicao.append(len(palavra)-1)
    #print(posicao,"teste1")
   
    #return posicao


'''
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
'''

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




def Calcular_palavra(palavra,Tpalavra):
    with open('Dados_Palavras.json') as  O_arquivo:
        palavras=json.load(O_arquivo)
    
    Status = palavras[Tpalavra][palavra]
    
    return Status

def ProcuPalEmo(emocao,Aonde,Emocao):

    if emocao == "alegria":
        Esel = 0
    with open('Dados_Palavras.json') as  O_arquivo:
        palavras=json.load(O_arquivo)
    for g in palavras[Aonde] :
        print(palavras[Aonde][g][Esel])
        
            
    
    




def Saudar(palavra):
    Dstatus = Calcular_palavra(palavra,"Saudacoes")
    cordy.alegria += Dstatus[0]
    cordy.raiva += Dstatus[1]
    ProcuPalEmo("alegria","Saudacoes",cordy.alegria)
    
    if cordy.alegria < 0:
        return "Ham"
    if cordy.alegria == 0:
        return "Ola"
    if cordy.alegria > 0:
        return "Prazer"

def Pergunta(PI,frase,oracaou):
    P = Interrogativa(PI,frase,oracaou)
    #print(oracaou)
    #print(P.orasion)
    
    pessoa = P.Referencial()

    if pessoa == 1:
        print("1")
        refe = pedro
        
    if pessoa == 2:
        #print("2")
        refe = cordy

    acao = P.TipodeVerbo()
    if acao == "informativa":
        return str(P.Informacao(refe,pessoa))
    if acao == 0:
        return "nap tem verbo"
    
        

    return "pergunta"


