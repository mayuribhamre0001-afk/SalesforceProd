trigger CaseClosedEmail on Case (after update) 
{
    set<id>Allid = new set<id>{};
    for(case eachcase : trigger.new)
    {
        case oldcase = trigger.oldmap.get(eachcase.Id);
        if(eachcase.Status == 'Closed' && oldcase.Status != 'Closed')   
        {
            Allid.add(eachcase.id);
        }
    }
    if(!Allid.isempty())
    {
        system.enqueuejob(new CaseClosedEmail(Allid));
    }
}