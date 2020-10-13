({
	doInit : function(component, event, helper) {
        var action = component.get("c.accountlist");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.AccountName",response.getReturnValue());            }
            
        });
        
        $A.enqueueAction(action);
    },
	update : function(component, event, helper) {
        var accountrec = event.getSource().get("v.text");
        var accounttopush =[];
        accounttopush.push(accountrec);
        console.log(JSON.stringify(accountrec));
		component.set("v.SelectedAccount",accounttopush);     
        
    },
})