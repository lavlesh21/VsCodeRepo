({
	component2Event  : function(component, event, helper) {
		var message = event.getParam("message"); 
        component.set("v.FinalRec", message);
	}
})