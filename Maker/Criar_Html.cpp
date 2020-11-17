
 #include<iostream>
#include <fstream>
#include <string>

int op = 0;

void head(std::ofstream &arq){

do
{
    std::cout<<"O que gostaria de adicionar? \n default-Nada \n 1- styleshhet \n 2- icon \n 3-script \n 4- escrever\n";
    std::cin>>op;
    std::string Narq;
    std::string typo;
    std::string tam;
    switch (op)
    {
    case 1/* constant-expression */: //stylesheet
        std::cout<<"O nome com o tipo do arquivo \n";
        std::cin>>Narq;
        arq<<"<link rel='stylesheet' href='"<<Narq<<"'>"<<std::endl;
        break;
        case 2 /* constant-expression */:
        std::cout<<"O nome com o tipo do arquivo \n";
        std::cin>>Narq;
        std::cout<<"O tipo da imagem \n";
        std::cin>>typo;
        std::cout<<"O tamanho da imagem \n ";
        std::cin>>tam;
        /* code */arq<<"<link rel='icon'  type='image/"<<typo <<"' sizes='"<< tam <<"href='"<<Narq<<"'>"<<std::endl;
        break;
        case  3/* constant-expression */:
        std::cout<<"O nome com o tipo do arquivo \n";
        std::cin>>Narq;
        arq<<"<script src='"<<Narq<<"'></script>"<<std::endl;
        /* code */
        break;
       /* case  4:
        
        code 
        break;*/
        
    
    default:
    op = 0;
        break;
    }
} while (op != 0);




}
/*
std::string funcao(){

   return 0;
}
*/

void tags(std::ofstream &arq , std::string tag){


std::string n;
 std::string N1;
 
/*
bool P;
int NP;
std::string P;
std::string E;
*/
arq<<"<"<<tag<<" ";

do
{
   std::cout<<"Gostaria de adicioanr algo dentro desta tag? default - Nada\n 1- id \n 2- classe \n 3- type \n 4- name \n 5- value \n 6- list \n 7- placeholder \n 8- wrap \n 9-Digitar";
   std::cin>> op;
   switch (op)
   {
   case 1 :
   std::cout<<"de a id\n";
   std::cin>>N1;
   arq<<" id = '"<<N1<<"'";
      
      break;
   
      case 2 :
      std::cout<<"de a classe\n";
   std::cin>>N1;
   arq<<" class = '"<<N1<<"'";
      break;
         /*case  :
      std::cout<<"de o tipo  de evento\n";
   std::cin>>E;
   std::cout<<"de o nome da funcao (sem parenteses)\n";
   std::cin>> N;
   std::cout<<"Parametros?\n  default : sim \n 0 : nao";
   if(P){
     std::cout<<"Quantos?\n";
     std::cin>>NP;
     arq<<E<<"="<<N<<"'";
     for(int i = 0; )
   }else{

   }
   
      break;*/
      case 3:
      std::cout<<"de o type \n";
   std::cin>>N1;
   arq<<" type  = '"<<N1<<"'";
       break;
           case 4:
      std::cout<<"de o name \n";
   std::cin>>N1;
   arq<<" name  = '"<<N1<<"'";
       break;
         case 5:
      std::cout<<"de o value \n";
   std::cin>>N1;
   arq<<" value  = '"<<N1<<"'";
       break;
       case 6 :
        std::cout<<"de a list  \n";
   std::cin>>N1;
   arq<<" list  = '"<<N1<<"'";
       break;
       case 7 :
        std::cout<<"de o place holder \n";
   std::cin>>N1;
   arq<<" placeholder  = '"<<N1<<"'";
       break;
       case 8 :
        std::cout<<"de o wrap \n";
   std::cin>>N1;
   arq<<" wrap  = '"<<N1<<"'";
       break;
       case 9:
        std::cout<<"de o atributo \n";
        std::cin>>n;
        std::cout<<"de o valor de"<<n;
   std::cin>>N1;
   arq<<" "<<n<<'='<< "'"<<N1<<"'";
       break;
   default:
   op = 0;
      break;
   }
} while (op != 0);


arq<<">\n";



}

void intag(std::ofstream &arq , std::string tag ){

std::string pa;
do
{
   std::cout<<"Gostaria de por algo dentro de "<<tag<<"? \n 0-parar \n default nada\n 1- Texto \n 2- outra tag";
   std::cin>>op;
   switch (op)
   {
      case 0:
      break;
   case 1 :
   std::cout<<"Digite o texto\n";
   std::cin>> pa;
      arq<<pa;
      break;
      case 2:
      std::cout<<"Digite a tag\n";
   std::cin>> pa;
   tags(arq, pa);
  
     if((pa != "img") || (pa != "input") || (pa != "iframe") || (pa != "option")){
     intag(arq, pa);
      
   }  
      
   default:
   
      break;
   }
} while ( op != 0);

arq<<"</"<<tag<<">\n";


}

void body(std::ofstream &arq){

    
    
    do
    {
        std::cout<<"O que gostaria de adicionar? \n default-Nada \n 1- div \n 2- nav   \n 3- p\n 4- span \n 5- label \n 6- a   \n 7- form \n 8 - input  \n 9-button \n 10 select \n 11- img\n 12- digitar";
        std::cin>>op;
        std::string N;
        switch (op)
        {
        case 1:
        tags(arq ,"div");
        intag(arq, "div");
            /* code */
            break;
               case 2:
               tags(arq ,"nav");
        intag(arq, "nav");
            /* code */
            break;
               case 3:
            /* code */tags(arq ,"p");
        intag(arq, "p");
            break;
               case 4:
            /* code */tags(arq ,"span");
        intag(arq, "span");
            break;
               case 5:
            /* code */tags(arq ,"label");
        intag(arq, "label");
            break;
               case 6:
            /* code */tags(arq ,"a");
        intag(arq, "a");
            break;
               case 7:
            /* code */tags(arq ,"form");
        intag(arq, "form");
            break;
               case 8:
               tags(arq ,"input");
        
            /* code */
            break;
               case 9:
               tags(arq ,"button");
        intag(arq, "button");
            /* code */
            break;
               case 10:
               tags(arq ,"select");
        intag(arq, "select");
            /* code */
            break;
               case 11:
               tags(arq ,"img");
        
            /* code */
            break;
               case 12:
               std::cout<<"Digite o nome da tag\n";
               std::cin>>N;
               tags(arq,N);
               if(N != "img" || N != "iframe" || N != "input" || N != "option"){
                  intag(arq,N);
               }


            /* code */
            break;
              /* case 13:
             
            break;*/
        
        default:
        op = 0;
            break;
        }
        /* code */
    } while (op !=0);
    

}


void Criar_Html (std::string nome , std::string tipo){
std::ofstream arq;
arq.open( nome + tipo , std::ios::app);
std::cout<<"v17"<<std::endl;
arq<<"<!DOCTYPE html>\n<html lang='pt'>\n<head>\n<meta charset='UTF-8'/>\n <meta name='viewport'  content='width=device-width, initial-scale=1.0 ' > \n <meta http-equiv='X-UA-Compatible' content='ie=edge'> \n";

int SoN;
do
{
    head(arq);
    std::cout<<"Gostaria de adicionar mais coisas ao head? \n 1 : sim \n 0: nao \n";/* code */
    std::cin>>SoN;
    
} while (SoN);
arq<<"</head>\n <body>";


do
{
    body(arq);
    std::cout<<"Gostaria de adicionar mais coisas ao body? \n 1 : sim \n 0: nao \n";/* code */
    std::cin>>SoN;
} while (SoN);






arq<<"</body>\n</html>";
arq.close();

}