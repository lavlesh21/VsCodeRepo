({
	doInit : function(component, event, helper) {
		console.log('doinit');
        var a = doInit2(component, event, helper);
        console.log('doinit===>>>'+JSON.stringify(a));
        
        //$A.enqueueAction(a);
        var c = component.get('v.Message2');
        console.log('doinit for c===>>>'+c);
         
	},
    doInit2 : function(component, event, helper) {
		console.log('doinit2');
        component.set("v.Message2",'This account does not have any related dealerships. Please cancel and select another account.');
        
        //console.log('doinit===>>>'+JSON.stringify(a));
        
       
        // return 'abc';
	}
})