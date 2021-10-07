public class ClsEmptextFile {
    
    public static void fncMovefile(){ 
        
      /*  List<Id> lstPhone = new List<Id>();
        Map<string,Account> mapExistingAccountOnMobileNumber=new Map<string,Account>();*/
        
        ContentDocumentLink cdlk = [select id,LinkedEntityId, ContentDocumentId from ContentDocumentLink where LinkedEntityId='0017F00002Qk9qmQAB'];
        
        ContentDocumentLink cdl = New ContentDocumentLink();
        cdl.LinkedEntityId = '0067F00000YgK6jQAF';
        cdl.ContentDocumentId = cdlk.ContentDocumentId;
        cdl.shareType = 'V';
        Insert cdl;
        
        delete cdlk;
        
       /* public static void fncMoveFile(List<string> oldAcc){
        List<ContentDocumentLink> RecList=new List<ContentDocumentLink>();
        Map<string,string> ExistingMapofAccountAndOpportunity =new Map<string,string>();
        Map<string,string> ExistingMapofAccountAndContentDocumentLink =new Map<string,string>();
        boolean IsNotDublicate=false;
        LIST<Opportunity> ListRecOppo=new  LIST<Opportunity>();
        ListRecOppo =[SELECT Id, AccountId,Account.File_Uploaded_Successfully__c, Duplicate_Account_Id__c FROM Opportunity where Duplicate_Account_Id__c!=null and Duplicate_Account_Id__c IN :oldAcc];
        if(ListRecOppo.size()==0){
            ListRecOppo =[SELECT Id,Account.File_Uploaded_Successfully__c, AccountId, Duplicate_Account_Id__c FROM Opportunity where AccountId IN :oldAcc];
            IsNotDublicate=true;
        }
        if(oldAcc.size()>0){
            if(IsNotDublicate==true){
                for(Id AccId: oldAcc){
                    for(Opportunity opp: ListRecOppo){
                        if(opp.AccountId==AccId && opp.Account.File_Uploaded_Successfully__c==true)
                            ExistingMapofAccountAndOpportunity.put(opp.AccountId, opp.Id);
                    }
                }
            }else{
                for(Id AccId: oldAcc){
                    for(Opportunity opp: ListRecOppo){
                        if(opp.Duplicate_Account_Id__c==AccId && opp.Account.File_Uploaded_Successfully__c==true)
                            ExistingMapofAccountAndOpportunity.put(opp.Duplicate_Account_Id__c, opp.Id);
                    }
                } 
            }
            LIST<ContentDocumentLink> ListContentDocumentLinkcdlk = [select id,LinkedEntityId, ContentDocumentId from ContentDocumentLink where LinkedEntityId IN :oldAcc];
            if(ListContentDocumentLinkcdlk.size()>0){
                for(Id AccId: oldAcc){
                    for(ContentDocumentLink con:ListContentDocumentLinkcdlk){
                        if(con.LinkedEntityId==AccId){
                            ExistingMapofAccountAndContentDocumentLink.put(con.LinkedEntityId, con.ContentDocumentId); 
                        }      
                    }
                }
                
                if(ListContentDocumentLinkcdlk!=null && ExistingMapofAccountAndOpportunity.size()>0){
                    for(ContentDocumentLink con:ListContentDocumentLinkcdlk){
                        if(ExistingMapofAccountAndOpportunity.containsKey(ListContentDocumentLinkcdlk[0].LinkedEntityId)){
                            ContentDocumentLink cdl = New ContentDocumentLink();
                            cdl.LinkedEntityId = ExistingMapofAccountAndOpportunity.get(ListContentDocumentLinkcdlk[0].LinkedEntityId);
                            if(ExistingMapofAccountAndContentDocumentLink.containsKey(con.LinkedEntityId))
                                cdl.ContentDocumentId =con.ContentDocumentId;
                            cdl.shareType = 'V';
                            RecList.add(cdl);
                        }
                        
                    }
                    
                    Insert RecList;
                    delete ListContentDocumentLinkcdlk;
                }
            }
        }
        
    }*/
        
    }
}