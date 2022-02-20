// estados en los que se encuentra la aplicación: 0 -> modo dibujo, 1 -> visualización de la figura
int state = 0;

// Array para chequear si se pulsa una tecla: w, a, s, d, UP, DOWN
int[] pressedKey = {0, 0, 0, 0, 0, 0};

Figure figure;
Background bg;

void setup() {
  size(800, 600, P3D);
  
  figure = new Figure();
  bg = new Background();

}

void draw() {
  background(200);
  
  switch(state) {
    case 0:
      bg.drawBackgroundDrawingState(); 
     
      if(figure.initialPoints.size() > 0) {  
        figure.drawInitialPoints();
        
        if(mouseX >= width/2) {
          line(figure.initialPoints.get(figure.initialPoints.size() -1).x + width/2, figure.initialPoints.get(figure.initialPoints.size() -1).y + height/2, mouseX, mouseY);
        } else{
          line(figure.initialPoints.get(figure.initialPoints.size() -1).x + width/2, figure.initialPoints.get(figure.initialPoints.size() -1).y + height/2, width/2, mouseY);
        }
      }
      
      break;
    case 1:
    
      bg.drawBackgroundShapeState(figure.rotationAngle);
      pushMatrix();
      
      translate(width/2, height/2, 0);
      figure.checkRotationsAndScaling();
      figure.drawShape();
      
      popMatrix();
      break;
  }
}

void mousePressed() {
  switch(state) {
    case 0:  
      if(mouseX >= width/2) { 
        figure.addPoint(new PVector(mouseX, mouseY, 0));
      } else {
        figure.addPoint(new PVector(width/2, mouseY, 0));
      }
      break;
  }
}

void keyPressed() {
  switch(state) {
    case 0:
      if(key == 'r' || key == 'R') figure.removeLastPoint();
      if(key == 'f' || key == 'F') {
        if(figure.initialPoints.size() > 0) {
          figure.createNewFlatSurfaces(figure.rotationAngle);
          figure.createSolid();
          state = 1;
        }
      }
      break;
    case 1:
       if(key == 'w' || key == 'W') pressedKey[0] = 1;
       if(key == 'a' || key == 'A') pressedKey[1] = 1;
       if(key == 's' || key == 'S') pressedKey[2] = 1;
       if(key == 'd' || key == 'D') pressedKey[3] = 1;
       if(key == CODED) {
         if(keyCode == UP) pressedKey[4] = 1;
         if(keyCode == DOWN) pressedKey[5] = 1;
         if(keyCode == RIGHT) {
           figure.increaseRotationAngle();
           figure.createNewFlatSurfaces(figure.rotationAngle);
           figure.createSolid();
         }
         if(keyCode == LEFT) {
           figure.decreaseRotationAngle();
           figure.createNewFlatSurfaces(figure.rotationAngle);
           figure.createSolid();
         }
       } 
         
       
       if(key == 'r' || key == 'R') state = 0;
       if(key == 'f' || key == 'F') figure.figure.resetMatrix();


       break;
  }
}

void keyReleased() {
  switch(state) {
    case 1:
      if(key == 'w' || key == 'W') pressedKey[0] = 0;
      if(key == 'a' || key == 'A') pressedKey[1] = 0;
      if(key == 's' || key == 'S') pressedKey[2] = 0;
      if(key == 'd' || key == 'D') pressedKey[3] = 0;
      if(key == CODED) {
         if(keyCode == UP) pressedKey[4] = 0;
         if(keyCode == DOWN) pressedKey[5] = 0;
       } 
      
      break;
      
  }
}
