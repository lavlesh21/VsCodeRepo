({
    doInit : function(component, event, helper) {
            var recid =component.get("v.recordId"); 
        	var action = component.get("c.btnvalue");
        	 action.setParams({"idofrec":recid});
        	action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Amount", response.getReturnValue());
            } 
            else {
                console.log(state);
            }
        });
            
             $A.enqueueAction(action);
},
    savebtn : function(component, event, helper) {
        var amt = component.get("v.Amount");
        var recid =component.get("v.recordId"); 
        var action = component.get("c.savebtns");
        console.log(amt);
        console.log(recid);
        action.setParams({"amnt":amt,"idofrec":recid});
        
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                $A.get('e.force:refreshView').fire();
                $A.get("e.force:closeQuickAction").fire();
            } 
            else {
                console.log(state);
            }
        });
        
        
        $A.enqueueAction(action);
        
        
    }
})