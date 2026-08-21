@RestResource(urlMapping = '/getDataFromMySystem/*')
Global class integrationPractice1 
{
	@httpget
    global static list<contact>getcon()
    {
        RestRequest req = RestContext.request;
        map<string, string> mapdata = req.params;
        string MyRecId = mapdata.get('sfid');
        system.debug('check passed Id '+MyRecId);
        list<contact> conList = [SELECT Id, Name, Email FROM Contact WHERE Id =: MyRecId];
        return conList;
    }
}