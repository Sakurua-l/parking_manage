package com.drx.serviceImpl;

import com.drx.dto.Time;
import com.drx.mapper.CarMapper;
import com.drx.mapper.ParkingTimeMapper;
import com.drx.po.Parking;
import com.drx.po.ParkingTime;
import com.drx.service.ParkingTimeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ParkingTimeServiceImpl implements ParkingTimeService {

    private static Logger logger = Logger.getLogger(ParkingTimeServiceImpl.class);

    @Autowired
    private ParkingTimeMapper parkingTimeMapper;

    @Autowired
    private CarMapper carMapper;

    @Transactional
    public void addTime(ParkingTime time) throws Exception {
        Date beginTime = time.getBeginTime();
        Date endTime = time.getEndTime();
        int total = getTotalTime(beginTime,endTime);
        time.setTotalTime(total);

        parkingTimeMapper.insertParkingTime(time);
    }

    private static int getTotalTime(Date beginTime,Date endTime){
        int totalTime = 0;
        if (endTime == null){
            return totalTime;
        }else {
            long l = endTime.getTime() - beginTime.getTime();
            totalTime = (int) (l/3600000);
            return totalTime;
        }

    }

    @Transactional
    public List<ParkingTime> showTimes(int driverId) throws Exception {
        List<ParkingTime> times = new ArrayList<>();

        List<ParkingTime> timesByDriverId = parkingTimeMapper.findTimesByDriverId(driverId);
        times.addAll(timesByDriverId);
        logger.info("查询得到的停车记录："+times);
//        List<Integer> carIds = carMapper.findCarIdsByDriverId(driverId);
//
//        for (int carId: carIds) {
//            List<ParkingTime> list = parkingTimeMapper.findTimesByCarId(carId);
//            times.addAll(list);
//        }
//        logger.info("查询得到的停车记录："+times);
        return times;
    }

    @Override
    public void modifyLicenseNum(ParkingTime time) throws Exception {
        parkingTimeMapper.updateLicenseNum(time);
    }

    @Override
    public void updateParkingTimeByCarId(ParkingTime time) throws Exception {
        parkingTimeMapper.updateParkingTimeByCarId(time);
    }

    @Override
    public List<ParkingTime> findByCarId(int carId) throws Exception {
        List<ParkingTime> list = parkingTimeMapper.findTimesByCarId(carId);
        return list;
    }

    @Override
    public List<ParkingTime> findByDriverIdAndCarId(int driverId, int carId) throws Exception {
        return parkingTimeMapper.findTimeByDriverIdAndCarId(driverId,carId);
    }

    @Override
    public int findDriverIdByCarId(int carId) throws Exception {
        return parkingTimeMapper.findDriverIdByCarId(carId);
    }
}
