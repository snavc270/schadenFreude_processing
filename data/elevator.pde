import processing.serial.*;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;

import ddf.minim.*;
import ddf.minim.effects.*;
AudioPlayer file,beep;

Minim minim;

int xPos1=323;
int yPos1=485;

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

boolean green, red, opentime, closetime, gw, gl, bw, bl, every, one, no; 

//int img_index = 0;
//String img_list[] =
//{
//  //"doorsopened.png"
//};

Serial port;

Robot robot;
           
int button1Pressed;
//int button2Pressed;

void setup() {
  //println(Serial.list());
  //port = new Serial(this, Serial.list()[1], 9600);
  //port.bufferUntil('\n');

  //try {
  // robot = new Robot();
  //}
  //catch (AWTException e) {
  // e.printStackTrace();
  // exit();
  //}
  
   background(0);
  size(970, 598);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  
  
   //img = loadImage(img_list[img_index]);// Load the image into the program  
   
  background = loadImage("doorsopened.png"); 
  rightdoor = loadImage("doorRight.jpg");
  leftdoor = loadImage("doorLeft.jpg");
  greenlight = loadImage("greenlight.png");
  redlight = loadImage("redlight.png");  
  
  goodwins = loadImage("gwins.png"); 
  goodloses = loadImage("gloses.png");
  badwins = loadImage("bwins.png");
  badloses = loadImage("bloses.png");
  everybody = loadImage("everybody.png");
  oneperson = loadImage("oneperson.png");
  noone = loadImage("noone.png");
  
  
  
  //Sound Effects
  minim = new Minim(this);
  file = minim.loadFile("lift.mp3", 2048);
  beep = minim.loadFile("beep.mp3", 2048);
  
}

//void serialEvent(Serial port) {
//  String inString = port.readStringUntil('\n');
//  if (inString != null) {
//    inString = trim(inString);
//    //println(inString);
//    int[] allButtons = int(split(inString, ','));
//    if (allButtons.length == 1) { 
//      button1Pressed = allButtons[0];
//      //button2Pressed = allButtons[1];
//    }
//  }
//}


void draw() {
  
   // Displays the image at its actual size at point (0,0)
  background(0);
  image(leftdoor,xPos1,35);
  image(rightdoor,yPos1,35);
  
  image(background, 0, 0);
  
  
  //image(goodwins, xPos2,yPos2);
  //image(goodloses, xPos2,yPos2);
  //image(badwins, xPos2,yPos2);
  //image(badloses, xPos2,yPos2);
  //image(everybody, xPos2,yPos2);
  //image(oneperson, xPos2,yPos2);
  //image(noone, xPos2,yPos2);
  
  
  
  // Displays the image at point (0, height/2) at half of its size
  //image(img, 0, height/2, img.width/2, img.height/2);

  file.play();//elevator sound
  
  
  //println("button 1 is: " + button1Pressed);
  //println("button 2 is: " + button2Pressed);

  //if (button1Pressed == 3) {
  //  robot.keyPress(KeyEvent.VK_RIGHT);
  //  robot.delay(50);
  //} else {
  //   robot.keyRelease(KeyEvent.VK_RIGHT);
  //}
  
   if(green && counter<200){
     image(greenlight,710,62);
     counter ++; 
   } 
   
   
   
   
   if(red && counter<200){
      image(redlight,710,157);
      counter ++; 
   }
   
   if(opentime && counter<200){
    
     beep.play();
     xPos1 = xPos1-a;
     yPos1 = yPos1+a;
     
   }
    if(closetime && counter<200){
    
     xPos1 = 323;
     yPos1 = 485;
      
   }
   
   
   
   if(gw && counter<300){
    
    image(goodwins, xPos2,yPos2);
      counter ++; 
      
   }
   if(gl && counter<300){
    
    image(goodloses, xPos2,yPos2);
      counter ++; 
      
   }
   if(bw && counter<300){
    
   image(badwins, xPos2,yPos2);
     counter ++; 
      
   }
   if(bl && counter<300){
    
    image(badloses, xPos2,yPos2);
      counter ++; 
      
   }
   if(every && counter<300){
    image(everybody, xPos2,yPos2);
      counter ++; 
      
   }if(one && counter<300){
    image(oneperson, xPos2,yPos2);
      counter ++; 

   }
   if(no && counter<300){
    image(noone, xPos2,yPos2);
      counter ++; 
   }
   
   
   
   
}
void keyPressed(){
  
  //if( key == ' '){ //press SPACE BAR for Textmessage
  //img_index++;
  //if( img_index >= img_list.length ) img_index = 0;
  //img = loadImage(img_list[img_index]);}
 
 if( key == 'a'){ //press A 
  
     opentime = true;
    
  
 }

if( key == 's'){ //press A 
  
     closetime = true;
    
  
 }

if(key == 'b'){
   green = true; 
   
  
  
 }
 if(key == 'c'){
   red = true; 
 }
 
  if(key == 'd'){
   gw = true; 
 }
 
 
  if(key == 'e'){
   gl = true; 
 }
 
  if(key == 'f'){
   bw = true; 
 }
 
  if(key == 'g'){
   bl = true; 
 }
 
  if(key == 'h'){
   every = true; 
 }

 if(key == 'i'){
   one = true; 
 }
 if(key == 'j'){
   no = true; 
 }

}