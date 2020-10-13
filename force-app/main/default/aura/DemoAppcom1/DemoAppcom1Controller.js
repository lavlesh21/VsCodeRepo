({
    handleClick: function(component, event, helper) {
        var Nameval = component.get("v.namevalue");
        var action = component.get("c.acclist");
        var res='';
        action.setParams({
            NameofAccount:Nameval
        });
        action.setCallback(this, function(response) {
            
            // component.set("v.Acts", response.getReturnValue());
            res=response.getReturnValue();
            var cmpEvent = $A.get("e.c:SampleComponentEvent");
           //component.getev('sampleCmpEvent')
            //var cmpEvent = component.getEvent("sampleCmpEvent");
            cmpEvent.setParams({AccountList : res,
                                renderdvalue:true}); 
            cmpEvent.fire(); 
            
        });
        $A.enqueueAction(action);
        
    }  
    
})