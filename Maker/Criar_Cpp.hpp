/*#pragma once


void biblioteca(){

std::cout<<"Escolha a biblioteca que deseja\n 0- nao esta aqui vou escrever \n 1- fstream pra arquivo \n 2-ctdlib \n 3- stdio.h \n 4- math.h pra matematica \n 4- vector para vectors \n 5- cstdlib \n 6- string";

}








void Criar_Cpp(std::string nome , std::string tipo){
std::ofstream arq;
arq.open( nome + tipo);
arq<<"#include <iostream>\n";
bool aux = true;
int op;
 do
 {
     std::cout<<"Escolha o que vc quer fazer no codigo \n 0-  ir para dentro do main  \n 1-adicionar biblioteca\n 2- adicionar global variavel \n 3- adicionar funcao \n  4 - adicionar expressão \n 5- adicioanr operação \n 6 - adicionar struct \n 7- adcionar classe \n 8- adicionar objeto \n 9- adicionar comentario de uma linha \n 10- escrever ";
     std::cin>>op;
     switch (op)
     {
     case 0: // ir pro main
         aux = false;
         break;

         case 1:
         biblioteca();
         break;
         case  2 :
         break;
         case  3 :
         break;
         case  4 :
         break;
         case  5 :
         break;
         case  6 :
         break;
         case  7 :
         break;
         case  8 :
         break;
         case  9:
         break;
         case 10:
         break;

     
     default:
      std::cout<<"Erro digite um valor valido"<<std::endl;
         break;
     }
 } while (!aux);
 
//dentro do main



arq.close();
}*/