public class demolist {
    public void show()
    {
    set<string> l=new set<string>();
    l.add('a');
    l.add('a');
	l.add('b');
    l.add('c');
    l.add('d');
	for(string s:l)
    {
        system.debug('value is:'+l);
    }
    }
}