#include "Arvres.hpp"

template<typename T , unsigned int NF>
Arvore<T,NF>::Arvore(){

}

template<typename T , unsigned int NF>
Arvore<T , NF>::~Arvore(){
    
}

template<typename T , unsigned int NF>
Arvore<T, NF>::Node::Node(Node* Pai ,T Item , int Id, double Peso ){
this->filho = new Node*[NF];
for(int f = 0; f < NF ; f++)this->filho[f] = NULL;
this->item = Item;
this->pai = Pai;
this->id = Id;
this->peso = Peso;
}
template<typename T , unsigned int NF>
Arvore<T, NF>::Node::~Node(){
}