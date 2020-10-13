({
    helperfun : function(component, event, helper) {
        /*var type =[{class:"optionclass", label:"5k", value:"5K"}, 
             {class:"optionclass", label:"10k", value:"10K"},
             {class:"optionclass", label:"Half Marathon", value:"Half Marathon"}];
        component.find("Type").set("v.options", type);*/
    },
    insertRace :function(component, event, helper) {
       console.log('fff ' +component.get("v.Race"));
        var action = component.get("c.racelisttoinsert");
        action.setParams({ race : component.get("v.Race") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
            }
        });
        $A.enqueueAction(action);
    }
	
})