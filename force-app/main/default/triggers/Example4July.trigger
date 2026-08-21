trigger Example4July on Account (before delete) 
{
    for(account eachac : trigger.old)
    {
        if(eachac.type =='Customer - Direct')
        {
            eachac.adderror('Cannot delete Direct customer accounts');
        }
    }
}