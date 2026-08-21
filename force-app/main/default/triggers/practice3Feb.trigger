trigger practice3Feb on Contact (before insert, before update) 
{
    if(trigger.isbefore)
    {
        if(trigger.isInsert || trigger.isUpdate)
        {
            practice3FebHandlerClass.method(trigger.new);
        }
    }
}