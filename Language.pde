class Language
{
  ArrayList<int[]> buffer = new ArrayList<int[]>();

  String name;
  int rowNumber;

  final float yScale = 3;

  //  Ranges ranges;
  float max;
  TableRow row;

  color col1, col2;
  final int strokeWt = 3;

  int x;
  int y;

  Language(TableRow r, color c1, color c2)
  {
    row = r;
    name = r.getString(0);
    max = 1462;

    x = 2;
    y = round(r.getFloat(x) * yScale);
    //    println(y);

    col1 = c1;
    col2 = c2;
  }

  void show2(int originX, int originY)
  {
    fill(col1);
    stroke(col2);
    strokeWeight(strokeWt);

    for (int i = curMin; i < curMax; i++)
    {
        String day = row.getString(3+i);
      if (day.equals("0"))
        continue;
      day = day.substring(1, day.length()-1);
      String[] parts = day.split(" ");

      int sum = 0;
      for (int j = 0; j < 6; j++)
      {
        //        println(sidebar.checkbox.getItem(j).getState());
        if (sidebar.checkbox.getItem(j).getState())
        {
          //          println(parts.length);
          sum += parseInt(parts[j]);
        }
      }
      if (normalNumber == 2)
        sum = int(sum/reader.uniquenorm[i] * 500 / (100/reader.uniquenorm[730]));
      else if (normalNumber == 3)
        sum = int(sum/reader.newusersnorm[i] * 500 / (100/reader.newusersnorm[730]));
      else if (normalNumber == 4)
        sum = int(sum/reader.viewsnorm[i] * 500 / (100/reader.viewsnorm[730]));
//      sum*500/(
      //      println(sum);
      //      println(day);
      //      int[] curData2 = {
      //      i+1, round(row.getFloat(i+1) * yScale) };

      int[] screenCoords = scaleCoords(i, sum);
      //      int[] nextScreenCoords = scaleCoords(curData2[0], curData2[1]);

      if (screenCoords[1]+100 < 110)
        continue;
      point(screenCoords[0]+o1, screenCoords[1]+100);
    }
  }

  void move2()
  {
  }


  //      
  //  void show(int originX, int originY)
  //  {
  //    fill(col1);
  //    stroke(col2);
  //    strokeWeight(strokeWt);
  //
  //    int[] curData = {
  //      x, y
  //    };
  //    //    println(curData[0]);
  //
  //    //    moveAmt = 1;
  //    //updating the buffer
  //    if (moveAmt > 0 && x < 1462-2)
  //      buffer.add(curData);
  //    else if (moveAmt < 0 && x > 0)
  //      buffer.add(0, curData);
  //
  //    if (buffer.size() > 499)//if (buffer.get(buffer.size()-1)[0] > w-2*padding)
  //    {
  //      if (moveAmt > 0 && x < 1462-2)
  //        buffer.remove(0);
  //      else if (moveAmt < 0 && x > 0)
  //        buffer.remove(buffer.size()-1);
  //    }
  //
  //    //drawing the points in the buffer
  //    for (int i = 0; i < buffer.size()-1; i++)
  //    {
  //      int[] point = buffer.get(i);
  //      int[] point2 = buffer.get(i+1); 
  //      int[] screenCoords = scaleCoords(point[0], point[1]);
  //      int[] nextScreenCoords = scaleCoords(point2[0], point2[1]);
  //      //      println("(" + screenCoords[0] +  ", " + screenCoords[1] + ")");
  //      //line(originX + screenCoords[0], screenCoords[1] - originY, 
  //      //      originX + nextScreenCoords[0], nextScreenCoords[1] - originY);\
  //      //      stroke(#ff0099);
  //      //      println(screenCoords[0]);
  //      point(screenCoords[0], screenCoords[1]);
  //    }
  //  }
  //
  //  //go in both directions
  //  void move()
  //  {
  //
  //    //    println(moveAmt);
  //    if (moveAmt > 0)
  //    {
  //      if (x < 1462-3)
  //      {
  //        for (int i = 0; i < moveAmt; i++)
  //        {
  //          try {
  //            x = curMax + 1;
  //            y = round(row.getFloat(x) * yScale);
  //
  //            show(padding, padding);
  //            curMin = buffer.get(0)[0];
  //            curMax++;
  //          }
  //          catch(ArrayIndexOutOfBoundsException e)
  //          {
  //            x--;
  //            y = round(row.getFloat(x) * yScale);
  //
  //            show(padding, padding);
  //            curMin = buffer.get(0)[0];
  //            curMax--;
  //          }
  //        }
  //      }
  //    }
  //    else if (moveAmt < 0)
  //    {
  //      if (x > 0)
  //      {
  //        for (int i = 0; i < -moveAmt; i++)
  //        {
  //          x = curMin - 1;
  //          y = round(row.getFloat(x) * yScale);
  //          show(padding, padding);
  //          curMin = buffer.get(0)[0];
  //          curMax--;
  //        }
  //      }
  //    }
  //      println(x);
  //      println("(" + x + ", " + y + ")");
  //}
}

