public class Path extends Obj
{
  private ArrayList<Float> xList;
  private ArrayList<Float> yList;

  private ArrayList<Float> xc1List; 
  private ArrayList<Float> yc1List;

  private ArrayList<Float> xc2List;
  private ArrayList<Float> yc2List;
  
  private int fac;
  private boolean is_clicked;
  private boolean is_closed;
  
  private int selection_type;
  private int selection_index;
  
  private final int CPOFFSET = 8;
  private final int POFFSET = 16;
  
  
  public Path()
  {
    System.out.println("gen");
    _init();
  }
  
  protected void _init()
  {
    myType = ObjType.PATH_TYPE;
    
    selection_type = 0;
    selection_index = 0;
    xList = new ArrayList<Float>();
    yList = new ArrayList<Float>();
    xc1List = new ArrayList<Float>();
    yc1List = new ArrayList<Float>();
    xc2List = new ArrayList<Float>();
    yc2List = new ArrayList<Float>();
    
    is_closed = false;
    is_clicked = false;
    is_active = true;
    
    fac = 0;
    
    xList.add(0.0);
    yList.add(0.0);
    xc1List.add(0.0);
    yc1List.add(0.0);
    xc2List.add(0.0);
    yc2List.add(0.0);
    
  }
  
  public void Clear()
  {
    xList.clear();
    yList.clear();
    xc1List.clear();
    yc1List.clear();
    xc2List.clear();
    yc2List.clear();
    
    is_closed = false;
    is_clicked = false;
    selection_index = 0;
    
    fac = 0;
    
    xList.add(0.0);
    yList.add(0.0);
    xc1List.add(0.0);
    yc1List.add(0.0);
    xc2List.add(0.0);
    yc2List.add(0.0);
  }
  
  public void Deselect()
  {
    is_active = false;
  }
  
  public void Select()
  {
    is_active = true;
  }
  
  public void Undo()
  {
    
  }
  
  public void Redo()
  {
    
  }
  
  public void RemoveLastNode()
  {
    if(!is_active) return;
    if(selection_index < 1) return;
    if(is_closed)
    {
      selection_index = xList.size() - 1;
    }
    xList.remove(selection_index);
    yList.remove(selection_index);
    xc1List.remove(selection_index);
    yc1List.remove(selection_index);
    xc2List.remove(selection_index);
    yc2List.remove(selection_index);
    
    selection_index = xList.size() - 1;
    
    if(is_closed)
    {
      is_closed = false;
    }
  }
  
  public void Path_EngageControlPoint()
  {
    xc1List.set(selection_index, xList.get(selection_index) - 30);
    yc1List.set(selection_index, yList.get(selection_index) - 30);
    xc2List.set(selection_index, xList.get(selection_index) + 30);
    yc2List.set(selection_index, yList.get(selection_index) + 30);
  }
  
