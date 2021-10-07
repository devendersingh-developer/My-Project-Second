public class ClsCallWrapper {
    
       public Wrapper1 objWrapper{get;set;}
    public void ClsCallWrapper(){
        ClsMainClass obj=new ClsMainClass();
        Wrapper1 objwrap=new Wrapper1();
        
       // objwrap= obj.fncGetWrapper();       
        system.debug('obj.fncGetWrapper()@@'+obj.fncGetWrapper());
       // objwrap= obj.fncGetWrapper(); 
    }
    
    public class Wrapper1{
        public string sName{get;set;}
        public integer iAge{get;set;}
        public Boolean isMarried{get;set;}
        public decimal iHeight{get;set;}
    }
}