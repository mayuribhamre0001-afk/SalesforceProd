public class ElectricityBill 
{
    public void method(decimal units)
    {
        if(units == null)
        {
			system.debug('invalid input');
        }
		else if(units<=50)
        {
			Decimal TotalBill = units * 0.50; 
            system.debug(TotalBill);
        }
        else if(units<=150)
        {
            Decimal TotalBill = (units-50)*0.75 + (50*0.50);
            system.debug(TotalBill);
        }
        else if(units<=250)
        {	 
            Decimal TotalBill = (units-150)*1.20 + (50*0.50) + (100*0.75);
            system.debug(TotalBill);
        }
        else
        {
            Decimal TotalBill = ((units-250)*1.50) + (50*0.50) + (100*0.75) +(100*1.20);
            system.debug(TotalBill);
        }
        
    }

}