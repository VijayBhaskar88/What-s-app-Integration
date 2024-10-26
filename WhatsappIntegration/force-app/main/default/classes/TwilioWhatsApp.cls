public class TwilioWhatsApp {

    @AuraEnabled
    public static string sendMessage(String msg){
        try {
            String accountId = 'ACd9162aac08100cfa5317fee625f93257';
            String authToken = '496905723817d920cacd2394ce4d5bc0';
            String fromNumber = '+14155238886';
            String toNumber = '+19132576290';

            Http ht = new Http();
            HttpRequest req = new HttpRequest();
            HttpResponse res = new HttpResponse();
            
            req.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/' + accountId + '/Messages.json');
            req.setMethod('POST');

            Blob b = Blob.valueOf(accountId + ':' + authToken);
            String encodedValue ='Basic' + EncodingUtil.base64Encode(b);
            req.setHeader('Authorization', encodedValue);
            req.setHeader('Content-Type', 'application/x-www-form-urlencoded');

            String body = 'From=whatsapp:' + EncodingUtil.urlEncode(fromNumber, 'UTF-8');
            body += '&Body=' + msg;
            body += '&To=whatsapp:' + EncodingUtil.urlEncode(toNumber, 'UTF-8');
            req.setBody(body);

            res = ht.send(req);
            System.debug('::::: Response: ' + res.getBody());
            return '';

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}