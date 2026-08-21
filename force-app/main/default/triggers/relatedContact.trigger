trigger relatedContact on Account (after insert) 
{
    relatedContactHandler.createContacts(trigger.new);
}