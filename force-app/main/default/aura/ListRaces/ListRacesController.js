({
    doinit : function(component, event, helper) {
       var action = component.get("c.racelist");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.races",response.getReturnValue());   
                
            }
            
        });

        $A.enqueueAction(action);
    },
    
    handleEvent:function(component, event, helper)
    {
        
    }
})