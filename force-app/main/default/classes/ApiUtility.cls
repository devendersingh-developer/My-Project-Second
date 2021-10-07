/**
* @File Name          : ApiUtility.apxc
* @Author             : Devender Singh
* @Created On         : 01 July 2021
*==============================================================================
* Ver         Date                     Author                 Modification
*==============================================================================
* 1.0    01 July 2021            Devender Singh               Initial Version
**/
public without sharing  class ApiUtility {
    //_______________________________________________  Record Type Names  ______________________________________________
    public static final String PAYU_API_DETAIL_RECORDTYPE_PAYBYLINK = 'PayByLink';
    
    public static final Map<String,String> MAP_API_INTERNAL_STATUS_CODE = new Map<String,String>{
        '101' => 'Valid Authentication', 
            '102' => 'Invalid ID number or combination of inputs', 
            '103' => 'No records found for the given ID or combination of inputs', 
            '104' => 'Max retries exceeded', 
            '105' => 'Missing Consent',
            '106' => 'Multiple Records Exist',
            '107' => 'Not Supported',
            '108' => 'Internal Resource Unavailable',
            '109' => 'Too many records Found' 
            };
                
     //__________________________________________________________________________________________________________________
      public static final Map<String,String> MAP_API_TO_CLASS = new Map<String,String>{'Pay By Link' => 'PayByLinkApi',
                    'Pay By Online' => 'PayByOnlineApi'
      };
     //__________________________________________________________________________________________________________________
               
          /**
			* @Description        : It is used to get Data of the API Credential from custom setting
			* @Author             : Devender Singh
			* @Created On         : 01 July 2021
           */       
          public static final Map<String,PayU__c> MAP_API_NAME_KYC_PAYU_API_DATA{
              get{
                  if( MAP_API_NAME_KYC_PAYU_API_DATA == Null ){
                      MAP_API_NAME_KYC_PAYU_API_DATA= new Map<String,PayU__c>();
                      for ( PayU__c objKYVVerif :[ SELECT Id, Name, command__c, command_2__c, CollectUrl__c, SendLinkUrl__c, 
                                                  sKey__c, SMS_Template_ID__c,sResponseUrl__c, sSolt__c, sUrl__c, 
                                                  template_id__c, Url2__c, Validation_Period__c FROM PayU__c]){
                                                      MAP_API_NAME_KYC_PAYU_API_DATA.put(objKYVVerif.Name,objKYVVerif);
                                                  }
                  }
                  return MAP_API_NAME_KYC_PAYU_API_DATA;
              }
              private set;
          }
          
      public static APICalloutFactory getCalloutInstance(String apiName) {
          if(MAP_API_TO_CLASS.containsKey(apiName)) {
            return (APICalloutFactory)Type.forName(MAP_API_TO_CLASS.get(apiName)).newInstance();
          }
        return null;
     }  
}