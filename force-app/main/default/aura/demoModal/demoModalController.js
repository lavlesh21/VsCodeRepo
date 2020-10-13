({
   openModel: function(component, event, helper) {
      component.set("v.isOpen", true);
       var accountid = event.getSource().get("v.value");
       var action = component.get("c.contactlist");
        action.setParams({  accid : accountid  });
       action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               component.set("v.ContactRec",response.getReturnValue());  
            }
            
        });
        
        $A.enqueueAction(action);
   },
 
   closeModel: function(component, event, helper) {  
      component.set("v.isOpen", false);
   },
 
   likenClose: function(component, event, helper) {
      alert('thanks for like Us :)');
      component.set("v.isOpen", false);
   },
     doInit : function(component, event, helper) {
         var action = component.get("c.accountlist");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Accountrec",response.getReturnValue());}
            
        });
        
        $A.enqueueAction(action);
    },
})