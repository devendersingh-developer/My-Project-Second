public class ClsFuture {
    
    //------------------------------ 1 -------------------------------------
    /*Interviewer: Why do we use Future Methods?
      Interviewee: You can call a future method for executing long-running operations,
      such as callouts to external Web services or any operation you’d like to run in its own thread, on its own time.*/
    
    //------------------------------ 2 -------------------------------------
    /*Interviewer: Can you write the syntax of a future method?
      Interviewee: Methods with the future annotation must be static methods, and can only return a void type.*/
    @future
    public static void myFutureMethod(){
        
    }
}