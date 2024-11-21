#define BTN 2 // entrada digital para o botao
#define LED 3 //porta digital para luz led
#define IN1 9 //porta do acionador de motor in1 deve ser pwm ~
#define IN2 10 //porta do acionador de motor in2 deve ser pwm ~
#define TEMPO 2500 // tempo em que o motor fica ligado
#define ESPERA 500 // tempo de espera para se apagar o led ou acendelo

bool ligado;//variavel de estado

void set_color(bool l){//ligar ou desligar o led
	digitalWrite(LED,l);
}

void desligar(int D){//desligar o motor
  ligado = !ligado;
  delay(TEMPO);
  digitalWrite(D, LOW);
}



void setup()
{
  ligado = HIGH;//estado para se ligar o sabre
  pinMode(BTN,INPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(LED,OUTPUT);
  
}

void loop()
{
  if(digitalRead(BTN)== HIGH){
    
    delay(100);
    if(ligado){
      // ligamento do sabre 
      //primeiro se liga o led
      set_color(HIGH);
      delay(ESPERA);
      //depois se liga o motor
      digitalWrite(IN2, LOW);
      digitalWrite(IN1, HIGH);
      desligar(IN1);
      //depois o desliga
      
    
  }else{
    //desligamento do sabre
    //primeiro se liga o motor
       digitalWrite(IN1, LOW);
       digitalWrite(IN2, HIGH);
       desligar(IN2);
       //depois o desliga
       delay(ESPERA);
       //desliga-se o led
       set_color(LOW);
      
  }
  }
}
