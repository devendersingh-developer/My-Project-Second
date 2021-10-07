public class ClsMainClass {
    
    public Wrapper objWrapper{get;set;}
    //public List<Wrapper1> lstWrapper{get;set;}
    public Wrapper fncGetWrapper(){
       Wrapper objWrapper=new  Wrapper();
        objWrapper.sName='Test';
        objWrapper.iAge=10;
        objWrapper.isMarried=true;
        objWrapper.iHeight=5.5;
        return objWrapper;
    }
    
    public class Wrapper{
        public string sName{get;set;}
        public integer iAge{get;set;}
        public Boolean isMarried{get;set;}
        public decimal iHeight{get;set;}
    }
}