public class jscall {
    public list<account> record{set;get;}
    public string abc{get;set;}
    
    public void btn()
    {
        system.debug('in fun');
        record = new list<account>();
        record=[select name from Account limit 10];
    }
    public Pagereference btn1()
    {
        abc = 'test';
        system.debug('abc===>>'+abc);
        return null;
    }
}