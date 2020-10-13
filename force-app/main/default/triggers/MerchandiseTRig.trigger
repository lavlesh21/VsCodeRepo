trigger MerchandiseTRig on Merchandise__c (before insert,after insert,before update,after update,before Delete,after Delete,after undelete) {
if(Trigger.isDelete && Trigger.isafter)
{
    mertrig.insertmerchandiseArch(Trigger.old);
}
}