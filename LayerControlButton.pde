public class LayerControlButton
{
  private int layer;
  
  private float xSize;
  private float ySize;
  
  public LayerControlButton(int a)
  {
    this.layer = a;
    xSize = 60;
    ySize = 40;
  }
  
  public void setSize(float xSize, float ySize)
  {
    if(xSize < 0)
    {
      xSize = 0;
    }
    this.xSize = xSize;
    if(ySize < 0)
    {
      ySize = 0;
    }
    this.ySize = ySize;
  }
  
  
  
  
  public int Proc(float myXPos, float myYPos)
  {
    if(mousePressed)
    {
      if(mouseX >= myXPos - (xSize / 2) && mouseX <= myXPos + (xSize / 2))
      {
        if(mouseY >= myYPos - (ySize / 2) && mouseY <= myYPos + (ySize / 2))
        {
          return layer;
        }
      }
    }
    
    
    
    return -1;
  }
  
  public void Show(float myXPos, float myYPos, int activeLayer)
  {
    rectMode(CENTER);
    fill(#FFF4AC);
    
    if(activeLayer == layer)
    {
      fill(#FFFEEA);
    }
    
    
    
    rect(myXPos, myYPos, xSize, ySize, 15);
    
    fill(#FFAB00);
    textFont(mainFont);
    textSize(ySize <= 0 ? 1 : 12 * ySize / 40);
    textAlign(CENTER, CENTER);
    if(ySize > 0)
    {
      text(layer, myXPos, myYPos);
    }
    
  }
  
}
