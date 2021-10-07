/**
 * @Author      :Devender Singh
 * @Date        :13th April 2020
 * @Description :This is code for test the all sanerio for Trigger
 * */
public class Episode2 {
    //Enum -Medal color
    public enum Medal{gold,silver,bronze}
  // public void knowYourMedal(Episode2.Medal enumMedalColor){
    public void knowYourMedal(string enumMedalColor){
        switch on enumMedalColor{
            when 'gold'{
                system.debug('Wow your stood  First');
            }
            when 'silver'{
                system.debug('Wow your stood  Second');
            }
            when 'bronze'{
                system.debug('Wow your stood  Third');
            }
            when else{
                system.debug('Sorry you selected an invalid medal color!');
            }
        }
    }
    
  /**  Call class Proccess of Switch
    *Episode2 obj=new Episode2();
    *obj.knowYourMedal('silver');
    *obj.knowYourMedal(null);
    *  Call class Process with enum
    *Episode2 obj=new Episode2();
    *obj.knowYourMedal(Episode2.Medal.gold);
    *obj.knowYourMedal(null);
    **/
}