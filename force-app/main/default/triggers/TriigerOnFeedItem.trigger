trigger TriigerOnFeedItem on FeedItem (before insert) {
    
    if(Trigger.isBefore) {
        for(FeedItem Ft : Trigger.New) {
            if(Ft.Type =='TextPost'){
                Ft.addError('You do not have right to create post ');
            }
        } 
    }
    system.debug('Trigger.New @@@@  '+Trigger.New);    
    //SELECT Id, ParentId, Type, CreatedById, CreatedDate, IsDeleted, 
    //LastModifiedDate, SystemModstamp, Revision, Body, IsClosed, Status FROM FeedItem where Type='TextPost'
    
}