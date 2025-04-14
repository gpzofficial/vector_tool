public class SvgExport
{
  private final String header = "<svg width=\"1080\" height=\"720\" xmlns=\"http://www.w3.org/2000/svg\">\n";
  private final String detector = "<!--VCDG@GPZ-->\n";
  private final String footer = "\n</svg>";
  
  public SvgExport()
  {
    
  }
  
  
  
  public boolean Export(ArrayList<Obj> objs)
  {
    String output = "";
    
    output += header;
    output += detector;
    for(int i = 0; i < objs.size(); i++)
    {
      Obj obj = objs.get(i);
      ArrayList<Float> x = obj.Path_Get(1);
      ArrayList<Float> y = obj.Path_Get(2);
      ArrayList<Float> xc1 = obj.Path_Get(3);
      ArrayList<Float> yc1 = obj.Path_Get(4);
      ArrayList<Float> xc2 = obj.Path_Get(5);
      ArrayList<Float> yc2 = obj.Path_Get(6);
      
      if(x.size() < 2)
      {
        continue;
      }
      else
      {
      output += "<path\nd = \"";
      for(int j = 1; j < x.size(); j++)
      {
        if(j == 1)
        {
        output += "M ";
        output += (x.get(j) + " " + y.get(j) + " ");
        }
        else
        {
        output += "C ";
        output += (xc2.get(j - 1) + " " + yc2.get(j - 1) + " ");
        output += (xc1.get(j) + " " + yc1.get(j) + ", ");
        
        output += (x.get(j) + " " + y.get(j) + ", ");
        }
        
        
      }
      output += ("\"\nstroke = \"black\"\nfill = \"white\" />\n");
      }
    }
    output += footer;
    
    println(output);
    
    
    return false;
  }
  
  
}
