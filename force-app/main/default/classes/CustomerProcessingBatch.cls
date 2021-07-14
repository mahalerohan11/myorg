global class CustomerProcessingBatch implements Database.Batchable<sobject>
{
    global string[] email =new string[] {'mahalerohan11@gmail.com'};
    
    //start method
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator('Select id,name,Apex_Active__c,Apex_Customer_status__c,Apex_Customer_D__c from apex_customer__c where Apex_Active__c=true');
    }
    
    //excute method
    global void execute(Database.BatchableContext BC,list<Sobject> Scope)
    {
        List<apex_customer__c> updatedcustomerlist=new list<apex_customer__c>();
        for(Sobject objscope:Scope)
        {
            apex_customer__c newobj=(apex_customer__c)objscope;
            newobj.Apex_Customer_D__c='Updated via Batch Job';
            newobj.Apex_Customer_status__c='Paid';
            updatedcustomerlist.add(newobj);
        }
        database.update(updatedcustomerlist);
        System.debug('Records are successfully updated'+updatedcustomerlist);//Update the Records
    }
    
 
    
    //Finish method
    global void finish(Database.BatchableContext BC)
    {
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors, a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById, a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
       System.debug('Jobid is'+BC.getJobId());

       //below code will send an email to User about the status
  	   mail.setToAddresses(email);
  	   mail.setReplyTo('mahalerohan11@gmail.com');
       mail.setSenderDisplayName('Apex Batch Processing Module');
       mail.setSubject('Batch Processing '+a.Status);
       mail.setPlainTextBody('The Batch Apex job processed  '+a.TotalJobItems+'batches with  '+a.NumberOfErrors+'failures'+'Job Item processed are'+a.JobItemsProcessed);
       Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
    }
    
}