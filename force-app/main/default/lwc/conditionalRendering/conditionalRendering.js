import { LightningElement, track } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    @track dispDiv =true;
    @track cityList =['Dhule','Pune' ,'Mumbai'];
    showDivHandle(event){
        this.dispDiv=event.target.checked;
    }
}