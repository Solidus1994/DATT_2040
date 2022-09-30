import processing.sound.*;
AudioIn in;

int cols = 120;
int rows = cols;

float factor = 0.015;
int step;

float i = int(random(255));

void setup() {
  fill(255);
  in = new AudioIn(this, 0);
  in.play();
  size(600, 600);
  step = (width / cols);
}
  
float inc = 0;


void mousePressed(){
       redraw();
      }


void draw() {
  background(0);

  float n;

  inc+= 0.006;


  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      n = noise(x * factor, y * factor, inc) *  i;
      
      stroke(random(255), random(255), random(255));
      float cx = cos(n)*0.3;
      float cy = sin(n)*0.3;
      point(x * (step + cx), y * (step + cy));
      
      if(mousePressed){
      i = int(random(255));
      }
      //switch(dice){
      
      //case 0:
      //stroke(random(255), random(255), random(255));
      //cx = cos(n)*random(1);
      //cy = sin(n)*random(1);
      //n = noise(x * factor, y * factor, inc) *  i;
      
      //case 1:
      //stroke(random(255), random(255), random(255));
      //cx = cos(n)*random(1);
      //cy = -sin(n)*random(1);
      //n = noise(x * factor, y * factor, inc) *  i;
      
      //case 2:
      //stroke(random(255), random(255), random(255));
      //cx = -cos(n)*random(1);
      //cy = sin(n)*random(1);
      //n = noise(x * factor, y * factor, inc) *  i;
      
      //case 3:
      //stroke(random(255), random(255), random(255));
      //cx = -cos(n)*random(1);
      //cy = -sin(n)*random(1);
      //n = noise(x * factor, y * factor, inc) *  i;
      //}
    }
  }
}
