@IsTest
private class PicklistSelectControllerTest {
  
     public static testmethod void test_get_field_label() {
         //test.startTest();
        
        String fieldLabel = PicklistSelectController.getFieldLabel( 'Account', 'Type' );
        //test.stopTest();
        System.assertEquals( Account.Type.getDescribe().getLabel(), fieldLabel );
    }

     public static testmethod void test_get_picklist_values() {
        //test.startTest(); 
        List<PicklistSelectController.PicklistOption> options = PicklistSelectController.getPicklistOptions( 'Account', 'Type' ); 
       // test.stopTest();
        List<PicklistEntry> values = Account.Type.getDescribe().getPicklistValues();
        for ( Integer i = 0; i < options.size(); i++ ) {
            System.assertEquals( values[i].getLabel(), options[i].label );
            System.assertEquals( values[i].getValue(), options[i].value );
        }
    }
}