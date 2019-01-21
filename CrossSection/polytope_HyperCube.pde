                     //   RED      GREEN    YELLOW   BLUE     MAGENTA  CYAN     ORANGE   GRAY
final color[] colors = { #FF0000, #00FF00, #FFFF00, #0000FF, #FF00FF, #00FFFF, #FFA500, #F0F0F0 };

class HyperCube
{
  
  boolean hasCustomColor = false;
  color customColor;
  final Cube model[] = new Cube[8];
  
  HyperCube (float s, color c) {this(s); hasCustomColor = true; customColor = c;}
  
  HyperCube (float s) {this(-s,-s,-s,-s, s,s,s,s);}
  
  HyperCube (float x0,float y0,float z0,float w0, float x1,float y1,float z1,float w1, color c)
  {this(x0,y0,z0,w0,x1,y1,z1,w1); hasCustomColor = true; customColor = c;}
  
  HyperCube (float x0,float y0,float z0,float w0, float x1,float y1,float z1,float w1)
  {
    int i = 0;
    for (int j = 0; j < 4; j++)
    {
      model[i++] = new Cube(
      x0, y0, z0, w0, 
      j==0 ? x0 : x1,
      j==1 ? y0 : y1,
      j==2 ? z0 : z1,
      j==3 ? w0 : w1
      );
      model[i++] = new Cube( 
      j==0 ? x1 : x0,
      j==1 ? y1 : y0,
      j==2 ? z1 : z0,
      j==3 ? w1 : w0,
      x1, y1, z1, w1
      );
    }
  }
  
  void render(float w)
  {
    int i = 0;
    for (Cube c : model)
    {
      c.render(w, hasCustomColor ? customColor : colors[i++]);
    }
  }
}
