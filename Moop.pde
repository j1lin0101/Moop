boolean gameOver = false;
Mooper moop1 = new Mooper(150,250,false,50,55,100);
Mooper moop2 = new Mooper(350,250,true,255,0,0);
int startingTime;

public void setup(){
  size(500,500);
  startingTime = millis();
  
}

public void draw(){
  int seconds = (millis() - startingTime) / 1000;
  
  if(gameOver == true){
    noLoop();
    background(0);
    textSize(40);
    fill(0, 200, 0);
    textAlign(CENTER);
    text("RED MOOPER WINS!!!", 250, 180);
    textSize(30);
    text("Time Un-MOOPED: " + (seconds) + " seconds", 250, 230);
    textSize(30);
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
      if(key == 'r' && gameOver){
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


class Mooper{
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
