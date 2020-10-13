public class ISOWeek {
    
    /*     ====Calculate ISO Week between Two input Date=======    */
     
    public static integer GetISoWeek(Date stdate,date endate)
    {
         Datetime Dateatimeforstartdate  = DateTime.newInstance(stdate, Time.newInstance(0, 0, 0, 0)); 
         String dayOfStartDate=Dateatimeforstartdate.format('EEEE'); 	//====Return Day name for Start Date 
         integer startunit = GetStarDateUnit(dayOfStartDate); 	//=====Get No of unit to make start Date as ISO Week Start Week  
         date startdate = stdate.addDays((-startunit)); 	//==Return Start Date of ISO Week
         Datetime DateatimeforEndDate = DateTime.newInstance(endate, Time.newInstance(0, 0, 0, 0));
         String dayOfendDate=DateatimeforEndDate.format('EEEE');  	//======Return Day name for End Date 
         integer endunit= GetEndDateUnit(dayOfendDate);  	//=====Get No of unit to make End Date as ISO Week End Week
         date Enddate = endate.addDays((endunit));  	//=======Return End Date of Iso Week 
         integer  numberDays = startdate.daysBetween(Enddate) +1;
         integer WeekCount = numberDays/7;
         return WeekCount;
        
    }
    
    /* ========== Calculate No of Unit for Start Date================= */
    public static integer GetStarDateUnit(string dayname)
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
    /* ========== Calculate No of Unit for End Date================= */
public static integer GetEndDateUnit(string dayname)
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