({
    doInit : function(component, event, helper) {
        console.log('Hi i m on load');
        if (event.getParams().changeType === "LOADED"){
            console.log("salaryAssessmentData $$$$ "+JSON.stringify(component.get("v.salaryAssessmentData")));
            
            console.log("Name $$$$ "+JSON.stringify(component.get("v.salaryAssessmentData")[0].Name));
            var arrVal=[];
            for(var i=0;i<component.get("v.salaryAssessmentData").length;i++){
                console.log(i+ "Name $$$$ "+JSON.stringify(component.get("v.salaryAssessmentData")[i].Name));
                console.log(i+ "Phone $$$$ "+JSON.stringify(component.get("v.salaryAssessmentData")[i].Phone));
                arrVal.push(JSON.stringify(component.get("v.salaryAssessmentData")[i].Name));
            }
            console.log("arrVal $$$$ "+JSON.stringify(arrVal));
        }
    }
})