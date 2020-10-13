public with sharing class MyController23 {
public Boolean rend { get; set; }
public MyController23 ()
{
rend = false;
}
    public PageReference commandLinkAction() {
    rend = true;
    return null;
    }
}