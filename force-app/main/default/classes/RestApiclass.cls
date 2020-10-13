@RestResource(urlmapping='/AccountDetails/*')
global class RestApiclass {
    
    @httpget
    global static  list<account> Acc()
    {
        restrequest req = RestContext.request;
        string idofacc = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        list<account> acc = [select name,type,phone from account where id=:idofacc]; 
        return acc;
    }
    @httppost
    global static string acc1(String name,String phone) {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
       
        insert account;
        return account.Id;
    }

}