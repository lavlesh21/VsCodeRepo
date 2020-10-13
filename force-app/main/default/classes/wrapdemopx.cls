public class wrapdemopx {
    public list<wrap> wraplist{set;get;}
    public list<wrap> finallist{set;get;}
    public wrapdemopx()
    {
        list<Account> acc =[select name,type,phone from account limit 10 ];
        wraplist = new list<Wrap>();
        for(account a: acc)
        {
            wraplist.add(new wrap(a));
        }
    }
    
    public class Wrap{
        public Account Ac{set;get;}
        public string nameac{set;get;}
        public string phoneac{set;get;}
        public string typeac{set;get;}
        public boolean check{set;get;}
        public wrap(account a)
        {
            ac =a;
            nameac =a.name;
            phoneac = a.Phone;
            typeac =a.Type;
            check = false;
        }
    }
    public void nextbtn()
    {
        finallist= new list<wrap>();
      	for(wrap wr :wraplist)
        {
            if(wr.check ==true)
            {
            	finallist.add(wr);    
            }
        }
        
    }

}