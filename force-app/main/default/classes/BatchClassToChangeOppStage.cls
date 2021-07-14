global class BatchClassToChangeOppStage implements Database.Batchable<sobject>{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {   
        date dt=date.today().adddays(31);
        return Database.getQueryLocator('select Name,StageName,CloseDate from Opportunity where CLoseDate=:dt');
    }
    global void execute(Database.BatchableContext BC,list<Sobject> Scope)
    {
        List<Opportunity> OppList=new list<Opportunity>();
        
            
            for(sObject s : scope){
                Opportunity objscope = (Opportunity)s;
         
               if(objscope.StageName=='Prospecting')
                  {
                	objscope.StageName='Qualification';
                  }
                OppList.add(objscope);
            }
                                   
        
        database.update(OppList);
        System.debug('Stages successfully changed before close date'+OppList);//Update the Records
    }
    global void finish(Database.BatchableContext BC)
    {
        
    }

}