public class Rectangle extends shape
{
    public integer length = 10;
    public integer width = 20;
    
      public override decimal calculatearea()
      {
          integer area = length*width;
          system.debug(area);
          return area;
      }


}