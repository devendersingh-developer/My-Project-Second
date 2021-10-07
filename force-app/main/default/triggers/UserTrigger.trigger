trigger UserTrigger on User ( before insert,after update,before update ) {
    if (Trigger.isafter && Trigger.isUpdate) {
        for(User itrUs:trigger.New){
            Callout fakeCallout = new Callout(HttpCallout.getbody(itrUs.Username,itrUs.FirstName+''+itrUs.LastName), new Url(Callout.END_POINT), Callout.METHOD_TYPE);
            HttpCallout.process(string.valueOf(JSON.serialize(fakeCallout)));
            system.debug('isBefore  before first time login  update &&& '+trigger.new);
        }
    }
}