public  class AccessData {
 public static String getContacts() {
       return JSON.serialize([select id, name, email 
                              from contact Where name like '%C%']);
   }
}