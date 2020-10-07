int dieSize = 10;
int count = 0;
int totalCount = 0;
int dotSize = 2;
int canvasSizeX = 1900;
int canvasSizeY = 800;
int rolls = 1;
int spins = 0;
int spacing = 2;
boolean rolled = false;
boolean spinning;

void setup() {
  frameRate(60);
  size(1908, 900);
  
}

void draw() {
  if(spins < 10) {
    background(200);
    spinning = true;
    for(int x = 3; x < canvasSizeX; x+= (dieSize + spacing)) {
      for(int y = 3; y < canvasSizeY; y+= (dieSize + spacing)) {
        Die die = new Die(x, y);
        die.fakeRoll();
        die.show();
      }
    }
    spins++;
    fill(200);
    rect(0, 810, width, 90);
    fill(0);
    textSize(30);
    text("You Rolled: -", 10, 840);
    text("Average Roll: -", 10, 880);
  } else {
    spinning = false;
    if(rolled == false) {
      for(int x = 3; x < canvasSizeX; x+= (dieSize + spacing)) {
        for(int y = 3; y < canvasSizeY; y+= (dieSize + spacing)) {
          Die die = new Die(x, y);
          die.roll();
          die.show();
        }
        rolled = true;
      }
      fill(200);
      rect(0, 810, width, 90);
      fill(0);
      textSize(30);
      text("You Rolled: " + count, 10, 840);
      text("Average Roll: " + totalCount/rolls, 10, 880);
    }
  }
}

void mousePressed() {
  if(spinning == false) {
    rolls++;
  }
  spins = 0;
  count = 0;
  rolled = false;
}
class Die {
  int yPos;
  int xPos;
  int roll;
  
  Die(int x, int y) {
    xPos = x;
    yPos = y;
  }
        
  void roll() {
    roll = (int)(Math.random() * 6) + 1;
    count += roll;
    totalCount += roll;
  }
  void fakeRoll() {
    roll = (int)(Math.random() * 6) + 1;
  }
        
  void show() {
    noStroke();
    fill(100);
    rect(xPos, yPos, dieSize, dieSize, 2);
    fill(255);
    if(roll == 1){
      ellipse(xPos + dieSize/2, yPos + dieSize/2, dotSize, dotSize);
    } else if(roll == 2) {
      ellipse(xPos + dieSize/4, yPos + dieSize/4, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize*.75, dotSize, dotSize);
    } else if(roll == 3) {
      ellipse(xPos + dieSize/4, yPos + dieSize/4, dotSize, dotSize);
      ellipse(xPos + dieSize/2, yPos + dieSize/2, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize*.75, dotSize, dotSize);
    } else if(roll == 4) {
      ellipse(xPos + dieSize/4, yPos + dieSize/4, dotSize, dotSize);
      ellipse(xPos + dieSize/4, yPos + dieSize*.75, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize*.75, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize/4, dotSize, dotSize);
    } else if(roll == 5) {
      ellipse(xPos + dieSize/4, yPos + dieSize/4, dotSize, dotSize);
      ellipse(xPos + dieSize/4, yPos + dieSize*.75, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize*.75, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize/4, dotSize, dotSize);
      ellipse(xPos + dieSize/2, yPos + dieSize/2, dotSize, dotSize);
    } else {
      ellipse(xPos + dieSize/4, yPos + dieSize/4, dotSize, dotSize);
      ellipse(xPos + dieSize/4, yPos + dieSize/2, dotSize, dotSize);
      ellipse(xPos + dieSize/4, yPos + dieSize*.75, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize*.75, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize/2, dotSize, dotSize);
      ellipse(xPos + dieSize*.75, yPos + dieSize/4, dotSize, dotSize);
    }
  }
}
