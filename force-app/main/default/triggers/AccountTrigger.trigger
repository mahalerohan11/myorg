trigger AccountTrigger on Account (before insert,after insert,before update,after update) {
    if(trigger.isbefore){
            
        if(trigger.isinsert){
            //to check duplicate account insertion
            AccountTriggerHelper.duplicateAccountcheck(Trigger.new);
        }
        if(trigger.isupdate){
            //Write code to perform operations before record updation.
        }
    }
    if(trigger.isafter){
        
        if(trigger.isinsert){
            //Write code to perform operations after record insertion
        }
        if(trigger.isupdate){
            ////Write code to perform operations after record updation
        }
    }

}