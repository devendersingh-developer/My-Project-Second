public class SendNotification implements Queueable, Database.AllowsCallouts {
    List<Daily_expenses__c> DailyExp = new List<Daily_expenses__c>();
    
    public SendNotification(List<Daily_expenses__c> DailyExp){
        this.DailyExp = DailyExp;
        system.debug('accList'+DailyExp);
    }
    public void execute(QueueableContext context) {
        
        string otp= string.valueOf(Math.round(Math.random()*1000000));
        if(otp.length()!=6)
            otp=otp+'0';
        //Vehicle_Number__c
        string   Price=DailyExp[0].Fuel_filling__c!= Null ?  DailyExp[0].Fuel_filling__c :'350';
        string   VehicleNumber=DailyExp[0].Vehicle_Number__c!= Null ?  DailyExp[0].Vehicle_Number__c :'DL 4CA 2090';
        
        otp='CNG Fuel filling cost '+Price +' RS for Vehicle Number '+VehicleNumber+' at XYZ CNG station';
        string   mobilenum=DailyExp[0].Mobile_Number__c!= Null ?  DailyExp[0].Mobile_Number__c :'9971602208';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api-alerts.kaleyra.com/v4/?api_key=A4b8d4454dc1e7507e5f1694b1c97ff85&method=sms&message=Use this code for verifying your mobile number with India Shelter : '+otp+'&to='+mobilenum+'&sender=ISFCHL');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'text/xml');
        request.setTimeout(120000);
        HttpResponse response =http.send(request);
        system.debug('response ==> '+response.getBody());
    }
    
}