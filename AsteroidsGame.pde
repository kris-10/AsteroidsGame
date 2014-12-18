
SpaceShip pirate = new SpaceShip();
Star [] north = new Star [100];
Asteroids[] astra = new Asteroids [15];
ArrayList <Asteroids> astro = new ArrayList <Asteroids> ();


public void setup() 
{
  
  for(int i=0; i<astra.length; i++)
    {
      astra[i] = new Asteroids();
      astro.add(astra[i]);
    }
    
  size (600,600);
  // for(int i=0;i<100;i++)
  // {
  //   north[i]= new Star();
  // }
  //your code here
}
public void draw() 
{
  background(0);

  pirate.show();
  pirate.move();
  for(int i=0;i<100;i++)
  {
   north[i]=new Star();
   north[i].show();
 }
  for(int i=0; i<astra.length; i++)
  {
     astro.get(i).move();
     astro.get(i).show();
  } 

 
 System.out.println(pirate.getX() + ", " + pirate.getY());
  //your code here
}

public void keyPressed()
{
  if(keyCode==LEFT)
  {
    pirate.rotate(-10);
  }
  if(keyCode==RIGHT)
  {
    pirate.rotate(10);
  }
  if(keyCode==UP)
  {
    pirate.accelerate(2);
  }
  if(keyCode==DOWN)
  {
    pirate.accelerate(0);
  } 
}

class SpaceShip extends Floater  
{   

  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;}

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
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    } 
  }

}

/*Write an Asteroid class that extends Floater. Make sure it's not inside the curly braces of any other class. You will need to
write a constructor
write the code to "finish" the abstract methods in the Floater class
add a new int member variable to hold the speed of rotation for each asteroid. Make sure that this is initialized to have an equal probablility of 
being positive or negative. Also make sure to declare appropriately (should it be public or private?)
"override" the move method of the Floater class by writing a new move method in the Asteroid class that also rotates each Asteroid at its own speed
Now add just a single asteroid to your applet. Start by just drawing the asteroid. Make sure you can see it and are happy with its shape before going to the next step.
Now add the code that moves and rotates the Asteroid
Modify your applet code so that you have an array of Asteroids.*/
class Asteroids extends Floater
{
  private int rot;
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;}
  
    public Asteroids()
    {
      rot = (int)(((Math.random())*10)-5);
      corners = 9;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -11;
      yCorners[0] = 0;
      xCorners[1] = -3;
      yCorners[1] = 10;
      xCorners[2] = 6;
      yCorners[2] = 8;
      xCorners[3] = 5;
      yCorners[3] = 0;
      xCorners[4] = 3;
      yCorners[4] = -1;
      xCorners[5] = 5;
      yCorners[5] = -7;
      xCorners[6] = 0;
      yCorners[6] = -13;
      xCorners[7] = -5; 
      yCorners[7] = -13;
      xCorners[8] = -10;
      yCorners[8] = 0;
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
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
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
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
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
    ellipse((int)(Math.random()*600), (int)(Math.random()*600),2,2);
  }
}

