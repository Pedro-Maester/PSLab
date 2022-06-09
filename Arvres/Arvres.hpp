

template<typename T , unsigned int NF = 2> class Arvore{
    private:
        class Node;
        int altura = 0;
        double peso = 0.0;
        int Num_Nodes = 0;
        int Num_Leafs = 0;
        Arvore::Node** raiz = nullptr;
        Arvore::Node** current = raiz;
        

    public:
        Arvore();
        
        ~Arvore();
        T CopyItem(int pos);
        T* SearchItem(int pos);
        T CopyCuttentItem();
        T GetCurrentPos();
        int GetHeight();
        int Get_Num_Nodes();
        int Get_Num_Leafs();
        void AddItem(T item);
        void AddItem_In(int pos);
        void Balance();
        void Weight_Balance();
        void Organize();
        int* Map_to(int pos);
        T RemoveItem(int pos);
        void Cut_Leaf(int pos);
        void Climb(int* Track , int height);
        T* Remove_Current();



};

template<typename T , unsigned int NF> 
class Arvore<T, NF>::Node{
    public:
        Node(Node* pai ,T Item , int Id , double Peso = 1.0 );
        ~Node();
        int numFilhos;
        T item = NULL;
        double peso;
        int id;
        Node* pai;
        
        Node** filho = nullptr;
    private:
    
};