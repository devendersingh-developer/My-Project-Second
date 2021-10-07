/**
* @File Name          : APICalloutFactory.apxc
* @Author             : Devender Singh
* @Created On         : 01 July 2021
* @Description        : It is used to define all required methods for API's integration
*==============================================================================
* Ver         Date                     Author                 Modification
*==============================================================================
* 1.0      01 July 2021               Devender Singh         Initial Version
**/
public interface APICalloutFactory {
    List<String> getRequestJSONParams();
    HttpResponse callApi(String parentId, String requestBody);
    String parseResponseSync(String parentId, String responseBody);
}