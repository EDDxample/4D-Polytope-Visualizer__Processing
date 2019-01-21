
class Matrix
{
  float[][] content;
  int rows, cols;
  
  Matrix(final float[][] f)
  {
    content = f;
    rows = f.length;
    cols = f[0].length;
  }
  
  public Matrix multiply(Matrix m)
  {
    if (cols != m.rows)
    {
      println("ERROR: " + rows + " " + cols + " != " + m.rows + " " + m.cols);
      return null;
    }
    
    float[][] mat = new float[rows][m.cols];
    
    for (int i = 0; i < m.cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        float sum = 0;
        for (int k = 0; k < cols; k++)
        {
          sum += content[j][k] * m.content[k][i];
        }
        mat[j][i] = sum;
      }
    }
    return new Matrix(mat);
  }
}

Matrix identity(int order) { return scalar(order, 1); }

Matrix scalar(int order, int scalar)
{
  float[][] m = new float[order][order];
  for (int i = 0; i < order; i++)
  for (int j = 0; j < order; j++)
    if (i == j) m[i][j] = scalar;
    else m[i][j] = 0;
  return new Matrix(m);
}

Matrix project(Matrix point)
{
  float distance = 2;
  float z = 1 / (distance - point.content[3][0]);
  
  point.content[0][0] *= z;
  point.content[1][0] *= z;
  return point;
}


/**
  * X = 0, Y = 1, Z = 2, W = 3
  */
Matrix rotationMatrix(final float deg, final int xyz, final int yzw)
{
  final float rad = deg * PI / 180.0,
              c = cos(rad),
              s = sin(rad) * ((yzw - xyz) % 2 == 0 ? 1 : -1);
  return rotationMatrix(c, s, xyz, yzw);
}

Matrix rotationMatrix(final float c, final float s, final int xyz, final int yzw)
{
  float[][] m = identity(5).content;
  
  m[xyz][xyz] = c; m[xyz][yzw] =-s;
  m[yzw][xyz] = s; m[yzw][yzw] = c;

  return new Matrix(m);
}

class Vector extends Matrix
{
  Vector(final float x, final float y, final float z, final float w)
  {
    super(new float[][]{{x},{y},{z},{w},{1}});
  }
}
