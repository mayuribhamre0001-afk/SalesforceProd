public class stringReversal 
{
    Public static string reversestring(string a)
    {
        string b = '';
        for(integer i=a.length()-1;i>=0;i--)
        {
            b+=a.substring(i,i+1);
        }
        return b;
    }
    

}