  public void Proc()
  {
    if(is_active)
  {
  
  
  if(mousePressed && !is_clicked)
  {
    is_clicked = true;
    if(fac < 20)
    {
      is_active = false;
      fac = 0;
      Vt_Obj_Disable();
      return;
    }
    
    fac = 0;
    
    if(!is_closed)
    {
     
    
    for(int i = 1; i < xList.size(); i++)
      {
        if(mouseX >= xList.get(i) - POFFSET && mouseX <= xList.get(i) + POFFSET && mouseY >= yList.get(i) - POFFSET && mouseY <= yList.get(i) + POFFSET)
        {
          System.out.println("> 3");
          selection_type = 3;
          if(i == 1 && selection_index == xList.size() - 1)
          {
            println("???????");
            is_closed = true;
            selection_index = xList.size();
            
      xList.add(xList.get(1));
      yList.add(yList.get(1));
      xc1List.add(xc1List.get(1));
      yc1List.add(yc1List.get(1));
      xc2List.add(xc2List.get(1));
      yc2List.add(yc2List.get(1));
      selection_type = 5;
            
            
            return;
          }
          
          selection_index = i;
          println(selection_index);
          
          return;
        }
    
      }
    
    if(mouseX >= xc2List.get(selection_index) - CPOFFSET && mouseX <= xc2List.get(selection_index) + CPOFFSET && mouseY >= yc2List.get(selection_index) - CPOFFSET && mouseY <= yc2List.get(selection_index) + CPOFFSET)
    {
      System.out.println("> 2");
      selection_type = 2;
    }
    else if(mouseX >= xc1List.get(selection_index) - CPOFFSET && mouseX <= xc1List.get(selection_index) + CPOFFSET && mouseY >= yc1List.get(selection_index) - CPOFFSET && mouseY <= yc1List.get(selection_index) + CPOFFSET)
    {
      System.out.println("> 1");
      selection_type = 1;
    }
    else
    {
      
      
      
      System.out.println("> 0");
      selection_type = 0;
     
    
      xList.add(float(mouseX));
      yList.add(float(mouseY));
      xc1List.add(float(mouseX));
      yc1List.add(float(mouseY));
      xc2List.add(float(mouseX));
      yc2List.add(float(mouseY));
      selection_index = xList.size() - 1;
    }
    }
    else // CLOSED LOOP CONTROL
    {
     
      
      
      
      for(int i = 1; i < xList.size(); i++)
      {
        if(mouseX >= xList.get(i) - POFFSET && mouseX <= xList.get(i) + POFFSET && mouseY >= yList.get(i) - POFFSET && mouseY <= yList.get(i) + POFFSET)
        {
          System.out.println("> CL3");
          selection_type = 4;
          selection_index = i;
          
          return;
        }
    
      }
    
    if(mouseX >= xc2List.get(selection_index) - CPOFFSET && mouseX <= xc2List.get(selection_index) + CPOFFSET && mouseY >= yc2List.get(selection_index) - CPOFFSET && mouseY <= yc2List.get(selection_index) + CPOFFSET)
    {
      System.out.println("> CL2");
      selection_type = 2;
    }
    else if(mouseX >= xc1List.get(selection_index) - CPOFFSET && mouseX <= xc1List.get(selection_index) + CPOFFSET && mouseY >= yc1List.get(selection_index) - CPOFFSET && mouseY <= yc1List.get(selection_index) + CPOFFSET)
    {
      System.out.println("> CL1");
      selection_type = 1;
    }
    else
    {
      selection_type = 5;
    }
    
      
      
    }
    
    
  }
  else if(mousePressed && is_clicked)
  {
    switch(selection_type)
    {
      case 0:
    xc2List.set(selection_index, float(mouseX));
    yc2List.set(selection_index, float(mouseY));
    xc1List.set(selection_index, 2 * xList.get(selection_index) - float(mouseX));
    yc1List.set(selection_index, 2 * yList.get(selection_index) - float(mouseY));
    break;
    
    case 1:
    xc1List.set(selection_index, float(mouseX));
    yc1List.set(selection_index, float(mouseY));
    if(selection_index == xList.size() - 1)
    {
      xc1List.set(1, float(mouseX));
      yc1List.set(1, float(mouseY));
    }
    else if(selection_index == 1)
    {
      xc1List.set(xList.size() - 1, float(mouseX));
      yc1List.set(xList.size() - 1, float(mouseY));
    }
    break;
    
    
    case 2:
    
    xc2List.set(selection_index, float(mouseX));
    yc2List.set(selection_index, float(mouseY));
    if(selection_index == xList.size() - 1)
    {
      xc2List.set(1, float(mouseX));
      yc2List.set(1, float(mouseY));
    }
    else if(selection_index == 1)
    {
      xc2List.set(xList.size() - 1, float(mouseX));
      yc2List.set(xList.size() - 1, float(mouseY));
    }
    break;
    
    case 3:
    
    xc1List.set(selection_index, xc1List.get(selection_index) - xList.get(selection_index) + float(mouseX));
    yc1List.set(selection_index, yc1List.get(selection_index) - yList.get(selection_index) + float(mouseY));
    xc2List.set(selection_index, xc2List.get(selection_index) - xList.get(selection_index) + float(mouseX));
    yc2List.set(selection_index, yc2List.get(selection_index) - yList.get(selection_index) + float(mouseY));
    xList.set(selection_index, float(mouseX));
    yList.set(selection_index, float(mouseY));
    break;
    
    case 4:
    
    xc1List.set(selection_index, xc1List.get(selection_index) - xList.get(selection_index) + float(mouseX));
    yc1List.set(selection_index, yc1List.get(selection_index) - yList.get(selection_index) + float(mouseY));
    xc2List.set(selection_index, xc2List.get(selection_index) - xList.get(selection_index) + float(mouseX));
    yc2List.set(selection_index, yc2List.get(selection_index) - yList.get(selection_index) + float(mouseY));
    xList.set(selection_index, float(mouseX));
    yList.set(selection_index, float(mouseY));
    
    if(selection_index == xList.size() - 1)
    {
    
    xc1List.set(1, xc1List.get(1) - xList.get(1) + float(mouseX));
    yc1List.set(1, yc1List.get(1) - yList.get(1) + float(mouseY));
    xc2List.set(1, xc2List.get(1) - xList.get(1) + float(mouseX));
    yc2List.set(1, yc2List.get(1) - yList.get(1) + float(mouseY));
    xList.set(1, float(mouseX));
    yList.set(1, float(mouseY));
      
    }
    else if(selection_index == 1)
    {
    xc1List.set(xList.size() - 1, xc1List.get(xList.size() - 1) - xList.get(xList.size() - 1) + float(mouseX));
    yc1List.set(xList.size() - 1, yc1List.get(xList.size() - 1) - yList.get(xList.size() - 1) + float(mouseY));
    xc2List.set(xList.size() - 1, xc2List.get(xList.size() - 1) - xList.get(xList.size() - 1) + float(mouseX));
    yc2List.set(xList.size() - 1, yc2List.get(xList.size() - 1) - yList.get(xList.size() - 1) + float(mouseY));
    xList.set(xList.size() - 1, float(mouseX));
    yList.set(xList.size() - 1, float(mouseY));
    }
    
    break;
      
    
    }
  }
  else if(!mousePressed && is_clicked)
  {
    is_clicked = false;
    
  }
  
  
  }
  
  
  
  
  }
  
