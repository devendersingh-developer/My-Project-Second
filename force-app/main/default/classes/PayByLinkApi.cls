public without sharing class PayByLinkApi implements APICalloutFactory  {
    //Return request parameters for binding
    public Static List<String> getRequestJSONParams() {
        return new List<String>{'uans','entityId','employerName','employeeName','mobile','emailId','pdf'};
            }
    
    //make callout
    public static HttpResponse callApi(String parentId, String requestBody) {
        PayU__c objKycMdt = ApiUtility.MAP_API_NAME_KYC_PAYU_API_DATA.get('MtQShL');
        APICalloutService.RequestWrap requestWrap = new APICalloutService.RequestWrap(objKycMdt.sUrl__c,'POST','KarzaEmploymentVerificationApi');
        requestWrap.mapHeaderTovalue.put('Content-Type', 'application/json');
        requestWrap.mapHeaderTovalue.put('x-karza-key', objKycMdt.sKey__c);
        requestWrap.requestBody = requestBody;
        requestWrap.parentId = parentId;
        HttpResponse objResponse = APICalloutService.makeCallout( requestWrap );
        return objResponse;
    }
    //To parse response
    public static String parseResponseSync(String parentId, String responseBody){
        String strResponse = '{"request_id":"813c2b21-88cb-423a-9554-f06462423a4e","result":{"email":{"additionalInfo":{"companyInfo":{"orgDomainMatch":[{"domain":"karza.in","match":true,"orgName":"Karza Technologies Private Limited","source":"GST"}],"orgEmailMatch":[{"companyEmail":"info@karza.in","match":false,"orgName":"Karza Technologies Private Limited","source":"GST"}],"usrDirectorMatch":[{"match":false,"name":"","orgName":"Karza Technologies Private Limited","score":0}]},"individualMatch":[{"match":true,"name":"Swarnava Maitra","score":0.875}],"spamRecord":{"ipBlacklist":false,"reportCount":0,"spamEmail":false},"whoisInfo":{"ageYear":3.9,"creationDate":"2015-02-11 09:29:49","expirationDate":null,"expired":null,"updateDate":"2019-01-21 12:04:19","whoisEmailDomainMatch":[{"domain":"","match":false}],"whoisEmailMatch":[{"companyEmail":"","match":false}],"whoisIndvName":[{"match":false,"name":"","score":0}],"whoisOrgName":[{"match":false,"orgName":"","score":0}]}},"data":{"acceptAll":false,"disposable":false,"email":"swarnava.m@karza.in","genericEmail":false,"mxRecords":true,"regexp":true,"result":true,"smtpCheck":true,"webmail":false},"result":true},"nameLookup":{"employeeName":"swarnava maitra","epfHistory":[{"formatted_wage_month":"1812","totalAmount":87734,"totalMembers":22,"wageMonth":"DEC-18"},{"formatted_wage_month":"1811","totalAmount":75914,"totalMembers":19,"wageMonth":"NOV-18"},{"formatted_wage_month":"1810","totalAmount":73750,"totalMembers":17,"wageMonth":"OCT-18"}],"estInfo":[{"address":"1302, Orchid, Bg Kher Road Campacola Compound, Worli, MAHARASHTRA, 400018","estId":"MHBAN1744410000"}],"isEmployed":true,"isNameExact":true,"isNameUnique":true,"isRecent":true,"matches":[{"confidence":1,"epfHistory":{"DEC-18":true,"NOV-18":true,"OCT-18":true},"estId":"MHBAN1744410000","name":"SWARNAVA MAITRA"}],"organizationName":"Karza Technologies Private Limited"},"summary":{"emailParameters":{"alerts":false,"isValid":true,"organization":{"match":true,"orgName":"Karza Technologies Private Limited"},"person":{"match":true,"matchScore":0.875}},"emailValid":true,"nameLookup":{"isLatest":true,"isUnique":true,"matchName":"SWARNAVA MAITRA","result":true},"uanLookup":{"currentEmployer":"KARZA TECHNOLOGIES PRIVATE LIMITED","matchScore":1,"result":true,"uanNameMatch":true},"waiveFi":true},"uan":[{"employer":[{"emplrScore":1,"isEmployed":true,"isNameExact":true,"isNameUnique":true,"isRecent":true,"lastMonth":"1812","matchName":"SWARNAVA MAITRA","memberId":"MHBAN17444100000010001","name":"KARZA TECHNOLOGIES PRIVATE LIMITED","nameConfidence":1,"settled":false,"uanNameMatch":true},{"emplrScore":0.36423734593289625,"isEmployed":false,"isNameExact":false,"isNameUnique":false,"isRecent":false,"lastMonth":"","matchName":"","memberId":"DSNHP00340900000000783","name":"INDUS VALLEY PARTNERS (INDIA) PRIVATE LIMITED","nameConfidence":0,"settled":false,"uanNameMatch":true}],"uan":"100377190898"}],"pdfLink":"test pdf"},"status-code":"101"}';
        try{
            JSONParser parser = JSON.createParser(strResponse);   
            String tokenValue = ''; 
            String fieldAPIName;   
            Map< String, String> mapFieldWithValues = new Map< String, String>();    
            while (parser.nextToken() != null) {
                if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                    parser.nextValue();
                    tokenValue = parser.getText();
                    fieldAPIName = '';
                    if(parser.getCurrentName() == 'status-code') {
                        tokenValue = KarzaApiUtility.MAP_API_INTERNAL_STATUS_CODE.containsKey( tokenValue ) ? KarzaApiUtility.MAP_API_INTERNAL_STATUS_CODE.get( tokenValue ) :tokenValue;
                        fieldAPIName = 'Internal_Status__c';   
                    }
                    if(parser.getCurrentName() == 'request_id') {
                        fieldAPIName = 'Api_Request_Id__c';
                    }
                    if(parser.getCurrentName() == 'orgName') {
                        //if(!mapFieldWithValues.containskey(fieldAPIName))
                        fieldAPIName = 'Organisation_Name__c';
                    }
                    if(parser.getCurrentName() == 'companyEmail') {
                        if(!mapFieldWithValues.containskey('Company_Email__c'))
                            fieldAPIName = 'Company_Email__c';
                    }
                    if(parser.getCurrentName() == 'name') {
                        //if(!mapFieldWithValues.containskey(fieldAPIName))
                        fieldAPIName = 'Name__c';
                    }
                    
                    if(parser.getCurrentName() == 'updateDate') {
                        //  if(!mapFieldWithValues.containskey(fieldAPIName))
                        fieldAPIName = 'Update_Date__c';
                    }
                    if(parser.getCurrentName() == 'domain') {
                        if(!mapFieldWithValues.containskey('Domain_org_Domain_Match__c'))
                            fieldAPIName = 'Domain_org_Domain_Match__c';
                    }
                    
                    if(parser.getCurrentName() == 'estId') {
                        //if(!mapFieldWithValues.containskey(fieldAPIName))
                        fieldAPIName = 'EST_ID_est_Info__c';
                    }
                    /*if(parser.getCurrentName() == 'name') {
if(!mapFieldWithValues.containskey(fieldAPIName))
fieldAPIName = 'Name_individual_Match__c';
}*/
                    if(parser.getCurrentName() == 'pdfLink') {
                        // if(!mapFieldWithValues.containskey(fieldAPIName))
                        fieldAPIName = 'PDF__c';
                    }
                    if(parser.getCurrentName() == 'uan') {
                        // if(!mapFieldWithValues.containskey(fieldAPIName))
                        fieldAPIName = 'UAN_Number__c';
                    }
                    
                        /* if(parser.getCurrentName() == 'individualMatch') {
    while(parser.nextToken()!= JSONToken.END_OBJECT) {
    if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
    parser.nextValue();
    tokenValue = parser.getText();
    fieldAPIName = '';
    System.debug('@#@!#@@'+tokenValue+'@@@'+parser.getCurrentName());
    if(parser.getCurrentName() == 'match') {
    fieldAPIName = 'Name_individual_Match__c';
    }
    }
    }
    }*/
                    //To bind API name with value
                    if(String.isNotBlank(fieldAPIName))
                        mapFieldWithValues.put(fieldAPIName,tokenValue);
                }
            }
            System.debug('@!#!@#  '+mapFieldWithValues);
           /* if( !mapFieldWithValues.isEmpty() ){
                Karza_API_Detail__c objKarzaApiDetails = KarzaApiUtility.createKarzaAPIDetailRecord(mapFieldWithValues, KarzaApiUtility.REC_TYPE_EMPLOYMENT_VERIFICATION );
                if(String.isNotBlank(parentId))  {
                    objKarzaApiDetails.Account__c = parentId;
                }
                INSERT objKarzaApiDetails;
                system.debug( objKarzaApiDetails.Id );
            }
            return ConstantUtility.SUCCESS_KEY;*/
            return null;
        }catch(Exception ex) {
            System.debug('______Exception__'+ex.getMessage());
            return ex.getMessage();
        }
    }
}