({
    doSearch : function(component, event, helper) {
        var componentEvent=component.getEvent('SearEvent');
        var searchParam=component.find("searchInput").get('v.value');
        componentEvent.setParams({
            searchText:searchParam
        });
        componentEvent.fire();
    }
})