trigger demo1 on Opportunity (after insert) {
contact c=new contact();
for(opportunity o:trigger.new)
c.accountid=o.accountid;
c.Firstname='lavlesh';
c.lastname='owner';
insert c;

}