import { LightningElement, track } from 'lwc';

export default class CreateRecordUsingEditForm extends LightningElement {
    @track recordId;
    successHandler(event){
        this.recordId=event.detail.id;
        console.log("Id of created account" ,event.detail.id);
    }
}