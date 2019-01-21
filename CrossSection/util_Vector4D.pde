
class Vect4D
{
  float x, y, z, w;
  Vect4D(final float a, final float b, final float c, final float d)
  {
    x = a; y = b; z = c; w = d;
  }
  
  Vect4D clone()
  {
    return new Vect4D(x, y, z, w);
  }
  
  void rotate()
  {
    if (XY != 0) rotatePlane(XY, 0, 1);
    if (YZ != 0) rotatePlane(YZ, 1, 2);
    if (XZ != 0) rotatePlane(XZ, 0, 2);
    
    if (XW != 0) rotatePlane(XW, 0, 3);
    if (YW != 0) rotatePlane(YW, 1, 3);
    if (ZW != 0) rotatePlane(ZW, 2, 3);
  }
  
  // X = 0, Y = 1, Z = 2, W = 3
  void rotatePlane(float deg, int xyz, int yzw)
  {
    final float
    rad = deg * PI / 180.0,
      c = cos(rad),
      s = sin(rad) * ((yzw - xyz) % 2 == 0 ? 1 : -1);

    final float
    a0 = c * get(xyz) + s * get(yzw),
    a1 =-s * get(xyz) + c * get(yzw);
    
    set(xyz, a0);
    set(yzw, a1);
  }
  
  float get(int i)
  {
    switch(i)
    {
      case 0: return x; case 1: return y;
      case 2: return z; case 3: return w;
    }
    return 0;
  }
  
  void set(int i, float val)
  {
    switch(i)
    {
      case 0: x = val; break; case 1: y = val; break;
      case 2: z = val; break; case 3: w = val; break;
    }
  }
}
