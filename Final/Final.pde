Myself myself;
ArrayList<Enemy> enemies;
ArrayList<Bullet> myBullets;
ArrayList<Bullet> eneBullets;
ArrayList<Star> stars = new ArrayList<Star>();
int points;
int level = 1;
int frequency = 4;


void setup(){
  size(640, 640);
  rectMode(CENTER);
  myself = new Myself();
  enemies = new ArrayList<Enemy>();
  myBullets = new ArrayList<Bullet>();
  eneBullets = new ArrayList<Bullet>(); 
}

void draw(){
  background(0);
  text("Points: " + points, 50, 50);
  drawStar();
  
  myself.display();
  for(Enemy enemy: enemies){
    enemy.display();
  }
  for(Bullet bullet: myBullets){
    bullet.display();
  }
  for(Bullet bullet: eneBullets){
    bullet.display();
  }

  myself.update();
  ArrayList<Enemy> nextEnemies = new ArrayList<Enemy>();
  for(Enemy enemy: enemies){
    enemy.update();
    if(!enemy.isDead){
      nextEnemies.add(enemy);
    }
  }
  enemies = nextEnemies;
  ArrayList<Bullet> nextMyBullets = new ArrayList<Bullet>();
  for(Bullet bullet: myBullets){
    bullet.update();
    if(!bullet.isDead){
      nextMyBullets.add(bullet);
    }
  }
  myBullets = nextMyBullets;
  ArrayList<Bullet> nextEneBullets = new ArrayList<Bullet>();
  for(Bullet bullet: eneBullets){
    bullet.update();
    if(!bullet.isDead){
      nextEneBullets.add(bullet);
    }
  }
  eneBullets = nextEneBullets;
  if(random(1) < 0.02){
    enemies.add(new Enemy());
  }
}

void drawStar() {
  strokeWeight(8);
  stroke(255);
  if (frameCount % frequency == 0) {
    Star myStar = new Star();
    stars.add(myStar);
  }
  for (int i = 0; i<stars.size(); i++) {
    Star currentStar = stars.get(i);
    currentStar.drawStar();
  }
}


class Myself{
  
  PVector loc;
  float size;
  int coolingTime;
  boolean isDead;
  
  Myself(){
    size = 25;
    loc = new PVector(width / 2, height - size / 2 - 10);
    coolingTime = 0;
    isDead = false;
  }
  
  
  
  void display(){
    if(isDead){
      fill(255, 255, 0);
      stroke(0, 255, 0); 
    } else {
      noFill();
      stroke(0, 0, 255);
    }
    rect(loc.x, loc.y, size, size);
  }
  


  
  void update(){
    isDead = false;
    float dmx = mouseX - loc.x;
    dmx = constrain(dmx, -5, 5);
    loc.x += dmx;
    coolingTime++;
    if(mousePressed && coolingTime >= 10){
      myBullets.add(new Bullet());
      coolingTime = 0;
    }
    for(Bullet b: eneBullets){
      if((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
         && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)){
        isDead = true;
        b.isDead = true;
        points --;
        break;
      }
    }
    for(Enemy e: enemies){
      if(abs(loc.x - e.loc.x) < size / 2 + e.size / 2 && abs(loc.y - e.loc.y) < size / 2 + e.size / 2){
        isDead = true;
        e.isDead = true;
        points --;
        break;
      }
    }
  }
}


class Star {
  float x, y;
  int vy;
  
  Star() { 
    this.x = random(width);
    this.y = 0;
    this.vy = 8;
  }
  
  void drawStar() {
    y+=vy;
    point(x,y);
    
  }
}

class Bullet{
  
  PVector loc;
  float vel;
  boolean isMine;
  boolean isDead;
  
  Bullet(){
    loc = new PVector(myself.loc.x, myself.loc.y);
    vel = -10;
    isMine = true;
  }
  
  Bullet(Enemy enemy){
    loc = new PVector(enemy.loc.x, enemy.loc.y);
    vel = 5;
    if(points >= level * 5){
    vel += 2; 
    }
    isMine = false;
  }
  
  void display(){
    if(isMine){
      stroke(0, 0, 255);
    } else {
      stroke(255, 0, 0);    
    }
    line(loc.x, loc.y, loc.x, loc.y + vel);    
  }

  void update(){
    loc.y += vel;
    if((vel > 0 && loc.y > height) || (vel < 0 && loc.y < 0)){
      isDead = true;
    }
  }  
}

class Enemy{

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  int level;
  
  Enemy(){
    size = 25;
    loc = new PVector(random(size / 2, width - size / 2), -size / 2);
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
  }
  
  void display(){
    noFill();
    stroke(255, 0, 0);
    rect(loc.x, loc.y, size, size);
  }

  void update(){
    loc.y += vel;
    if(loc.y > height){
      isDead = true;
    }
    coolingTime++;
    if(coolingTime >= 60){
      eneBullets.add(new Bullet(this));
      coolingTime = 0;
    }
    if(points >= level * 5){
    vel += 1; 
    level ++;
    }
    for(Bullet b: myBullets){
      if((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
         && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)){
        isDead = true;
        b.isDead = true;
        points ++;
        break;
      }
    }
  }    
}
