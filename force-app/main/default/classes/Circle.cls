public class Circle extends shape
{
    decimal radius = 20;
    decimal pi = 3.143;
    
    public override decimal calculatearea()
    {
        decimal area = radius*pi;
        system.debug(area);

        return area;

    }

}