@RestResource(urlMapping='/V1/EmployeeInfoDetails/')
global class RestApiForEmployeeDetail {
    @httpGet
    global static List<Employee_Details__c> fncEmp(){
        system.debug(' line 5 hi m run get  --> '+RestContext.request.params);
        List<Employee_Details__c> empres=new List<Employee_Details__c>();
        map<string,string> mapid=RestContext.request.params;
        string empid=mapid.get('Id');
        system.debug('hi m run'+empid);
        empres=[select id,name,First_Name__c from Employee_Details__c Where Id=:empid];
        // empres=[select id,name from Employee_Details__c];
        return empres;
    }
    
    @httpPost
    global static List<Employee_Details__c> doPost(){
        system.debug(' line 17 hi m run  post --> '+RestContext.request.params);
        List<Employee_Details__c> empres=new List<Employee_Details__c>();
        map<string,string> mapid=RestContext.request.params;
        string empid=mapid.get('Id');
        system.debug('hi m run'+empid);
        empres=[select id,name,First_Name__c from Employee_Details__c Where Id=:empid];
        // empres=[select id,name from Employee_Details__c];
        return empres;
    }
    
    @httpDelete
    global static string fncDelete(){
        Employee_Details__c empde=new Employee_Details__c();
        map<string,string> params=RestContext.request.params;
        string empid=params.get('Id');
        empde=[select id,name from Employee_Details__c Where Id=:empid];
        delete empde;
        
        return 'Record is deleted';
    }
   /* @httpPost
    global static Employee_Details__c fncPost(string name,string Email){
        Employee_Details__c empRes=new Employee_Details__c(First_Name__c=name,Email__c=Email,Country__c='Asia',State__c='India',City__c='Haryana');
        insert empRes;
        return empRes;
    }
    
     @httpPost
    global static Employee_Details__c fncPost(EmpInfo EmpWrap){
        Employee_Details__c empRes =EmpWrap.empWra;
        insert empRes;
        return empRes;
    }*/
    
    @httpPut
    global static Employee_Details__c fncPut(string name){
        map<string,string> mapstring=RestContext.request.params;
        string empid=mapstring.get('Id');
        Employee_Details__c empRes=new Employee_Details__c(First_Name__c=name,id=empid);
        update empRes;
        return empRes;
    }
    
    global class EmpInfo{
        Employee_Details__c empWra{get;set;}
    }
    
}