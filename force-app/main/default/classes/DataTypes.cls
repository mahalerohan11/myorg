public class DataTypes {
 
    public static void dummyMethod()
    {
        integer count=5;
        String str='SFDC Developer';
        //System.debug(count);
        //List class
        list<integer> list1=new list<integer>();
        list1.add(5);
        list1.add(8);
        System.debug(list1);
        
        //Map Class
        map<integer, string> m1=new map<integer,string>(); //mapOfAccount
        m1.put(1, 'Mah');
        m1.put(2, 'Guj');
        m1.put(3, 'UP');
        System.debug('Map Values:' +m1.values());
        System.debug('Map Keys:' +m1.keyset());
        
        for(string mapitr:m1.Values()){
            if(mapitr=='Mah'){
                System.debug('Welcome to Maharashtra');
            }
            if(mapitr=='UP'){
                System.debug('Welcome to UttarP');
            }
        }
        
        
        
        
        
        
     }
}