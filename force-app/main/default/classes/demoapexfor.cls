public class demoapexfor {
    public demoapexfor()
    {
        
    }
    public list<account> acc{get;set;}
    public list<account> fun(){
        list<account> acc = new list<account>();
         acc = [select id,name from account];
        return acc;
    }

}