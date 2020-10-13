public class dateissue {
    
    public void checkdate(date startdate,date endDate)
    { 
        decimal numberDays;
        Datetime dt = DateTime.newInstance(startdate, Time.newInstance(0, 0, 0, 0));
        String dayOfWeek=dt.format('EEEE');
        Datetime dt2 = DateTime.newInstance(endDate, Time.newInstance(0, 0, 0, 0));
        String dayOfWeek2=dt.format('EEEE');
        numberDays = startdate.daysBetween(endDate);
        decimal stday = checkstartday(dayOfWeek);
        decimal enday =checkendday(dayOfWeek2);
        numberDays=numberDays+stday+enday;
        decimal totalweek = math.ceil(numberDays/7);
        system.debug('totalweek===>>'+totalweek);
       
    }
    public decimal checkstartday(string dayname)
    {
        decimal unit;
        if(dayname=='Sunday')
        {
           unit=0; 
        }
        else
        {
            if(dayname=='Monday')
            {
              unit=1;  
            }
            else
            {
              if(dayname=='Tuesday') 
              {
                 unit=2;  
              }
                else
                {
                    if(dayname=='Wednesday')
                    {
                       unit=3; 
                    }
                    else
                    {
                    	if(dayname=='Thursday')
                        {
                            unit=4;
                        }
                        else
                        {
                           if(dayname=='Friday')
                           {
                               unit=5;
                           }
                            else
                            {
                                 if(dayname=='Saturday')
                                 {
                                     unit=6;
                                 }
                                
                            }
                        }
                    }
                    
                }
            }
        }
        return unit;
    }
   public decimal checkendday(string dayname)
   {
       decimal unit;
        if(dayname=='Sunday')
        {
           unit=0; 
        }
        else
        {
            if(dayname=='Monday')
            {
              unit=6;  
            }
            else
            {
              if(dayname=='Tuesday') 
              {
                 unit=5;  
              }
                else
                {
                    if(dayname=='Wednesday')
                    {
                       unit=4; 
                    }
                    else
                    {
                    	if(dayname=='Thursday')
                        {
                            unit=3;
                        }
                        else
                        {
                           if(dayname=='Friday')
                           {
                               unit=2;
                           }
                            else
                            {
                                 if(dayname=='Saturday')
                                 {
                                     unit=1;
                                 }
                                
                            }
                        }
                    }
                    
                }
            }
        }
        return unit;

   }
}