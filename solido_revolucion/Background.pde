
class Background {
  
  void drawBackgroundDrawingState() {
     stroke(100);
     line(width/2, 0, width/2, height);
     
     stroke(255, 0, 0);
     textSize(12);
     text("Click on the right side of the line to save each vertex that will ", width/50, height/11); 
     text("be part of the shape.", width/50, height/22 * 3);
     text("Draw at least one vertex to generate the shape.", width/50, height/22 * 4);
     
     
     text("Press R to delete the last vertex saved.", width/50, height/22 * 6);
     text("Press F to generate the shape.", width/50,  height/22 * 7);
     
     text("Once you have generated the solid, interact with it using: ", width/50,  height/22 * 10);
     text("- The keys W, A, S, D to rotate the solid in all directions.", width/50,  height/22 * 12);
     
     text("- The UP arrow to zoom in.", width/50,  height/22 * 13);
     text("- The DOWN arrow to zoom out.", width/50,  height/22 * 14);
     
     text("- The LEFT arrow to increase the number of flat surfaces that ", width/50,  height/22 * 15);
     text("   are part of the solid", width/50,  height/22 * 16);
     text("- The RIGHT arrow to decrease the number of flat surfaces ", width/50,  height/22 * 17);
     text("   that are part of the solid", width/50,  height/22 * 18);
     
     text("The last two controls, will undo all transformations of the shape.",  width/50,  height/22 * 20);
  }
  
   void drawBackgroundShapeState(float rotationAngle) {
     text("Press R to return to the drawing stage and see the instructions.", width/50, height/50 * 49);
     text("Press F to undo all transformations of the shape.", width/50, height/50 * 47);
     
     text(round(360 / rotationAngle) + " flat surfaces conform the solid.", width/50, height/22);
   }
}
