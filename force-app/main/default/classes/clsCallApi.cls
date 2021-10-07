public class clsCallApi {
    
    public class deserializeResponse
    {
        public String id;
        public String access_token;
    }
    public static string fncGetToken(){
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        String CLIENT_ID = '3MVG9d8..z.hDcPLjxBR1ZW1kBz.co.BHQx4ooxQJdhMGspAVREDjONZLmMH3xwdXJ4J8HXZ_pkcrkfjsFWVf';
        String CLIENT_SECRET = '234927499109901463';
        String USERNAME = 'devenders843@gmail.com';
        String PASSWORD = 'chibi@843';
        
        
        System.debug(UserInfo.getSessionId());
        
        
        req.setBody('grant_type=password' + '&client_id='+CLIENT_ID + 
                    '&client_secret='+CLIENT_SECRET + '&username='+USERNAME + '&password='+PASSWORD);
        
        System.debug(UserInfo.getOrganizationId()+''+UserInfo.getSessionId().SubString(15));
        
        Http http = new Http();
        HTTPResponse response = http.send(req);
        System.debug('Body ' + response.getBody());
        System.debug('Status ' + response.getStatus());
        System.debug('Status code ' + response.getStatusCode());
        
        deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(response.getbody(),deserializeResponse.class);
        system.debug('@@@@access_token@@'+resp1 );
        return resp1.access_token;
    }
    
    public static void fncMain()
    {
        String token=fncGetToken();
        
         system.debug('token id in main function'+token);
        
        HttpRequest req = new HttpRequest(); 
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        // req.setHeader('Authorization', 'Bearer '+'00D7F000005Ua0U!AQwAQPdVwyx7qPjdkz7urLWDooDGHk3R2r1cGzg.3eAW5.4bURU5_.Qbo.y6xhL99L1C_SDRmJ1yeajNoT_CJzXdsM5Y86QP');
        req.setHeader('Authorization', 'Bearer '+token);
        req.setHeader('Content-Type', 'application/json');
        //req.setHeader('timestamp', timestamp);
        // req.setHeader('Channel', 'salesforce');
        req.setEndpoint('https://devendersingh-dev-ed.my.salesforce.com/services/apexrest/LeaveManagement');
        //  req.setBody(jsonString);
        Http h = new Http();   
        HttpResponse res = h.send(req);
        System.debug('HTTP Response Code: ' + res.getStatusCode());
        System.debug('HTTP Response body: ' + res.getBody());
        System.debug(res.getStatusCode());
        
     
    }

}