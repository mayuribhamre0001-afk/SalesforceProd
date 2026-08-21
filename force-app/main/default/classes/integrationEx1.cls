public class integrationEx1 
{
	public static void makecallout()
    {
        Http obj = new Http();
        httpRequest req = new httpRequest();
        req.setendpoint('https://api.spoonacular.com/recipes/random?apiKey=1687f6fc2ce24e0e92fcc47514851c0a');
        req.setMethod('GET');
        httpResponse res = obj.send(req);
        
        if(res.getStatusCode()== 200)
        {
            system.debug('Made a callout to external system '+res.getbody());
        }
        system.debug(res.getStatusCode());
    }
}