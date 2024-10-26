import sendMessage from '@salesforce/apex/TwilioWhatsApp.sendMessage';
import { LightningElement } from 'lwc';

export default class SendWhatsAppMessage extends LightningElement {

    handleSendMessage(){
        this.template.querySelector('lightning-input').value 
        sendMessage({msg: this.template.querySelector('lightning-input').value })
            .then(res=> {
                console.log('res' + res);
            })
            .catch(err => {
                console.error(JSON.stringify(err));
                })
    }
}