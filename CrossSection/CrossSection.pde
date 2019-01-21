PFont F;
VoidHyperCube cub;
int frame = 0;

void setup()
{
  size(400,400,P3D);
  frameRate(60);
  F = createFont("Consolas",18,true);
  cub = new VoidHyperCube(50);
  setW(-25, 25);
}

void draw()
{
  background(0);
  showDegrees();
  processDegrees();
  translate(width/2, height/2);
  
  rotateX(-.5);
  rotateY(.7);
  ortho();
  
  cub.render(getW());
  if (frame < 360) saveFrame("frames/a###.png");
  frame++;
  
}
