public class myControllerDemo {

  public List<aTableRow> tableRows { get; set; }
  public class aTableRow {
    public Contact theContact { get; set; }
    public Account theAccount { get; set; }
    public Boolean isSelected { get; set; }
    public aTableRow(Contact c,Account a,Boolean b) {
      theContact = c;
      theAccount = a;
      isSelected = b;
    }
  }

    
  public myControllerDemo() {
    tableRows = new List<aTableRow>();
    for(Contact c:[select id,firstname,lastname,account.id,account.name from contact limit 10]) {
      tableRows.add(new aTableRow(c,c.account,false));
    }
  }

}