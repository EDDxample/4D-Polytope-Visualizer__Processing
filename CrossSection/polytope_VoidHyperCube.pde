
class VoidHyperCube
{
  
  boolean hasCustomColor = false;
  color customColor;
  final VoidCube model[] = new VoidCube[8];
  
  VoidHyperCube (float s, color c) {this(s); hasCustomColor = true; customColor = c;}
  
  VoidHyperCube (float s) {this(-s,-s,-s,-s, s,s,s,s);}
  
  VoidHyperCube (float x0,float y0,float z0,float w0, float x1,float y1,float z1,float w1, color c)
  {this(x0,y0,z0,w0,x1,y1,z1,w1); hasCustomColor = true; customColor = c;}
  
  VoidHyperCube (float x0,float y0,float z0,float w0, float x1,float y1,float z1,float w1)
  {
    int i = 0;
    for (int j = 0; j < 4; j++)
    {
      model[i++] = new VoidCube(
      x0, y0, z0, w0, 
      j==0 ? x0 : x1,
      j==1 ? y0 : y1,
      j==2 ? z0 : z1,
      j==3 ? w0 : w1
      );
      model[i++] = new VoidCube( 
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
    for (VoidCube vc : model)
    {
      vc.render(w, hasCustomColor ? customColor : colors[i++]);
    }
  }
}
