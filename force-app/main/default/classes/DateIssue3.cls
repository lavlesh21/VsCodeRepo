public class DateIssue3 {
    public void datecheck(Date stdate,date endate)
    {
         Datetime dt = DateTime.newInstance(stdate, Time.newInstance(0, 0, 0, 0));
         String dayOfWeek=dt.format('EEEE');
         integer stday= checkstartday(dayOfWeek);
         date startdate = stdate.addDays((-stday));
         Datetime dt1 = DateTime.newInstance(endate, Time.newInstance(0, 0, 0, 0));
         String dayOfWeek1=dt1.format('EEEE');
         integer endday= checkendday(dayOfWeek1);
         date Enddate = endate.addDays((endday));
         system.debug('startdate====>>>'+startdate);
         system.debug('Enddate====>>>'+Enddate);
         integer  numberDays = startdate.daysBetween(Enddate) +1;
         system.debug('numberDays====>>'+numberDays);
         integer noofweek = numberDays/7;
         system.debug('noofweek====>>'+noofweek);
        
    }
    public integer checkstartday(string dayname)
    {
        integer unit;
        if(dayname=='Sunday')
        {
           unit=6; 
        }
        else
        {
            if(dayname=='Monday')
            {
              unit=0;  
            }
            else
            {
              if(dayname=='Tuesday') 
              {
                 unit=1;  
              }
                else
                {
                    if(dayname=='Wednesday')
                    {
                       unit=2; 
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
                               unit=4;
                           }
                            else
                            {
                                 if(dayname=='Saturday')
                                 {
                                     unit=5;
                                 }
                                
                            }
                        }
                    }
                    
                }
            }
        }
        return unit;
    }
public integer checkendday(string dayname)
   {
       integer unit;
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