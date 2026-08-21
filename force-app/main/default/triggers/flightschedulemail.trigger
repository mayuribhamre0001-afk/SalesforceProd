trigger flightschedulemail on Flight_Schedule__c (after insert) 
{
    set<id> pilotId = new set<id>{};
    for(Flight_Schedule__c eachfs: Trigger.new)
    {
        if(eachfs.First_Pilot__c != null)
        {
            pilotId.add(eachfs.First_Pilot__c);
        }
    }
    Map<Id, User> pilotsMap = new Map<Id, User>([SELECT Id, Name, Email FROM User WHERE Id IN :pilotId]);
    
    list<messaging.singleEmailMessage> mail = new list<messaging.singleEmailMessage>{};
    for(Flight_Schedule__c eachfs : Trigger.new) 
    {
        if(eachfs.First_Pilot__c != null && pilotsMap.containsKey(eachfs.First_Pilot__c)) 
        {
                User pilotUser = pilotsMap.get(eachfs.First_Pilot__c);
            
                messaging.singleEmailmessage M = new messaging.singleEmailMessage();
                M.settoaddresses(new String[] {pilotUser.Email});
                M.setSubject('Flight Assignment Notification');
                M.setPlainTextBody('Dear '+pilotUser.Name+',\n\n'+
                    'You have been assigned a new Flight \n\n Flight name: '+
                    eachfs.Select_Flight__c+'\n Source: '+
                    eachfs.Source_Name__c+'\n Destination: '+eachfs.D__c+
                    '\n Departure Time: '+eachfs.Departure_Time__c+
                    '\n Arrival Time: '+eachfs.Arrival_Time__c+
                    '\n\nPlease be prepared for the flight.\n\nRegards,\nFLY EMIRATES\n\nWISHING YOU A HAPPY JOURNEY AND GOOD LUCK!');

                mail.add(M);
                System.debug('Sending email to pilot: ' + pilotUser.Email);
            }
        }
    if(!mail.isEmpty()) 
    {
        Messaging.sendEmail(mail);
    }
      
    }