/**
* @File Name          : KarzaInitiateRequestService.apxc
* @Author             : Devender Singh
* @Created On         : 07 July 2021
*==============================================================================
* Ver         Date                     Author                 Modification
*==============================================================================
* 1.0    07 July 2021               Devender Singh          Initial Version
**/
public class KarzaInitiateRequestService {
    //To get API's list with category
   /* @AuraEnabled
    public static map<string,list<APIToRequestParamsWrap>> getKYCVerificationAPI(){
        map<string,list<APIToRequestParamsWrap>>  mapOfKycVerification=New map<string,list<APIToRequestParamsWrap>>();
        //get loggedin user profile
        List<Profile> lstLoggedInUsrProfile = [SELECT Id, Name FROM Profile WHERE Id=:userinfo.getProfileId() LIMIT 1];
        List<KarzaApiUtility.RequestWrap> lstRequestWrap;
        APIToRequestParamsWrap objWrap;
        for(KYC_Verification_API__mdt kva: [SELECT  Id, Label, Active__c, Category__c,Available_To__c
                                            FROM KYC_Verification_API__mdt where Category__c!=null And Active__c=true]){       
            if(kva.Available_To__c != null && kva.Available_To__c.contains(lstLoggedInUsrProfile[0].Name))  {       
                lstRequestWrap = getRequestParams(kva.Label);
                if(lstRequestWrap != null && !lstRequestWrap.isEmpty()) {
                    if(!mapOfKycVerification.containsKey(kva.Category__c)){
                        mapOfKycVerification.put(kva.Category__c,new list<APIToRequestParamsWrap>());
                    }
                    objWrap = new APIToRequestParamsWrap(kva.Label);
                    objWrap.lstRequestWrap = lstRequestWrap;
                    mapOfKycVerification.get(kva.Category__c).add(objWrap);
                }    
            }        
        }
        system.debug('mapOfKycVerification --> '+mapOfKycVerification);
        return mapOfKycVerification;
    }
    //To get request parameter details
    private static List<KarzaApiUtility.RequestWrap> getRequestParams(String apiName) {
        IKarzaCalloutFactory objInterface = KarzaApiUtility.getKarzaCalloutInstance(apiName);
        System.debug('@#@!#!'+objInterface+'@@@'+apiName);
        if(objInterface != null) {
            return objInterface.getRequestJSONParams();
        }
        return null;
    }
    //To send request
    @AuraEnabled
    public static String sendRequest(String recordId, String apiName, String strRequestWrapJSON){
        List<KarzaApiUtility.RequestWrap> listRequestWrap = (List<KarzaApiUtility.RequestWrap>)System.JSON.deserialize(strRequestWrapJSON, List<KarzaApiUtility.RequestWrap>.class);
        String requestBody = KarzaApiUtility.generateRequestJson(listRequestWrap);
        IKarzaCalloutFactory objInterface = KarzaApiUtility.getKarzaCalloutInstance(apiName);
        HttpResponse objResponse = objInterface.callApi( recordId, requestBody);	
        if(objResponse != null && objResponse.getStatus() == '200') {
            return objInterface.parseResponseSync(recordId,objResponse.getBody());
        }else {
            return ConstantUtility.API_STATUS_CODE_ERROR;
        }
    }
    public class APIToRequestParamsWrap {
        @AuraEnabled
        public String apiName;
        @AuraEnabled
        public List<KarzaApiUtility.RequestWrap> lstRequestWrap;
        public APIToRequestParamsWrap(String apiName) {
            this.apiName = apiName;
        }
    }*/
}