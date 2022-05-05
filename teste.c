#include <stdio.h>

int* Retornoponteiro(){
    int ref = 0;
    int* ptr = ref;
    return *ptr;
}




struct CelMtx{
    struct CelMtx *antiX = NULL; 
    struct CelMtx *antiY = NULL; 
    struct CelMtx *nextX = NULL; 
    struct CelMtx *nextY = NULL; 
    int value = 0;
};

struct CelMtx* makeCell(int val)
{
    struct Celmtx *cel = (struct CelMtx*) malloc(sizeof(struct CelMtx));
    cel->value = val;
    return cel;
}
void addNextY(struct Celmtx *cel , int val){
    cel->nextY = makeCell(val);
    cel->nextY->antiY = *cel;
    moveNextY(cel);

}

void addNextX(struct Celmtx *cel , int val){
    cel->nextX = makeCell(val);
    cel->nextX->antiX = *cel;
    moveNextX(cel);

}

void moveNextX(struct Celmtx *ptr){
    if(ptr->nextX != NULL)ptr = ptr->nextX;
    
}

void moveNextY(struct Celmtx *ptr){
    if(ptr->nextY != NULL) ptr = ptr->nextY;
}

void moveBackX(struct Celmtx *ptr){
    if(ptr->antiX != NULL)ptr = ptr->antiX;
}

void moveBackY(struct Celmtx *ptr){
    if(ptr->antiY != NULL)ptr = ptr->antiY;
}

int Get_Cel_Val(struct Celmtx cel){
return cel->val;
}

void Connect_All_pfrX(struct Cellmtx* head){

}

void Connect_All_prfY(struct Cellmtx* head){

}


int main(){
    struct Celmtx *celHead = makeCell(0);
    
    struct Celmtx **celptr = *celHead;
    addNextY(celptr , 1);
    addNextX(celptr , 2);
    moveNextX(celptr);
    moveBackX(celptr);
    return 0;
}

/*

struct Caixa{
    struct Caixa *ptr = NULL;
    int value = 0;
    
}

int main(){
    struct Caixa *caixona = (struct Caixa*) malloc(sizeof(struct Caixa));
    caixona->ptr = (struct Caixa*) malloc(sizeof(struct Caixa));
    caixona->ptr->value = 1;
    printf("Caixa->value: %d \n Caixa->ptr->value: %d",caixona->value,caixona->ptr->value);
    //Caixa->value: 0 
    //Caixa->ptr->value: 1
    caixona->ptr->ptr = (struct Caixa*) malloc(sizeof(struct Caixa));
    struct Caixa *salvar = caixona->ptr;
    free(caixona);
    

        return 0;
}*/