public class sqldemo {
   public list<account> accs {set;get;}
    public sqldemo()
    {
        
        accs=[select id,name from account limit 5];
   		
        
    }

}