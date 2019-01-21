
float XY = 0, XW = 0,
      YZ = 0, YW = 0,
      XZ = 0, ZW = 0;

boolean bXY = false, bXW = false,
        bYZ = false, bYW = true,
        bXZ = true, bZW = true;

int dy = 0;

void printdeg(final String s, final float f, final int dx)
{
  text(s + String.format(" %3.0f", f), dx, dy += 20);
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
    case 'n': COLORS = !COLORS; break;
    case 'm': ORTHO = !ORTHO; break;
  }
}

void processDegrees()
{
  final float dtheta = 1.5f;
  if (bXY) XY += dtheta; if (XY >= 360) XY -= 360;
  if (bYZ) YZ += dtheta; if (YZ >= 360) YZ -= 360;
  if (bXZ) XZ += dtheta; if (XZ >= 360) XZ -= 360;
  if (bXW) XW += dtheta; if (XW >= 360) XW -= 360;
  if (bYW) YW += dtheta; if (YW >= 360) YW -= 360;
  if (bZW) ZW += dtheta; if (ZW >= 360) ZW -= 360;
}
