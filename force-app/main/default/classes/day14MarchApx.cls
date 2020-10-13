public class day14MarchApx {
	public justforDEmo__c pcb;
    public string abcd{set;get;}
    public day14MarchApx(ApexPages.StandardController controller) {
		this.pcb = (justforDEmo__c)controller.getRecord();
    }
    public  day14MarchApx(){
        system.debug('hello  '+abcd);
    }  
		
}