trigger SendEmailtoSpeaker on Session_Speaker__c (after insert)
{
    //System.debug('Hello World Speaker!');
    for(Session_Speaker__c itm :trigger.new)
    {
        Session_Speaker__c sp=[
            select Session_Date__c,
                   Session_subjects__c,
                   Speaker_Name__c,
                   Speaker_s_Email__c
                   from Session_Speaker__c 
                   where Id=:itm.Id];
        
        //system.debug('Hi'+sp.Speaker_Name__c +'You have session on'+sp.Session_subjects__c +'On date'+sp.Session_Date__c);
        //Email to speaker
        if(sp.Speaker_s_Email__c!=null)
        {
            String address=sp.Speaker_s_Email__c;
            String subject='Speaker Confirmation';
            String msg='Dear '+sp.Speaker_Name__c+',\n\n Your sesion"'+sp.Session_subjects__c+'" on date'+sp.Session_Date__c+' is confirmed!';
            //EmailManager obj = new EmailManager();
            //obj.sendMail(address,subject,msg);
            EmailManager.sendmail(address,subject,msg);
        
    }
    
}
}