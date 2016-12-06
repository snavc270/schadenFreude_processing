import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.serial.*;
AudioPlayer file,beep, music;
Serial portA; 
Serial portB; 
//array for state of button; 
int buttonPressed [] = new int[9]; 
int buttonPressed2 [] = new int[8];  
int randomGenerator[] = new int[4]; 
int number1, number2; 
int state = -1; 
int lives = 5; 
boolean pressedFirst= false;
boolean pressedSecond = false; 
boolean pressedThird = false; 
boolean pressedFourth = false; 

int player1= 0, player2 =0; 
int numberPressed [] = new int[9];  
int playerSelector [] = new int[4]; 

Minim minim;

int xPos1=323;
int yPos1=485;
int rounds = 1; 

boolean win, loseOne, loseTwo = false; 

int xPos2 = 223;
int yPos2 = 100;

int a = 15;
int counter= 0; 
PImage background;
PImage img;  
PImage leftdoor;  
PImage rightdoor;  
PImage greenlight;  
PImage redlight;  
PImage goodwins;
PImage goodloses;
PImage badwins;
PImage badloses;
PImage everybody;
PImage oneperson;
PImage noone;
PImage tutorial; 
PImage guy; 
PImage introScreen; 

void setup(){
  println(Serial.list()); 
  
  background(0);
  size(970, 598);
  
  background = loadImage("data/doorsopened.png"); 
  rightdoor = loadImage("data/doorRight.jpg");
  leftdoor = loadImage("data/doorLeft.jpg");
  greenlight = loadImage("data/greenlight.png");
  redlight = loadImage("data/redlight.png");  
  
  goodwins = loadImage("data/gwins.png"); 
  goodloses = loadImage("data/gloses.png");
  badwins = loadImage("data/bwins.png");
  badloses = loadImage("data/bloses.png");
  everybody = loadImage("data/everybody.png");
  oneperson = loadImage("data/oneperson.png");
  noone = loadImage("data/noone.png");
  tutorial = loadImage("data/tutorial.png");
  guy = loadImage("data/character.png"); 
  introScreen = loadImage("data/Schadenfreude.png"); 
  //sound effects
  minim = new Minim(this);
  file = minim.loadFile("data/lift.mp3", 2048);
  beep = minim.loadFile("data/beep.mp3", 2048);
  music = minim.loadFile("data/elevatorMusic.mp3"); 
  
  portB = new Serial(this, Serial.list()[2], 115200); 
  //portB.bufferUntil(' ');
  portA = new Serial(this, Serial.list()[3], 9600); 
  //portA.bufferUntil(' ');
  
  for(int i = 0; i<9; i++){
    numberPressed[i] = 0; 
  }
  //for(int i = 0; i<4; i++){
  //  randomGenerator[i] = int(random(2,10)); 
    
  //  //println(randomGenerator[i]); 
  //  //portB.write(randomGenerator[i]); 
  //}
  music.play();
  music.loop(); 

}

