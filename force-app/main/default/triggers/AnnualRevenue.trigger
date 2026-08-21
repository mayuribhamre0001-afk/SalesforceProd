trigger AnnualRevenue on Account (before insert, before update) 
{
    for(account eachac : trigger.new)
    {
        if(eachac.AnnualRevenue == null || eachac.AnnualRevenue < 10000)
        {
            eachac.adderror('Minimum Revenue must be atleast 10000');
        }
    }
}