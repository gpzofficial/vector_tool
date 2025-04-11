public abstract class Obj
{
  protected ObjType myType;
  protected boolean is_active;
  
  
  
  protected abstract void _init();
  public abstract void Clear();
  public abstract void Deselect();
  public abstract void Select();
  
  public abstract void Undo();
  public abstract void Redo();
  
  public abstract void RemoveLastNode();
  
  public abstract void Proc();
  public abstract void Show();
  
  public abstract ArrayList<Float> Path_Get(int listType);
  public abstract void Path_EngageControlPoint();
  
  
  
  
  
  
}
