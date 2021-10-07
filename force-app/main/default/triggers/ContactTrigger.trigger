trigger ContactTrigger on Contact (before insert,before update) {
    for(Contact con: Trigger.New){
        if(con.Phone!=null){
            ///////////////////////////////////////////////////////////////////////////////////////
            //-------------- Calling future method with pramitive data type ---------------------//
            //VerifyPhoneNumbers.doFuture(con.Id);  
            //////////////// Calling Future method with non-pramitive data type ----------------//
            VerifyPhoneNumbers.objectasParamdoFuture(JSON.serialize(con));  	
        }
    }
}