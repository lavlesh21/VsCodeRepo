public class may26apx {
    public list<Contact> record{get;set;}
    public id idofRec{get;set;}
    public string nameofrec{set;get;}
    public string phoneofrec{set;get;}
    public may26apx()
    {
        record = new list<contact>();
        record =[select id,name,phone from contact where phone != NULL ORDER BY name DESC limit 5];
        
    }
    public void valueofrec()
    {
        list<contact> conrec = [select name,phone from contact where id =: idofRec];
        nameofrec =conrec[0].name;
        phoneofrec = conrec[0].phone;
        //system.debug('idofRec     '+idofRec);
    }
    public void savebtn()
    {
        
    }

}