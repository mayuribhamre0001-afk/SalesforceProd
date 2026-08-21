trigger closedcases on Case (after insert, after update, after delete, after undelete) 
{
    list<case> Allcase = Trigger.New;
    set <id>AllId = new set<id>{};
    
    for(case eachcase : Allcase)
    {
        AllId.add(eachcase.contactId);
    }
    
    map<id,contact>Allcon = new map<id,contact>(
    [select id, Closed_Cases_Count__c from contact where id IN : AllId]
    );
}