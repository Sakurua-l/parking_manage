package com.drx.service;

import com.drx.dto.Time;
import com.drx.po.Parking;
import com.drx.po.ParkingTime;

import java.util.List;

public interface ParkingTimeService {
    void addTime(ParkingTime time) throws Exception;
    List<ParkingTime> showTimes(int driverId)throws Exception;
    void modifyLicenseNum(ParkingTime time)throws Exception;
    void updateParkingTimeByCarId(ParkingTime time)throws Exception;
    List<ParkingTime> findByCarId(int carId)throws Exception;
    List<ParkingTime> findByDriverIdAndCarId(int driverId,int carId)throws Exception;
    int findDriverIdByCarId(int carId) throws Exception;
//    List<ParkingTime> showParkingTimes(int driverId)throws Exception;
}
