public class piklistvf {
    public string typ {set;get;}
    public list<account> acc1{set;get;}
    public account a{set;get;}
    
     Public List<Selectoption> gettypeof(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            for(Account acc :[SELECT id,type FROM Account where type != null]){
            lstnamesel.add(new selectoption(acc.id,acc.type));
            }
            return lstnamesel; 
        }
    
    public void go()
    {
        acc1 = new list<account>();
        acc1 =[select name,phone from account where type =:a.type];
    }

}