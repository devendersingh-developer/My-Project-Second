@RestResource(urlMapping='/Opportunities/*')
global with sharing class OpportunityManager {
    @httpPost
    global static ID CreateOpportunity(string name,string stage,string closedate,string source){
        //try{
            
            opportunity newOpportunity=New opportunity(
                name=name,
                stageName=stage,
                leadsource=source,
                closedate=date.valueOf(closedate)
            );
            insert newOpportunity;
            return newOpportunity.Id;
       // }catch(exception e){
            
        //}
    }

}