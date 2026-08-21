trigger OrderEventTrigger on Order_Event__e (after insert) 
{
    list<task>AllTask = new list<task>{};
	for(Order_Event__e order : trigger.new)
    {
        if(order.Has_Shipped__c == true)
        {
            task a = new task();
            a.Priority = 'Medium';
            a.Subject = 'Follow up on shipped order 105';
            a.OwnerId = UserInfo.getUserId();
            
            AllTask.add(a);
        }
    }
    insert AllTask;
}