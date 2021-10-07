public class Callout {
    private static final Integer DEFAULT_TIMEOUT = 10000;
    public static final String END_POINT = 'https://salesforce.galaxyweblinks.com';
    public static final String METHOD_TYPE = 'POST';
    
    public Callout(String jsonString,
                   Url endpoint, 
                   String method,
                   Integer millisecondTimeout) {
                       this.BodyString = jsonString;
                       this.Endpoint = endpoint.toExternalForm();
                       this.RestMethod = method;
                       this.Timeout = millisecondTimeout;
                   }
    
    public Callout(String jsonString, Url endpoint, String method) {
        this(jsonString, endpoint, method, DEFAULT_TIMEOUT);
    }
    
    public String ApiKey { get; set; }
    public String BodyString { get; private set; }
    public String Endpoint { get; private set; }
    public String RestMethod { get; private set; }
    public Integer Timeout { get; private set; }
}