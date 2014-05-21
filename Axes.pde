class Axes
{
  PFont font;

  int originX, originY;
  int thickness;
  int padding;
  int w, h;
  color col1;
  color col2;

  int[] tickPoints;

  Axes(int x, int y, int p, int wid, int heig, int t, color c1, color c2)
  {
    font = loadFont("TrebuchetMS-12.vlw");
    textFont(font);

    originX = x;
    originY = y;

    padding = p;

    w = wid-2*padding;
    h = heig-2*padding;

    thickness = t;

    //    ranges = r;
    //    tickPoints = new String[1462/30];
    //    makeTickPoints(tickPoints);

    col1 = 1;
    col2 = c2;
  }

  void show()
  {
    stroke(col2);
    strokeWeight(1);
    fill(col1);
    rect(originX, originY+200, w, thickness);
    rect(originX, y(originY), thickness, h);

    //    int yIncrements = scaleCoords(ranges.tickSizeX, ranges.tickSizeY, 0)[1];
    int yIncrements = 20;
    //
    //    //X axis
    //    if (tickBuffer.isEmpty() || cur > tickBuffer.get(tickBuffer.size()-1))
    //      tickBuffer.add(tickBuffer.get(tickBuffer.size()-1) + ranges.tickSizeX);
    //    if (tickBuffer.size() > w/ranges.tickSizeX)
    //      tickBuffer.remove(0);
    //    //    println(ranges.tickSizeX);
    //    //    println( tickBuffer.get(tickBuffer.size()-1));

//    int skip = 0;
    for (int i = curMin-20; i <= curMax-5; i++)
    {
      String tick;
      try {
        tick = xMonthTicks[i];
      } 
      catch (NullPointerException e ) {
        continue;
      }
      catch(ArrayIndexOutOfBoundsException f)
      {
        continue;
      }
      //      println(i);
      //      println(tick);
      if (tick != null)
      {
//        if (skip == 0)
//        {
          //        println("curMin " + curMin + ", i " + i);
//          println(originY);
          text(tick, originX + i - curMin, originY+200 + 20);
//          skip = 3;
//        }
//        else
//          skip--;
      }
    }

    //Y axis
    int ct = 0;
    for (int i = 0; i <= 100; i += 10)
    {
      text(i, originX - 20, (y(i*4 + originY) + h));
      ct++;
    }
  }
}

