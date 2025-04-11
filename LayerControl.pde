public class LayerControl
{
  private ArrayList<LayerControlButton> lCB;
  
  private float verticalPosition;
  
  private final int layerVertLimit = 8;
  
  
  public LayerControl()
  {
    lCB = new ArrayList<LayerControlButton>();
    verticalPosition = 0;
  }
  
  public void Add(int layer)
  {
    LayerControlButton target = new LayerControlButton(layer);
    
    lCB.add(target);
    
    if(lCB.size() >= layerVertLimit) verticalPosition = -1 * float(lCB.size() - layerVertLimit) * 25;
    else verticalPosition = 0;
    
  }
  
  
  public void vertScroll(float count)
  {
    
    if(lCB.size() >= layerVertLimit)
    {
      verticalPosition += count;
      if(verticalPosition >= float(lCB.size() - layerVertLimit) * 25)
      {
        verticalPosition = float(lCB.size() - layerVertLimit) * 25;
      }
      else if(verticalPosition <= -1 * float(lCB.size() - layerVertLimit) * 25)
      {
        verticalPosition = -1 * float(lCB.size() - layerVertLimit) * 25;
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
      acc = lCB.get(i).Proc(1190, 360 + 25 * (lCB.size() - 1) - i * 50 - verticalPosition);
      if(acc != -1)
      {
        break;
      }
    }
    
    if(mousePressed && acc == -1)
    {
      if(mouseX >= 1190 - 40 && mouseX <= 1190 + 40)
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
      rect(1190, 360, 80, 60, 25);
    }
    else if(lCB.size() >= 1 && lCB.size() < layerVertLimit)
    {
      rect(1190, 360, 80, 60 + 50 * (lCB.size() - 1), 25);
    }
    else
    {
      rect(1190, 360, 80, 60 + 50 * (layerVertLimit - 1), 25);
    }
    
    
    for(int i = 0; i < lCB.size(); i++)
    {
      if(25 * (lCB.size() - 1) - i * 50 - verticalPosition <= -1 * (30 + 25 * (layerVertLimit - 2)))
      {
        
        lCB.get(i).setSize(60, 40 + 2 * (25 * (lCB.size() - 1) - i * 50 - verticalPosition + (30 + 25 * (layerVertLimit - 2)))   );
        lCB.get(i).Show(1190, 360 + 25 * (lCB.size() - 1) - i * 50 - verticalPosition, activeLayer);
      }
      else if(25 * (lCB.size() - 1) - i * 50 - verticalPosition >= (30 + 25 * (layerVertLimit - 2)))
      {
        
        lCB.get(i).setSize(60, 40 + 2 * (-1 * (25 * (lCB.size() - 1) - i * 50 - verticalPosition) + (30 + 25 * (layerVertLimit - 2)))   );
        lCB.get(i).Show(1190, 360 + 25 * (lCB.size() - 1) - i * 50 - verticalPosition, activeLayer);
      }
      else
      {
        lCB.get(i).setSize(60, 40);
        lCB.get(i).Show(1190, 360 + 25 * (lCB.size() - 1) - i * 50 - verticalPosition, activeLayer);
      }
      
    }
  }
  
}
