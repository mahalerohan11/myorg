public class objdisplaycontroller {

    public list<SelectOption> getobjnames(){
    
        list<selectoption> objlist=new list<selectoption>();
        objlist.add(new selectoption('None','None'));
        list<schema.SObjectType> allobj= schema.getGlobalDescribe().values();
        for (schema.SObjectType itr:allobj){
            objlist.add(new selectoption(itr.getDescribe().getname(),itr.getDescribe().getname()));
        }	
        return objlist;
    }
}