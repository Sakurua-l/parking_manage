package com.drx.mapper;

import com.drx.dto.Time;
import com.drx.po.Parking;
import com.drx.po.ParkingTime;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ParkingTimeMapper {
    void insertParkingTime(ParkingTime time) throws Exception;
    List<ParkingTime> findTimesByCarIds(List<Integer> carIds)throws Exception;
    List<ParkingTime> findTimesByCarId(int carId)throws Exception;
    List<ParkingTime> findTimesByCarIdAndFormulaId(Map<String,Object> map)throws Exception;
    void updateLicenseNum(ParkingTime time)throws Exception;
    void updateParkingTimeByCarId(ParkingTime time) throws Exception;
    List<ParkingTime> findTimesByDriverId(int driverId)throws Exception;
    List<ParkingTime> findTimeByDriverIdAndCarId(@Param("driverId") int driverId, @Param("carId")int carId)throws Exception;
    int findDriverIdByCarId(int carId)throws Exception;
}
