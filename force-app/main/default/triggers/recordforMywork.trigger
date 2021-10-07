trigger recordforMywork on MyWork__c (before insert) {
  for(MyWork__c mw : Trigger.New) {
       if( mw.City__c!='' || mw.City__c!=null )
       {
      		if(mw.City__c=='Noida')
      		{
        	  mw.State__c ='UP';    
      		}
      		if(mw.City__c=='Faridabad')
      		{
        	  mw.State__c ='Haryana';    
      		}
      		if(mw.City__c=='Gurgaon')
      		{
       		   mw.State__c ='Haryana';    
      		}
       }
      else
      {
     	 mw.addError('City is required...!');  
      }
    } 


   
}