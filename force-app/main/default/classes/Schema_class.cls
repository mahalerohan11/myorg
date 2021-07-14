public class Schema_class {/*
List<Schema.SObjectType> gd=Schema.getGlobalDescribe().values();
for(Schema.SObjectType obj:gd)
{
    System.debug('Object Name: '+obj.getDescribe().getname()+' fields => '+obj.getDescribe().fields.getMap().Values();
}

}
///account fields:
Schema.DescribeSObjectResult acc= Account.SobjectType.getDescribe();
Map<String,Schema.SObjectField>accf=acc.fields.getMap();

for(Schema.SObjectField fld:accf.values()){
    System.debug('Fields in account'+fld);
}     
//fileds ends with __c
Schema.DescribeSObjectResult acc= Apex_Invoice__c.SobjectType.getDescribe();
Map<String,Schema.SObjectField>accf=acc.fields.getMap();

for(Schema.SObjectField fld:accf.values())
{
    //System.debug(fld);   
    if (String.valueOf(fld).endswith('__c')){
        System.debug(fld);
        
    */}