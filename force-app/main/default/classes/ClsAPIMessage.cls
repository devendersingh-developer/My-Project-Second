@RestResource(urlMapping='/APIMessage/*')
global class ClsAPIMessage {

    @HttpGet
     global static string getAPIMessage() {
        return 'I m from Api call helloooooooo';
       
     }
}