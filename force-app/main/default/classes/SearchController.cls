public class SearchController
{
private apexpages.standardController controller {get; set; }
private Lead l;
public List<Lead> searchResults {get; set; }
public string searchText
{
get
{
if (searchText==null) searchText = '';
return searchText;
}
set;
}

public SearchController(ApexPages.StandardController controller)
{
this.controller = controller;
this.l = (Lead) controller.getRecord();
}

public PageReference search()
{
if(SearchResults == null)
{
SearchResults = new List<Lead>();
}
else
{
SearchResults.Clear();
}

String qry = 'Select Id, Name from Lead where name like \'%'+searchText+'%\') Order By Name';
SearchResults = Database.query(qry);
return null;
}
}