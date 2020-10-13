public with sharing class vfpageapx{
    public vfpageapx() {
        dataRecords = [select Id,Name from account];
    }
    //Getter & Setter here are important. This means you can GET records from this variable and ANY changes you do in VF page will get SET changed into this variable itself.
    public list<Account> dataRecords { get;set; } 

    public void saveData() {
        // this code below does not make anything for editing but you can certainly check if your changed values in input controls are carried onto this APEX call or not
        integer i=0;
        for (Account c : dataRecords) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'Row ['+i+']: ID = '+c.Id + ' | Name = '+c.Name));
            i++;
        }

        // just call the update here and it means your records are saved with whatever data you modified in VF page Input Controls.
        update dataRecords;

    }
    public void saveSingleRecord() {
        string recId = ApexPages.currentpage().getParameters().get('myRecId');
        Account mySingleRec;
        for (Account c : dataRecords) {
            if (recId == c.Id) {
                mySingleRec = c;
                break;
            }
        }
        if (mySingleRec != null)
            update mySingleRec;
    }
}