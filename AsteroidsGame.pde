
private SpaceShip pirate;
private Star [] north = new Star [100];
private Asteroids[] astra = new Asteroids [15];
private ArrayList <Asteroids> astro = new ArrayList <Asteroids> ();
private ArrayList <Bullet> bill = new ArrayList <Bullet> ();

public void setup() 
{
  pirate = new SpaceShip();

  for (int i=0; i<astra.length; i++)
  {
    astra[i] = new Asteroids();
    astro.add(astra[i]);
  }
  //bill=new ArrayList <Bullet> ();

  size (600, 600, P2D);
}
public void draw() 
{
  background(0);
  pirate.show();
  pirate.move();
  for (int i=0; i<100; i++)
  {
    north[i]=new Star();
    north[i].show();
  }
  for (int i=0; i<astro.size (); i++)
  {
    astro.get(i).move();
    astro.get(i).show();
  } 

  for (int i=0; i<astro.size (); i++)

    if (dist(astro.get(i).getX(), astro.get(i).getY(), pirate.getX(), pirate.getY()) < 20)
    {
      astro.remove(i);
    }

  for (int i=0; i<bill.size (); i++) {
    bill.get(i).show();   
    bill.get(i).move();
  }

 /* for (int i=0; i<bill.size (); i++) {
    if (dist(bill.get(i).getX(), bill.get(i).getY(), bill.get(i).getX(), bill.get(i).getY()) < 40) {
      bill.remove(i);
    }
  }*/
  for (int k=0; k<bill.size (); k++)
  {
    if (bill.get(k).getX()>width || bill.get(k).getX()<0)
    {
      bill.remove(k);
      break;
    }
    if (bill.get(k).getY()>height || bill.get(k).getY()<0)
    {
      bill.remove(k);
      break;
    }
  }

    for (int i=0; i<bill.size (); i++)
  {
    for (int w=0; w<astro.size (); w++)
   {
      if (dist((float)(bill.get(i).myCenterX), (float)(bill.get(i).myCenterY), (float)(astro.get(w).myCenterX), (float)(astro.get(w).myCenterY))<=20)
      {
        bill.remove(i);
        astro.remove(w);
        break;
      }
    }
  }
}

public void keyPressed()
{
  if (keyCode==LEFT)
  {
    pirate.rotate(-10);
  }
  if (keyCode==RIGHT)
  {
    pirate.rotate(10);
  }
  if (keyCode==UP)
  {
    pirate.accelerate(2);
  }
  if (keyCode==DOWN)
  {
    pirate.accelerate(0);
  }
  if (keyCode == 32) {
    bill.add(new Bullet(pirate));
    
  }
}

class SpaceShip extends Floater  
{   

  public void setX(int x) {
    myCenterX=x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY=y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX=x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY=y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection=degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }

  public SpaceShip()
  {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
    myColor = color(255);
    myCenterX = 200;
    myCenterY = 200;
    myPointDirection = 0;
    myDirectionY=0;
    myDirectionX=0;
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;  
    myDirectionX=.9*myDirectionX;
    myDirectionY=.9*myDirectionY;   

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }
}

class Asteroids extends Floater
{
  private int rot;
  public void setX(int x) {
    myCenterX=x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY=y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX=x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY=y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection=degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }

  public Asteroids()
  {
    rot = (int)(((Math.random())*10)-5);
    corners = 9;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -13;
    yCorners[0] = 2;
    xCorners[1] = -5;
    yCorners[1] = 12;
    xCorners[2] = 8;
    yCorners[2] = 10;
    xCorners[3] = 7;
    yCorners[3] = 2;
    xCorners[4] = 5;
    yCorners[4] = -3;
    xCorners[5] = 7;
    yCorners[5] = -9;
    xCorners[6] = 2;
    yCorners[6] = -15;
    xCorners[7] = -7; 
    yCorners[7] = -15;
    xCorners[8] = -12;
    yCorners[8] = 2;
    myColor = color(150);
    myCenterX = (int)(Math.random()*600);
    myCenterY = (int)(Math.random()*600);
    myPointDirection = 0;
    myDirectionY=(int)((Math.random()*4)-2);
    myDirectionX=(int)((Math.random()*4)-2);
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    rotate(rot);
    super.move();
  }
}
/*Write a Bullet class that extends Floater. You will need to:
 Write a constructor that takes one ship argument: Bullet(SpaceShip pirate)
 Intialize myCenterX and myCenterY of the bullet to be the same as the ship.
 Initialize myPointDirection of the bullet to be the same as myPointDirection of the ship
 convert myPointDirection to radians with the following code: double dRadians =myPointDirection*(Math.PI/180);
 Initialize myDirectionX as 5 * Math.cos(dRadians) + the myDirectionX of the ship
 Initialize myDirectionY as 5 * Math.sin(dRadians) + the myDirectionY of the ship
 Override the show method of the Floater class so that you can use circular bullets
 Now, add just one bullet to your program. First, just draw it to the screen. Make sure you can see it before continuing to the next step.
 Now, move the bullet.
 Now create an ArrayList of Bullets. The list should be empty to start with. Everytime you press the key to "shoot", add a new Bullet to the ArrayList. Modify the program with loops that draw and move all the bullets in the ArrayList
 One way to check for collisions between the bullets and the Asteroids is to write a loop within a loop (see below for another way). Everytime you move one asteroid you will need:
 a loop that goes through all the bullets to see if there is a collision between that bullet and the asteroid
 if there is a collision remove both the asteroid and the bullet from their ArrayLists
 Alternatively, you might be able to use processing's get() to check for collisions.
 (Note: I'm not sure if this is still true in the current version of Processing)If your finished program is running slowly, try changing size() to use P2D. For example, size(600,600,P2D); creates an applet 600 x 600 that uses processing's fast 2D renderer (which is not as accurate as the default renderer).
 */
class Bullet extends Floater
{
  public void setX(int x) { 
    myCenterX = x;
  }  
  public int getX() { 
    return (int) myCenterX;
  } 
  public void setY(int y) { 
    myCenterY = y;
  }   
  public int getY() { 
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }   
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  } 

  public Bullet(SpaceShip theShip)
  {
    double myPointDirection = theShip.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myColor = color(#FFFF00);   
    myCenterX =  theShip.getX();
    myCenterY = theShip.getY();
    myDirectionX =  5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
  }

  public void show () {

    ellipse((int)myCenterX, (int)myCenterY, 3, 3);
  }    
  public void move(){
    super.move();
  }

}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 

class Star
{
  public void show()
  {
    fill(255);
    noStroke();
    ellipse((int)(Math.random()*600), (int)(Math.random()*600), 2, 2);
  }
}

