@RestResource(urlMapping='/DataofWrapper/*')
global with Sharing class RestApiwithWraper {
    @HttpGet
    global static list<Wrapper> getData()
    {
        list<Wrapper> wraplist =new list<Wrapper>();
        list<Wrapper> wraplist1 =new list<Wrapper>();
        list<Wrapper> wraplist2 =new list<Wrapper>();
       	list<Merchandise__c> list1=[select name,id from Merchandise__c];
        list<LineItem__c> list2 =[select name,id from LineItem__c];
        for(Merchandise__c mer:list1)
        {
            wraplist1.add(new Wrapper(mer));
        }
        for(LineItem__c line:List2)
        {
         	wraplist2.add(new Wrapper(line));   
        }
        
        for(Wrapper lis1:wraplist1)
        {
            wraplist.add(lis1);
        }
        for(Wrapper lis1:wraplist1)
        {
            wraplist.add(lis1);
        }
        
      return  wraplist;
    }
    global class Wrapper{
        public merchandise__c mer {set;get;}
        public LineItem__c line{set;get;}
        public Wrapper(LineItem__c lin)
        {
            line=lin;
        }
        public Wrapper (Merchandise__c m)
        {
         mer=m;   
        }
    }

    
}