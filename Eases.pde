public enum EaseType
{
  LINEAR,
  EXPONENT,
  BOUNCE
}

public static class Eases
{
  
  
  
  public Eases()
  {
    
  }
  
  public static float EasesProc(EaseType type, float current, float end, float coef)
  {
    if(type == EaseType.EXPONENT)
    {
      float output = current + (end - current) / coef;
      if(abs(end - current) < 0.5)
      {
        return end;
      }
      return output;
    } 
    else
    {
      float output = current + end / coef;
      return current + end / coef;
    }
  }
}
