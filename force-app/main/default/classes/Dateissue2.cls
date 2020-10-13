public class Dateissue2 {
    
    
    public void isoWeekno(Date stDate)
    {
         
        integer dateyear = stDate.year();
        string comdate = '12/28/'+dateyear;
        date compdate = date.parse(comdate);
        string startd = '01/01/'+dateyear;
        date startdate = date.parse(startd);
        Decimal totaldays;
        decimal noofweek;
        if(stDate < date.valueOf(compdate))
        { 
            
            Datetime dt = DateTime.newInstance(startdate, Time.newInstance(0, 0, 0, 0));
            String dayOfWeek=dt.format('EEEE');
            
            if(dayOfWeek =='Monday'||dayOfWeek =='Tuesday'||dayOfWeek =='Wednesday'||dayOfWeek =='Thursday')
            {
                totaldays = startdate.daysBetween(stDate);
                decimal addunit =checkstartday(dayOfWeek);
                totaldays= totaldays+addunit;
            }
            else{
                
            }
            noofweek = math.ceil(totaldays / 7);
        }
        else
        {
            Datetime dt = DateTime.newInstance(compdate, Time.newInstance(0, 0, 0, 0));
            String dayOfWeek=dt.format('EEEE');
            if(dayOfWeek =='Sunday')
            {
                noofweek =1;
            }
            else
            {
				                
            }
        }
        system.debug('noofweek===>>'+noofweek);
        
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
    
    
}