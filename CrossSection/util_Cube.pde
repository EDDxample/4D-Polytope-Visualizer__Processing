

class Cube
{
  Tetrahedron tetrahedra[];
  
  Cube(float x0, float y0, float z0, float w0,
       float x1, float y1, float z1, float w1)
  {
    int fixed = x0 == x1 ? 1 : y0 == y1 ? 2 : z0 == z1 ? 4 : 8;
    
    Vect4D[] v = new Vect4D[8];
    int index = 0;
    for (int i = 0; i < 16; i++)
    {
      if ((i & fixed) == 0) continue;
      
      v[index++] = new Vect4D(
      (i & 1) == 0 ? x0 : x1,
      (i & 2) == 0 ? y0 : y1,
      (i & 4) == 0 ? z0 : z1,
      (i & 8) == 0 ? w0 : w1);
    }
    setTetrahedra(v);
  }
  
  void setTetrahedra(Vect4D[] v)
  {
    tetrahedra = new Tetrahedron[]
    {
      new Tetrahedron(v[1], v[2], v[4], v[7]),
      new Tetrahedron(v[0], v[1], v[2], v[4]),
      new Tetrahedron(v[2], v[4], v[6], v[7]),
      new Tetrahedron(v[1], v[2], v[3], v[7]),
      new Tetrahedron(v[1], v[4], v[5], v[7])
    };
  }
  
  void render(float w, color c){ for (Tetrahedron t : tetrahedra) t.render(w, c); }
}
