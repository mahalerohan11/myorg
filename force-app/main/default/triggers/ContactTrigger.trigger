trigger ContactTrigger on Contact (before insert,after insert,before update,after update)
{
    if(trigger.isbefore){
            
        if(trigger.isinsert)
        {
            //Write code to perform operations before record inserted to DB.
            ContactTriggerHelper.phoneNumberValidate(Trigger.new);
            ContactTriggerHelper.accountNumberAvailableForContact(Trigger.new);
            ContactTriggerHelper.industryAvailableForContact(Trigger.new);
            //System.debug(Trigger.new);
            
        }
        if(trigger.isupdate)
        {
            //Write code to perform operations before record updation.
            
        }
    }

}