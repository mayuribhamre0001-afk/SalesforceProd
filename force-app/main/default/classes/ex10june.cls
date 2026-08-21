public class ex10june 
{
    list<integer> candles = new list<integer>{3,2,1,3};
        
    public void method()
    {
        integer candlesCount = 0;
    	integer tallest = candles[0];
    
        for(integer each : candles)
        {
            if(each==tallest)
            {
                tallest = each;
                candlesCount++;
            }
            
        }
    	system.debug(candlesCount);
        system.debug(tallest);
    }
}