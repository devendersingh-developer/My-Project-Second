public with sharing class VerifyPhoneNumbers{
    @future(callout=true)
    public static void doFuture(id recordId){
        Contact con=[select Id,name, Phone from Contact Where id=:recordId];
        system.debug('con doFuture ---  ### '+con);
        VerifyNum(con,'Phone');
    }
    @future(callout=true)
    public static void objectasParamdoFuture(string  sObjectData){
        Contact con=(Contact)JSON.deserialize(sObjectData, Contact.class);
        system.debug('con objectasParamdoFuture ---  ### '+con);
        VerifyNum(con,'Phone');
    }
    /*
     * Yes 
     * 1-JSON.Serialize(); => string (from where you are calling future method)
     * 2-inside future method => JSON.deserialize(string  sObjectData)
     */
    public static string VerifyNum(sObject sobj,string phoneField){
        string phoneNo=(string)sobj.get(phoneField);
        system.debug(' ##### phoneNo '+phoneNo);
        string endPointURL='http://apilayer.net/api/validate?access_key=261bdf082c37eab2ae214f0b6c0d40a1';
        endPointURL+='&number='+'1'+phoneNo+'&country_code=&format=1';
        
        HttpRequest httpReq=New HttpRequest();
        httpReq.setMethod('GET');
        httpReq.setEndPoint(endPointURL);
        httpReq.setHeader('Content-type','application/Json');
        http  http=New http();
        
        HttpResponse httpRes=new HttpResponse();
       
        
        try{
            httpRes=http.send(httpReq);
            system.debug('Respose code --> '+ httpRes.getStatusCode());
            system.debug('Respose --> '+ httpRes.getBody());
            if(httpRes.getStatusCode()==200){
                string responseBody=httpRes.getBody();
                system.debug('responseBody --> '+responseBody);
                return responseBody;
            }
            else{ 
                string responseBody=httpRes.getBody();
                system.debug('responseBody --> '+responseBody);
                return responseBody; 
            }
            
        }
        catch(system.CalloutException ex){
            
        }
        return null;
    }
}