global class accountcreate {
    
    webservice static string createaccount( string name ,string phone , string address)
    {
        account acc = new account();
        acc.name = name;
        acc.Phone = phone;
        acc.BillingCity = address;
        insert acc;
        if(acc.id != null)
        {
            return 'success';            
        }
        else
        {
            return 'fail';
        }
    }

    
}