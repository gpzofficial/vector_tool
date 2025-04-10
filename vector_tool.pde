import processing.javafx.*;
import java.util.ArrayList;

private boolean is_keypressed;
private boolean saveSc;

private SvgExport svgExport;

public ArrayList<Obj> objs;

public LayerControl lC;

public int curLayer = -1;


public PFont mainFont;

void setup()
{
  size(1280, 720, FX2D);
  frameRate(120);
  pixelDensity(2);
  
  svgExport = new SvgExport();
  
  objs = new ArrayList<Obj>();
  lC = new LayerControl();
  saveSc = false;
  
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
    else if(key == 'p')
    {
      svgExport.Export(objs);
    }
    else if(key == 'u')
    {
      saveSc = true;
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
  
  if(saveSc)
  {
    saveSc = false;
    saveFrame();
  }
  
  lC.Show(curLayer);
  
  
  textAlign(LEFT, BOTTOM);
  fill(#FFFFFF);
  circle(mouseX, mouseY, 20);
  
  fill(#FFAB00);
  textFont(mainFont);
  
  textSize(20);
  
  String bruh = "VECDOG | " + key + " " + curLayer + " " + lC.getVertScroll();
  
  text(bruh, 25, height - 25);
  
  textSize(10);
  text("prealpha", 35 + 2 * textWidth(bruh), height - 25);
  
  
}

public void Vt_Obj_Disable()
{
  curLayer = -1;
}

void mouseWheel(MouseEvent event)
{
  lC.vertScroll(event.getCount());
}
