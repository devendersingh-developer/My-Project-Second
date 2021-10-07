public class DataLoadTestingClass {
            public String UserID { get; set; }
            public String Password { get; set; }  
       public PageReference doInsert() {          
            pagereference ref = new pagereference('/apex/CustomeSearchVfPage');
            if(UserID=='Test' && Password=='12345')
            {	
       			 ref.setredirect(true);   
            }
         return ref;
       }
    
           public decimal Fare { get; set; }
           public String food { get; set; } 
           public integer NoOfPassenger { get; set; } 
           public String Name { get; set; } 
    
       public void fncSaveEmployee(){
          Reservation__c objRes=new Reservation__c();
           objRes.Fare_Range__c=Fare;
           objRes.Food__c='food';
           objRes.No_of_Passenger__c=NoOfPassenger;
           objRes.Passenger_Name__c =Name;
           insert  objRes;
       }      
}