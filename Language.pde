class Language
{
  ArrayList<int[]> buffer = new ArrayList<int[]>();

  String name;
  int rowNumber;

  final float yScale = 3;

  //  Ranges ranges;
  float max;
  TableRow row;
  int[][] data = new int[1462][6];


  color col1, col2;
  final int strokeWt = 3;

  int x;
  int y;

  Language(TableRow r, color c1, color c2)
  {
    row = r;
    name = r.getString(0);
    max = 1462;

    //load in data
    for (int j = 3; j < 1462+3; j++)
    {

      String day = row.getString(j);
      if (day.equals("0"))
      {
        for (int k = 0; k < 6; k++)
          data[j-3][k] = 0;
        continue;
      }
      String[] criteria = day.substring(1, day.length()-1).split(" ");
      for (int k = 0; k < 6; k++)
        data[j-3][k] = Integer.parseInt(criteria[k]); 
      
    }

    x = 2;
    y = round(r.getFloat(x) * yScale);
    //    println(y);

    col1 = c1;
    col2 = c2;
  }

  void showFit2(int originX, int originY)
  {

    fill(col1);
    stroke(col2);
    strokeWeight(strokeWt);

    int[] pt1, pt2;
    int avgEvery = 10;

    for (int i = curMin; i < curMax-avgEvery; i += avgEvery)
    {
      int sum = 0;
      int sum2 = 0;
      for (int ii = i; ii < i + avgEvery; ii++)
        for (int j = 0; j < 6; j++)
          if (sidebar.checkbox.getState(j))
            sum += data[ii][j];
      for (int ii = i+avgEvery; ii < i + 2*avgEvery; ii++)
        for (int j = 0; j < 6; j++)
          if (sidebar.checkbox.getState(j))
            sum2 += data[ii][j];
      sum /= avgEvery;
      sum2 /= avgEvery;
      // average 5 or so and 
      if (normalNumber == 2)
      {
        sum = int(sum/reader.uniquenorm[i+avgEvery] * 500 / (100/reader.uniquenorm[730]));
        sum2 = int(sum2/reader.uniquenorm[i+avgEvery] * 500 / (100/reader.uniquenorm[730]));
      }  
      else if (normalNumber == 3)
      {
        sum = int(sum/reader.newusersnorm[i+avgEvery] * 500 / (100/reader.newusersnorm[730]));
        sum2 = int(sum2/reader.newusersnorm[i+avgEvery] * 500 / (100/reader.newusersnorm[730]));
      }
      else if (normalNumber == 4)
      {
        sum = int(sum/reader.viewsnorm[i+avgEvery] * 500 / (100/reader.viewsnorm[730]));
        sum2 = int(sum2/reader.viewsnorm[i+avgEvery] * 500 / (100/reader.viewsnorm[730]));
      }
      int[] screenCoords = scaleCoords(i, sum);
      int[] nextScreenCoords = scaleCoords(i + avgEvery, sum2);

      if (screenCoords[1]+100 < 110)
        continue;
      line(screenCoords[0]+o1, screenCoords[1]+100, nextScreenCoords[0]+o1, nextScreenCoords[1]+100);
    }
  }


  void showFit(int originX, int originY)
  {

    fill(col1);
    stroke(col2);
    strokeWeight(strokeWt);

    int[] pt1, pt2;
    int avgEvery = 15;

    for (int i = curMin; i < curMax-avgEvery; i += avgEvery)
    {
      if(i < padding/2)
        continue;
      int sum = 0;
      int sum2 = 0;
      for (int ii = i; ii < i + avgEvery; ii++)
        for (int j = 0; j < 6; j++)
          if (sidebar.checkbox.getState(j))
            sum += data[ii][j];
      for (int ii = i+avgEvery; ii < i + 2*avgEvery; ii++)
        for (int j = 0; j < 6; j++)
          if (sidebar.checkbox.getState(j))
            sum2 += data[ii][j];
      sum /= avgEvery;
      sum2 /= avgEvery;
      // average 5 or so and 
      if (normalNumber == 2)
      {
        sum = int(sum/reader.uniquenorm[i+avgEvery] * 500 / (100/reader.uniquenorm[730]));
        sum2 = int(sum2/reader.uniquenorm[i+avgEvery] * 500 / (100/reader.uniquenorm[730]));
      }  
      else if (normalNumber == 3)
      {
        sum = int(sum/reader.newusersnorm[i+avgEvery] * 500 / (100/reader.newusersnorm[730]));
        sum2 = int(sum2/reader.newusersnorm[i+avgEvery] * 500 / (100/reader.newusersnorm[730]));
      }
      else if (normalNumber == 4)
      {
        sum = int(sum/reader.viewsnorm[i+avgEvery] * 500 / (100/reader.viewsnorm[730]));
        sum2 = int(sum2/reader.viewsnorm[i+avgEvery] * 500 / (100/reader.viewsnorm[730]));
      }
      int[] screenCoords = scaleCoords(i, sum);
      int[] nextScreenCoords = scaleCoords(i + avgEvery, sum2);

      if (screenCoords[1]+100 < 110)
        continue;
      line(screenCoords[0]+o1+10, screenCoords[1]+100, nextScreenCoords[0]+10+o1, nextScreenCoords[1]+100);
    }
  }

  void showPoints(int originX, int originY)
  {
    fill(col1);
    stroke(col2);
    strokeWeight(strokeWt);

    int[] pt1, pt2;
    for (int i = curMin; i < curMax; i++)
    {
      int sum = 0;
      for (int j = 0; j < 6; j++)
      {
        if (sidebar.checkbox.getState(j))
          sum += data[i][j];
      }
      // average 5 or so and 
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
//
//  void move2()
//  {
//  }


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

