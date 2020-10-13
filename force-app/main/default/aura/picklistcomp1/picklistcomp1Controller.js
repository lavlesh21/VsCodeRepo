({
	doinit : function(component, event, helper) {
         var action = component.get("c.conRec");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.ContactRec",response.getReturnValue());   
                
            }
            
        });

        $A.enqueueAction(action);
		
	},
    
    handleSelectAllContact: function(component, event, helper) {
        var getID = component.get("v.contactList");
        var checkvalue = component.find("selectAll").get("v.value");        
        var checkContact = component.find("checkContact"); 
        if(checkvalue == true){
            for(var i=0; i<checkContact.length; i++){
                checkContact[i].set("v.value",true);
            }
        }
        else{ 
            for(var i=0; i<checkContact.length; i++){
                checkContact[i].set("v.value",false);
            }
        }
    },
     
    
    handleSelectedContacts: function(component, event, helper) {
        var selectedContacts = [];
        var checkvalue = component.find("checkContact");
       
            for (var i = 0; i < checkvalue.length; i++) {
                if (checkvalue[i].get("v.value") == true) {
                    selectedContacts.push(checkvalue[i].get("v.text"));
                }
            }
       // var cmpEvent = component.getEvent("cmpEvent");
       var cmpEvent = $A.get("e.c:Result");
        cmpEvent.setParams({
            "ContactRec" : selectedContacts });
        cmpEvent.fire();
        console.log('hello');
        
    }
})