void draw(){
   
  background(0);
   //println(buttonPressed2[0]);
  //println(buttonPressed); 
  println(buttonPressed2); 
  //println(numberPressed); 
  //println(playerSelector); 

  //println(number2); 
 
  //println("player1" + player1); 
  //println("player2" + player2); 
  //println(state); 
  //println(counter); 
  if(state ==-2){
    image(introScreen, 0,0); 
    introScreen.resize(950, 598); 
    if(keyPressed){
      state = -1; 
    }
    //counter++; 
    //if(counter> 200){
    //  state = -1; 
    //  counter = 0; 
    //}
  }
  if(state == -1){
    image(tutorial, 0, 0); 
    counter++; 
    if(counter> 10){
      state = 0; 
      counter=0; 
    }
  }
  if(state>=0){
    image(leftdoor,xPos1,35);
    image(rightdoor,yPos1,35);
    image(background, 0, 0);
    
    if(counter>5){
         beep.play();
     }
     xPos1 = xPos1-a;
     yPos1 = yPos1+a;
  }
  
  if(state == 0){
     counter++; 

     //fill(255); 
     textSize(24); 
     text("ask two passengers what", width/3, height/4); 
     text("floor they need to go to", width/3, height/3); 
     for(int i = 4; i<8; i++){
        if(buttonPressed2[i]!=1){
          player1 = i-4; 
          pressedFirst = true; 
        } 
        if(buttonPressed2[player1+4]!=0 && pressedFirst == true){
            state = 1; 
            pressedFirst = false; 
            println("this worked"); 
        }
       }
     }else if (state ==1){
      for(int i = 0; i<9; i++){
        if(buttonPressed[i] !=1){
          //println("this happened"); 
          numberPressed[i] = i; 
          number1= numberPressed[i]+1; 
          pressedSecond = true; 
        }if(buttonPressed[number1]!=0 && pressedSecond == true){
            state = 2; 
            pressedSecond = false; 
          }
        }
     }else if (state == 2){
        for(int i = 4; i<8; i++){
          if(buttonPressed2[i]!=1){
            player2 = i-4; 
            pressedThird = true; 
          } 
          if(buttonPressed2[player2+4]!=0 && pressedThird == true){
              state = 3; 
              pressedThird = false; 
          }
         }
      }else if (state == 3){
        for(int i = 0; i<9; i++){
          if(buttonPressed[i] !=1){
            //println("this happened"); 
            numberPressed[i] = i; 
            number2= numberPressed[i]+1; 
            pressedFourth = true; 
          }if(buttonPressed[number2]!=0 && pressedFourth == true){
              state = 4; 
              pressedFourth  = false; 
         }
         counter = 0; 
      }
     }else if(state == 4){
       loseOne= false; 
       loseTwo = false; 
       println("at state 4"); 
       println(buttonPressed2[player1]);
       println(player1); 
       println(number2); 
       if(buttonPressed2[player1] == number1 && buttonPressed2[player2]== number2){
            image(everybody, xPos2,yPos2);  
          //win = true; 
          counter++; 
       }else if(buttonPressed2[player1] != number1 && buttonPressed2[player2]== number2){
            image(oneperson, xPos2,yPos2);
            loseOne = true;        
            counter++; 
       }else if(buttonPressed2[player1] == number1 && buttonPressed2[player2]!= number2){
            image(oneperson, xPos2,yPos2);
            loseOne = true; 
            counter++; 
       }else if(buttonPressed2[player1] != number1 && buttonPressed2[player2]!= number2){
            image(noone, xPos2,yPos2);
            loseTwo = true; 
            counter++; 
       }
        //code with randomGenerator); 
       //if(randomGenerator[player1] == number1 && randomGenerator[player2]== number2){
       //   image(everybody, xPos2,yPos2);
       //   //win = true; 
       //   counter++; 
       //}else if(randomGenerator[player1] != number1 && randomGenerator[player2]== number2){
       //   image(oneperson, xPos2,yPos2);
       //   loseOne = true;        
       //   counter++; 
       //}else if(randomGenerator[player1] == number1 && randomGenerator[player2]!= number2){
       //   image(oneperson, xPos2,yPos2);
       //   loseOne = true; 
       //   counter++; 
       //}else if(randomGenerator[player1] != number1 && randomGenerator[player2]!= number2){
       //   image(noone, xPos2,yPos2);
       //   loseTwo = true; 
       //   counter++; 
       //}
       
       if(counter> 200){
           //for(int i = 0; i<4; i++){
           //   randomGenerator[i] = int(random(2,10)); 
           //   //println(buttonPressed2[i]); 
           //   println(randomGenerator[i]); 
       //
         if(loseOne){
           lives -= 1; 
         }
         if(loseTwo){
           lives -=2; 
         }
         if(rounds<5){
             rounds+=1; 
             state = 0; 
         }
         
           if(rounds == 5 && lives>=0){
             //win state
             state = 6; 
           }
           if(rounds <= 5 && lives == 0){
             //lose state
             state = 7; 
           }
        }
       
     }else if (state == 6){
          image(goodwins, xPos2,yPos2);
          image(badloses, xPos2+100,yPos2+100);
          
     }else if (state == 7){
          image(badwins, xPos2,yPos2);
          image(goodloses, xPos2+100, yPos2+100); 
     }
     if(state>0){
       text("ROUND:" + rounds, width*.05, height*.1);
     }
     
       textSize(24); 
       text("LIVES:" , width*.05, height*.15);
       for(int i = 0; i<lives; i++){
         image(guy, width*.05+i*35, height*.20); 
         guy.resize(0, 50); 
       }
    }
  


 

void serialEvent(Serial port){
  
  String inString = port.readStringUntil('\n'); 
  
  if(inString != null){
    inString = trim(inString);
    //if(port == portA){
//    println(split(inString, ','));
      //println("working"); 
      if(port == portA){
      int[] allButtons = int(split(inString, ',')); 
      //println(allButtons.length);
      if(allButtons.length == 9){
        
        for(int i = 0; i<allButtons.length; i++){
          buttonPressed[i] = allButtons[i];
          //println("working"); 
          }
        } 
      }
    //}
    if (port == portB){
     //println("working"); 
    //    println(split(inString, ',')); 
       int[] allButtons2 = int(split(inString, ',')); 
       if(allButtons2.length == 8){
         for(int i = 0; i<allButtons2.length; i++){
           buttonPressed2[i] = allButtons2[i];
         }
     } 
    }
  }
}