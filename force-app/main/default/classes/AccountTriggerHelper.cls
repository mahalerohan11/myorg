public class AccountTriggerHelper {
    public static void duplicateAccountcheck(List<account> listNewRecords)
    {
        set<string> nameAccount=new set<string>();
        list<account> existingAccounts=new list<account>();
        
        for(account acc:listNewRecords)
        {
            nameAccount.add(acc.Name);
        }
        
        existingAccounts=[select name from account where name in :nameAccount];
        
        for(account acc:listNewRecords)
        {
            for(account acc1:existingAccounts)
            {
                if (acc.Name==acc1.Name)
                {
                    acc.AddError('Account with same name already exists');
                }
                    
            }
        }
    }

}