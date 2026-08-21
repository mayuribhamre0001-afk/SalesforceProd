trigger Practice3 on Opportunity (after insert, after update, after delete, after undelete)
{   
    List<opportunity> AllOp = Trigger.new;
    testclass2.handlermethod(Allop);
}