  public void Show()
  {
    
   
  // ************ START OF SHOW()
    
  if(fac < 120)
  {
    fac++;
  }
  
  if(xList.size() < 2) return;
  
  
  beginShape();
  if(xList.size() <= 1)
  {
    vertex(0, 0);
  }
  else
  {
    xList.set(0, xList.get(1));
    yList.set(0, yList.get(1));
    
  }
  for(int i = 1; i < xList.size() - 1; i++)
  {
    
    stroke(#FFAB00);
    if(is_active) stroke(#FF5C00);
    strokeWeight(4);
    noFill();
    bezier(xList.get(i), yList.get(i), xc2List.get(i), yc2List.get(i), xc1List.get(i + 1), yc1List.get(i + 1), xList.get(i + 1), yList.get(i + 1));
    
    if(false)
    {
    
    stroke(#0065FF);
    line(xc2List.get(i + 1), yc2List.get(i + 1), xc1List.get(i + 1), yc1List.get(i + 1));
    
    strokeWeight(3);
    fill(#FFFFFF);
    circle(xc2List.get(i + 1), yc2List.get(i + 1), 10);
    circle(xc1List.get(i + 1), yc1List.get(i + 1), 10);
    }
  }
  endShape();
  if(is_active)
  {
    stroke(#0065FF);
    line(xc2List.get(selection_index), yc2List.get(selection_index), xList.get(selection_index), yList.get(selection_index));
    line(xc1List.get(selection_index), yc1List.get(selection_index), xList.get(selection_index), yList.get(selection_index));
    
    strokeWeight(3);
    fill(#FFFFFF);
    circle(xc2List.get(selection_index), yc2List.get(selection_index), 10);
    circle(xc1List.get(selection_index), yc1List.get(selection_index), 10);
  }
  for(int i = 1; i < xList.size(); i++)
  {
    stroke(#FFAB00);
    if(i == selection_index)
    {
      stroke(#FF3550);
    }
    else if(i == xList.size() - 1)
    {
      stroke(#0065FF);
    }
    strokeWeight(4);
    fill(#FFFFFF);
    if(is_active) circle(xList.get(i), yList.get(i), 20);
    else circle(xList.get(i), yList.get(i), 6);
    
  }
  
  noStroke();
  
  // ************ END OF SHOW()
  
  }
  
  public ArrayList<Float> Path_Get(int listType)
  {
    switch(listType)
    {
      case 1:
        return xList;
      case 2:
        return yList;
      case 3:
        return xc1List;
      case 4:
        return yc1List;
      case 5:
        return xc2List;
      case 6:
        return yc2List;
      default:
        return xList;
      
    }
  }
  
  
  
  
  
}
