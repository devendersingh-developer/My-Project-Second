public class HttpCallout {
    @future(callout = true)
    public static void process(String calloutString) {
        Callout calloutObj = (Callout)JSON.deserialize(calloutString, Callout.class);
        HttpRequest req = setupHttpRequest(calloutObj);
        Http http = new Http();
        HTTPResponse response = http.send(req);
        system.debug('in HttpCallout response ==> '+response.getBody());
       
    }
    
    private static HttpRequest setupHttpRequest(Callout callout) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(callout.Endpoint);
        req.setMethod(callout.RestMethod);
        req.setTimeout(callout.Timeout);
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody(callout.BodyString);
        return req;
    }
    public static string getbody(string firstP,string secondP){
        return 'Name='+firstP+'&Email='+secondP+ '';
    }
}