global class CompanyCasesQuery {
    public List<Case> results {get;set;}
    public String filterId {get;set;}
    
    public CompanyCasesQuery ()
    {
        results = new List<Case>();
    }
    
    
     public PageReference processRequests()
     {
         results = [select Id,CaseNumber,AccountId from case where Status = :filterId ];
         return null;
     }
     
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','Select'));
        options.add(new SelectOption('Closed','Closed'));
        options.add(new SelectOption('New','New'));
        options.add(new SelectOption('Working','Working'));
        return options;
    }

}