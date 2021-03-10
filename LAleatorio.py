import os


Livros =  os.listdir()
Vnum = 0
import random

for livro in Livros:
        Vnum += 1
        #print(video)
        

livros=Livros
Nram = random.randint(0,Vnum-1)
#print(Vnum)
#print(Nram)


if (livros[Nram].endswith(".pdf") == 0):
    #print (livros[Nram])
    if Nram == 0:
        Nram += 1
    elif Nram == Vnum-1:
        Nram -= 1
    else:
        Nram += 1
    #print("pegou" , Nram)
os.startfile(livros[Nram])



 



    

 
