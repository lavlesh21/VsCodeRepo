public class AnimalLocator {
    
    public  Static String getAnimalNameById(integer ids){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'+ids);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // system.debug('abc '+response.getBody());
        Map<String, Object> animals =new  Map<String, Object>();
        string strResp;
        if (response.getStatusCode() == 200) {
            
           Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
           animals = (Map<String, Object>) results.get('animal');
            strResp = string.valueof(animals.get('name')); 
        } 
        System.debug('abc  '+strResp);
        return strResp;
    }
}