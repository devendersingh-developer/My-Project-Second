({
    doInit: function(component, event, helper) {
        var page = component.get("v.page") || 1;
        var recordToDisply = component.find("recordSize").get("v.value");
        helper.getContactList(component,page,recordToDisply);
    },
   navigate: function(component, event, helper) {
      // this function call on click on the previous page button  
      var page = component.get("v.page") || 1;
      // get the previous button label  
      var direction = event.getSource().get("v.label");
      // get the select option (drop-down) values.  
      var recordToDisply = component.find("recordSize").get("v.value");
      // set the current page,(using ternary operator.)  
      page = direction === "Previous Page" ? (page - 1) : (page + 1);
      // call the helper function
      helper.getContactList(component, page, recordToDisply);
 
   },
 
    onSelectChange: function(component, event, helper) {
        // this function call on the select opetion change,	 
        var page = 1
        var recordToDisply = component.find("recordSize").get("v.value");
        helper.getContactList(component, page, recordToDisply);
    },
    SearchText:function(component,event,helper){
        var page = component.get("v.page") || 1;
        var recordToDisply = component.find("recordSize").get("v.value");
        helper.getSearchText(component,page,recordToDisply);
    },
    EditContact:function(component,event,helper)
    {
        component.set("v.isOpen", true);
        // var ProductName = event.target.getElementsByClassName('Contact-ID')[0].value;
    },
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.isOpen", false);
    },
    
    likenClose: function(component, event, helper) {
        // Display alert message on the click on the "Like and Close" button from Model Footer 
        // and set set the "isOpen" attribute to "False for close the model Box.
        alert('thanks for like Us :)');
        component.set("v.isOpen", false);
    },
})