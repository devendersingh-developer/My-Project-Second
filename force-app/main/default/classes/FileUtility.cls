/****************************************************************
**Author: Karthik Chekkilla
**Name : FileUtility
**Date : 28/05/2021
**Description :  This class is a utility class for file creation.
*****************************************************************/
public class FileUtility {
    @AuraEnabled
    public String fileName;
    @AuraEnabled
    public String contentType;
    @AuraEnabled
    public String Description;
    @AuraEnabled
    public Blob Body;
    @AuraEnabled
    public Id recordId;
    @AuraEnabled
    public Id parentId;
    @AuraEnabled
    public Boolean isAttachment;
    @AuraEnabled
    public String status;
    @AuraEnabled
    public String API_Status;
    @AuraEnabled
    public String remarks;
    @AuraEnabled
    public String category;
    public FileUtility(Attachment objAttach, Boolean isContentRequired) {
        this.fileName = objAttach.Name;
        this.contentType = objAttach.ContentType;
        this.Description = objAttach.Description;
        if(isContentRequired) {
           this.Body = objAttach.body; 
        }
        this.recordId = objAttach.Id;
        this.parentId = objAttach.ParentId;
        this.isAttachment = True;
        this.status = Constant_Class.STATUS_NEW;
        if(String.isBlank(objAttach.ContentType) && objAttach.Name.contains('.')) {
            List<String> lstFileName = objAttach.Name.split('\\.');
            if(lstFileName != null && !lstFileName.isEmpty()) {
                this.fileName = lstFileName[0];
            	this.contentType = lstFileName[1];
                this.category = lstFileName[1];
            }
        }
    }
    public FileUtility(ContentVersion objCV, Boolean isContentRequired) {
        this.fileName = objCV.Title;
        this.contentType = objCV.FileExtension;
        this.category = objCV.FileExtension;
        if(isContentRequired) {
        	this.Body = objCV.VersionData;
        }
        this.recordId = objCV.Id;
        this.parentId = objCV.ContentDocumentId;
		this.isAttachment = False;
        this.status = Constant_Class.STATUS_NEW;
       /* if(objCV.Status__c != NULL) {
            this.status = objCV.Status__c;
        }
        if(objCV.remarks__c != NULL) {
            this.remarks = objCV.remarks__c;
        }
        if(objCV.Description != NULL) {
            this.Description = objCV.Description;
        }
        if(objCV.API_Status__c != NULL) {
            this.API_Status = objCV.API_Status__c;
        }
        if(objCV.Category__c != NULL) {
            this.category = objCV.Category__c;
        }*/
    }
    //To fetch files and attachments
    public static list<FileUtility> fetchFiles(Set<String> setParentIds,Set<String> skipStatusVals){
        list<id> lstConDocs = new list<id>();
        list<FileUtility> lstDocs = new list<FileUtility>();
        for(ContentDocumentLink cntLink : [Select Id, ContentDocumentId From ContentDocumentLink Where LinkedEntityId IN:setParentIds]) {
            lstConDocs.add(cntLink.ContentDocumentId);
            
        }
        if(!lstConDocs.isEmpty()) {
            List<ContentVersion> lstCV = [SELECT Id, Title, FileExtension, ContentDocumentId,Description
                                          FROM ContentVersion WHERE ContentDocumentId IN :lstConDocs 
                                           ORDER BY CREATEDDATE DESC];
            //AND Status__c NOT IN: skipStatusVals
            if(lstCV != null && !lstCV.isEmpty()) {
                for(ContentVersion objCV : lstCV) {
                    lstDocs.add(new FileUtility(objCV,false)); 
                }
            }
        }
        system.debug('87 lstDocs --> '+lstDocs.size());
        List<Attachment> lstAttachments = [SELECT Id,ContentType,Name,Body,Description,ParentId FROM Attachment WHERE parentId IN: setParentIds ORDER BY CREATEDDATE DESC];
        system.debug('lstAttachments --> '+lstAttachments);
        if(lstAttachments != null && !lstAttachments.isEmpty()) {
            for(Attachment objAttach : lstAttachments) {
                lstDocs.add(new FileUtility(objAttach,false));  
            }          
        }
         system.debug('lstDocs --> '+lstDocs.size());
        return lstDocs;
    }
    /*//Get ContentDocumentLink instance
    public static ContentDocumentLink getConDocLinkInstance(String parentId, String conDocId) {
        ContentDocumentLink conDocLink = New ContentDocumentLink();
        conDocLink.LinkedEntityId = parentId; 
        conDocLink.ContentDocumentId = conDocId; 
        conDocLink.shareType = 'V';
        return conDocLink;
    }
    //Fetch files
    @AuraEnabled
    public static list<ContentVersion> fetchUploadedFiles(List<String> lstFileIds,String parentId,String category){
        List<ContentVersion> lstCV = [SELECT Id, Title,FileExtension,ContentDocumentId FROM ContentVersion WHERE Id IN :lstFileIds];
        if(lstCV != null && !lstCV.isEmpty()) {
            for(ContentVersion objContent : lstCV) {
             //   objContent.Temporary_File__c = true;
                if(String.isNotBlank(category)) {
           //         objContent.Category__c = category;
                }    
            }
            UPDATE lstCV;
        }
        return fetchTempFiles(parentId,category);
    }
    @AuraEnabled
    public static String deleteContentDocument(String contentDocId){
        try{
            List<ContentDocument> lstDocs = [SELECT Id FROM ContentDocument WHERE Id =: contentDocId];
            if(lstDocs != null && !lstDocs.isEmpty()) {
                DELETE lstDocs;
            }
        }catch(Exception ex) {
            return ex.getMessage();
        }
        return 'SUCCESS';
    }
    @AuraEnabled
    public static String deleteTempDocs(String parentId){
        List<ContentVersion> lstTempCV = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Temporary_File__c = true];
        if(lstTempCV != null && !lstTempCV.isEmpty()) {
            Set<String> setConDocIds = new Set<String>(); 
            for(ContentVersion objCV : lstTempCV) {
                setConDocIds.add(objCV.ContentDocumentId);
            }
            System.debug('!@#!'+setConDocIds+'@@@'+parentId);
            Set<String> setRelatedConDocIds = getContentDocumentIds(parentId);
            List<ContentDocument> lstDocsToDelete = [SELECT Id FROM ContentDocument WHERE Id IN: setConDocIds AND Id IN: setRelatedConDocIds];
            if(lstDocsToDelete != null && !lstDocsToDelete.isEmpty()) {
                try {
                    DELETE lstDocsToDelete;
                    return 'SUCCESS';
                }catch(Exception ex) {
                    return ex.getMessage();
                }    
            }
        }
        return '';
    }
    //To fetch all associated temporary files
    public static list<ContentVersion> fetchTempFiles(String parentId,String category) {
        Set<String> setRelatedConDocIds = getContentDocumentIds(parentId);
        if(!setRelatedConDocIds.isEmpty()) {
            List<ContentVersion> lstCV;
            if(String.isNotBlank(category)) {
                lstCV = [SELECT Id,Title,FileExtension,ContentDocumentId FROM ContentVersion 
                        WHERE ContentDocumentId IN: setRelatedConDocIds 
                        AND Temporary_File__c = true AND category__c =: category];
            }else {
                lstCV = [SELECT Id,Title,FileExtension,ContentDocumentId FROM ContentVersion 
                        WHERE ContentDocumentId IN: setRelatedConDocIds 
                        AND Temporary_File__c = true];
            }
            
            if(lstCV != null && !lstCV.isEmpty()) {
                return lstCV;
            }
        }
        return null;
    }
    //To fetch document links for temporary files
    public static list<ContentDocumentLink> fetchTempContentDocLinks(String parentId) {
        List<ContentVersion> lstCV = [SELECT Id,Title,FileExtension,ContentDocumentId FROM ContentVersion WHERE Temporary_File__c = true];
        Set<String> setConIds = new Set<String>();
        if(lstCV != null && !lstCV.isEmpty()) {
            for(ContentVersion objCV : lstCV) {
                setConIds.add(objCV.ContentDocumentId);
            }
            List<ContentDocumentLink> lstConDocLnk = [SELECT ContentDocumentId From ContentDocumentLink WHERE ContentDocumentId IN: setConIds AND LinkedEntityId =: parentId];
            if(lstConDocLnk != null && !lstConDocLnk.isEmpty()) {
                return lstConDocLnk;
            }
        }
        return null;
    }
    //Insert content document links
    public static void insertContentDocumentLnks(Set<String> setConDocIds, String parentId) {
        List<ContentDocumentLink> lstConDoclnksToInsert = new List<ContentDocumentLink>();
        for(String conDocId : setConDocIds) {
            lstConDoclnksToInsert.add(getConDocLinkInstance(parentId,conDocId));
        }
        if(!lstConDoclnksToInsert.isEmpty()) {
            INSERT lstConDoclnksToInsert;
        }
    }
    //Get document Ids against parentId
    public static set<String> getContentDocumentIds(String parentId) {
        Set<String> setRelatedConDocIds = new Set<String>();
        List<ContentDocumentLink> lstConDocLnk = [SELECT ContentDocumentId From ContentDocumentLink WHERE LinkedEntityId =: parentId];
        for(ContentDocumentLink objLnk : lstConDocLnk) {
            setRelatedConDocIds.add(objLnk.ContentDocumentId);
        }
        return setRelatedConDocIds;
    }
    //To get document URL
    public static String getSignatureURL(String parentId){
        String returnString;
        if(String.isNotBlank(parentId)){
            Set<String> contentDocIds = new Set<String>();
            for( ContentDocumentLink CDL : [SELECT ContentDocumentId FROM ContentDocumentLink where LinkedEntityId =: parentId] ){
                contentDocIds.add(CDL.ContentDocumentId);
            }
            if(!contentDocIds.isEmpty()){
                List<contentversion> lstCV = [SELECT id FROM contentversion WHERE contentdocumentid IN : contentDocIds AND title LIKE '%signature%' LIMIT 1];
                if(lstCV != null && !lstCV.isEmpty()) {
                    returnString = generatePublicURL(lstCV[0].id);
                }
            }
        }
        return returnString;
    }
    public static String generatePublicURL(String strVersionId) {
        List<ContentDistribution> lstCD = [SELECT ContentDownloadUrl FROM ContentDistribution WHERE ContentVersionId =: strVersionId LIMIT 1];
        if(lstCD != null && !lstCD.isEmpty()) {//If already exists
            return lstCD[0].ContentDownloadUrl;
        }else {
            ContentDistribution objCD = new ContentDistribution();
            objCD.Name = strVersionId;
            objCD.ContentVersionId = strVersionId;
            objCD.PreferencesAllowViewInBrowser= true;
            objCD.PreferencesLinkLatestVersion=true;
            objCD.PreferencesNotifyOnVisit=false;
            objCD.PreferencesPasswordRequired=false;
            objCD.PreferencesAllowOriginalDownload= true;
            INSERT objCD;
            return [SELECT ContentDownloadUrl FROM ContentDistribution WHERE Id =: objCD.Id].ContentDownloadUrl;
        }    
    }
    //To insert files
    public static void insertContent(String fileName, String versionData, String parentId) {
        ContentVersion objCV = new ContentVersion();
        objCV.Title = fileName;
        objCV.PathOnClient = fileName;
        objCV.VersionData = Blob.valueOf(versionData);
        INSERT objCV;
        List<ContentVersion> listContentVersion = [SELECT Id,ContentDocumentId FROM ContentVersion WHERE Id=: objCV.Id];
        if(listContentVersion.size() > 0){
            ContentDocumentLink cdlink = New ContentDocumentLink();
            cdlink.LinkedEntityId = parentId;
            cdlink.ContentDocumentId = listContentVersion[0].ContentDocumentId;
            INSERT cdlink;
        }
    }*/
}