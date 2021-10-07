public class APICalloutService {
    /**
@author          : Karthik Chekkilla
@company         : TechMatrix Consulting
@description     : This method is used create the Make the HTTP Callout and return the HttpResponse Instance
@Date            : 10/06/2021
*/
    public static HttpResponse makeCallout(RequestWrap objRequestWrap) {
        try { 
            HttpRequest httpRequest = new HttpRequest();
            httpRequest.setMethod(objRequestWrap.method);
            httpRequest.setEndpoint(objRequestWrap.endpoint);
            System.debug('requestss-->'+httpRequest.getEndpoint());
            if(String.isNotBlank(objRequestWrap.requestBody)) {
                httpRequest.setBody(objRequestWrap.requestBody);
            }
            if(objRequestWrap.mapHeaderTovalue != null && objRequestWrap.mapHeaderTovalue.size() > 0) {
                for(String strHeader : objRequestWrap.mapHeaderTovalue.keySet()) {
                    httpRequest.setHeader(strHeader, objRequestWrap.mapHeaderTovalue.get(strHeader));
                } 
            }
            if(objRequestWrap.timeout != null)
                httpRequest.setTimeout(objRequestWrap.timeout);
            //Send request
            Http http = new Http();
            HttpResponse response = http.send(httpRequest);
            System.debug('request-->'+objRequestWrap.requestBody);
            system.debug('response-->'+response.getBody());
            if(objRequestWrap.source == 'KIFS_GenerateHighMarkReportCtrl') {//Request body is blank in this API
                objRequestWrap.requestBody = objRequestWrap.mapHeaderTovalue.get('requestXML');
            }
            //CH01 : 24-06-2021 : Added line here ( createApiLogger )
            if(objRequestWrap.isApiLoggerRequired)
                createApiLogger(objRequestWrap.source,objRequestWrap.requestBody,response.getBody(), String.valueOf(response.getStatusCode()),objRequestWrap.parentId );
            return response;
        }catch (CalloutException exp) {
            System.debug(' Exception Message ::' + exp.getMessage() + ' Class Name : '+objRequestWrap.source+' at Line ::' + exp.getLineNumber());
          //  ErrorLogger.createErrorLogger(objRequestWrap.source, 'makeCallout', exp.getTypeName(), exp.getMessage(), exp.getLineNumber(), null);
        }
        return null;
    } 
    
    /**
@author          : Karthik Chekkilla
@company         : TechMatrix Consulting
@description     : This method is used create the API Logs
@Date            : 10/06/2021
*/
    //CH01 : 24-06-2021 : Added params ( statusCode,parentId )
    public static void createApiLogger(String className, String request, String response, String statusCode, String parentId){
        /*API_Logger__c objAPILog = new API_Logger__c();
        objAPILog.Class_Name__c = className;
        if(request != null) {
            objAPILog.Request__c = request.length() > 131068 ? request.substring(0, 131068) : request;
        }
        objAPILog.Response__c = response.length() > 131068 ? response.substring(0, 131068) : response;
        
        objAPILog.Status_Code__c = statusCode;
        objAPILog.Parent_Id__c = parentId;
        INSERT objAPILog;*/
    }
    //For JSON reponse
    public static Map<String, Object> getJSONParsedResponse(String strResponse) {
        return (Map<String, Object>) JSON.deserializeUntyped(strResponse);
    }
    //For JSON request body
    public static string generateRequestJson(Map<String,String> mapKeyToValue){
        String requestJson = '{';
        for(String strKey : mapKeyToValue.keySet()) {
            requestJson += '"'+strKey+'":"' + mapKeyToValue.get(strKey) + '",';
        }
        requestJson = requestJson.removeEnd(',');
        requestJson += '}';
        return requestJson;
    }
    //Get configured values for integrations
    public static Map<String,Map<String,String>> getMapTypeToKeyValues(String thirdPartyAPI) {
       /* List<Integration_Config__mdt> lstIntegrationConfig = [SELECT DeveloperName,MasterLabel,Config_Value__c,Request_Type__c FROM Integration_Config__mdt WHERE Thirdparty_API__c =: thirdPartyAPI];
        if(lstIntegrationConfig != null && !lstIntegrationConfig.isEmpty()) {
            Map<String,Map<String,String>> mapTypeToKeyValues = new Map<String,Map<String,String>>();
            for(Integration_Config__mdt objConfig : lstIntegrationConfig) {
                if(!mapTypeToKeyValues.containsKey(objConfig.Request_Type__c)) {
                    mapTypeToKeyValues.put(objConfig.Request_Type__c,new Map<String,String>());
                }
                if(mapTypeToKeyValues.containsKey(objConfig.Request_Type__c)) {
                    mapTypeToKeyValues.get(objConfig.Request_Type__c).put(objConfig.MasterLabel,objConfig.Config_Value__c);
                }
            }
            return mapTypeToKeyValues;
        }*/
        return null;
    }
    public class RequestWrap {
        public String method;
        public String endpoint;
        public String requestBody;
        public Integer timeout;
        public String source;
        public String parentId; //CH01 : 24-06-2021 : Added variable 
        public String responseBody;//CH01 : 24-06-2021 : Added variable 
        public Boolean isApiLoggerRequired;
        public Map<String,String> mapHeaderTovalue;
        public RequestWrap(String strEndpoint,String strMethod,String strSource) {
            this.endpoint = strEndpoint;
            this.method = strMethod;
            this.source = strSource;
            this.mapHeaderTovalue = new Map<String,String>();
            this.isApiLoggerRequired = true;
        }
    }
}