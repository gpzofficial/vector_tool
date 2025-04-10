public class LayerControlButton
{
  private int layer;
  
  public LayerControlButton(int a)
  {
    this.layer = a;
  }
  
  public int Proc(float myXPos, float myYPos)
  {
    if(mousePressed)
    {
      if(mouseX >= myXPos - 40 && mouseX <= myXPos + 40)
      {
        if(mouseY >= myYPos - 20 && mouseY <= myYPos + 20)
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
    
    
    
    rect(myXPos, myYPos, 80, 40, 15);
    
    fill(#FFAB00);
    textFont(mainFont);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(layer, myXPos, myYPos);
  }
  
}
