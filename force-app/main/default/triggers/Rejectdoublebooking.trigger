trigger Rejectdoublebooking on Session_Speaker__c (before insert) {
list<Session_Speaker__c> newitem=new list<Session_Speaker__c>();
newitem=trigger.new;
    

    
}