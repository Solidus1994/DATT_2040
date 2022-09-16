int cols = 10;
int rows = 10;


int stepx, stepy;


void setup() {
  size(1080, 720);

  stepx = (width / cols);
  stepy = (height / rows);

  noLoop();
}

int col = 0;
int row = 0;

void draw() {
  background(255);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i*stepx;
      float y = j*stepy;


      int linesize = stepy;


      ellipse(x, y, 5, 5);

      int dice = int(random(16));

      strokeWeight (random(16));

      switch(dice) {
      case 0:
        stroke(random(255), random(255), random(255));
        line(x+linesize, y+linesize, x+linesize, y+linesize);
        break;
      case 1:
        stroke(random(255),random(255),random(255));
        line(x+linesize, y+linesize, x+linesize, y-linesize);
        break;
      case 2:
        stroke(random(255),random(255),random(255));
        line(x+linesize, y+linesize, x-linesize, y-linesize);
        break;
      case 3:
        stroke(random(255),random(255),random(255));
        line(x+linesize, y-linesize, x-linesize, y-linesize);
        break;
       case 4:
        stroke(random(255),random(255),random(255));
        line(x, y-linesize, x, y-linesize);
        break;
       case 5:
        stroke(random(255),random(255),random(255));
        line(x-linesize, y+linesize, x+linesize, y+linesize);
        break;
       case 6:
        stroke(random(255),random(255),random(255));
        line(x-linesize, y-linesize, x-linesize, y+linesize);
        break;
       case 7:
        stroke(random(255),random(255),random(255));
        line(x-linesize, y+linesize, x+linesize, y-linesize);
        break;
       case 8:
        stroke(random(255),random(255),random(255));
        line(x+linesize, y-linesize, x-linesize, y+linesize);
        break;
       case 9:
        stroke(random(255),random(255),random(255));
        line(x+linesize, y-linesize, x+linesize, y-linesize);
        break;
       case 10:
        stroke(random(255),random(255),random(255));
        line(x-linesize, y+linesize, x-linesize, y+linesize);
        break;
       case 11:
        stroke(random(255),random(255),random(255));
        line(x+linesize, y-linesize, x+linesize, y+linesize);
        break;
       case 12:
        stroke(random(255),random(255),random(255));
        line(x+linesize, y+linesize, x-linesize, y+linesize);
        break;
       case 13:
        stroke(random(255),random(255),random(255));
        line(x-linesize, y-linesize, x+linesize, y-linesize);
        break;
       case 14:
        stroke(random(255),random(255),random(255));
        line(x-linesize, y+linesize, x+linesize, y-linesize);
        break;
       case 15:
        stroke(random(255),random(255),random(255));
        line(x-linesize, y-linesize, x-linesize, y-linesize);
        break;
      }
    }
  }
}
void mousePressed() {
  redraw();
}
