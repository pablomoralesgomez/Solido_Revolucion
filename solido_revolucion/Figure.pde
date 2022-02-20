
class Figure {
  
  private PVector axisOffset = new PVector(width/2, height/2, 0);
  private ArrayList<PVector> initialPoints = new ArrayList<PVector>();
  private ArrayList<ArrayList<PVector>> flatSurfaces = new ArrayList<ArrayList<PVector>>();
  
  private PShape figure;
  
  private int anglesIndex = 5;
  private float[] angles = {120, 90, 60, 45, 40, 30, 22.5, 20, 15, 11.25, 10, 7.5, 5.625, 5, 3.75, 2.5};
  
  private float rotationAngle = angles[anglesIndex];
  
  /*******************************
  PUNTOS QUE SELECCIONA EL USUARIO
  ********************************/
  
  // Añadimos un nuevo punto a la selección inicial
  void addPoint(PVector newPoint) {
    initialPoints.add(newPoint.sub(axisOffset));
  }
  
  // Quitamos el último punto añadido
  void removeLastPoint() {
    if(initialPoints.size() > 0) initialPoints.remove(initialPoints.size() -1);
  }
  
  // Mostramos los puntos iniciales seleccionados por el usuario
  void drawInitialPoints() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    PVector pv1 = initialPoints.get(0).add(axisOffset);
    ellipse(pv1.x, pv1.y, 6, 6);
    initialPoints.get(0).sub(axisOffset);
    
    for(int i = 1; i < initialPoints.size(); i++) {
      PVector pv2 = initialPoints.get(i).add(axisOffset);
      ellipse(pv2.x, pv2.y, 6, 6);
      line(pv1.x + width/2, pv1.y + height/2, pv2.x , pv2.y);
      pv1 = pv2;
      
      initialPoints.get(i).sub(axisOffset);
    }
    
  }
  
  
  /**************************************************************
  CREACIÓN DE LOS MERIDIANOS A PARTIR DE LOS PUNTOS SELECCIONADOS
  ***************************************************************/
  
  /* Creamos los nuevos meridianos rotando los puntos iniciales, para hacer la rotación correctamente 
     tenemos que desplazarlos hacia el 0,0 y luego corregir ese desplazamiento para dejarlos en su lugar original. */
  void createNewFlatSurfaces(float angle) {
    flatSurfaces.clear();
    float currentAngle = angle;
    
    while(currentAngle < 360) {
      ArrayList<PVector> newFlatSurface = new ArrayList<PVector>();
      
      for(int i = 0; i < initialPoints.size(); i++) {
        PVector newPoint = rotatePoint(initialPoints.get(i), currentAngle); 
        newFlatSurface.add(newPoint); 
      }
      
      flatSurfaces.add(newFlatSurface);
      currentAngle += angle;
    }
  }
  
  //Rota puntos en 3D
  PVector rotatePoint(PVector point, float angle) {
    return new PVector(point.x * cos(radians(angle)) - point.z * sin(radians(angle)), point.y, point.x * sin(radians(angle)) + point.z * cos(radians(angle)));
  }
  
  
  // Función para comprobar la correcta rotación de los puntos
  void drawPoints() {
    stroke(255, 0, 0);
    strokeWeight(8);
  
    for(int i = 0; i < flatSurfaces.size(); i++) {
      for(int j = 0; j < flatSurfaces.get(i).size(); j++) {
        point(flatSurfaces.get(i).get(j).x, flatSurfaces.get(i).get(j).y, flatSurfaces.get(i).get(j).z);
      }
    }
    
    for(int j = 0; j < initialPoints.size(); j++) {
      point(initialPoints.get(j).x, initialPoints.get(j).y, initialPoints.get(j).z);
    }
  }
  
  void increaseRotationAngle() {
    anglesIndex++;
    if(anglesIndex >= angles.length) anglesIndex = angles.length -1;
    rotationAngle = angles[anglesIndex];
    
  }
  
  void decreaseRotationAngle() {
    anglesIndex--;
    if(anglesIndex < 0) anglesIndex = 0;
    rotationAngle = angles[anglesIndex];
  }
   
  /*************************************************
  CREACIÓN Y VISUALIZACIÓN DEL SÓLIDO DE REVOLUCIÓN
  **************************************************/
  
  void createSolid() {
    figure = createShape();
    figure.beginShape(TRIANGLE_STRIP);
    figure.fill(0);
    figure.stroke(255, 0, 0);
    figure.strokeWeight(2);
    
    ArrayList<PVector> previousFlatSurface = initialPoints; 
    ArrayList<PVector> currentFlatSurface;
    
    for (int i = 0; i < flatSurfaces.size(); i++){
      currentFlatSurface = flatSurfaces.get(i);  
      
      for (int j = 0; j < previousFlatSurface.size(); j++){
        figure.vertex(previousFlatSurface.get(j).x,previousFlatSurface.get(j).y,previousFlatSurface.get(j).z);
        figure.vertex(currentFlatSurface.get(j).x,currentFlatSurface.get(j).y,currentFlatSurface.get(j).z);
      }
      
      figure.vertex(previousFlatSurface.get(0).x,previousFlatSurface.get(0).y,previousFlatSurface.get(0).z);
      figure.vertex(currentFlatSurface.get(0).x,currentFlatSurface.get(0).y,currentFlatSurface.get(0).z);
      
      previousFlatSurface = currentFlatSurface;
    }
    
    // Hacemos este proceso una vez mas con el primer y último meridiano para cerrar la figura
    previousFlatSurface = flatSurfaces.get(flatSurfaces.size() -1);
    currentFlatSurface = initialPoints;
    
    for (int j = 0; j < previousFlatSurface.size(); j++){
        figure.vertex(previousFlatSurface.get(j).x,previousFlatSurface.get(j).y,previousFlatSurface.get(j).z);
        figure.vertex(currentFlatSurface.get(j).x,currentFlatSurface.get(j).y,currentFlatSurface.get(j).z);
    }
    figure.vertex(previousFlatSurface.get(0).x,previousFlatSurface.get(0).y,previousFlatSurface.get(0).z);
    figure.vertex(currentFlatSurface.get(0).x,currentFlatSurface.get(0).y,currentFlatSurface.get(0).z);
    
    figure.endShape();
  }
  
  void drawShape() {
    shape(figure);
  }
  
  
  // Método para rotar y escalar la figura 
  void checkRotationsAndScaling() {
    if(pressedKey[0] == 1) figure.rotateX(0.01);
    if(pressedKey[1] == 1) figure.rotateY(0.01);
    if(pressedKey[2] == 1) figure.rotateX(-0.01);
    if(pressedKey[3] == 1) figure.rotateY(-0.01);
    if(pressedKey[4] == 1) figure.scale(1.01);
    if(pressedKey[5] == 1) figure.scale(0.99);

  }
  
}
