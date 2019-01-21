

class VoidCube
{
  final Cube cubes[] = new Cube[6];
  
  VoidCube(float x0, float y0, float z0, float w0,
           float x1, float y1, float z1, float w1)
  {
    
    final float
    d = (x0 != x1 ? x1 - x0 : y1 - y0)*2/16,
    coords[][] = {{x0,y0,z0,w0},
                  {x1,y1,z1,w1}};
    
    int i= 0;
    for (int j = 0; j < 4; j++)
    {
      if (coords[0][j] == coords[1][j]) continue;
      cubes[i++] = new Cube(
      x0, y0, z0, w0, 
      j==0 ? x0 + d : x1,
      j==1 ? y0 + d : y1,
      j==2 ? z0 + d : z1,
      j==3 ? w0 + d : w1
      );
      cubes[i++] = new Cube( 
      j==0 ? x1 - d : x0,
      j==1 ? y1 - d : y0,
      j==2 ? z1 - d : z0,
      j==3 ? w1 - d : w0,
      x1, y1, z1, w1
      );
    }
  }
  
  void render(float w, color c){ for (Cube cub : cubes) cub.render(w, c); }
}
