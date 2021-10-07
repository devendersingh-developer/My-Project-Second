//*********************************Request*****************************
//{"animals": ["pesky porcupine", "hungry hippo", "squeaky squirrel"]}
//*********************************Request*****************************
@RestResource(urlMapping='/Apex/*')
global class ApexRestRequest {
    @httpGet
    global static void doGET(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
                System.debug(animal);
            }
        }
    }
    @httpPost
    global static void doPost(){
        RestRequest req = RestContext.request;
        // LogoutClass logoutCls = (LogoutClass)JSON.deserialize(req.requestBody.toString(),LogoutClass.class);
        WrapperApexRestRequest results = (WrapperApexRestRequest) JSON.deserialize(req.requestBody.toString(),WrapperApexRestRequest.class);
        system.debug('results **** '+results);
    }
    public class WrapperApexRestRequest{
            public  string sStudentName{get;set;}
            public  string sStudentAddress{get;set;}
            public  string sStudentPhone{get;set;}
            public  string sStudentClass{get;set;}
            public list<string> listSubject{get;set;}
    }
    
}