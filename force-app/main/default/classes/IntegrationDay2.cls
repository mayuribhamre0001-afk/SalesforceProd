@Restresource(urlMapping='/DataAvailable/*')
Global class IntegrationDay2 
{
	@httpget
    Global static contact getContact()
    {
        contact con = [SELECT Id, name FROM Contact];
        return con;
    }
}