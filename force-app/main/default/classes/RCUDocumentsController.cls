public class RCUDocumentsController {
    @AuraEnabled
    public static List<FileUtility> loadInitialData(String recordId,String applicantId,String sourceCmp){
        List<FileUtility> lstFiles = new List<FileUtility>();
        if(sourceCmp == 'Analyse') {
            lstFiles.addAll(FileUtility.fetchFiles(new Set<String>{recordId,applicantId},
                                                   new Set<String>{Constant_Class.STATUS_SCREEN,
                                                       Constant_Class.STATUS_HOLD
                                                       }));
        }else if(sourceCmp == 'Verify') {
            lstFiles.addAll(FileUtility.fetchFiles(new Set<String>{recordId,applicantId},
                                                   new Set<String>{Constant_Class.STATUS_SCREEN,
                                                       Constant_Class.STATUS_HOLD,
                                                       Constant_Class.STATUS_RCU_VERIFIED,
                                                       Constant_Class.STATUS_RCUAPI_VERIFIED
                                                       }));
        }else if(sourceCmp == 'View') {
            Set<String> setRecordIds = new Set<String>{recordId};
                //Fetch from related vendor requests as well
                /*  Map<String,Vendor_Request__c> mapIdToVendor = new Map<String,Vendor_Request__c>([SELECT Id,RecordType.Name FROM Vendor_Request__c WHERE Application__c =: recordId AND RecordType.Name = 'RCU']);
if(mapIdToVendor != null && mapIdToVendor.size() > 0) {
setRecordIds.addAll(mapIdToVendor.keySet());
}*/
                lstFiles.addAll(FileUtility.fetchFiles(setRecordIds,
                                                       new Set<String>{'',Constant_Class.STATUS_NEW,
                                                           Constant_Class.STATUS_API_VERIFIED,
                                                           Constant_Class.STATUS_RCU_VERIFIED,
                                                           Constant_Class.STATUS_RCUAPI_VERIFIED}));
        }else if(sourceCmp == 'NoteAndAttchment') {
            lstFiles.addAll(FileUtility.fetchFiles(new Set<String>{recordId},
                                                   new Set<String>{}));
        }
        return lstFiles;
    }  
    @AuraEnabled
    public static String deleteDocuments(String docIds, Boolean isAttachment){
        try{
            if(isAttachment) {
                delete [SELECT Id FROM Attachment WHERE Id=:docIds];  
            }else {
                delete [SELECT Id FROM ContentDocument WHERE Id=:docIds];
            }  
            return 'SUCCESS';
        }
        catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }
}