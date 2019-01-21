class Tetrahedron
{
  final Vect4D vects[];
  
  Tetrahedron(Vect4D a, Vect4D b, Vect4D c, Vect4D d)
  {
    vects = new Vect4D[]{a, b, c, d};
  }
  
  void render(float w, color c)
  {
    final int pairs[] = { 0,1, 0,2, 0,3, 1,2, 1,3, 2,3 };
    int inside[] = {0,0,0,0}, count = 0;
    Vect4D A, B, renderList[] = new Vect4D[4];
    
    for (int i = 0; i < 12; i+=2)
    {
      A = vects[pairs[i]].clone();   A.rotate();
      B = vects[pairs[i+1]].clone(); B.rotate();
      
      // No intersection
      if ((A.w > w && B.w > w) || (A.w < w && B.w < w)) continue;
      
      // Fully inside
      if (A.w == w && B.w == w)
      {
        if (count < 4 && inside[pairs[i]] == 0)
        { renderList[count] = A; count++; inside[pairs[i]] = 1; }
        
        if (count < 4 && inside[pairs[i+1]] == 0)
        { renderList[count] = B; count++; inside[pairs[i+1]] = 1; }
        continue;
      }
      
      // Intersection
      if (count < 4)
      {
        float t = (w - A.w) / (B.w - A.w);
        renderList[count] = new Vect4D
        (
          A.x + (B.x - A.x)*t,
          A.y + (B.y - A.y)*t,
          A.z + (B.z - A.z)*t,
        w);
  
        count++;
        continue;
      }
    }
    
    /****** RENDER ******/
    
    //stroke(c); noFill();
    fill(c); noStroke();
    
    if (count == 3)
    {
      Vect4D
      _a = renderList[0],
      _b = renderList[1],
      _c = renderList[2];
      
      TRIANGLE(_a, _b, _c);
  
    }
    if (count == 4)
    {
      final int order[] = { 0,1,2, 3,0,1, 3,1,2, 3,2,0 };
      for (int i = 0; i < 4; ++i)
      {
        Vect4D
        _a = renderList[order[i * 3]],
        _b = renderList[order[i * 3 + 1]],
        _c = renderList[order[i * 3 + 2]];
        
        TRIANGLE(_a, _b, _c);
      }
    } 
  }
  
  void TRIANGLE(Vect4D a, Vect4D b, Vect4D c)
  {
    beginShape(TRIANGLE);
    vertex(a.x, a.y, a.z);
    vertex(b.x, b.y, b.z);
    vertex(c.x, c.y, c.z);
    endShape();
  }
}
