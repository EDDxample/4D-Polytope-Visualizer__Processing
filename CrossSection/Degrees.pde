
float XY = 500, XW = 200,
      YZ = 400, YW = 100,
      XZ = 300, ZW = 0,
      W = 0, wMin = 0, wMax = 1;

boolean bXY = true, bXW = true,
        bYZ = true, bYW = true,
        bXZ = true, bZW = true,
        bW = true;

int dy = 0;

void printdeg(final String s, final float f, final int dx)
{
  text(s + String.format("%3.0f", f), dx, dy += 20);
}

void showDegrees()
{
  textFont(F,18);
  fill(255);
  dy = 0;
  printdeg("XY:", XY, 5);
  printdeg("YZ:", YZ, 5);
  printdeg("XZ:", XZ, 5);
  dy = 0;
  printdeg("XW:", XW, 85);
  printdeg("YW:", YW, 85);
  printdeg("ZW:", ZW, 85);
  
  text("Cross W:" + String.format("%3.0f", getW()), 5, dy += 20);
}

void keyPressed()
{
  if (key < 'a') key += 'a' - 'A';
  switch(key)
  {
    case 'q': bXY = !bXY; break; case 'w': XY = 0; bXY = false; break;
    case 'a': bYZ = !bYZ; break; case 's': YZ = 0; bYZ = false; break;
    case 'z': bXZ = !bXZ; break; case 'x': XZ = 0; bXZ = false; break;
    case 'e': bXW = !bXW; break; case 'r': XW = 0; bXW = false; break;
    case 'd': bYW = !bYW; break; case 'f': YW = 0; bYW = false; break;
    case 'c': bZW = !bZW; break; case 'v': ZW = 0; bZW = false; break;
    
    case 'n': bW = !bW; break; case 'm': W = 0; bW = false; break;
  }
}

void processDegrees()
{
  final float dtheta = 1f;
  if (bXY) XY += dtheta; if (XY >= 360) XY -= 360;
  if (bYZ) YZ += dtheta; if (YZ >= 360) YZ -= 360;
  if (bXZ) XZ += dtheta; if (XZ >= 360) XZ -= 360;
  if (bXW) XW += dtheta; if (XW >= 360) XW -= 360;
  if (bYW) YW += dtheta; if (YW >= 360) YW -= 360;
  if (bZW) ZW += dtheta; if (ZW >= 360) ZW -= 360;
  
  if (bW) W += dtheta; if (W >= 360) W -= 360;
}


void setW(float min, float max) { wMin = min; wMax = max; }

float getW() { return wMin + (wMax - wMin) * (sin(radians(W)- PI/2) + 1)/ 2; }
