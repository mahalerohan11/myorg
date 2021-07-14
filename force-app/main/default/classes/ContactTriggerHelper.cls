public class ContactTriggerHelper {
    
    Public static void phoneNumberValidate(List<Contact> listNewRecords)
    {
        for(contact con:listNewRecords)
        {
            if(con.Phone==NULL)
            {
                con.addError('Phone number cannot be blank');
            }
        }
    }
    
    Public static void accountNumberAvailableForContact(List<contact> listNewRecords)
    {
     list<account> listaccount=new list<account>();
     list<account> listaccountwithoutaccountnumber=new list<account>();
     Set<Id> setAccountId = new Set<Id>();   
        
        for(contact con:listNewRecords)
        {
            setAccountId.add(con.AccountId);
            
        }
        listaccount=[select ID,Name,AccountNumber from account where Id in :setAccountId];
        
        for(Account AccWithNum:listaccount)
        {
            if(AccWithNum.AccountNumber==NULL)
            {
                listaccountwithoutaccountnumber.add(AccWithNum);
            }
            
        }
        for(contact con:listNewRecords)
        {
            for(account acc :listaccountwithoutaccountnumber)
            {
                if(con.AccountId==acc.ID)
                {
                    con.AddError('Associated account has no account number');
                }
            }
            
            
        }
    
        
        //System.debug('Account associated with new contact'+listaccount);
    }
    
    Public static void industryAvailableForContact(List<contact> listNewRecords)
    {
       set<id> setAccountId=new set<id>();
        for(contact con:listNewRecords)
        {
            setAccountId.add(con.AccountId);
        } 
       map<id,account> mapOfAccount=new map<id,account>([select id,Industry from account where id IN :setAccountId]);
        for(contact con:listNewRecords)
        {
         Account acc=mapOfAccount.get(con.AccountId);
            if(acc.Industry==NULL)
            {
              con.AddError('Industry is not associated with account');
            }   
        }   
           
    }

}