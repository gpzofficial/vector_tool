import processing.javafx.*;
import java.util.ArrayList;

private boolean is_keypressed;
private boolean saveSc;

private SvgExport svgExport;

private int interactionLayer;

private float vecdogInfoYPos;
private boolean is_vecdogRevealed;

public ArrayList<Obj> objs;
private AddButton addButton;

public LayerControl lC;

public int curLayer = -1;


public PFont mainFont;

void setup()
{
  size(1280, 720, FX2D);
  frameRate(120);
  pixelDensity(2);
  
  interactionLayer = 0;
  
  svgExport = new SvgExport();
  addButton = new AddButton(width - 90, height - 90);
  
  vecdogInfoYPos = height - 25;
  is_vecdogRevealed = false;
  
  objs = new ArrayList<Obj>();
  lC = new LayerControl();
  saveSc = false;
  
  mainFont = loadFont("aqum.vlw");
  
}

void draw()
{
  int selectLayer = -1;
  background(#FFF9E4);
  
  if(interactionLayer == 0)
  {
  
  if(keyPressed && !is_keypressed)
  {
    is_keypressed = true;
    if(key == 'a' && false)
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
    else if(key == 'e')
    {
      if(curLayer != -1)
      {
        objs.get(curLayer).Path_EngageControlPoint();
      }
    }
  }
  else if(!keyPressed && is_keypressed)
  {
    is_keypressed = false;
  }
  if(lC.LC_GetAddButton().Proc())
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
  selectLayer = lC.Proc();
  
  if(!is_vecdogRevealed)
    {
      if(mouseY >= height - 25)
      {
        is_vecdogRevealed = true;
        println("cccc");
      }
      else
      {
        vecdogInfoYPos = Eases.EasesProc(EaseType.EXPONENT, vecdogInfoYPos, height + 25, 9.0);
      }
      
    }
    else
    {
      if(mouseY <= height - 25 * 2)
      {
        is_vecdogRevealed = false;
        println("dddd");
      }
      else
      {
        vecdogInfoYPos = Eases.EasesProc(EaseType.EXPONENT, vecdogInfoYPos, height - 25, 9.0);
      }
      
    }
  
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
  
  }
  
  
  
  if(objs.size() < 1)
  {
    textAlign(CENTER, CENTER);
    fill(#FFAB00);
    textFont(mainFont);
  
    textSize(20);
    
    text("Click add button to add layer.", width / 2, height / 2);
    
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
  
  
  
  text(bruh, 25, vecdogInfoYPos);
  
  textSize(10);
  text("prealpha", 35 + 2 * textWidth(bruh), vecdogInfoYPos);
  
  
}

public void Vt_Obj_Disable()
{
  curLayer = -1;
}

void mouseWheel(MouseEvent event)
{
  lC.vertScroll(event.getCount() * 2);
}
