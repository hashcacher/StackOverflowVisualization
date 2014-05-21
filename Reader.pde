class Reader
{
  Table table;

  Table ru = loadTable("data/uniques.csv");
  Table rn = loadTable("data/newusers.csv");
  Table rv = loadTable("data/views.csv");

  float[] mins = new float[3];
  float[] uniquenorm;
  float[] newusersnorm;
  float[] viewsnorm;

  int[][][] data = new int[100][1462][6];

  String[] tags = new String[100];

  void populateArrays()
  {
    for (int i = 0; i < 100; i++)
    {
      TableRow r = table.getRow(i);
      for (int j = 3; j < 1462+5; j++)
      {
//        r.getString(j).
//        data[i][j] = table.getRow(
      }
    }
  }
  // get the max of each.
  TableRow rurow = ru.getRow(0);
  //    String[] v = rurow.split(',');
  int[] uniquearr = new int[1462];
  int rumax = 0;
  for (int ii = 0; ii < 1462; ii++) {
    int cv = rurow.getInt(ii);
    if (rumax < cv) {
      rumax = cv;
    }
    uniquearr[ii] = cv;
  }
  TableRow rnrow = rn.getRow(0);
  //    v = rnrow.split(',');
  int[]newusersarr = new int[1462];
  int rnmax = 0;
  for (int ii = 0; ii < 1462; ii++) {
    int cv = rnrow.getInt(ii);
    if (rnmax < cv) {
      rnmax = cv;
    }
    newusersarr[ii] = cv;
  }
  TableRow rvrow = rv.getRow(0);
  //    v = rvrow.split(',');
  int[]viewsarr = new int[1462];
  int rvmax = 0;
  for (int ii = 0; ii < 1462; ii++) {
    int cv = rvrow.getInt(ii);
    if (rvmax < cv) {
      rvmax = cv;
    }
    viewsarr[ii] = cv;
  }

  // loop again to get a vector of the factors
  uniquenorm  = new float[uniquearr.length];
  for (int ii = 0; ii < uniquearr.length; ii++) {
    uniquenorm[ii] = (float) uniquearr[ii] / rumax;
  }
  newusersnorm = new float[newusersarr.length];
  for (int ii = 0; ii < newusersarr.length; ii++) {
    newusersnorm[ii] = (float) newusersarr[ii] / rnmax;
  }
  viewsnorm = new float[viewsarr.length];
  for (int ii = 0; ii < viewsarr.length; ii++) {
    viewsnorm[ii] = (float) viewsarr[ii] / rvmax;
  }

  // use the arrays
  // uniquenorm to normalize based on unique active users per day
  // newusersnorm to normalize based on new user registrations per day
  // viewsnorm to normalize on site views per day
}

Reader(String path)
{
  maxX = 0;
  maxY = 0;

  //    langs = new ArrayList<Data>();
  table = loadTable(path);
  tags = table.getStringColumn(0);
  populateArrays();
  println(uniquenorm[0]);
  println(newusersnorm[0]);
  println(viewsnorm[0]);
  //  float[] newusersnorm;
  //  float[] viewsnorm;
  //    println(uniquenorm[1400]);
  //    println(table.getRow(0).getString(3));
  //    String line;
  //
  //    while (line != null)
  //    {
  //      String[] nameAndFirstRecord = line.split("-\\{");
  //      Data data = new Data(nameAndFirstRecord[0]);
  //      
  //      String[] firstSplit = nameAndFirstRecord[1].split(":");
  //      data.addData(firstSplit[0].substring(1,8), int(firstSplit[1].trim()));
  //      
  ////      println(firstSplit[1].trim());
  //      
  //      String[] pieces = split(line, ",");
  //      for (int i = 1; i < pieces.length; i++)
  //      {
  //        String piece = pieces[i];
  //        String[] dateAndViews = piece.split(":");
  //        
  //        data.addData(dateAndViews[0].substring(2,9), int(dateAndViews[1].trim()));
  //        
  //        if(dateToNumber(data.getDataX(i)) > maxX)
  //          maxX = dateToNumber(data.getDataX(i)); 
  //        if(data.getDataY(i) > maxY)
  //          maxY = data.getDataY(i);
  //      }




  //      
  //      data.xMax = maxX;
  //      data.yMax = maxY;
  //      println(maxX + " " + maxY);
  //      langs.add(data);
  //      
  //      try {
  //        line = reader.readLine();
  //      } 
  //      catch (IOException e) {
  //        e.printStackTrace();
  //        line = null;
  //      }
}

Table getTable()
{
  return table;
}
}
