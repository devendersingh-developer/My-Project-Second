/**
* @Author      :Devender Singh
* @Date        :13th April 2020
* @Description :This episode about the basic of DML and Exception Handling
* 
*----- Manipulation Records With DML ----
* INSERT  -->Every time new record with be created with unique record id
* UPDATE  -->Update the existing records 
* DELETE  --> Delete the record
* UPSERT  -->if the key is matched once, the existing object record is update and if the key is not matched , 
*            a new record will be record.
* UNDELETE-->To retrive the deleted data from recycle// List<ObjectName> 
*            LitRecord=[select id from objectName where name='XMZ' ALL Row]  undelete LitRecord
* MERGE
* 
*    DATA BASE METHODS
* -->Database methodes are static methods available in Database class
* -->Partial insert is supported // meaning if you have 10 record and 5 record are ok and 5 records have some issue, 
*    then with the help of these database methord we can have partial insert data.
* -->inculdes the optional [all or None] parameters that default true,
*    if we pass false the partial data will be insert 
* 
* Database.insert()
* Database.update()
* Database.upsert()
* Database.delete()
* Database.undelete()
* Database.merge()
* 
* ------BULK DML
* ------DATA BASE METHOD AND ERROR HANDLING
* 
* ------TRANSACTION CONTROL
* SAVEPOINT
* ROLLBACK
* */
public class Episode6 {
    
    
    public void fncDataBase_InsertExample(){
        
        // Create the list of sObjects to insert
        List<Account> acctList = new List<Account>();
        acctList.add(new Account(Name='Acme1'));
        acctList.add(new Account(Name='Acme2'));
        // DML statement
        Database.SaveResult[] srList = Database.insert(acctList, false);
        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            }
            else {
                // Operation failed, so get all errors               
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                   
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
    
     public void fncDataBase_SavePointExample(){
         
     }
    
    
}