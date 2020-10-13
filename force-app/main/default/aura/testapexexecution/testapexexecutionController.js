({
	doinit : function(component, event, helper) {
        alert('hello');
        
            
            var batchid=sforce.apex.execute("MyDemoClass","getContextUserName",{});
        
	}
})