public class mapcomp {
     public mapcomp()
    {
        map<string,string> map1 = new map<string,string>();
        map<string,string> map2 = new map<string,string>();
        map<string,string> map3 = new map<string,string>();
        map1.put('key1','value1');
        map1.put('key2','value2');
        map2.put('value1','value3,value5');
        map2.put('value2','value4');
        set<string> map1key = map1.keyset();
        list<string> map1key1 = new list<string>();
        for(string a: map1key)
        {
            map1key1.add(a);
        }
        list<string> map1value =map1.values();
        set<string> map2key = map2.keyset();
        list<string> map2key2 = new list<string>();
        for(string s:map2key )
        {  
        	map2key2.add(s);
        }
        
        list<string> map2value =map2.values();
        for(integer i=0;i<map1value.size();i++)
        {
           for(integer j=0; j<map2key2.size() ;j++) 
           {
               if(map1value[i] == map2key2[j])
               {
					map3.put(map1key1[i],map2value[j]);                   
               }
           }
        }
        
	system.debug('map3===>>'+map3);        
    }
}