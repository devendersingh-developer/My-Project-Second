@RestResource(urlMapping='/FatchData/*')
global  class TestApi {
    @HttpGet
    global static string getVoucherDetails(){
        return 'Hello i m comming from Api';
    }

}