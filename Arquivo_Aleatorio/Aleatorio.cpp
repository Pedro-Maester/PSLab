#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>
#include <windows.h>
#include <string>
int main(){

std::ifstream lista;
int n = 0;
std::string linha;
char* item [50];
lista.open("lista.txt");//abre a lista

if(lista.is_open()){

while(getline(lista,linha)){//confere o tamanho da lista
    //std::cout<<linha<<std::endl;
    ++n;
}
lista.close();//fecha a lista
std::ifstream alista;
alista.open("lista.txt");//reabre a lista
if(alista.is_open()){
srand(time(NULL));
int a = rand()%n;
 for (int i = 0; i <= a  ; i++)//seleciona um item aleatorio da lista
 {
     getline(alista,linha);
     //std::cout<<linha<<std::endl;
 }
 alista.close();// re fecha a lista
 std::ifstream livro;
 livro.open(linha);//abre o item
if(livro.is_open()){//confere se o item existe

//std::cout<<a<<std::endl;
std::cout<<linha<<std::endl;
//system("cmd/?");
livro.close();
int ErrO;
ErrO = system(linha.c_str());
if(ErrO){
std::cout<<"ERRO numero:"<<ErrO<<std::endl;
system("pause");
}
///system("pause");
//fecha o item

//system("cmd /c start" + item);//era pra executa o item
}else{
    std::cout<<"ERRO em abrir "<<linha<<"confira se o arquivo na lista tem o  endereco completo do arquivo que deseja abrir"<<std::endl;
    system("pause");
}
}else{
    std::cout<<"Erro2: erro em reabrir a lista"<<std::endl;
    system("pause");
}
}else
{
   std::cout<<"erro3 erro em abrir a lista"<<std::endl; 
   system("pause");
}


//std::cout<<n<<std::endl;

    return 0;
}