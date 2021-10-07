/**
* @File Name          : KarzaApiUtility.apxc
* @Author             : Karan Singh Soni
* @Created On         : 28 June 2021
*==============================================================================
* Ver         Date                     Author                 Modification
*==============================================================================
* 1.0    28 June 2021               Karan Singh               Initial Version
**/
public without sharing class KarzaApiUtility {
    
    //_______________________________________________  Record Type Names  ______________________________________________
    public static final String KARZA_API_DETAIL_RECORDTYPE_UDYOGAADHARNUMBER = 'UdyogAadharNumber';
    public static final String KARZA_API_DETAIL_RECORDTYPE_LPGCONNECTIONAUTHENTICATION = 'LPG_Connection_Authentication';
    public static final String KARZA_API_DETAIL_RECORDTYPE_ELECTRICITYBILLAUTHENTICATION = 'Electricity_Bill_Authentication';
    public static final String KARZA_API_DETAIL_RECORDTYPE_PAN_AUTHENTICATION_ADVANCED = 'PAN_Authentication_Advanced';
    public static final String KARZA_API_DETAIL_RECORDTYPE_TELEPHONELANDLINEAUTHENTICATION = 'Telephone_Landline_Authentication';
    public static final String KARZA_API_DETAIL_RECORDTYPE_SHOP_ESTABLISHMENT = 'Shop_Establishment';
    
    public static final String REC_TYPE_BANK_AC_VERIFICATION = 'Bank_AC_Verification';
    public static final String REC_TYPE_GST_SEARCH_BASIS_PAN = 'GST_Search_Basis_PAN';
    public static final String REC_TYPE_GST_AUTHENTICATION = 'GSP_GSTIN_Authentication';
    public static final String REC_TYPE_GST_RETURN_FILING = 'GSP_GST_Return_Filing';
    public static final String REC_TYPE_ITR_AUTHENTICATION= 'ITR_V_Authentication';
    public static final String REC_TYPE_INCOME_TAX_AUTH = 'Income_Tax_Challan_Authentication';
    public static final String REC_TYPE_EMPLOYMENT_VERIFICATION = 'Employment_Verification_Advanced';
    public static final Map<String,String> MAP_API_INTERNAL_STATUS_CODE = new Map<String,String>{
        '101' => 'Valid Authentication', '102' => 'Invalid ID number or combination of inputs', '103' => 'No records found for the given ID or combination of inputs', 
            '104' => 'Max retries exceeded', '105' => 'Missing Consent','106' => 'Multiple Records Exist',
            '107' => 'Not Supported','108' => 'Internal Resource Unavailable','109' => 'Too many records Found' 
    };

    //__________________________________________________________________________________________________________________
    public static final Map<String,String> MAP_API_TO_CLASS = new Map<String,String>{'GST SEARCH BY PAN' => 'KarzaGSTSearchPANApi',
                                                                                    'GSP GSTIN Authentication' => 'KarzaGSTAuthenticationApi',
                                                                                    'GSP GST Return Filing' => 'KarzaGSTReturnFilingApi',
                                                                                    'LPGConnectionAuthentication' => 'KarzaLPGConnectionGeneratorApi',
                                                                                    'ElectricityBillAuthentication' => 'KarzaElectricityBillGeneratorApi',
                                                                                    'KarzaUdyogAadharNumberApi' => 'KarzaUdyogAadharNumberApi',
        																			'TelephoneLandlineAuthentication' => 'KarzaTelephoneLandlineGeneratorApi',
                                                                                    'Bank AC Verification' => 'KarzaBankACVerificationAPi',
                                                                                    'ITR-V Authentication' => 'KarzaITRAuthenticationApi',
                                                                                    'Income Tax Challan Authentication' => 'KarzaIncomeTaxChallanAuthApi',
                                                                                    'Employment Verification Advanced' => 'KarzaEmploymentVerificationApi'
        																			};
    //__________________________________________________________________________________________________________________
    
    /**
    * @Description        : It is used to get Metadata of the Karza API
    * @Author             : Karan Singh SOni
    * @Created On         : 30 June 2021
    */
    /*public static final Map<String,KYC_Verification_API__mdt> MAP_API_NAME_KYC_VERIFICATION_API_DATA{
        get{
            
            if( MAP_API_NAME_KYC_VERIFICATION_API_DATA == Null ){
                MAP_API_NAME_KYC_VERIFICATION_API_DATA = new Map<String,KYC_Verification_API__mdt>(); 
                for ( KYC_Verification_API__mdt objKYVVerif :[ SELECT Id, Label, Endpoint__c, Key__c,Verification_Document_Type__c,Active__c 
                                                                FROM KYC_Verification_API__mdt ]){
                                                           
                                                                    MAP_API_NAME_KYC_VERIFICATION_API_DATA.put(objKYVVerif.Label,objKYVVerif);
                                                       } 
            }
            return MAP_API_NAME_KYC_VERIFICATION_API_DATA;
        }
        private set;
    }    */        
    //Param -> object field API name with its value
    //Use -> to create a Karza_API_Detail__c record with 'n' no of fields mapping 
    /*public static Karza_API_Detail__c createKarzaAPIDetailRecord(Map< String, String> mapFieldWithValues, String recordTypeName){
        Karza_API_Detail__c objKarzaApiDetail;
                    
        if( !mapFieldWithValues.isEmpty() && String.isNotBlank( recordTypeName )){
                        
            objKarzaApiDetail = new Karza_API_Detail__c();
            objKarzaApiDetail.recordTypeId = KIFS_UtilityClass.getRecordTypeName('Karza_API_Detail__c',recordTypeName);
            for( String fieldApiName : mapFieldWithValues.keySet() ){
                objKarzaApiDetail.put( fieldApiName, mapFieldWithValues.get( fieldApiName ));
               
            }
        }
            system.debug( 'objKarzaApiDetail -> ' + objKarzaApiDetail );
            return objKarzaApiDetail;
    }*/
    //__________________________________________________________________________________________________________________
    //Karan Singh Soni : 28 June 2021 Please Note that the response will be typecast to string
    public static Map< String,String > mapFieldValuesFromJsonResponse( Map<String,String> mapJsonKeyWithFieldAPIName, Map< String,Object > mapJsonResponse ){
        
        Map< String,String > mapFieldAPINameWithValues = new Map< String,String >();
        
        for( String objJsonKey : mapJsonKeyWithFieldAPIName.keySet() ){
            
            if( mapJsonResponse.containsKey( objJsonKey ) ){
                mapFieldAPINameWithValues.put( mapJsonKeyWithFieldAPIName.get( objJsonKey ), (String) mapJsonResponse.get( objJsonKey ));   
            }
        }
        return mapFieldAPINameWithValues;
    }
    /**
    * @Description        : It is used to get IKarzaCalloutFactory interface instance
    * @Author             : Karthik Chekkilla
    * @Created On         : 29 June 2021
    */
    public static IKarzaCalloutFactory getKarzaCalloutInstance(String apiName) {
        if(MAP_API_TO_CLASS.containsKey(apiName)) {
            return (IKarzaCalloutFactory)Type.forName(MAP_API_TO_CLASS.get(apiName)).newInstance();
        }
       return null;
    }  
}