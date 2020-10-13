({
	doinit : function(component, event, helper) {
       // helper.helperfun(component, event, helper);
    },
    scriptsLoaded : function(component, event, helper) {
       alert('all Good.?');
        //helper.insertRace(component, event, helper);
    },
    profiles : function(component, event, helper) {
       var records = '0056F000007G3rE';
           console.log('records '+records); 
       var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({ "url": "/profile/"+records });
        urlEvent.fire();
    }
})