public class Mytestclass {

    public Account account { get; set; }
    public Mytestclass()
    {
      account=new account();
    } 

    public PageReference Cancel() {
        return null;
    }


    public PageReference Save() {
        upsert account;  
        return null;
    }

}