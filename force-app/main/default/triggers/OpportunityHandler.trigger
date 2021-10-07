trigger OpportunityHandler on Opportunity (After insert,After Update,After Delete,After Undelete) {
 new OpportunityTriggerHandler().run(); 
}