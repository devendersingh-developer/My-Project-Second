/**
* @File Name          : IKarzaCalloutFactory.apxc
* @Author             : Karthik Chekkilla
* @Created On         : 29 June 2021
* @Description        : It is used to define all required methods for Karza API's integration
*==============================================================================
* Ver         Date                     Author                 Modification
*==============================================================================
* 1.0    29 June 2021               Karthik Chekkilla          Initial Version
**/
public interface IKarzaCalloutFactory {
    List<String> getRequestJSONParams();
    HttpResponse callApi(String parentId, String requestBody);
    String parseResponseSync(String parentId, String responseBody);
}