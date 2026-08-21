trigger practice24novopp on Opportunity (after update) 
{
    boolean updt = trigger.isupdate;
    list<id>allId = new list<id>{};
    for(opportunity eachOp : Trigger.new)
    {
        if(eachop.OwnerId!= null)
        {
            allId.add(eachop.OwnerId);
        }
        if(eachOp.StageName == 'Closed Lost')
        {
           if(updt == true)
           {
                 p24novoppHandlerclass.method(eachop, allId, updt);
           }
        }
    }
}