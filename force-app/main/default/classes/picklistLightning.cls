public class picklistLightning {
@AuraEnabled
    public static list<contact> conRec()
    {
        return [select firstname,lastname,name,Account.Name,Phone,email from contact where email != null ];
    }
    
}