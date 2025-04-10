import processing.javafx.*;
import java.util.ArrayList;

private boolean is_keypressed;

public ArrayList<Obj> objs;

public LayerControl lC;

public int curLayer = -1;


public PFont mainFont;

void setup()
{
  size(1280, 720, FX2D);
  frameRate(120);
  pixelDensity(2);
  
  objs = new ArrayList<Obj>();
  lC = new LayerControl();
  
  mainFont = loadFont("aqum.vlw");
  
}

void draw()
{
  int selectLayer = -1;
  background(#FFF9E4);
  if(keyPressed && !is_keypressed)
  {
    is_keypressed = true;
    if(key == 'a')
    {
      for(int i = 0; i < objs.size(); i++)
      {
        objs.get(i).Deselect();
      }
      Obj newObj = new Path();
      objs.add(newObj);
      System.out.println(objs.size());
      lC.Add(objs.size() - 1);
      curLayer = objs.size() - 1;
    }
    else if(key == 'd')
    {
      for(int i = 0; i < objs.size(); i++)
      {
        objs.get(i).Deselect();
      }
      curLayer = -1;
    }
    else if(key == 'z')
    {
      if(curLayer >= 0)
        {
          objs.get(curLayer).RemoveLastNode();
        }
    }
    else if(key == 'c')
    {
      
      if(curLayer >= 0)
        {
          objs.get(curLayer).Clear();
        }
    }
  }
  else if(!keyPressed && is_keypressed)
  {
    is_keypressed = false;
  }
  
  selectLayer = lC.Proc();
  
  
  
  if(selectLayer == -1)
  {
  
  for(int i = 0; i < objs.size(); i++)
  {
    objs.get(i).Proc();
  }
  
  }
  else if(selectLayer == -2)
  {
  }
  else
  {
    
  for(int i = 0; i < objs.size(); i++)
  {
    objs.get(i).Deselect();
  }
  curLayer = selectLayer;
  
  objs.get(selectLayer).Select();
  
  
    
  }
  
  
  
  
  
  
  for(int i = 0; i < objs.size(); i++)
  {
    objs.get(i).Show();
  }
  noStroke();
  
  lC.Show(curLayer);
  
  textAlign(LEFT, BOTTOM);
  fill(#FFFFFF);
  circle(mouseX, mouseY, 20);
  
  fill(#FFAB00);
  textFont(mainFont);
  
  textSize(20);
  text(key + " " + curLayer + " " + lC.getVertScroll(), 25, height - 25);
  
  textSize(10);
  text("vector editing tool test", 30 + 2 * textWidth("gpzofficial"), height - 25);
  
  
}

public void Vt_Obj_Disable()
{
  curLayer = -1;
}

void mouseWheel(MouseEvent event)
{
  lC.vertScroll(event.getCount());
}
