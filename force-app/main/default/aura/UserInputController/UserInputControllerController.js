({
    Add : function(component, event, helper) {
        var num1 = component.find("Input1").get("v.value");
        var num2 = component.find("Input2").get("v.value");
        var res = parseInt(num1) + parseInt(num2);
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:DisplayResult",
            componentAttributes: {
                Get_Result :res
            }
        });
        evt.fire();
        
        
        
        
        
        
      //  var evt = $A.get("e.c:Result");
        //evt.setParams({ "Pass_Result": res});
        //evt.fire();
    }
})