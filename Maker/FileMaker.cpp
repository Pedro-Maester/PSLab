


//#include "Criar_Cpp.hpp"
#include "Criar_Html.cpp"





int main(){
int op;
std::string tipo;
std::cout<<"Selecione o tipo do arquivo"<<std::endl;
std::cout<<"1-C \n2-C++ \n3-Html \n4-Css\n5-Js "<<std::endl;
bool aux;
do{

std::cin>>op;
switch (op)
{
case 1:
    tipo = ".c";
    aux = true;
    break;

    case 2:
    tipo = ".cpp";
    aux = true;
    break;
    case 3 :
    tipo = ".html";
    aux = true;
    break;

    case 4 :
    tipo = ".css";
    aux = true;
    break;
    case 5 :
    tipo = ".js";
    aux = true;
    break;

default:
aux = false;
 std::cout<<"Erro digite um numero valido"<<std::endl;
    break;
}

}while(!aux);
std::string nome;
do
{

std::cout<<"Digite o nome que vc quer por no arquivo"<<std::endl;
std::cin>>nome;
//std::ifstream teste (nome + tipo) ;
std::ifstream teste;
teste.open(nome + tipo);
if(teste.is_open()){
std::cout<<"ERRO este arquivo já existe"<<std::endl;
aux = false;
 teste.close();

}
else{
    aux = true;
}
    /* code */
} while (!aux);



switch (op)
{
case 1:/* criar c *///
    /* code */
    std::cout<<"Not done yet"<<std::endl;
    break;
    case 2:/* criar c++ *///
    /* code */
    std::cout<<"Not done yet"<<std::endl;
    //Criar_Cpp(nome , tipo);
    break;
    case 3 :/* criar html *///
    Criar_Html(nome , tipo);
    break;
     case 4 :/* criar css  *///
    std::cout<<"Not done yet"<<std::endl;
    break;
     case 5 :/* criar js *///
    std::cout<<"Not done yet"<<std::endl;
    break;


default:
std::cout<<"WTF?"<<std::endl;
    break;
}








return 0;
}