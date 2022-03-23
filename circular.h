struct Circular{
int tam;
int* array;
double angle_leque;
double present_angle;
int present_pos;
};

void Circular_init(struct Circular *Cir, int tam){
  Cir->tam = tam;
  Cir->array = (int*) malloc(sizeof(int)*tam);
  Cir->angle_leque = 360.0/tam;
  Cir->present_angle = 0.0;
  Cir->present_pos = 0;

}

void Angle_Fix(double *ang){
  while(*ang < 0.0) *ang +=360.0;
  while (*ang >= 360.0) *ang -=360.0;
}
void Pos_Fix(int *pos, int MAX){
while(*pos < 0) *pos += MAX;
while(*pos > MAX) *pos-=MAX;
}

void Circular_Insert_On_Angle(struct Circular *Cir, double angle , int value){
Angle_Fix(&angle);
Cir->array[(int) (angle/Cir->angle_leque)] = value;
}

int Circular_Get_Value_On_Angle(struct Circular *Cir, double angle){
  Angle_Fix(&angle);
  return Cir->array[(int) (angle/Cir->angle_leque)];
}

void Circular_Insert_On_Pos(struct Circular *Cir ,int pos , int value){
Pos_Fix(&pos,Cir->tam);
Cir->array[pos] = value;
}

int Circular_Get_Value_On_Pos(struct Circular *Cir ,int pos){
Pos_Fix(&pos,Cir->tam);
return Cir->array[pos];
}

void Circular_Set_Current_Pos(struct Circular *Cir ,int pos){
Pos_Fix(&pos,Cir->tam);
Cir->present_pos = pos;
Cir->present_angle = pos * Cir->angle_leque;
}

void Circular_Set_Current_Angle(struct Circular *Cir , double ang){
  Angle_Fix(&ang);
  Cir->present_angle = ang;
  Cir->present_pos = (int)(ang/Cir->angle_leque);
}

int Circular_Get_Value_On_Current_Ang(struct Circular *Cir){
return Cir->array[(int)(Cir->present_angle/Cir->angle_leque)];
}

int Circular_Get_Value_In_Current_Pos(struct Circular *Cir){
  return Cir->array[Cir->present_pos];
}

void Circular_Change_Current_Pos(struct Circular *Cir , int dpos){
Circular_Set_Current_Pos(Cir , Cir->present_pos + dpos);
}

void Circular_Change_Curret_Ang(struct Circular *Cir , double dang){
  Circular_Set_Current_Angle(Cir , Cir->present_angle + dang);
}

void Circular_Insert_In_Current_Angle(struct Circular *Cir , int value){
Circular_Insert_On_Angle(Cir , Cir->present_angle , value);
}

void Circular_Insert_On_Current_Pos(struct Circular *Cir , int value){
  Circular_Insert_On_Pos(Cir , Cir->present_pos , value);
}
