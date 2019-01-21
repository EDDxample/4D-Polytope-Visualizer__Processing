float siz = .5;
boolean ORTHO = false, COLORS = false;

int frame = 0;

Matrix projection = new Matrix(new float[][] { {1, 0, 0, 0, 0}, {0, 1, 0, 0, 0} });

Vector[] points = 
{
  new Vector( siz, siz, siz, siz),
  new Vector(-siz, siz, siz, siz),
  new Vector(-siz,-siz, siz, siz),
  new Vector( siz,-siz, siz, siz),
  new Vector( siz, siz,-siz, siz),
  new Vector(-siz, siz,-siz, siz),
  new Vector(-siz,-siz,-siz, siz),
  new Vector( siz,-siz,-siz, siz),
  
  new Vector( siz, siz, siz,-siz),
  new Vector(-siz, siz, siz,-siz),
  new Vector(-siz,-siz, siz,-siz),
  new Vector( siz,-siz, siz,-siz),
  new Vector( siz, siz,-siz,-siz),
  new Vector(-siz, siz,-siz,-siz),
  new Vector(-siz,-siz,-siz,-siz),
  new Vector( siz,-siz,-siz,-siz)
};

PFont F;

void setup()
{
  size(300,400);
  frameRate(30);
  F = createFont("Consolas",18,true);
}

void draw()
{
  background(0);
  stroke(255);
  
  translate(width/2, height/2);
  
  
  //Prep rotation
  float c0 = cos(XY * PI / 180.0), s0 = sin(XY * PI / 180.0),
        c1 = cos(YZ * PI / 180.0), s1 = sin(YZ * PI / 180.0),
        c2 = cos(XZ * PI / 180.0), s2 = sin(XZ * PI / 180.0),
        c3 = cos(XW * PI / 180.0), s3 = sin(XW * PI / 180.0),
        c4 = cos(YW * PI / 180.0), s4 = sin(YW * PI / 180.0),
        c5 = cos(ZW * PI / 180.0), s5 = sin(ZW * PI / 180.0);
  
  Matrix
  rotationXY = rotationMatrix(c0, s0, 0, 1),
  rotationYZ = rotationMatrix(c1, s1, 1, 2),
  rotationXZ = rotationMatrix(c2, s2, 0, 2),
  rotationXW = rotationMatrix(c3, s3, 0, 3),
  rotationYW = rotationMatrix(c4, s4, 1, 3),
  rotationZW = rotationMatrix(c5, s5, 2, 3);
  
  Matrix
  tempmat = identity(5)
  .multiply(rotationXY)
  .multiply(rotationYZ)
  .multiply(rotationXZ)
  .multiply(rotationXW)
  .multiply(rotationYW)
  .multiply(rotationZW)
  ;
  
  
  for (int i = 0; i < points.length; i++)
  { 
    Matrix point = points[i];
    point = tempmat.multiply(point);
    
    if (ORTHO) point = projection.multiply(scalar(5, 130).multiply(point));
    else point = scalar(5, 200).multiply(project(point));
    
    point(point.content[0][0], point.content[1][0]);
  }
  for (int i = 0; i < 4; i++)
  {
    if (COLORS) stroke(255,0,0);
    else stroke(255);
    
    connect(i, (i + 1) % 4, tempmat);
    connect(i + 4, ((i + 1) % 4) + 4, tempmat);
    connect(i, i + 4, tempmat);
    
    if (COLORS) stroke(0,255,0);
    
    connect(i + 8, (i + 1) % 4 + 8, tempmat);
    connect(i + 12, ((i + 1) % 4) + 12, tempmat);
    connect(i + 8, i + 12, tempmat);
    
    if (COLORS) stroke(0,0,255);
    
    connect(i, i + 8, tempmat);
    connect(i + 4, i + 12, tempmat);
  }
  
  translate(-width/2, -height/2);
  //showDegrees();
  processDegrees();
  
  if (frame < 360) saveFrame("frames/f_###");
  frame++;
}


void connect(int i, int j, Matrix transform)
{
  Matrix a = transform.multiply(points[i]), b = transform.multiply(points[j]);
  
  if (ORTHO)
  {
    a = projection.multiply(scalar(5, 130).multiply(a));
    b = projection.multiply(scalar(5, 130).multiply(b));
  }
  else
  {
    a = scalar(5, 200).multiply(project(a));
    b = scalar(5, 200).multiply(project(b));
  }
  
  line(a.content[0][0], a.content[1][0], b.content[0][0], b.content[1][0]);
}
