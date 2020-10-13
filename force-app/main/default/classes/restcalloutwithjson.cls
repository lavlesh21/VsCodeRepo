public class restcalloutwithjson {
    public string fun()
    {
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
		request.setMethod('GET');
		HttpResponse response = http.send(request);
        /*
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
   		List<Object> animals = (List<Object>) results.get('animals');
    	System.debug('Received the following animals:');
    	for (Object animal: animals) {
        System.debug(animal);
        }
		*/
        
        
        Map<String, object> results = (Map<String, object>) JSON.deserializeUntyped(response.getBody());
        list<object> animalslist = (list<object>) results.get('animals');
        list<Rest_Record__c> listtoinsert = new list<Rest_Record__c>();
        for(object obj :animalslist)
        {
            listtoinsert.add(new Rest_Record__c(name =string.valueof(obj)));
        }
         System.debug(listtoinsert);
        insert listtoinsert;
        return 'yes you can';
    }


}