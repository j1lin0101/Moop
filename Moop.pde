boolean menu;
Button single, two;
boolean overSingle, overTwo;
boolean singlePlayer;
color singleHighlight, twoHighlight;
boolean gameOver;
Mooper moop1, moop2; 
int startingTime;

public void setup(){
  size(500,500);
  noStroke();
  menu = true;
  singleHighlight = color(255, 179, 179);
  twoHighlight = color(179, 179, 255);
  overSingle =false;
  overTwo = false;
  single = new Button(150,200,300,50,color(255,0,0));
  two = new Button(150,400,400,50,color(0,0,255));
  gameOver = false;
  moop1 = new Mooper(150,250,false,50,55,100);
  moop2 = new Mooper(350,250,true,255,0,0);
  startingTime = millis();
  
  
}

public void draw(){
    int seconds = (millis() - startingTime) / 1000;
    /*if(menu == true){
       single.show();
       two.show();
       update(mouseX, mouseY); 
       background(0);
       if (overSingle) {
          fill(singleHighlight);
        }
        if (overTwo){
           fill(twoHighlight);
        }
       textSize(40);
       fill(0, 200, 0);
       textAlign(CENTER);
       text("Press 1 for Single Player", 250, 100);
       text("Press 2 for Two Player", 250, 130);
    }
    
  else*/ if(gameOver == true){
    noLoop();
    background(255);
    textSize(40);
    fill(255,0,0);
    textAlign(CENTER);
    text("RED MOOPER WINS!!!", 250, 180);
    fill(50,55,100);
    textSize(30);
    text("Time Un-MOOPED: " + (seconds) + " seconds", 250, 230);
    textSize(30);
    text("Press R to Play Again", 250, 280);

  }
  
  else if(seconds == 30){
    noLoop();
    gameOver = true;
    background(255);
    textSize(40);
    fill(50,55,100);
    textAlign(CENTER);
    text("Blue MOOPER WINS!!!", 250, 180);
    textSize(30);
    fill(255,0,0);
    text("Press R to Play Again", 250, 280);
  }
  
  else{
    background(255);
    textSize(20);
    textAlign(RIGHT,TOP);
    fill(50,55,100);
    text((seconds)+ " seconds",450,30);
    
    moop1.move();
    moop1.show();
  
    moop2.move();
    moop2.show();
  
    if(dist(moop1.getX(),moop1.getY(),moop2.getX(),moop2.getY())<=50){
   //lose();
     gameOver = true;
  }
}
}

public void update(int x, int y) {
   if( overButton(single.getX(), single.getY(), single.getLen(), single.getWidth())) {
    overSingle = true;
  } else if( overButton(two.getX(), two.getY(), two.getLen(), two.getWidth()) ) {
    overTwo = true;
  }
}

public boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

public void keyPressed(){
    if(key == 'w'){
        moop1.up(3);
      }
      if(key == 's'){
        moop1.down(3);
      }
      if(key == 'a'){
        moop1.left(3);
      }
      if(key == 'd'){
        moop1.right(3);
      }
      if(key == 'r' && gameOver == true){
        startingTime = millis();
        moop1.setX(150);
        moop1.setY(250);
        moop1.setMoveX(0);
        moop1.setMoveY(0);
        moop2.setX(350);
        moop2.setY(250);
        moop2.setMoveX(0);
        moop2.setMoveY(0);
        gameOver=false;
        loop();
       
      }
      if(key == CODED){
          if(keyCode == UP){
            moop2.up(3);
          }
          if(keyCode == DOWN){
            moop2.down(3);
          }
          if(keyCode == LEFT){
            moop2.left(3);
          }
          if(keyCode == RIGHT){
            moop2.right(3);
          }
      }
  }
  
public void keyReleased(){
    if(key == 'w'){
        moop1.up(0);
      }
    if(key == 's'){
        moop1.down(0);
      }
    if(key == 'a'){
        moop1.left(0);
      }
    if(key == 'd'){
        moop1.right(0);
      }
      
    if(key == CODED){
          if(keyCode == UP){
            moop2.up(0);
          }
          if(keyCode == DOWN){
            moop2.down(0);
          }
          if(keyCode == LEFT){
            moop2.left(0);
          }
          if(keyCode == RIGHT){
            moop2.right(0);
          }
      }
}

public void mousePressed(){
  if (overSingle) {
    menu = false;
    singlePlayer = true;
  }
  if (overTwo) {
    menu = false;
    singlePlayer = false;
  }

}


public class Mooper{
  private int myX, myY, moveX, moveY;
  private boolean isMooped;
  private color myColor;
  
  Mooper(int x, int y, boolean mooped, int r, int g, int b){
      myX = x;
      myY = y;
      isMooped = mooped;
      myColor = color(r,g,b);
      moveX = 0;
      moveY = 0;
  }
  
  public void show(){
      fill(myColor); 
      ellipse(myX, myY, 55, 55);
  }
  
  public int getX(){return myX;}
  
  public int getY(){return myY;}
  
  public int getMoveX(){return moveX;}
  
  public int getMoveY(){return moveY;}
  
  public boolean getMooped(){return isMooped;  }
  
  public void setX(int x){myX = x;}
  
  public void setY(int y){myY = y;}
  
  public void setMoveX(int x){moveX = x;}
  
  public void setMoveY(int y){moveY = y;}
  
  public void setMooped(boolean mooped){isMooped = mooped;}
  
  public void move(){
      myX+=moveX;
      myY+=moveY;
      
      if(myX >width)
    {     
      myX = 0;    
    }    
    else if (myX<0)
    {     
      myX = width;    
    }    
    if(myY >height)
    {    
      myY = 0;    
    }   
    else if (myY < 0)
    {     
      myY = height;    
    }   
  }
  
  public void up (double dAmount){moveY-=dAmount;}  
  
  public void right (double dAmount){moveX+=dAmount;}  
  
  public void down (double dAmount){moveY+=dAmount;} 
  
  public void left (double dAmount){moveX-=dAmount;}  
  
}

public class Button{
 
  private int buttonX,buttonY, len, wid;
  private color buttonC;
  
  Button(int x, int y, int len, int wid, color c){
    buttonX = x;
    buttonY = y;
    buttonC = c;
  }
  
   public int getX(){return buttonX;}
  
   public int getY(){return buttonY;}
   
   public int getLen(){return len;}
  
   public int getWidth(){return wid;}
   
   public color getC(){return buttonC;}
  
   public void setX(int x){buttonX = x;}
  
   public void setY(int y){buttonY = y;}
  
   public void setC(color c){buttonC = c;}
   
   public void show(){
     fill(buttonC);
     rect(buttonX,buttonY,len,wid); 
   }
  
}
