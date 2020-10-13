public with sharing class LavleshApex {
public LavleshApex() {
        
    Id id = ApexPages.currentpage().getParameters().get('id');
         if (id!=null){}
}         
    public String Country { get; set; }

    public PageReference save() {
        return null;
    }
}