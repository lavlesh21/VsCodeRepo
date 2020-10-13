public class MyCont22 {
    public MyCont22(){
        obj=new Account();
    }
    public PageReference insertme() {
    upsert obj;
        return null;
    }
    public Account obj { get; set; }
}