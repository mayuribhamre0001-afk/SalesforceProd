public class Example18June implements queueable
{
    Public Void Execute(system.queueableContext QC)
    {
       system.debug('this is executed parallely');
        method2();
    }
    public static void method2()
    {
        system.debug('this is simple method');
        method1();
    }
    @future
    Public static void Method1()
    {
        system.debug('future apex');
    }
}