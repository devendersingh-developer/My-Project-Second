public class ClsTriggerOnMethod {

    public ClsTriggerOnMethod()
    {
        system.debug('Hi i m method two and calling bye trigger');
    }
    public void fncMes(integer a, integer b)
    {
      system.debug('Hi i m in method one and calling bye trigger==>'+(a*b));
    }
}