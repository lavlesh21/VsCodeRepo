public class createcontantDocument {
    public static void method1()
    {
        system.debug('UserInfo.UITheme()==>>');
        Blob yourFiles = Blob.valueOf('Unit Test ContentVersion Body test 4'); 
        
        ContentVersion conVer = new ContentVersion();
        conVer.ContentLocation = 'S';
        conVer.PathOnClient = '.txt'; 
        conVer.Title = 'Header_Picture4';  
        conVer.VersionData = yourFiles; 
        insert conVer;
        Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
        ContentDocumentLink cDe = new ContentDocumentLink();
        cDe.ContentDocumentId = conDoc;
        cDe.LinkedEntityId = '0036F00003Gem1oQAB';
        cDe.ShareType = 'I';
        cDe.Visibility = 'AllUsers';
        insert cDe;
    }
    
}