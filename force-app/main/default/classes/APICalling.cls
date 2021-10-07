public class APICalling {
    
    public static void fncCallAPI(){
        APICalloutFactory obj = ApiUtility.getCalloutInstance('Pay By Link');
        
        List<String> lstParams = obj.getRequestJSONParams();
        system.debug('@!#!@#'+lstParams);
        
        Map<String, String> mapJson = new Map<String, String>();
        mapJson.put(lstParams[0], '10000000050431060');
        mapJson.put(lstParams[1], 'Y');
        
        String requestBody = APICalloutService.generateRequestJson(mapJson);
        
        HttpResponse objResponse = obj.callApi('0011e00000BJQwmAAH', requestBody);
        String test = obj.parseResponseSync('0011e00000BJQwmAAH', objResponse.getBody());
    }
}