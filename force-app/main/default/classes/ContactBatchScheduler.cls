global class ContactBatchScheduler implements Schedulable {
	 global void execute(SchedulableContext ctx) {
         ClsSendEmailToContactBirthday cdb=new ClsSendEmailToContactBirthday();
         database.executebatch(cdb);
     }
}