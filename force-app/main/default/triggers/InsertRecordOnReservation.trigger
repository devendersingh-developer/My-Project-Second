trigger InsertRecordOnReservation on Reservation__c (before insert) {
System.debug('This is trigger fire .....');
}