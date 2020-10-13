public class lookupforpageapex {
    public list<Merchandise__c> results{set;get;}
    public List<Merchandise__c> finallist{get;set;}
    
    public List<wrapAccount> listofselecteditem{set;get;}
    public lookupforpageapex(){
        
	    listofselecteditem = new List<wrapAccount>();        
       results=[select name from Merchandise__c];
        system.debug('aaaaa'+results);
        for(Merchandise__c mer :results)
        {
           listofselecteditem.add(new wrapAccount(mer)); 
        }
        
        system.debug('bbbbbb'+listofselecteditem);
        
       }
    
    public class wrapAccount {
        public Merchandise__c merchandise {get; set;}
        public String Name{set;get;}
        public id id{set;get;}
        public Boolean selected {get; set;}
        public wrapAccount(Merchandise__c o){
            this.name=o.Name;
            this.id=o.id;
            merchandise=o;
            selected=false;
            
        }
        
    }
    public PageReference go() { 
        finallist=new list<Merchandise__c>();
        for(wrapAccount wrapAccountObj : listofselecteditem) {
            if(wrapAccountObj.selected == true) {
              finallist.add(wrapAccountObj.merchandise);
            }
        }
    day14MarchApx dayapx =new day14MarchApx();
       dayapx.abcd = 'final';
     
    return null;
    }
    
    
    public string getFormTag() {
    return System.currentPageReference().getParameters().get('frm');      
  }
    public string getTextBox() {
    return System.currentPageReference().getParameters().get('txt');
  }

}