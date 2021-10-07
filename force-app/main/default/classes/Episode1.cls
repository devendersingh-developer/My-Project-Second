/**
 * @Author      :Devender Singh
 * @Date        :13th April 2020
 * @Description :This is code for test the all sanerio for Trigger
 * */
public class Episode1 {
    
    public void demoDataType(){
        Integer i=10;
        Decimal d=20.3;
        string hello='Hello world !!';
        
        system.debug('@ Integer'+i);
        system.debug('@ Decimal'+d); 
        system.debug('@ string'+hello);
    }
    
    public enum Season{Summer,Winter,spring}
    
    public void  listDemo(){
        
        List<integer> lstInt=new List<Integer>{10,20,30,40,50,60,70,80};
        lstInt.add(90);
        system.debug('@ string'+lstInt[1]);
        
        for(integer intVal:lstInt)
            if(intVal>50)
            system.debug('@ intVal => '+intVal);
    }
    
    public void  setDemo(){
        
        set<integer> lstInt=new set<Integer>{10,20,30,40,50,60,70,80,80};
        lstInt.add(90);
        //system.debug('@ string'+lstInt[0]);
        
        for(integer intVal:lstInt)
            if(intVal>50)
            system.debug('@ intVal => '+intVal);
    }
    public void  mapDemo(){
        map<integer,String> mapInt=New map<integer,String>{1=>'one',2=>'Two'};
            
            for(Integer i:mapInt.keySet())
            system.debug('@ Map Val => '+mapInt.get(i));
    }
    
    public void changeInt(integer a){
        a=20;
    }
    /** Call process this below code from Anonymous window
     * Episode1 obj=new Episode1();
     * obj.demoDataType();
     * Episode1.Season w= Episode1.Season.Winter;
     * system.debug('@ Integer '+w);
     * Episode1 obj=new Episode1();
obj.demoDataType();
Episode1.Season w= Episode1.Season.Winter;
 system.debug('@ Integer '+w);

obj.listDemo();
obj.setDemo();
obj.mapDemo();
Integer a=10;
obj.changeInt(a);
system.debug('a @@@ ==> '+a);
        
     * */

}