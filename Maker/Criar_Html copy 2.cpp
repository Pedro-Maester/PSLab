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






void Header_Base(std::ofstream &arq){

arq<<"<header>\n";

arq<<"<nav id='Cerebro'>\n";

arq<<"<div id='logo'>\n</div>\n";
for(int i = 0; i<= 5; i++ ){

arq<<"<a href=''>"<<i<<"<a>";

}

arq<<"<input id='pesquisa' type='search' placeholder='pesquisar' list='lista'>\n";

arq<<"<datalist id='lista'>";

for(int i = 0; i< 5; i++ ){

arq<<"<option value=''>"<<i<<"</option>\n";

}
arq<<"</datalist>\n";
arq<<"</nav>\n</header>";

}

void Main_Base(std::ofstream &arq){

arq<<"<main>";

for(int i= 0 ; i< 3; i++){
arq<<"<div>"<<i<<"</div>";
}

arq<<"</main>";
}

void Footer_Base(std::ofstream &arq){

arq<<"<footer>\n";

arq<<"</footer>\n";

}

void OBasico(std::ofstream &arq){

Header_Base(arq);
Main_Base(arq);
Footer_Base(arq);

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

   std::cout<< "Adicionar  ao body?\n 0- Eu mesmo coloco \n 1-Header/Main/Footer \n 2-PaginaLink  ";

  std::cin>>op;
switch (op)
{
   case 0:
   
   break;
   case 1 :
   OBasico(arq);
   break;
   case 2 :
  // PLink();
   break;
   /*case :
   
   break;*/

default:
   break;
}







arq<<"</body>\n</html>";
arq.close();

}