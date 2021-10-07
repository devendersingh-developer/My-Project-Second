public class Q_ClassDemo_1 implements system.Queueable {
    public Id ParentId;
    public Q_ClassDemo_1(Id AccountId){
        this.ParentId=AccountId;
    }
    
    public void execute(QueueableContext context){
        Contact con=New Contact(LastName='Cont', firstName='Queueable',phone='7607327933', AccountId=this.ParentId);
        insert con;
    }

}