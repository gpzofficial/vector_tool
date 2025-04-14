public class LayerControl
{
  private ArrayList<LayerControlButton> lCB;
  
  private float verticalPosition;
  
  private final int layerVertLimit = 8;
  
  private final float xOutOffset = 90;
  private float currentXPos = width + 90;
  private float tYPos = height / 2;
  private AddButton addButton;
  
  private boolean is_revealed = false;
  
  
  public LayerControl()
  {
    lCB = new ArrayList<LayerControlButton>();
    verticalPosition = 0;
    addButton = new AddButton(currentXPos, height - 90);
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
    if(mouseX >= currentXPos - 40 && mouseX <= currentXPos + 40)
      {
        if(mouseY >= tYPos - (30 + 25 * (lCB.size() - 1)) && mouseY <= tYPos + (30 + 25 * (lCB.size() - 1)))
        {
          
        }
        else return;
      }
      else return;
    
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
    tYPos = height / 2;
    rectMode(CENTER);
    
    
    int acc = -1;
    
    if(!is_revealed)
    {
      if(mouseX >= width - xOutOffset / 2)
      {
        is_revealed = true;
      }
      else
      {
        currentXPos = Eases.EasesProc(EaseType.EXPONENT, currentXPos, width + xOutOffset, 9.0);
      }
      
    }
    else
    {
      if(mouseX <= width - xOutOffset * 2)
      {
        is_revealed = false;
      }
      else
      {
        currentXPos = Eases.EasesProc(EaseType.EXPONENT, currentXPos, width - xOutOffset, 9.0);
      }
      
    }
    
    addButton.SetPos(currentXPos, height - 90);
    
    
    for(int i = 0; i < lCB.size(); i++)
    {
      acc = lCB.get(i).Proc(currentXPos, tYPos + 25 * (lCB.size() - 1) - i * 50 - verticalPosition);
      if(acc != -1)
      {
        break;
      }
    }
    
    if(mousePressed && acc == -1)
    {
      if(mouseX >= currentXPos - 40 && mouseX <= currentXPos + 40)
      {
        if(mouseY >= tYPos - (30 + 25 * (lCB.size() - 1)) && mouseY <= tYPos + (30 + 25 * (lCB.size() - 1)))
        {
          acc = -2;
        }
      }
    }
    
    if(mouseY >= tYPos - (30 + 25 * (lCB.size() - 1)) && mouseY <= tYPos + (30 + 25 * (lCB.size() - 1)))
    {
      
    }
    
    
    return acc;
  }
  
  public void Show(int activeLayer)
  {
    
    fill(#FFA600);
    if(lCB.size() < 1)
    {
      rect(currentXPos, tYPos, 80, 60, 25);
    }
    else if(lCB.size() >= 1 && lCB.size() < layerVertLimit)
    {
      rect(currentXPos, tYPos, 80, 60 + 50 * (lCB.size() - 1), 25);
    }
    else
    {
      rect(currentXPos, tYPos, 80, 60 + 50 * (layerVertLimit - 1), 25);
    }
    
    
    for(int i = 0; i < lCB.size(); i++)
    {
      if(25 * (lCB.size() - 1) - i * 50 - verticalPosition <= -1 * (30 + 25 * (layerVertLimit - 2)))
      {
        
        lCB.get(i).setSize(60, 40 + 2 * (25 * (lCB.size() - 1) - i * 50 - verticalPosition + (30 + 25 * (layerVertLimit - 2)))   );
        lCB.get(i).Show(currentXPos, tYPos + 25 * (lCB.size() - 1) - i * 50 - verticalPosition, activeLayer);
      }
      else if(25 * (lCB.size() - 1) - i * 50 - verticalPosition >= (30 + 25 * (layerVertLimit - 2)))
      {
        
        lCB.get(i).setSize(60, 40 + 2 * (-1 * (25 * (lCB.size() - 1) - i * 50 - verticalPosition) + (30 + 25 * (layerVertLimit - 2)))   );
        lCB.get(i).Show(currentXPos, tYPos + 25 * (lCB.size() - 1) - i * 50 - verticalPosition, activeLayer);
      }
      else
      {
        lCB.get(i).setSize(60, 40);
        lCB.get(i).Show(currentXPos, tYPos + 25 * (lCB.size() - 1) - i * 50 - verticalPosition, activeLayer);
      }
      
    }
    
    addButton.Show();
    
  }
  
  public AddButton LC_GetAddButton()
  {
    return addButton;
  }
  
}
