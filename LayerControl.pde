public class LayerControl
{
  private ArrayList<LayerControlButton> lCB;
  
  private float verticalPosition;
  
  
  public LayerControl()
  {
    lCB = new ArrayList<LayerControlButton>();
    verticalPosition = 0;
  }
  
  public void Add(int layer)
  {
    LayerControlButton target = new LayerControlButton(layer);
    lCB.add(target);
    
  }
  
  
  public void vertScroll(float count)
  {
    
    if(lCB.size() >= 12)
    {
      verticalPosition += count;
      if(verticalPosition >= float(lCB.size() - 12) * 25)
      {
        verticalPosition = float(lCB.size() - 12) * 25;
      }
      else if(verticalPosition <= -1 * float(lCB.size() - 12) * 25)
      {
        verticalPosition = -1 * float(lCB.size() - 12) * 25;
      }
    }
  }
  
  public float getVertScroll()
  {
    return verticalPosition;
  }
  
  public int Proc()
  {
    rectMode(CENTER);
    
    
    int acc = -1;
    
    
    
    
    for(int i = 0; i < lCB.size(); i++)
    {
      acc = lCB.get(i).Proc(1190, 360 + 25 * (lCB.size() - 1) - i * 50);
      if(acc != -1)
      {
        break;
      }
    }
    
    if(mousePressed && acc == -1)
    {
      if(mouseX >= 1190 - 50 && mouseX <= 1190 + 50)
      {
        if(mouseY >= 360 - (30 + 25 * (lCB.size() - 1)) && mouseY <= 360 + (30 + 25 * (lCB.size() - 1)))
        {
          acc = -2;
        }
      }
    }
    
    if(mouseY >= 360 - (30 + 25 * (lCB.size() - 1)) && mouseY <= 360 + (30 + 25 * (lCB.size() - 1)))
    {
      
    }
    
    
    return acc;
  }
  
  public void Show(int activeLayer)
  {
    
    fill(#FFA600);
    if(lCB.size() < 1)
    {
      rect(1190, 360, 100, 60, 25);
    }
    else if(lCB.size() >= 1 && lCB.size() < 12)
    {
      rect(1190, 360, 100, 60 + 50 * (lCB.size() - 1), 25);
    }
    else
    {
      rect(1190, 360, 100, 610, 25);
    }
    
    
    for(int i = 0; i < lCB.size(); i++)
    {
      lCB.get(i).Show(1190, 360 + 25 * (lCB.size() - 1) - i * 50, activeLayer);
    }
  }
  
}
