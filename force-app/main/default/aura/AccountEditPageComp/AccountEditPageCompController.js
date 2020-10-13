({
    doInit: function(component, event, helper) {
        var action = component.get("c.saveAccount");
     
        action.setCallback(this, function(a) {
       
               component.set("v.newAccount",a.getReturnValue());
            
        });
        
        $A.enqueueAction(action)
    }
})