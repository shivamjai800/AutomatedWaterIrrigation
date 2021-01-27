
int in=11;
int i0=10;
int i1=7;
int out=9;

#include <LiquidCrystal.h>

LiquidCrystal lcd(12, 6, 5, 4, 3, 2);

void setup() {
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // Print a message to the LCD.
  
  pinMode(in,INPUT);
 pinMode(out,OUTPUT);
}

void loop() {

  int  y=0;
  int x=0;
  
  int var_1 = digitalRead(in);
  int var_in_1=digitalRead(i0);
  int var_in_2=digitalRead(i1);
  if (var_1 == HIGH )
      {
        y=millis() / 1000;
        y=x;
        
        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("motor is working");
        
        if(var_in_1==HIGH && var_in_2==HIGH)
        {
          lcd.setCursor(0, 1);
          lcd.print("RICE t=8s");
          
        }
        else if(var_in_1==HIGH && var_in_2==LOW)
        {
          
          lcd.setCursor(0, 1);
          lcd.print("WHEAT t=6s");
        }
        else if(var_in_1==LOW && var_in_2==HIGH)
        {
          
          lcd.setCursor(0, 1);
          lcd.print("GRAM t=4s");
        }
         else if(var_in_1==LOW && var_in_2==LOW)
        {
          
          lcd.setCursor(0, 1);
          lcd.print("MAIZE t=2s");
        }
        lcd.setCursor(0, 0);
        digitalWrite(out,LOW);
        delay(200);
      }
     else
     {
      lcd.clear();
      
      if(var_in_1==HIGH && var_in_2==HIGH)
        {
          lcd.setCursor(0, 1);
          lcd.print("RICE t=8s");
          
        }
        else if(var_in_1==HIGH && var_in_2==LOW)
        {
          
          lcd.setCursor(0, 1);
          lcd.print("WHEAT t=6s");
        }
        else if(var_in_1==LOW && var_in_2==HIGH)
        {
          
          lcd.setCursor(0, 1);
          lcd.print("GRAM t=4s");
        }
         else if(var_in_1==LOW && var_in_2==LOW)
        {
          
          lcd.setCursor(0, 1);
          lcd.print("MAIZE t=2s");
        }
        lcd.setCursor(0,0);
      lcd.print("not working");
      
      digitalWrite(out,HIGH);
      delay(200);
     }
 
}
