@Restresource(urlMapping='/DataAvailable1/*')
Global class IntegretionEx2 
{
	@httpget
    Global static Contact getContact()
    {
		string phoneNo = RestContext.request.params.get('phn');
		contact con = [SELECT Id, Name FROM Contact WHERE Phone =: phoneNo];
        return con;
    }
}