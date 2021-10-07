public class Q_ClassDemo  implements system.Queueable{
    public Account acc;
    public Q_ClassDemo(Account acc){
        this.acc=acc;
    }
    public void execute(QueueableContext context){
        this.acc.Name='update Account';
        this.acc.Industry='Education';
        update this.acc;
        Q_ClassDemo_1 qClass1=new Q_ClassDemo_1(this.acc.Id);
        Id batchId1= system.enqueueJob(qClass1);
        AsyncApexJob jobInfo=[SELECT Id, JobType, ApexClassId, Status, 
                      JobItemsProcessed, TotalJobItems, NumberOfErrors, 
                      MethodName FROM AsyncApexJob where Id=:batchId1];
        system.debug('jobInfo Q_ClassDemo_1 ----> '+jobInfo);
    }

}