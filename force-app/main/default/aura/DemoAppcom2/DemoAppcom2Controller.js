({
	parentComponentEvent : function(component, event, helper) {
        var alist = event.getParam("AccountList");
        var ren = event.getParam("renderdvalue");
        component.set("v.renvalue", ren);
        component.set("v.acctlist", alist);
		
	}
})