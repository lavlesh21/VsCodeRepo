({
	
    handleComponentEvent : function(cmp, event) {
        var selectedContacts  = event.getParam("ContactRec");
        cmp.set("v.ContactRec1", selectedContacts);
        
    }

})