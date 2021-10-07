public class WarehouseSyncSchedulerInvoke 
{
    public static void invokeschedule()
    {
        WarehouseSyncSchedule reminder = new WarehouseSyncSchedule();
        // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = '0 0 1 * * ?';
        String jobID = System.schedule('Scheduled Equipment Sync', sch, reminder);
        System.debug(jobID);
    }
}