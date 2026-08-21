trigger duplicateAccountPrevention on Account (before insert) 
{
    if(duplicateAccountPrehandler.firstrun)
    {
        duplicateAccountPrehandler.firstrun = false;
        duplicateAccountPrehandler.duplicateMethod(trigger.new);
    }
}