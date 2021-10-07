public inherited sharing class TowerMapUtilClass {
     public static List<sObject> queryObjects(String theObject, List<String> theFields, String theFilter, String sortOrder) {
          String theQuery = 'SELECT ' + string.join(theFields, ',');
          theQuery += ' FROM ' + theObject;
          if(!String.isEmpty(theFilter)) {
               theQuery += ' WHERE ' + theFilter;
          }
          
          return database.query(theQuery);
     }
}