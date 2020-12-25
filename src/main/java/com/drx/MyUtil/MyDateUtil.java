package com.drx.MyUtil;

import java.util.Date;

public class MyDateUtil {
    public static int getParkingTimeHour(Date start,Date end){
        long startTime = start.getTime();
        long endTime = end.getTime();
        long parktime = endTime-startTime;
        int parkHour = (int)(parktime/1000/60/60);
        return parkHour;
    }
}
