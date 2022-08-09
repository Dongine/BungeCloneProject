package com.bunge.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

public class CommonUtil {
	public static String makeStringDateDifference(String date1, String date2) {
		//String date1 = "2021/01/02"; //날짜1
        //String date2 = "2021/01/01"; //날짜2       
		
		if(date2==null) {   // 그러면, 현재날짜를 담아주는 것으로.
			date2 = LocalDate.now().toString().replace("-", "/");
		}	
		
        Date format1 = null;
        Date format2 = null;
		try {
			format1 = new SimpleDateFormat("yyyy/MM/dd").parse(date1);
        	format2 = new SimpleDateFormat("yyyy/MM/dd").parse(date2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        
        long diffSec = (format1.getTime() - format2.getTime()) / 1000; //초 차이
//        long diffMin = (format1.getTime() - format2.getTime()) / 60000; //분 차이
//        long diffHor = (format1.getTime() - format2.getTime()) / 3600000; //시 차이
        long diffDays = diffSec / (24*60*60); //일자수 차이
        
        if(diffDays<0)
        	diffDays *= -1;

        return diffDays + "일전";
	}
}	
