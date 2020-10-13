public class ApexDemo44 {


    public String filterId { get; set; }
   
    public list<Account> results { get; set; }

    public PageReference processRequests() {
    results = [select name,AccountNumber,Phone from Account where Type = :filterId ];
         return null;
        
    }


 

}