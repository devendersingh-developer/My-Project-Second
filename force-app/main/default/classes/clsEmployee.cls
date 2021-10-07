public class clsEmployee {
    public list<WrapEmployee> wrapEmpList {get;set;}
    public list<WrapDepartEmployee> wrapDepartEmpList {get;set;}  
    public list<Employee_info__c>  lstEmp{get;set;}
    
    public clsEmployee(){
        wrapEmpList=new list<WrapEmployee>();
        WrapEmployee objv;
        lstEmp=[Select id,name,Age__c,City__c,Country__c,Department_info__c,DOB__c,Email__c,Gender__c,Project_Info__c,Salary__c,Phone__c from Employee_info__c ];
        if(lstEmp!=null){
            for(Employee_info__c Emp:lstEmp){
                objv=new WrapEmployee();
                objv.wrpEmp=Emp;
                objv.selected=false;
                wrapEmpList.add(objv);
            }
        }
    }
    @AuraEnabled
    public static integer save(){
        try{
            
            integer a = 1 / 0;
            return a;
            
        }catch(exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
    }
    public class WrapEmployee{
        public Employee_info__c wrpEmp{get;set;}
        public Boolean selected {get; set;}
    }
    
    public void fncParentChild(){
        wrapDepartEmpList=new list<WrapDepartEmployee>();
        WrapDepartEmployee  objDepEmp=new WrapDepartEmployee();
        try {
            List<Department_info__c> lstRecDepar=[Select Name,(Select Name__c,Phone__c,Salary__c From Employee_info__r) From Department_info__c];
            for(Department_info__c  Dep:lstRecDepar){
                objDepEmp.wrpDep=Dep;
                lstEmp=new list<Employee_info__c> ();
                for(Employee_info__c emp:Dep.Employee_info__r){
                    lstEmp.add(emp);
                }
                objDepEmp.wrpDepatEmp=lstEmp;
                objDepEmp.selected=false;
                objDepEmp.sMessage='Hello i m from Wrapper class';
                system.debug('wrapDepartEmpList list'+objDepEmp);
                wrapDepartEmpList.add(objDepEmp);
            }
            
            system.debug('wrapDepartEmpList list'+wrapDepartEmpList);
        } catch(DmlException e) {
            
            System.debug('The following exception has occurred: ' + e.getMessage()); 
        }        
    }
    public class WrapDepartEmployee{
        public Department_info__c wrpDep{get;set;}
        public List<Employee_info__c> wrpDepatEmp{get;set;}
        public Boolean selected {get; set;}
        public string sMessage {get; set;}
    }
}