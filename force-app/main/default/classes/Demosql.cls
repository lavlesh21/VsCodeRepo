public class Demosql {
    public list<account> acc{set;get;}
  
    public void allrecord()
    {
        acc = [select id, name from account limit 5];
    }

}