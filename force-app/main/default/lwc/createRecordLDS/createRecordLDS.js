import { LightningElement ,track,wire} from 'lwc';
import { createRecord ,getRecord,} from 'lightning/uiRecordApi';

const fieldArray= ['Account.Name', 'Account.Phone', 'Account.Website'];
export default class CreateRecordLDS extends LightningElement {
@track accountName;
@track accountPhone;
@track accountWebsite;
@track recordId;

@wire(getRecord,{recordId:'$recordId',fields:fieldArray})
accountRecord;

accountNameChangeHandler(event){
    this.accountName=event.target.value;
}
accountPhoneChangeHandler(event){
    this.accountPhone=event.target.value;
}
accountwebsiteChangeHandler(event){
    this.accountWebsite=event.target.value;
}

createAccount(){
    const fields={'Name':this.accountName, 'Phone':this.accountPhone,'Website':this.accountWebsite};
    const recordInput={apiName:'Account',fields};
    createRecord(recordInput).then
    (Response =>
        {console.log('Record created with ID :' ,Response.id);
         this.recordId = Response.id;   
         // eslint-disable-next-line no-alert
         
        }
    ).catch
    (error =>{console.error('Error in creating account:',error.body.message);});

    }
    get retAccountName(){
        if(this.accountRecord.data){
            console.log('retrieve account name' ,this.accountRecord.data.fields.Name.value);
            return this.accountRecord.data.fields.Name.value;
        }
        return undefined;
    }
    
    get retAccountNumber(){
        if(this.accountRecord.data){
            console.log('retrieve account phone' ,this.accountRecord.data.fields.Phone.value);
            return this.accountRecord.data.fields.Phone.value;
        }
        return undefined;
    }

    get retAccountUrl(){
        if(this.accountRecord.data){
            console.log('retrieve account website' ,this.accountRecord.data.fields.Website.value);
            return this.accountRecord.data.fields.Website.value;
        }
        return undefined;
    }
}