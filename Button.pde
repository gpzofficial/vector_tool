public class Button
{
  private float xPos;
  private float yPos;
  
  private float xSize;
  private float ySize;
  
  private boolean is_clicked;
  
  private Button(float xPos, float yPos)
  {
    is_clicked = false;
    this.xPos = xPos;
    this.yPos = yPos;
    xSize = 60;
    ySize = 60;
  }
  
  public void SetPos(float xPos, float yPos)
  {
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  public void SetXPos(float xPos)
  {
    SetPos(xPos, this.yPos);
  }
  
  public boolean Proc()
  {
    if(!is_clicked && mousePressed)
    {
      if(mouseX <= xPos + xSize / 2 && mouseX >= xPos - xSize / 2)
      {
        if(mouseY <= yPos + ySize / 2 && mouseY >= yPos - ySize / 2)
        {
          is_clicked = true; 
          return true;
        }
      }
    }
    else if(is_clicked && !mousePressed)
    {
      is_clicked = false;
    }
    
    return false;
  }
  
  public void Show()
  {
    fill(#FFA600);
    circle(xPos, yPos, xSize);
    
    noFill();
    stroke(#FFFFFF);
    strokeWeight(7);
    pushMatrix();
    translate(xPos, yPos);
    
    line(10, 0, -10, 0);
    line(0, 10, 0, -10);
    
    popMatrix();
    
  }
  
  
  
  
}
