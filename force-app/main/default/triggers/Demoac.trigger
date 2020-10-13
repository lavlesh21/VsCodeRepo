trigger Demoac on Account (after insert) {
Contact c=new Contact();
    for(Account a : Trigger.New){
        c.accountid = a.id;
        c.lastname= 'rao';
        c.firstname='kush';

        insert c;
        }
}