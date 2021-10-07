@isTest
public class RestApiForEmployeeDetail_test {
    
    public static testMethod void unitTest_UpdateMethod(){
        string sRecordId=CreateEmployeeDetails();
        RestRequest request=new RestRequest();
        request.requestURI='/services/apexrest/V1/EmployeeInfoDetails/';
        request.httpMethod='Get';
        request.addHeader('Content-Type', 'application/json');
        request.addHeader('Accept', 'application/json');
        request.addParameter('Id', sRecordId);
        
        restContext.request=request;
        Test.startTest();
    }
    
    public static string CreateEmployeeDetails(){
        Employee_Details__c objEmp=new Employee_Details__c();
        objEmp.First_Name__c='Test';
        objEmp.Email__c='test@gmail.com';
        objEmp.IsActive__c=true;
        objEmp.Phone_Number__c='9971602208';
        insert objEmp;
        return objEmp.Id;
    }

}